{
  description = "NixosOS configurations for my machines";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    stylix,
    nixpkgs,
    ...
  } @ inputs: {
    nixosConfigurations.denkplatte = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      system = "x86_64-linux";
      modules = [
        ./hosts/denkplatte
        ./hosts/shared
        ./system
        ./user
        ./programs
        ./dm
      ];
    };
    nixosConfigurations.freemwork = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      system = "x86_64-linux";
      modules = [
        stylix.nixosModules.stylix
        ./hosts/freemwork
        ./hosts/shared
        ./system
        ./user
        ./programs
        ./dm
      ];
    };
    nixosConfigurations.pc = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      system = "x86_64-linux";
      modules = [
        ./hosts/pc
        ./hosts/shared
        ./system
        ./user
        ./programs
        ./dm
      ];
    };
  };
}
