{ pkgs, ... }:
let
  writeBin = name: path: pkgs.writeTextFile {
    inherit name;
    executable = true;
    destination = "/bin/${name}";
    text = builtins.readFile path;
  };
in
{
  home.packages = [
    (writeBin "sv" etc/sv.sh)
    (writeBin "fstc" etc/fstc.sh)
    (writeBin "pwdc" etc/pwdc.sh)
    (writeBin "todo" etc/todo.sh)
    (writeBin "symlink-localize" etc/symlink-localize.sh)
  ];
}
