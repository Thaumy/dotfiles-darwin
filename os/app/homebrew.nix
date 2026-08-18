_: {
  homebrew = {
    enable = true;
    brews = [
      "laishulu/homebrew/macism"
    ];
    casks = [
      "mos"
      "notunes"
    ];
  };
  environment.systemPath = [ "/opt/homebrew/bin" ];
}
