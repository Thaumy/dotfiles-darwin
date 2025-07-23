{
  inputs = {
    pkgs.url = "github:NixOS/nixpkgs/0776fda6ff74ddda14aad805b24224be1bdaba9b"; # 25-7-21

    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/master";
      inputs.nixpkgs.follows = "pkgs";
    };

    rust-overlay = {
      url = "github:oxalica/rust-overlay/b4270835bf43c6f80285adac6f66a26d83f0f277"; # 25-2-28
      inputs.nixpkgs.follows = "pkgs";
    };
  };

  outputs = inputs: {
    darwinConfigurations."HW0028763" =
      inputs.nix-darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        specialArgs = { inherit inputs; };
        modules = [ ./os.nix ];
      };
  };
}
