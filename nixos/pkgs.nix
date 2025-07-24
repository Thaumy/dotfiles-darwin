{ pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    awscli2
    jfrog-cli

    fd
    util-linux
    uutils-findutils
    uutils-diffutils
    uutils-coreutils-noprefix

    jq
    tokei
    pandoc
    ripgrep
    tree-sitter

    zip
    p7zip

    protobuf
    swagger-codegen3
    openapi-generator-cli

    bat
    eza
    btop
    tree
    dust
    pstree

    tmux
    devenv
    alacritty
    rust-script
    any-nix-shell

    code-cursor
    home-manager
  ];
}
