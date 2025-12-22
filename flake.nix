{
  inputs = {
    pkgs.url = "github:NixOS/nixpkgs/fdd4f3a74622d9d192ef665eecd6ac9ed0359a8d"; # 25-12-20

    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/5fb45ece6129bd7ad8f7310df0ae9c00bae7c562"; # 25-12-18
      inputs.nixpkgs.follows = "pkgs";
    };

    rust-overlay = {
      url = "github:oxalica/rust-overlay/c3cea2a0ec0d5debbef4aa2a0cfe59bd0fb0aeeb"; # 25-11-16
      inputs.nixpkgs.follows = "pkgs";
    };
    rsbin.url = "path:./rsbin";

    hm = {
      url = "github:nix-community/home-manager/bb35f07cc95a73aacbaf1f7f46bb8a3f40f265b5"; # 25-12-20
      inputs.nixpkgs.follows = "pkgs";
    };

    nvim-nightly.url = "github:nix-community/neovim-nightly-overlay/7e47a8c64312e726aafc0789a5d9043501a7e3ae"; # 25-12-20
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
