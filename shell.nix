{ pkgs ? import <nixpkgs> {} }:

(pkgs.buildFHSUserEnv {
  name = "draftsight-env";
  targetPkgs = pkgs: (with pkgs;
    [ mesa xdg_utils dbus_tools alsaLib cups fontconfig glib icu libpng12
      xkeyboard_config gstreamer zlib libxslt libxml2 sqlite orc
    ]) ++ (with pkgs.xorg;
    [ libX11 libXcursor libXrandr libxcb libXi libSM libICE libXrender
      libXcomposite
    ]);
  multiPkgs = pkgs: (with pkgs;
    [ udev
      alsaLib
    ]);
  profile = ''
    export LD_LIBRARY_PATH=/run/opengl-driver/lib:/run/opengl-driver-32/lib:/lib
    export FONTCONFIG_FILE=/etc/fonts/fonts.conf
  '';
  runScript = "bash";
}).env
