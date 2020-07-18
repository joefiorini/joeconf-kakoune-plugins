provide-module joeconf-ifelse %[
  require-module kak
  add-highlighter shared/kakrc/code/if_else regex \b(if|else)\b 0:keyword

  define-command -docstring "if <condition> <expression> [else [if <condition>] <expression>]: if statement that accepts shell-valid condition string" \
  if -params 2.. %{ evaluate-commands %sh{
      while [ true ]; do
          condition="[ $1 ]"
          if [ -n "$3" ] && [ "$3" != "else" ]; then
              printf "%s\n" "fail %{if: unknown operator '$3'}"
          elif [ $# -eq 3 ]; then
              printf "%s\n" "fail %{if: wrong argument count}"
          elif eval $condition; then
              [ -n "''${2##*&*}" ] && arg="$2" || arg="$(printf '%s' "$2" | sed 's/&/&&/g')"
              printf "%s\n" "evaluate-commands %& $arg &"
          elif [ $# -eq 4 ]; then
              [ -n "''${4##*&*}" ] && arg="$4" || arg="$(printf '%s' "$4" | sed 's/&/&&/g')"
              printf "%s\n" "evaluate-commands %& $arg &"
          elif [ $# -gt 4 ]; then
              if [ "$4" = "if" ]; then
                  shift 4
                  continue
              else
                  printf "%s\n" "fail %{if: wrong argument count}"
              fi
          fi
          exit
      done
  }}

]
