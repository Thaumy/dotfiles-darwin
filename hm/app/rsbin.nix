{ inputs, config, pkgs, ... }:
let
  homeDir = config.home.homeDirectory;
  mkSymlink = config.lib.file.mkOutOfStoreSymlink;
  rsbin = inputs.rsbin.packages.${pkgs.stdenv.hostPlatform.system};
in
{
  home.packages = with rsbin; [
    (edit-config "cfg")
    (git-abort "git-abort")
    (git-blame-line "git-blame-line")
    (git-conflicts "git-conflicts")
    (git-continue "git-continue")
    (git-modified "git-modified")
    (safe-remove "rr")
    (sh-history-filter "shf")
    (sh-prompt "sh-prompt")
    (sh-title "sh-title")
    (vi-project "vp")
    (vi-visual-pane "vvp")
  ];

  programs.fish.completions.cfg = ''
    complete -c cfg -f
    complete -c cfg -n __fish_is_first_arg -a "(cfg)" -f
  '';

  xdg.configFile = {
    "rsbin/edit-config/config.toml".source = mkSymlink "${homeDir}/cfg/rsbin/edit-config/config.toml";
    "sh-history-filter".source = mkSymlink "${homeDir}/cfg/shf";
  };
}
