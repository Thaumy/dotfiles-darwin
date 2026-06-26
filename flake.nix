{
  inputs = {
    pkgs.url = "github:NixOS/nixpkgs/89570f24e97e614aa34aa9ab1c927b6578a43775"; # 26-6-23

    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/a1fa429e945becaf60468600daf649be4ba0350c"; # 26-6-18
      inputs.nixpkgs.follows = "pkgs";
    };

    hm = {
      url = "github:nix-community/home-manager/4b0b9474749820afac53ea30d4ccfef60aba5ce6"; # 26-6-23
      inputs.nixpkgs.follows = "pkgs";
    };

    rust-overlay = {
      url = "github:oxalica/rust-overlay/40b0a3a193e0840c76174b4a322874c8f6dd0a63"; # 26-5-29
      inputs.nixpkgs.follows = "pkgs";
    };
    rsbin.url = "path:./rsbin";

    nvim.url = "github:nix-community/neovim-nightly-overlay/dfa2f665e0701eb1b08ddb00fc83d4867d156bce"; # 26-6-28
    libnvimcfg.url = "path:./nvim/lib";
  };

  outputs = inputs: {
    darwinConfigurations."HW0028763" =
      inputs.nix-darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        specialArgs = { inherit inputs; };
        modules = [ ./os/mod.nix ];
      };

    homeConfigurations."thaumy" =
      inputs.hm.lib.homeManagerConfiguration {
        pkgs = import inputs.pkgs {
          system = "aarch64-darwin";
          config.allowUnfree = true;
        };
        extraSpecialArgs = { inherit inputs; };
        modules = [ ./hm/mod.nix ];
      };
  };
}
