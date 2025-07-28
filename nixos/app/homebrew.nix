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
    ];
  };
  environment.systemPath = [ "/opt/homebrew/bin" ];
}
