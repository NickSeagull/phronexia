{ stdenvNoCC, fetchFromGitHub, gtk-engine-murrine }:

stdenvNoCC.mkDerivation rec {
  pname = "chicago95";
  version = "2.0";

  src = fetchFromGitHub {
    owner = "grassmunk";
    repo = "Chicago95";
    rev = "bdf5cf36a16102aaac297f3de887c601c2b1146f";
    sha256 = "sha256-1TW3bUZOUB6AGZ4zC274YpDg6t/UfZFEuDCHqtbw2oU=";
  };

  propagatedUserEnvPkgs = [ gtk-engine-murrine ];

  installPhase = ''
    mkdir -p $out/share/themes
    cp -r Theme/Chicago95 $out/share/themes

    mkdir -p $out/share/icons
    cp -r Icons/* $out/share/icons
    cp -r Cursors/* $out/share/icons

    mkdir -p $out/share/fonts
    cp -r Fonts/* $out/share/fonts
    cp -r Fonts/vga_font/LessPerfectDOSVGA.ttf $out/share/fonts

    mkdir -p $out/share/sounds
    cp -R sounds/Chicago95 $out/share/sounds

    mkdir -p $out/share/plymouth/themes/Chicago95
    cp -R Plymouth/Chicago95/* $out/share/plymouth/themes/Chicago95
    find $out/share/plymouth/themes/ -name \*.plymouth -exec sed -i "s@\/usr\/@$out\/@" {} \;
  '';
}
