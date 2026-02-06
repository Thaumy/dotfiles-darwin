{
  inputs = {
    pkgs.url = "github:NixOS/nixpkgs/9639dc09756f494050ed2106e7ae63f96631ff7a"; # 26-1-10

    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/0fc4e7ac670a0ed874abacf73c4b072a6a58064b"; # 26-1-19
      inputs.nixpkgs.follows = "pkgs";
    };

    rust-overlay = {
      url = "github:oxalica/rust-overlay/095c394bb91342882f27f6c73f64064fb9de9f2a"; # 26-2-4
      inputs.nixpkgs.follows = "pkgs";
    };
    rsbin.url = "path:./rsbin";

    hm = {
      url = "github:nix-community/home-manager/7c5d9345ad7cc38832cd4007f5cd03daad64d75b"; # 26-1-10
      inputs.nixpkgs.follows = "pkgs";
    };

    nvim-nightly.url = "github:nix-community/neovim-nightly-overlay/4ae5c0c99f5e7fe02f0df0220a7d09b1945df646"; # 26-2-4
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
