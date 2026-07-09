_: {
  imports = [
    ./sh/mod.nix
    ./app/mod.nix
    ./daemon/mod.nix
  ];

  home = {
    username = "thaumy";
    stateVersion = "26.05";
    homeDirectory = "/Users/thaumy";
  };

  news.display = "silent";
}
