_: {
  imports = [
    ./sec.nix
    ./pkgs.nix
    ./locale.nix
    ./app/mod.nix
    ./dev/mod.nix
  ];

  system.stateVersion = 6;
  system.primaryUser = "thaumy";
}
