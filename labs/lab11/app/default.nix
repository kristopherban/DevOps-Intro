{ pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation {
  pname = "my-reproducible-app";
  version = "1.0.0";
  src = ./.;

  nativeBuildInputs = [ pkgs.go ];

  buildPhase = ''
    export GOCACHE=$TMPDIR/go-cache
    go build -o my-reproducible-app main.go
  '';

  installPhase = ''
    mkdir -p $out/bin
    cp my-reproducible-app $out/bin/
  '';
}
