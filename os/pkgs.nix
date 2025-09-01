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

    zip
    p7zip

    protobuf
    swagger-codegen3
    openapi-generator-cli

    lf
    bat
    eza
    btop
    tree
    dust
    pstree

    tmux
    devenv
    alacritty
    any-nix-shell
    unixtools.watch

    sccache
    code-cursor
    home-manager
  ];
}
