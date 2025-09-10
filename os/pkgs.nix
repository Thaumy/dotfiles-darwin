{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    gh
    awscli2
    jfrog-cli

    fd
    util-linux
    uutils-findutils
    uutils-diffutils
    uutils-coreutils-noprefix

    protobuf
    swagger-codegen3
    openapi-generator-cli

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

    cmake
    sccache
    code-cursor
    home-manager
  ];
}
