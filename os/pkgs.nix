{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    awscli2
    jfrog-cli

    fd
    wget
    curl
    rsync
    openssh
    watchexec
    applesauce
    util-linux

    lf
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

    cmake
    minio
    docker
    xxHash
    firefox
    graphviz
    librewolf
    code-cursor
    home-manager
  ];
}
