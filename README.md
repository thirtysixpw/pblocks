# pblocks

Modular status bar for dwm and other wm's written in POSIX shell.

## Modifying blocks

The statusbar is made from text output from commandline programs. Blocks are
added and removed by editing the config.h file.

## My config

I have pblocks run preexisting scripts
[from my dotfiles repo](https://github.com/thirtysixpw/dotfiles/tree/master/.local/bin/statusbar).
So if you want to use my config, download those and put them in your
`$PATH`. I do this to avoid redundancy in my setup, because I use the same
scripts in all of my statusbars.

## Signaling changes

Most statusbars constantly rerun every script every several seconds to update.
This is an option here, but a *superior* choice is giving your module a signal
that you can signal to it to update on a relevant event, rather than having it
rerun on interval.

For example, the volume module has the update signal 10. Thus,
running `pkill -x -RTMIN+10 pblocks` will update it.

You can also run `kill -44 $(pidof -x pblocks)` which will have the same effect,
but is faster. Just add 34 to your typical signal number.

My volume module *never* updates on its own, instead I have this command run
along side my volume shortcuts in dwm to only update it when relevant.

Note that all modules must have different signal numbers.

## Improvements

The only notable feature that is lacking at the moment is *clickable modules*.
It exports `$BLOCK_BUTTON` variable and runs block stript in response to click events
to bar, which then can be handled in statusbar scipts.

This seems impossible to implement because in `dwmblocks` and other bars it's
done throught use of `sigqueu` and it's handler. Any help will be apreciated.

## License

This program is released under the GPLv3 license, which you can
find in the [LICENSE](LICENSE) file.
