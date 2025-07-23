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
