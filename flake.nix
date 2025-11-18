{
  inputs = {
    pkgs.url = "github:NixOS/nixpkgs/7985fbfbd94f4e056d4c9905dcd01e0f4f9ad25f"; # 25-10-10

    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/973db96394513fd90270ea5a1211a82a4a0ba47f"; # 25-11-15
      inputs.nixpkgs.follows = "pkgs";
    };

    rust-overlay = {
      url = "github:oxalica/rust-overlay/c3cea2a0ec0d5debbef4aa2a0cfe59bd0fb0aeeb"; # 25-11-16
      inputs.nixpkgs.follows = "pkgs";
    };
    rsbin.url = ./rsbin;

    hm = {
      url = "github:nix-community/home-manager/96156a9e86281c4bfc451236bc2ddfe4317e6f39"; # 25-11-16
      inputs.nixpkgs.follows = "pkgs";
    };

    nvim-nightly.url = "github:nix-community/neovim-nightly-overlay/e00db0f40c5c8d0832f085849bf16d85743b21c6"; # 25-11-16
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
