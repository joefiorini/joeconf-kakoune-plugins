# joeconf-kakoune-plugins

This is a collection of plugins for the [Kakoune][1] editor to make an already great editing experience even better!

I'm currently using these as part of my kakoune setup, but I'm offering them here in case anyone else might find them useful.

## Installation

You have a few options for installing the plugins depending on whether you use [plug.kak][2], [nix package manager][3] or manual loading. You can either use all the plugins at once (kitchen sink) or pick and choose which ones to use (piecemeal).

### Plug.kak

#### Kitchen sink

```
plug "joefiorini/joeconf-kakoune-plugins"
```

#### Piecemeal

```
plug "joefiorini/joeconf-kakoune-plugins" subset %{
	plugins/fileutils.kak
	plugins/kitty.kak
}
```

### Nix package manager

I'm going to assume you're using [niv][4] for managing nix package repositories (sources), in large part because I don't know the best way to do so without it :wink:.

```
niv add joeconf-kakoune-plugins -o joefiorini -r joeconf-kakoune-plugins
```

Now assuming you are installing Kakoune and other plugins somewhere, you can import this package by adding:

```
let
	joeconf-kakoune-plugins = (import path/to/niv/sources).joeconf-kakoune-plugins;
in
	...
```

and then you can include `joeconf-kakoune-plugins` in your list of kakoune plugins

#### Kitchen sink

In your `kakrc` you can just add:


```
require-module joeconf
```

#### Piecemeal

Each plugin provides its own module, so look in the source for the correct module name. Assuming you want the `fileutils` plugin just add to your `kakrc`:

```
require-module joeconf-fileutils
```

etc for each plugin you want to load.

## Plugins

- fileutils

A collection of useful commands operating on the current buffer's file

- ifelse

A simple plugin for adding conditionals to your kak scripts without having to deal with awkward shell scripting. Lifted from [@andreyorst's dotfiles][5]

- kitty

Adds support for kitty terminal layout direction (horizontal/vertical splits, fat, tall, etc)

- split

Adds Vim like split commands (split-horizontal, split-vertical) to Kakoune (currently just proxying to the corresponding kitty commands, but could be extended to support tmux, etc)

- connect

Adds a couple additional commands that use connect.kak to open programs

- lsp

My kak-lsp configuration

- nixutils

Various utility commands related to working with nix modules

- pathutils

A collection of useful commands operating on the path of the current buffer's file

- usermodes

Mnemonic keyboard mappings that work extremely well with Kakoune's self-documentation; similar to Spacemacs, SpaceVim, vim-which-key, etc.


[1]: https://kakoune.org/ "Kakoune Website"
[2]: https://github.com/andreyorst/plug.kak "Plug.kak on Github"
[3]: http://nixos.org/ "NixOS Website"
[4]: https://github.com/nmattia/niv "Niv on Github"
[5]: https://github.com/andreyorst/dotfiles/blob/187ebb84f9542b76a4f3c3e08f9533cd8187faa1/.config/kak/commands.kak#L254-L278 "If command on github"
