{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    protobuf
    swagger-codegen3
    openapi-generator-cli
  ];
}
