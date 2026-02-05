_: {
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
      "notunes"
    ];
  };
  environment.systemPath = [ "/opt/homebrew/bin" ];
}
