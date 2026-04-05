{
  inputs = {
    pkgs.url = "github:NixOS/nixpkgs/8e0485bac410ec46a7fb0ebeeed49e00950c152a"; # 26-3-30

    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/6c5a56295d2a24e43bcd8af838def1b9a95746b2"; # 26-2-13
      inputs.nixpkgs.follows = "pkgs";
    };

    rust-overlay = {
      url = "github:oxalica/rust-overlay/095c394bb91342882f27f6c73f64064fb9de9f2a"; # 26-2-4
      inputs.nixpkgs.follows = "pkgs";
    };
    rsbin.url = "path:./rsbin";

    hm = {
      url = "github:nix-community/home-manager/0825a0922a5d677f5f984bb79524569bbd1f9954"; # 26-2-12
      inputs.nixpkgs.follows = "pkgs";
    };

    nvim-nightly.url = "github:nix-community/neovim-nightly-overlay/a49f9d17bcaa684b81fc4322fbcbfc3ba501d40e"; # 26-3-30
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
