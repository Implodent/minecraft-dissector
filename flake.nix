{
  description = "my project description";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }:
    let pkgs = nixpkgs.legacyPackages."x86_64-linux";
    in {
      devShells."x86_64-linux".default = pkgs.mkShell {
        nativeBuildInputs = with pkgs; [ pkg-config ];
        buildInputs = with pkgs; [ wireshark.dev gnumake glib.dev nodejs libgcrypt ];
      };
    };
}
