{ config, lib, pkgs, namespace, ... }:

let
  inherit (lib) mkIf mkOption types concatStringsSep;
  inherit (lib.${namespace}) mkBoolOption;
  cfg = config.${namespace}.site-blocker;

  effectiveDomains = if cfg.enable then cfg.domains else [ ];
  domainsStr = concatStringsSep " " effectiveDomains;

  extraHosts = concatStringsSep "\n" (map (d: "127.0.0.1 ${d}") effectiveDomains);

  setPasswordScript = pkgs.writeShellScriptBin "site-blocker-setpassword" ''
    if [ "$(id -u)" -ne 0 ]; then
      echo "Run as root: sudo site-blocker-setpassword"
      exit 1
    fi
    mkdir -p /etc/site-blocker
    chmod 700 /etc/site-blocker
    read -rsp "New block password: " pw1; echo
    read -rsp "Confirm: " pw2; echo
    if [ "$pw1" != "$pw2" ]; then
      echo "Passwords don't match."
      exit 1
    fi
    printf '%s' "$pw1" | ${pkgs.coreutils}/bin/sha256sum | cut -d' ' -f1 > /etc/site-blocker/password
    chmod 600 /etc/site-blocker/password
    chown root:root /etc/site-blocker/password
    echo "Block password set."
  '';
in
{
  options.${namespace}.site-blocker = {
    enable = mkBoolOption "Enable site blocker with password-protected removal";
    domains = mkOption {
      type = types.listOf types.str;
      default = [ ];
      description = "Domains to block via /etc/hosts. Removing any domain requires the block password during nixos-rebuild.";
    };
  };

  config = {
    networking.extraHosts = mkIf cfg.enable extraHosts;

    environment.systemPackages = mkIf cfg.enable [ setPasswordScript ];

    system.activationScripts.site-blocker = {
      text = ''
        COMMITTED=/etc/site-blocker/committed
        PASSWORD=/etc/site-blocker/password
        NEW_DOMAINS="${domainsStr}"

        mkdir -p /etc/site-blocker
        chmod 700 /etc/site-blocker

        NEEDS_PASSWORD=false
        if [ -f "$COMMITTED" ]; then
          while IFS= read -r domain; do
            [ -z "$domain" ] && continue
            if ! echo " $NEW_DOMAINS " | ${pkgs.gnugrep}/bin/grep -qF " $domain "; then
              NEEDS_PASSWORD=true
              break
            fi
          done < "$COMMITTED"
        fi

        if $NEEDS_PASSWORD; then
          if [ ! -f "$PASSWORD" ]; then
            echo "ERROR: site-blocker: domains are being removed but no password is set." >&2
            echo "Set one first with: sudo site-blocker-setpassword" >&2
            exit 1
          fi
          ENTERED=$(${pkgs.systemd}/bin/systemd-ask-password "Site blocker unlock password:")
          ENTERED_HASH=$(printf '%s' "$ENTERED" | ${pkgs.coreutils}/bin/sha256sum | cut -d' ' -f1)
          STORED_HASH=$(cat "$PASSWORD")
          if [ "$ENTERED_HASH" != "$STORED_HASH" ]; then
            echo "Wrong password. Aborting activation." >&2
            exit 1
          fi
          echo "Password correct. Continuing."
        fi

        printf '%s\n' $NEW_DOMAINS > "$COMMITTED"
        chmod 600 "$COMMITTED"
        chown root:root "$COMMITTED"
      '';
    };
  };
}
