{
  inputs = {
    pkgs.url = "github:NixOS/nixpkgs/fdd4f3a74622d9d192ef665eecd6ac9ed0359a8d"; # 25-12-20

    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/0fc4e7ac670a0ed874abacf73c4b072a6a58064b"; # 26-1-19
      inputs.nixpkgs.follows = "pkgs";
    };

    rust-overlay = {
      url = "github:oxalica/rust-overlay/4b7472a78857ac789fb26616040f55cfcbd36c6e"; # 26-01-18
      inputs.nixpkgs.follows = "pkgs";
    };
    rsbin.url = "path:./rsbin";

    hm = {
      url = "github:nix-community/home-manager/bb35f07cc95a73aacbaf1f7f46bb8a3f40f265b5"; # 25-12-20
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
