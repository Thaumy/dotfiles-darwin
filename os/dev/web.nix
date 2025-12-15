{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    biome
    protobuf
    swagger-codegen3
    openapi-generator-cli
  ];
}
