_: {
  # NOTE:
  # Please ensure the `/var/lib/redis` is created with
  # correct permission, otherwise this service will
  # failed to run.
  services.redis = {
    enable = true;
  };
}
