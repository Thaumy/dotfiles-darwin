{ pkgs, ... }:
let
  cache_dir = "/var/cache/sccache";
in
{
  environment = {
    systemPackages = [ pkgs.sccache ];
    variables = {
      SCCACHE_DIR = cache_dir;
      SCCACHE_CACHE_SIZE = "50G";
    };
  };
  system.activationScripts.postActivation.text = ''
    mkdir -p ${cache_dir}
    chmod 770 ${cache_dir}
    chgrp bldcache ${cache_dir}
  '';
}
