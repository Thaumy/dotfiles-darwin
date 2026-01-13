{ config, ... }:
let
  homeDir = config.home.homeDirectory;
in
{
  programs.git = {
    enable = true;

    lfs.enable = true;
    ignores = [
      ".idea"
      ".vscode"
      ".thaumy"
      "*.patch"
      ".DS_Store"
    ];
    includes = [
      { path = "${homeDir}/cfg/git/config.ini"; }
      { path = "${homeDir}/cfg/git/aliases.ini"; }
    ];
  };
}
