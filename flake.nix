{
  description = "Config flake";

  inputs.nixpkgs.url = github:NixOS/nixpkgs/nixos-unstable;
  inputs.nixvim.url = "github:nix-community/nixvim";
  outputs = {
    self,
    nixpkgs,
    ...
  } @ inputs: {
    nixosConfigurations.denkplatte = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      system = "x86_64-linux";
      modules = [./hosts/denkplatte];
    };
    nixosConfigurations.pc = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      system = "x86_64-linux";
      modules = [./hosts/pc];
    };
  };
}
