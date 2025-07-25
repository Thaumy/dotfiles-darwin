{
  inputs = {
    pkgs.url = "github:NixOS/nixpkgs/0776fda6ff74ddda14aad805b24224be1bdaba9b"; # 25-7-21

    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/master";
      inputs.nixpkgs.follows = "pkgs";
    };

    rust-overlay = {
      url = "github:oxalica/rust-overlay/0751b65633a1785743ca44fd7c14a633c54c1f91"; # 25-7-21
      inputs.nixpkgs.follows = "pkgs";
    };

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
