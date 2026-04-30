{ inputs, pkgs, ... }:
let
  rsbin = inputs.rsbin.packages.${pkgs.stdenv.hostPlatform.system};
  shf = rsbin.sh-history-filter "shf";
  shf-fish = pkgs.writeScriptBin "shf-fish" ''
    #!${pkgs.dash}/bin/dash

    set -e

    OLD_HISTORY="$HOME/.local/share/fish/fish_history"
    NEW_HISTORY="/tmp/shf-fish-$(date +%s)"

    ${shf}/bin/shf \
      --shell fish \
      --pred-rev \
      --history-path "$OLD_HISTORY" >"$NEW_HISTORY"

    cp "$NEW_HISTORY" "$OLD_HISTORY"

    rm "$NEW_HISTORY"
  '';
in
{
  launchd.agents.shf-fish = {
    enable = true;
    config = {
      ProgramArguments = [ "${shf-fish}/bin/shf-fish" ];
      StartCalendarInterval = { Hour = 0; Minute = 0; };
      StandardOutPath = "/tmp/shf-fish.out.log";
      StandardErrorPath = "/tmp/shf-fish.err.log";
    };
  };
}
