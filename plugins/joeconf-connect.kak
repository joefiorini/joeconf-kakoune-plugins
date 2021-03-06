provide-module joeconf-connect %[
    set-option global connect_environment %{
      PATH=$PATH:/run/current-system/sw/bin:/etc/profiles/per-user/jf848f/bin
      SHELL=/run/current-system/sw/bin/fish
      export __NIX_DARWIN_SET_ENVIRONMENT_DONE=1
    }

		require-module connect

		define-command gitui -docstring 'Open gitui' %{
  		terminal-set global joeconf-kitty kitty-overlay kitty-focus
  		connect-terminal gitui
  		terminal-set global joeconf-kitty kitty-split kitty-focus
		}

		define-command darwin-rebuild -docstring 'Call nix-config rebuild function' %{
  		connect-terminal fish -c "direnv exec (pwd) rebuild && exit"
		}
]
