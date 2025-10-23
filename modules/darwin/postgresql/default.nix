{ config, lib, namespace, ... }:
let username = "gerald";
in lib.${namespace}.mkModule "postgresql" config {
  config = {
    system.activationScripts.preActivation = {
      enable = true;
      text = ''
        if [ ! -d "/var/lib/postgresql/" ]; then
          sudo mkdir -m 750 -p /var/lib/postgresql/
          chown -R ${username}:staff /var/lib/postgresql/
        fi
      '';
    };

    services.postgresql.initdbArgs = [
      "-U ${username}"
      "--pgdata=/var/lib/postgresql/17"
      "--auth=trust"
      "--no-locale"
      "--encoding=UTF8"
    ];
    services.postgresql.enable = true;

    launchd.user.agents.postgresql.serviceConfig = {
      StandardErrorPath = "/tmp/postgres.error.log";
      StandardOutPath = "/tmp/postgres.log";
    };
  };
}
