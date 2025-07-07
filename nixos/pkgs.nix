{ pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    awscli2
    jfrog-cli

    fd
    uutils-findutils
    uutils-diffutils
    uutils-coreutils-noprefix

    jq
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

    tmux
    devenv
    alacritty
    any-nix-shell

    tokei
    ripgrep
    tree-sitter
    rust-script

    code-cursor
    home-manager
  ];
}
