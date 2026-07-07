_: {
  imports = [
    ./sec.nix
    ./pkgs.nix
    ./locale.nix
    ./app/mod.nix
    ./dev/mod.nix
    ./pkgs/mod.nix
  ];

  system = {
    stateVersion = 7;
    primaryUser = "thaumy";

    defaults.NSGlobalDomain.KeyRepeat = 2;
    defaults.NSGlobalDomain.InitialKeyRepeat = 12;
  };

  users = {
    knownGroups = [ "bldcache" ];
    groups."bldcache" = {
      gid = 1000;
      members = [ "thaumy" ];
    };
  };
}
