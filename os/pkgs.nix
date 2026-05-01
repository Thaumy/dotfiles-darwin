{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    gh
    awscli2
    jfrog-cli

    fd
    wget
    rsync
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

    uutils-findutils
    uutils-diffutils
    uutils-coreutils-noprefix

    cmake
    minio
    docker
    xxHash
    firefox
    librewolf
    code-cursor
    home-manager
  ];
}
