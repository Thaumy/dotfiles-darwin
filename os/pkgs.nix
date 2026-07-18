{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    awscli2

    fd
    wget
    curl
    rsync
    openssh
    watchexec
    applesauce
    util-linux

    bat
    eza
    btop
    procs

    tmux
    dash
    devenv
    alacritty
    any-nix-shell
    unixtools.watch

    go
    cmake
    docker
    xxhash
    firefox
    graphviz
    librewolf
    home-manager
  ];
}
