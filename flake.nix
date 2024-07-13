{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix.url = "github:danth/stylix";
  };

  outputs = { nixpkgs, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      nixosConfigurations = {
        default = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules =
            [ ./configuration.nix inputs.home-manager.nixosModules.default ];
        };
      };
      devShells.${system}.default = pkgs.mkShell {
        name = "dotfiles";
        nativeBuildInputs = with pkgs; [ ghc haskell-language-server ];
      };
    };
}
