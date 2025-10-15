{
  inputs = {
    pkgs.url = "github:NixOS/nixpkgs/7985fbfbd94f4e056d4c9905dcd01e0f4f9ad25f"; # 25-10-10

    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/8df64f819698c1fee0c2969696f54a843b2231e8"; # 25-8-22
      inputs.nixpkgs.follows = "pkgs";
    };

    rust-overlay = {
      url = "github:oxalica/rust-overlay/b29e5365120f344fe7161f14fc9e272fcc41ee56"; # 25-9-1
      inputs.nixpkgs.follows = "pkgs";
    };
    rsbin.url = ./rsbin;

    home-manager = {
      url = "github:nix-community/home-manager/29ab63bbb3d9eee4a491f7ce701b189becd34068"; # 25-9-1
      inputs.nixpkgs.follows = "pkgs";
    };

    nvim-nightly.url = "github:nix-community/neovim-nightly-overlay/93318bab5ce403a60a694ad1b6219760935553f7"; # 25-9-27
    libnvimcfg.url = ./neovim/lib;
  };

  outputs = inputs: {
    darwinConfigurations."HW0028763" =
      inputs.nix-darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        specialArgs = { inherit inputs; };
        modules = [ ./os/mod.nix ];
      };

    homeConfigurations."thaumy" =
      inputs.home-manager.lib.homeManagerConfiguration {
        pkgs = import inputs.pkgs {
          system = "aarch64-darwin";
          config.allowUnfree = true;
        };
        extraSpecialArgs = { inherit inputs; };
        modules = [ ./hm/mod.nix ];
      };
  };
}
