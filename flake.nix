{
  inputs = {
    pkgs.url = "github:NixOS/nixpkgs/3a00309b9659c2c51b3a75cdc7183515d453bbd5"; # 25-12-10

    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/7e22bf538aa3e0937effcb1cee73d5f1bcc26f79"; # 25-12-7
      inputs.nixpkgs.follows = "pkgs";
    };

    rust-overlay = {
      url = "github:oxalica/rust-overlay/c3cea2a0ec0d5debbef4aa2a0cfe59bd0fb0aeeb"; # 25-11-16
      inputs.nixpkgs.follows = "pkgs";
    };
    rsbin.url = "path:./rsbin";

    hm = {
      url = "github:nix-community/home-manager/13cc1efd78b943b98c08d74c9060a5b59bf86921"; # 25-12-10
      inputs.nixpkgs.follows = "pkgs";
    };

    nvim-nightly.url = "github:nix-community/neovim-nightly-overlay/e00db0f40c5c8d0832f085849bf16d85743b21c6"; # 25-11-16
    libnvimcfg.url = "path:./neovim/lib";
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
