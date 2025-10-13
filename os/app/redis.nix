_:
let
  data_dir = "/var/lib/redis";
in
{
  services.redis = {
    enable = true;
    dataDir = data_dir;
  };
  system.activationScripts.postActivation.text = ''
    mkdir -p ${data_dir}
  '';
}
