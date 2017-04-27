{ pkgs ? import <nixpkgs> {} }:

# Below is for an environment in which you may run DraftSight via the
# .deb package. Install dpkg, make directory "draftsight" (or
# whatever), & extract files with 'dpkg -x draftSight.deb draftsight".
# The binary is then in:
# draftsight/opt/dassault-systemes/DraftSight/Linux/DraftSight
#
# HelpGuide in the same directory can be something else to check if
# library issues crop up again.

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
