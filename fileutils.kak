provide-module joeconf-fileutils %[

define-command rename -params 1 -file-completion -docstring %{
  Rename the current buffer and file
} %{
  write
  evaluate-commands %sh{
    dir=$(dirname "$kak_buffile")
    target="$dir/$1"
    if ! mv "$kak_buffile" "$target"
    then
      fail "Failed to rename file (see *debug*)"
    fi

    echo delete-buffer
    printf "edit '%s'\n" "$target"
  }
}

]
