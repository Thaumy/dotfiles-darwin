{ pkgs, ... }: {
  fonts = {
    packages = with pkgs; [
      fira-code
      sarasa-gothic
      jetbrains-mono
      liberation_ttf
      noto-fonts-emoji
      source-han-serif
      times-newer-roman
      material-design-icons
      nerd-fonts.jetbrains-mono
    ];
  };
}
