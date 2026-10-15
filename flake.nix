{
  inputs = {
    pkgs.url = "github:NixOS/nixpkgs/8edc0c72e3a38faf5434e40d1f19431125fe4b30"; # 26-10-9

    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/4cff07de74b50e64bdd68cd4e722ab5b6b35ee48"; # 26-8-16
      inputs.nixpkgs.follows = "pkgs";
    };

    hm = {
      url = "github:nix-community/home-manager/c58f54c733a7894d84fa2fdff26cc12088c4b78c"; # 26-10-10
      inputs.nixpkgs.follows = "pkgs";
    };

    rust-overlay = {
      url = "github:oxalica/rust-overlay/3100cf6ff140fb298f09192de610f4037d3bab0f"; # 26-10-13
      inputs.nixpkgs.follows = "pkgs";
    };
    rsbin.url = "path:./rsbin";

    nvim.url = "github:nix-community/neovim-nightly-overlay/2582a095725ee836098b0de4c56c52b8ccdb9a94"; # 26-10-13
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
