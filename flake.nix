{
  inputs = {
    pkgs.url = "github:NixOS/nixpkgs/723ce9394b443fc4ce83d6d5a54aee528c5bb328"; # 25-8-2

    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/master";
      inputs.nixpkgs.follows = "pkgs";
    };

    rust-overlay = {
      url = "github:oxalica/rust-overlay/08ff39bf869cadca3102b39824f4c7025186b7dc"; # 25-8-2;
      inputs.nixpkgs.follows = "pkgs";
    };
    rsbin.url = ./rsbin;

    home-manager = {
      url = "github:nix-community/home-manager/97118a310eb8e13bc1b9b12d67267e55b7bee6c8"; # 25-5-18
      inputs.nixpkgs.follows = "pkgs";
    };

    nvim-nightly.url = "github:nix-community/neovim-nightly-overlay/d23aed1e00bf4e133f582fbd435eac02199db22c"; # 25-7-4
    libnvimcfg.url = ./neovim/lib;
  };

  outputs = inputs: {
    darwinConfigurations."HW0028763" =
      inputs.nix-darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        specialArgs = { inherit inputs; };
        modules = [ ./nixos/mod.nix ];
      };

    homeConfigurations."thaumy" =
      inputs.home-manager.lib.homeManagerConfiguration {
        pkgs = import inputs.pkgs {
          system = "aarch64-darwin";
          config.allowUnfree = true;
        };
        extraSpecialArgs = { inherit inputs; };
        modules = [ ./home-manager/mod.nix ];
      };
  };
}
