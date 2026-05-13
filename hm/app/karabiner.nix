{ config, ... }:
let
  homeDir = config.home.homeDirectory;
  mkSymlink = config.lib.file.mkOutOfStoreSymlink;
in
{
  xdg.configFile."karabiner".source = mkSymlink "${homeDir}/cfg/karabiner";
}
