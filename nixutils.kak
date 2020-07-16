provide-module joeconf-nixutils %[
  hook -once global BufSetOption filetype=(nix) %{
    add-highlighter -override shared/nix/code/ regex "([a-zA-Z_][a-zA-Z0-9-_.]*)\s*([=])" 1:variable
  }

  define-command -params 1.. nix-prefetch-github %{
    prompt owner: %{
      set-register o %val{text}
      prompt repo: %{
        set-register r %val{text}
        prompt rev: %{
          set-register v %val{text}

          execute-keys "!nix-prefetch-github %reg{o} %reg{r}"

          if %[ -n "''${kak_reg_v}" ] %{
           execute-keys "--rev %reg{v}"
          }

          execute-keys " %arg{@} --nix | tail -6<ret>"
        }
      }
    }
  }
]
