{
  inputs = {
    pkgs.url = "github:NixOS/nixpkgs/8e0485bac410ec46a7fb0ebeeed49e00950c152a"; # 26-3-30

    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/06648f4902343228ce2de79f291dd5a58ee12146"; # 26-4-1
      inputs.nixpkgs.follows = "pkgs";
    };

    rust-overlay = {
      url = "github:oxalica/rust-overlay/d9f52b51548e76ab8b6e7d647763047ebdec835c"; # 26-3-30
      inputs.nixpkgs.follows = "pkgs";
    };
    rsbin.url = "path:./rsbin";

    hm = {
      url = "github:nix-community/home-manager/9340f51314713c83360bf72d75c8b404778ab5b1"; # 26-3-30
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
