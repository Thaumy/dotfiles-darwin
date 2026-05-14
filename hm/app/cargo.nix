{ config, ... }:
let
  homeDir = config.home.homeDirectory;
  mkSymlink = config.lib.file.mkOutOfStoreSymlink;
in
{
  home = {
    file.".cargo/config.toml".source = mkSymlink "${homeDir}/cfg/cargo/config.toml";
  };
}
