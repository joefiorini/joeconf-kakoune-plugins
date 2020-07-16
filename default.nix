{ fetchFromGitHub, kakPlugin, pkgs }:
kakPlugin {
  name = "kak-joeconf";

  src = ./.;

  dontUnpack = true;

  installPhase = ''
    mkdir -p $out/share/kak/autoload/plugins
    cp $src/*.kak $out/share/kak/autoload/plugins
  '';
}

