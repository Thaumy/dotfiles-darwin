{ pkgs, ... }: {
  fonts = {
    packages = with pkgs; [
      fira-code
      sarasa-gothic
      jetbrains-mono
      liberation_ttf
      source-han-serif
      times-newer-roman
      material-design-icons
      noto-fonts-color-emoji
      nerd-fonts.jetbrains-mono
    ];
  };
}
