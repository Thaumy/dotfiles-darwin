{
  inputs = {
    pkgs.url = "github:NixOS/nixpkgs/34ea16dab521dc5648ab5078040ead131b50f27b"; # 25-8-15

    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/8df64f819698c1fee0c2969696f54a843b2231e8"; # 25-8-22
      inputs.nixpkgs.follows = "pkgs";
    };

    rust-overlay = {
      url = "github:oxalica/rust-overlay/08ff39bf869cadca3102b39824f4c7025186b7dc"; # 25-8-2;
      inputs.nixpkgs.follows = "pkgs";
    };
    rsbin.url = ./rsbin;

    home-manager = {
      url = "github:nix-community/home-manager/29ab63bbb3d9eee4a491f7ce701b189becd34068"; # 25-9-1
      inputs.nixpkgs.follows = "pkgs";
    };

    nvim-nightly.url = "github:nix-community/neovim-nightly-overlay/d794f8296742e8552e884f2b4f3d626263f90d95"; # 25-9-1
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
