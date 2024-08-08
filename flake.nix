{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, ... }@inputs: 
    let 
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      nixosConfigurations.laptop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/laptop/configuration.nix
          ./nixosModules
        ];
      };

      homeConfigurations = {
        laptop = {
          system = "x86_64-linux";
          home-manager.user.joachimos = import ./hosts/laptop/home.nix;
          };
      };

      #nixosConfigurations.desktop = nixpkgs.lib.nixosSystem {
       # system = "x86_64-linux";
       # specialArgs = { inherit inputs; };
       # modules = [
       #   ./hosts/desktop/configuration.nix
       #   ./nixosModules  
       # ];
      #};
 
    };
}
