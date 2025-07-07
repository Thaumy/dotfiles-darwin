{ pkgs, config, ... }:
let
  homeDir = config.home.homeDirectory;
  mkSymlink = config.lib.file.mkOutOfStoreSymlink;
  writeBin = name: path: pkgs.writeTextFile {
    inherit name;
    executable = true;
    destination = "/bin/${name}";
    text = builtins.readFile path;
  };
in
{
  home = {
    packages = [
    ];

    file.".cargo/config.toml".source = mkSymlink "${homeDir}/cfg/cargo/config.toml";
  };
}
