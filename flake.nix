{
  inputs = {
    pkgs.url = "github:NixOS/nixpkgs/7b033cac491de078d36d15b07f0036ab197a3180"; # 26-9-16

    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/4cff07de74b50e64bdd68cd4e722ab5b6b35ee48"; # 26-8-16
      inputs.nixpkgs.follows = "pkgs";
    };

    hm = {
      url = "github:nix-community/home-manager/f2785222a14e90f8c5ad2ff62474ce88453c3421"; # 26-9-17
      inputs.nixpkgs.follows = "pkgs";
    };

    rust-overlay = {
      url = "github:oxalica/rust-overlay/35ca0490d13a3d38c4602d0eb9600a30fa63a367"; # 26-9-16
      inputs.nixpkgs.follows = "pkgs";
    };
    rsbin.url = "path:./rsbin";

    nvim.url = "github:nix-community/neovim-nightly-overlay/8406b7a1e0c6b058cb8d54f60c2abf74f33b61d5"; # 26-9-16
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
