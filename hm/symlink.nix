{ config, ... }:
let
  homeDir = config.home.homeDirectory;
  mkSymlink = config.lib.file.mkOutOfStoreSymlink;
in
{
  home.file = {
    "dl".source = mkSymlink "${homeDir}/Downloads";
    "docs".source = mkSymlink "${homeDir}/Documents";
  };
}
