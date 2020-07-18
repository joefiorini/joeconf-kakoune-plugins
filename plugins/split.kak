provide-module joeconf-split %[

define-command split-horizontal -params .. -command-completion -docstring '
split-horizontal [<commands>]: create a new kakoune client above or below the current one
The ''terminal alias is being used to determine the user''s preferred terminal emulator
The terminal must support split arguments (hsplit) to use this command
The optional arguments are passed as commands to the new client' \
%{
  try %{
		terminal hsplit kak -c %val{session} -e "%arg{@}"
  } catch %{
    fail "The 'terminal' command must support the hsplit argument for splitting to use this command"
  }
}

define-command split-vertical -params .. -command-completion -docstring '
split-horizontal [<commands>]: create a new kakoune client to the right or left of the current one
The ''terminal alias is being used to determine the user''s preferred terminal emulator
The terminal must support split arguments (vsplit) to use this command
The optional arguments are passed as commands to the new client' \
%{
  try %{
		terminal vsplit kak -c %val{session} -e "%arg{@}"
  } catch %{
    fail "The 'terminal' command must support the vsplit argument for splitting to use this command"
  }
}

]
