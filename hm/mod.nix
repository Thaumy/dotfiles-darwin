_: {
  imports = [
    ./sh/mod.nix
    ./app/mod.nix
    ./daemon/mod.nix
  ];

  home = {
    username = "thaumy";
    stateVersion = "25.05";
    homeDirectory = "/Users/thaumy";
  };

  news.display = "silent";
}
