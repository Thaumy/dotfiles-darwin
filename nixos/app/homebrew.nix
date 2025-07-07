{ pkgs, ... }: {
  homebrew = {
    enable = true;
    taps = [
      "laishulu/homebrew"
    ];
    brews = [
      "macism"
    ];
    casks = [
      "mos"
    ];
  };
}
