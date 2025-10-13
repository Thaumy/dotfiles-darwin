_: {
  imports = [
    ./sec.nix
    ./pkgs.nix
    ./locale.nix
    ./app/mod.nix
    ./dev/mod.nix
    ./pkgs/mod.nix
  ];

  system.stateVersion = 6;
  system.primaryUser = "thaumy";

  users = {
    knownGroups = [ "bldcache" ];
    groups."bldcache" = {
      gid = 1000;
      members = [ "thaumy" ];
    };
  };
}
