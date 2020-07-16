provide-module joeconf-connect %[
    set-option global connect_environment %{
      PATH=$PATH:/run/current-system/sw/bin:/etc/profiles/per-user/jf848f/bin
      SHELL=/run/current-system/sw/bin/fish
      export __NIX_DARWIN_SET_ENVIRONMENT_DONE=1
    }
]
