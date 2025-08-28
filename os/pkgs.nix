{ pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    gh
    awscli2
    jfrog-cli

    fd
    sd
    util-linux
    uutils-findutils
    uutils-diffutils
    uutils-coreutils-noprefix

    jq
    taplo
    tokei
    pandoc
    ripgrep
    tree-sitter

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

    code-cursor
    home-manager
  ];
}
