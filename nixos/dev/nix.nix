{ pkgs, ... }: {
  nix = {
    settings = {
      max-jobs = "auto";
      keep-going = true;
      keep-outputs = true;

      substituters = [
        "https://cache.nixos.org"
        "https://devenv.cachix.org"
        "https://nix-community.cachix.org"
        "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
      ];
      trusted-public-keys = [
        "thaumy.cachix.org-1:aUhbtORDWI0e/T/FcTMezJc0S7IO9mT1IE84cXHNm14="
        "devenv.cachix.org-1:w1cLUi8dv3hnoSPGAuibQv+f9TZLr6cv/Hm9XgU50cw="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];
      experimental-features = [
        "flakes"
        "nix-command"
      ];

      ssl-cert-file = "/etc/nix/ca_cert.pem";
    };
    optimise.automatic = true;
    extraOptions = ''
      extra-platforms = x86_64-darwin aarch64-darwin
    '';
  };

  environment.systemPackages = with pkgs; [
    nurl
    yarn2nix
    nix-tree
    nix-index
    nix-prefetch-github
    nix-prefetch-scripts
  ];
}
