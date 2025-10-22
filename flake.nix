{
  inputs = {
    pkgs.url = "github:NixOS/nixpkgs/7985fbfbd94f4e056d4c9905dcd01e0f4f9ad25f"; # 25-10-10

    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/c48e963a5558eb1c3827d59d21c5193622a1477c"; # 25-9-25
      inputs.nixpkgs.follows = "pkgs";
    };

    rust-overlay = {
      url = "github:oxalica/rust-overlay/b29e5365120f344fe7161f14fc9e272fcc41ee56"; # 25-9-1
      inputs.nixpkgs.follows = "pkgs";
    };
    rsbin.url = ./rsbin;

    hm = {
      url = "github:nix-community/home-manager/bcccb01d0a353c028cc8cb3254cac7ebae32929e"; # 25-10-10
      inputs.nixpkgs.follows = "pkgs";
    };

    nvim-nightly.url = "github:nix-community/neovim-nightly-overlay/643f5aad118a1bb2db5caa8bfc411da794fb870f"; # 25-10-22
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
