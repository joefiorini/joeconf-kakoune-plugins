{ fetchFromGitHub, kakPlugin, pkgs }:
kakPlugin {
  name = "kak-joeconf";

  src = ./.;

  dontUnpack = true;

  installPhase = ''
    mkdir -p $out/share/kak/autoload/plugins
    cp -r $src/{*,**/*.kak} $out/share/kak/autoload/plugins
  '';
}

