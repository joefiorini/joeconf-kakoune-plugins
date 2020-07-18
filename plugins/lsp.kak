provide-module joeconf-lsp %[
  define-command lsp-restart %{ lsp-stop; lsp-start }

  hook global KakBegin .* %{
    set-option global lsp_server_configuration pyls.plugins.pyls_mypy.enabled=true
    set-option global lsp_server_configuration pyls.plugins.pyls_black.enabled=true
    set-option global lsp_server_configuration pyls.plugins.pyls_isort.enabled=true
  }

  hook global WinSetOption filetype=(c|cpp|rust|python|javascript|typescript|reason|ocaml|php) %{
      eval %sh{kak-lsp --kakoune -s $kak_session}
      lsp-enable

      hook -always global KakEnd .* lsp-exit

      map window user "l" ": enter-user-mode lsp<ret>" -docstring "LSP mode"
      map window lsp "n" "<esc>: lsp-find-error --include-warnings<ret>" -docstring "find next error or warning"
      map window lsp "p" "<esc>: lsp-find-error --previous --include-warnings<ret>" -docstring "find previous error or warning"

      lsp-auto-hover-enable
      lsp-auto-hover-insert-mode-disable
      set-option window lsp_hover_anchor true
      set-face window DiagnosticError default+u
      set-face window DiagnosticWarning default+u
  }
]
