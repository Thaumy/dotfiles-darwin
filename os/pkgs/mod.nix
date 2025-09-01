{ lib, pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = lib.flatten (map (path: pkgs.callPackage path { }) [
    ./text.nix
  ]);
}
