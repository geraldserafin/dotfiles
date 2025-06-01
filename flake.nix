{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    darwin.url = "github:lnl7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";

    snowfall-lib.url = "github:snowfallorg/lib";
    snowfall-lib.inputs.nixpkgs.follows = "nixpkgs";

    snowfall-flake.url = "github:snowfallorg/flake";

    stylix.url = "github:danth/stylix";
    stylix.inputs.nixpkgs.follows = "nixpkgs";

    nixvim.url = "github:nix-community/nixvim";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";

    pomodoro-clock-cli.url = "github:geraldserafin/pomodoro-clock-cli";
    pomodoro-clock-cli.inputs.nixpkgs.follows = "nixpkgs";

    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    zen-browser.inputs.nixpkgs.follows = "nixpkgs";

    oh-my-bash.url = "github:ohmybash/oh-my-bash";
    oh-my-bash.flake = false;

    base16-black-metal-scheme.url =
      "github:metalelf0/base16-black-metal-scheme";
    base16-black-metal-scheme.flake = false;

    sops-nix.url = "github:Mic92/sops-nix";
    sops-nix.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs:
    inputs.snowfall-lib.mkFlake {
      inherit inputs;
      src = ./.;
      channels-config.allowUnfree = true;
      snowfall.namespace = "dotfiles";
      overlays = with inputs; [ snowfall-flake.overlays."package/flake" ];
      system.modules.nixos = with inputs;
        [ home-manager.nixosModules.home-manager ];
    };
}
