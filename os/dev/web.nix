{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    pnpm
    biome
    protobuf
    nodejs_24
    swagger-codegen3
    openapi-generator-cli
  ];
}
