{ stdenv, fetchFromGitHub, gtk-engine-murrine }:

stdenv.mkDerivation rec {
  pname = "chicago95";
  version = "2.0";

  src = fetchFromGitHub {
    owner = "grassmunk";
    repo = "Chicago95";
    rev = "bdf5cf36a16102aaac297f3de887c601c2b1146f";
  };

  propagatedUserEnvPkgs = [ gtk-engine-murrine ];

  installPhase = ''
    mkdir -p $out/usr/share/themes
    cp -r Theme/Chicago95 $out/usr/share/themes

    mkdir -p $out/usr/share/icons
    cp -r Icons/* $out/usr/share/icons
  '';
}
