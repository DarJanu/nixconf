{
  description = "Open-source Gowin FPGA toolchain (Yosys, nextpnr-gowin, Apicula, openFPGALoader)";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs {
        inherit system;
        overlays = [
          # Overlay for Apicula
          (final: prev: {
            apicula = prev.python3Packages.buildPythonApplication {
              pname = "apicula";
              version = "git";
              src = prev.fetchFromGitHub {
                owner = "YosysHQ";
                repo = "apicula";
                rev = "master";
                sha256 = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
              };
              propagatedBuildInputs = with prev.python3Packages; [
                pyusb
                pyserial
              ];
            };
          })

          # Overlay for nextpnr-gowin
          (final: prev: {
            nextpnr-gowin = prev.nextpnr.override {
              enableGowin = true;
              gowinDeviceDatabase = prev.fetchFromGitHub {
                owner = "YosysHQ";
                repo = "apicula";
                rev = "master";
                sha256 = "sha256-BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB=";
              };
            };
          })
        ];
      };
    in {
      devShells.default = pkgs.mkShell {
        name = "gowin-open-toolchain";

        buildInputs = with pkgs; [
          yosys
          nextpnr-gowin
          apicula
          openFPGALoader
          python3
        ];

        shellHook = ''
          echo "Gowin open-source toolchain ready."
          echo "Tools: yosys, nextpnr-gowin, apicula, openFPGALoader"
        '';
      };
    });
}
