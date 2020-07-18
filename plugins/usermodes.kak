provide-module joeconf-usermodes %[
  map global normal , <space>
  map global normal <space> ,

  # define-command map-user-mode

	declare-user-mode window-navigation

	# map-user-mode w window-navgiation "window navigation"
	# map-user-mode-cmd l 
	map global user w ': enter-user-mode window-navigation<ret>' -docstring "window navigation"
	map global window-navigation h ': split-horizontal<ret>' -docstring "horizontal split"
	map global window-navigation v ': split-vertical<ret>'  -docstring "vertical split"
	map global window-navigation t ': kitty-terminal-tab<ret>' -docstring "new tab"

	declare-user-mode files

	map global user f ': enter-user-mode files<ret>' -docstring "files"
	map global files z ': fzf-files<ret>' -docstring "open file"
	map global files x ': broot<ret>' -docstring "explore files"
	map global files d ': kitty-split-horizontal rm $kak_buffile<ret>: delete-buffer<ret>' -docstring "delete current file"

	declare-user-mode buffer

	map global user b ': enter-user-mode buffer<ret>' -docstring "Buffer"
	map global buffer z ': fzf-buffers<ret>' -docstring "open buffer"
	map global buffer n ': buffer-next<ret>' -docstring "next"
	map global buffer p ': buffer-previous<ret>' -docstring "previous"
	map global buffer c ': delete-buffer<ret>' -docstring "close buffer"

	declare-user-mode git
	map global user g ': enter-user-mode git<ret>' -docstring "Git"
	map global git s ': gitui<ret>' -docstring "gitui"
	map global git u ': gitui<ret>' -docstring "gitui"
	map global git w ': write<ret>: git add<ret>: git update-diff<ret>' -docstring "write - Write and stage the current file"

	declare-user-mode git-commit
	map global git c ': enter-user-mode git-commit<ret>' -docstring "Commit"
	map global git-commit c ': git commit<ret>' -docstring "commit"
	map global git-commit a ': git commit --amend<ret>' -docstring "amend commit"

	declare-user-mode user-terminal

	map global user t ': enter-user-mode user-terminal<ret>' -docstring "Terminal"
	map global user-terminal w ': kitty-split-horizontal<ret>' -docstring "Window"
	map global user-terminal t ': kitty-terminal-tab<ret>' -docstring "Tab"

	declare-user-mode refactoring 
	map global user r ': enter-user-mode refactoring<ret>' -docstring "Refactoring"
	map global refactoring c ': lsp-code-actions<ret>' -docstring "Code Actions"
	map global refactoring r ': lsp-highlight-references<ret>' -docstring "Highlight references"
	map global refactoring d ': lsp-diagnostics<ret>' -docstring "Open diagnostics"


	declare-user-mode lsp-navigation
	map global refactoring g ': enter-user-mode lsp-navigation<ret>' -docstring "Code Navigation"
	map global lsp-navigation d ': lsp-definition<ret>' -docstring "Go to definition"
	map global lsp-navigation r ': lsp-references<ret>' -docstring "List references"
	map global lsp-navigation s ': lsp-document-symbol<ret>' -docstring "Show symbols"

	declare-user-mode clipboard

	map global user y ': enter-user-mode clipboard<ret>' -docstring "System Clipboard"
	map global clipboard f '%<a-|>pbcopy<ret>' -docstring "Copy file"
	map global clipboard c '<a-|>pbcopy<ret>' -docstring "Copy"
	map global clipboard x '|pbcopy<ret>' -docstring "Cut"
	map global clipboard v '!pbpaste<ret>' -docstring "Paste"
]
