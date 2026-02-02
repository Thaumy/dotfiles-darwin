{ inputs, config, pkgs, ... }:
let
  homeDir = config.home.homeDirectory;
  mkSymlink = config.lib.file.mkOutOfStoreSymlink;
  rsbin = inputs.rsbin.packages.${pkgs.system};
in
{
  home.packages = with rsbin; [
    (edit-config "cfg")
    (git-abort "git-abort")
    (git-blame-line "git-blame-line")
    (git-conflicts "git-conflicts")
    (git-continue "git-continue")
    (safe-remove "rr")
    (vi-project "vp")
    (vi-visual-pane "vvp")
  ];

  home.file.".config/rsbin/edit-config/config.toml".source = mkSymlink "${homeDir}/cfg/rsbin/edit-config/config.toml";
}
