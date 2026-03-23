{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    gh
    awscli2
    jfrog-cli

    fd
    rsync
    watchexec
    applesauce
    util-linux
    uutils-findutils
    uutils-diffutils
    uutils-coreutils-noprefix

    lf
    bat
    eza
    btop
    procs

    tmux
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
    code-cursor
    home-manager
  ];
}
