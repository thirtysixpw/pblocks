# Upstream moved to [Codeberg](https://codeberg.org/thirtysixpw/pblocks)

## [codeberg.org/thirtysixpw/pblocks](https://codeberg.org/thirtysixpw/pblocks)

### This repository will not get updates

# pblocks

Modular status bar for dwm and other wm's written in POSIX shell.

## Installation

A makefile is provided to make install and removal easy.
Run `make install` *(as root if needed)*, `make uninstall` to remove.

A user of Arch-based distro can also install [pblocks-git](https://aur.archlinux.org/packages/pblocks-git) package from the AUR.

## Configuration

The status bar is made from text output from command line programs.
For detailed usage see manpage with `man pblocks`.

I have pblocks run preexisting scripts
[from my dotfiles repo](https://github.com/thirtysixpw/dotfiles/tree/master/.local/bin/statusbar).
So if you want to use [my config](https://github.com/thirtysixpw/dotfiles/blob/master/.config/pblocks/pblocksrc), download those and put them in your
`$PATH`. I do this to avoid redundancy in my setup, because I use the same
scripts in all of my statusbars.

## Signaling changes

Most statusbars constantly rerun every script every several seconds to update.
This is an option here, but a *superior* choice is giving your module a signal
that you can signal to it to update on a relevant event, rather than having it
rerun on interval.

Modules can have **unique** signals to update them only then their value changes
instead of having them rerun on interval, which is more efficient.

To  update  module with update signal *n* (where n can be from 1 to 22)
you need to run `pkill -RTMIN+n pblocks`.
Or `kill -m $(pidof -x pblocks)` (where *m*=*n*+34), which is faster.

## Examples

To setup the volume module with update signal 10 you need to put
`pkill -RTMIN+10 pblocks` command along side your volume bindings,
so module will update only when volume changes, instead of constantly checking it's value.

Run `pblocks -s | while read -r bar; do xprop -root -set WM_NAME "$bar"; done`
to update dwm bar with *xprop* instead of *xsetroot*, although pblocks by
default uses xprop instead of xsetroot if it is not present.

## Icons

There is no *icon* column in config file, because many people either don't use them at all
or use dynamic icons, that change corresponding to certain events.

To use icons add them directly to scripts or use `printf "<icon>%s" "$(<command>)"` as
command, which is universal.

## Improvements

The only notable feature that is lacking at the moment is *clickable modules*.
It exports `$BLOCK_BUTTON` variable and runs block script in response to click events
to bar, which then can be handled in status bar scripts. Any help will be appreciated.

## License

pblocks is free/libre software. This program is released under the GPLv3
license, which you can find in the file [LICENSE](LICENSE).
