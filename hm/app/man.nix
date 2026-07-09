{ ... }: {
  # Used to suppress the warning:
  # "programs.man.generateCaches has no effect when programs.man.package is null"
  programs.man.generateCaches = false;
}
