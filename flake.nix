{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # home-manager = {
    #   url = "github:nix-community/home-manager";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
  };

  outputs = { self, nixpkgs, ... }: 
    let 
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      nixosConfigurations.laptop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit pkgs; };
        modules = [
          ./hosts/laptop/configuration.nix
        ];
      };

      nixosConfigurations.desktop = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit pkgs; };
        modules = [
          ./hosts/desktop/configuration.nix
        ];
      };
    };
}
