{ pkgs, ... }:
let
  cache_dir = "/var/cache/sccache";
in
{
  environment.systemPackages = [ pkgs.sccache ];

  system.activationScripts.postActivation.text = ''
    mkdir -p ${cache_dir}
    chmod 770 ${cache_dir}
    chgrp bldcache ${cache_dir}
  '';
}
