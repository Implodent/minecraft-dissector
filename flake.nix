{
  description = "my project description";

  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
    let pkgs = nixpkgs.legacyPackages."x86_64-linux";
    in {
      devShells.default = {
        pkgs.mkShell {
          nativeBuildInputs = with pkgs; [ pkg-config ];
          buildInputs = with pkgs; [ wireshark.dev gnumake glib.dev nodejs ];
        }
      };
    };
}
