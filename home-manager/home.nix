{ pkgs, ... }: {
  imports = [
    ./sh/mod.nix
    ./app/mod.nix
  ];

  home = {
    username = "thaumy";
    stateVersion = "25.05";
    homeDirectory = "/Users/thaumy";
  };

  home.packages = with pkgs; [
  ];
}
