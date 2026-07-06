{
  inputs = {
    pkgs.url = "github:NixOS/nixpkgs/295c3f1c2ac1a55504373727cd6cafb26fb6b047"; # 26-5-23

    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/56c666e108467d87d13508936aade6d567f2a501"; # 26-5-18
      inputs.nixpkgs.follows = "pkgs";
    };

    hm = {
      url = "github:nix-community/home-manager/509ed3c603349a9d43de9e2ae6613baea6bd5b34"; # 26-5-23
      inputs.nixpkgs.follows = "pkgs";
    };

    rust-overlay = {
      url = "github:oxalica/rust-overlay/40b0a3a193e0840c76174b4a322874c8f6dd0a63"; # 26-5-29
      inputs.nixpkgs.follows = "pkgs";
    };
    rsbin.url = "path:./rsbin";

    nvim.url = "github:nix-community/neovim-nightly-overlay/857c4b359c105ad56822e64fd35f9bf9f7947d70"; # 26-5-26
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
