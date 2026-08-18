{
  inputs = {
    pkgs.url = "github:NixOS/nixpkgs/81788f7597ea358312f10f38300753746b2a90e4"; # 26-8-10

    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/4cff07de74b50e64bdd68cd4e722ab5b6b35ee48"; # 26-8-16
      inputs.nixpkgs.follows = "pkgs";
    };

    hm = {
      url = "github:nix-community/home-manager/5bd505963717a894b02a57cdbcc00db28d9b029f"; # 26-8-16
      inputs.nixpkgs.follows = "pkgs";
    };

    rust-overlay = {
      url = "github:oxalica/rust-overlay/b211eadeba8b180da9453ec3413a8a3535c85b3f"; # 26-8-16
      inputs.nixpkgs.follows = "pkgs";
    };
    rsbin.url = "path:./rsbin";

    nvim.url = "github:nix-community/neovim-nightly-overlay/3dc8fa3b0b2220ffd0836012407b15aa6747d3fe"; # 26-8-16
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
