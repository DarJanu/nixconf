{
  description = "NixosOS configurations for my machines";

  inputs = {
    #nixpkgs.url = "github:DarJanu/nixpkgs/nixos-unstable";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = {
    self,
    nixpkgs,
    ...
  } @ inputs: {
    nixosConfigurations.denkplatte = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      system = "x86_64-linux";
      modules = [
        ./hosts/denkplatte
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
        ./hosts/freemwork
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
        ./system
        ./user
        ./programs
        ./dm
      ];
    };
  };
}
