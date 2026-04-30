{ inputs, pkgs, ... }:
let
  rsbin = inputs.rsbin.packages.${pkgs.stdenv.hostPlatform.system};
  shf = rsbin.sh-history-filter "shf";
  shf-bash = pkgs.writeScriptBin "shf-bash" ''
    #!${pkgs.dash}/bin/dash

    set -e

    OLD_HISTORY="$HOME/.bash_history"
    NEW_HISTORY="/tmp/shf-bash-$(date +%s)"

    ${shf}/bin/shf \
      --shell bash \
      --pred-rev \
      --history-path "$OLD_HISTORY" >"$NEW_HISTORY"

    cp "$NEW_HISTORY" "$OLD_HISTORY"

    rm "$NEW_HISTORY"
  '';
in
{
  launchd.agents.shf-bash = {
    enable = true;
    config = {
      ProgramArguments = [ "${shf-bash}/bin/shf-bash" ];
      StartCalendarInterval = { Hour = 0; Minute = 0; };
      StandardOutPath = "/tmp/shf-bash.out.log";
      StandardErrorPath = "/tmp/shf-bash.err.log";
    };
  };
}
