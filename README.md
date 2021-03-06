# My dotfiles, inspired by holman does dotfiles

### (Caution: this will only guarantee working on personal Mac machine. It might not work on work machine or Linux machine)

## Quick start
#### If you just got a new machine:

1. Run **script/boostrap**
2. Look at **Leftovers** and install them

#### If you have a new e.g. .importjs configuration file:

1. Run **script/link**
2. Make sure the binary this config file belongs to are in your `Brewfile`

#### If you want to modify an existing config file:

1. Modify the file, e.g. .vimrc
2. **REMEMBER TO COMMIT AND PUSH**

#### If you want to install a new software via Homebrew:

1. Install the software as you normally will with `brew install`
2. Rerun `brew bundle dump` to update the bundle file
3. Commit and push

## Summary of components

General scripts that can be run independently:

- **bin/dot**: Script that'll install Homebrew itself and run `script/install`
- **script/install**: Does 2 things:
  1. Install all Homebrew-managed programs / binaries listed in
  the `Brewfile` through command `brew bundle`
  2. Run all the `install.sh` files in each topic folder to install other
   components
- **script/link**: Link all the configuration dotfiles (`.vimrc` etc.) into `$HOME` folder
- **script/bootstrap**: Does 3 things:
  1. Set up `gitconfig`, git username etc.
  2. Run **script/link**
  3. Run **bin/dot**

Internal scripts, generally shouldn't be run by itself:

- **topic/install.sh**: Install script for that topic / program. E.g.
  **homebrew/install.sh**: will install Homebrew itself, **zsh/install.sh**
installs oh-my-zsh and any other zsh components that require installation

## Leftovers:

1. Symlink (or point the applicaiton to use) credential dotfiles stored in 
**GDrive/credential-configs**
2. YouCompleteMe will still need to be manually compiled
3. Tern is used for JS completion. But after installing Tern's Vundle plugin, make sure to run `npm install` in `.vim/bundle/tern_for_vim/` directory
4. Vim plugins install

Applications not installed by brew cask:

1. Desktop Cleaner
2. Xcode
3. WeChat

## Windows Linux Subsystem:

For WLS terminal color and font settings, see:

https://imxieyi.com/2017/10/14/%E9%92%88%E5%AF%B9win10%E4%B8%8A%E7%9A%84linux%E5%AD%90%E7%B3%BB%E7%BB%9F%E4%BC%98%E5%8C%96cmd%E7%9A%84%E9%85%8D%E8%89%B2%E5%8F%8A%E5%AD%97%E4%BD%93/

---
The original README:

# holman does dotfiles

Your dotfiles are how you personalize your system. These are mine.

I was a little tired of having long alias files and everything strewn about
(which is extremely common on other dotfiles projects, too). That led to this
project being much more topic-centric. I realized I could split a lot of things
up into the main areas I used (Ruby, git, system libraries, and so on), so I
structured the project accordingly.

If you're interested in the philosophy behind why projects like these are
awesome, you might want to [read my post on the
subject](http://zachholman.com/2010/08/dotfiles-are-meant-to-be-forked/).

## topical

Everything's built around topic areas. If you're adding a new area to your
forked dotfiles — say, "Java" — you can simply add a `java` directory and put
files in there. Anything with an extension of `.zsh` will get automatically
included into your shell. Anything with an extension of `.symlink` will get
symlinked without extension into `$HOME` when you run `script/bootstrap`.

## what's inside

A lot of stuff. Seriously, a lot of stuff. Check them out in the file browser
above and see what components may mesh up with you.
[Fork it](https://github.com/holman/dotfiles/fork), remove what you don't
use, and build on what you do use.

## components

There's a few special files in the hierarchy.

- **bin/**: Anything in `bin/` will get added to your `$PATH` and be made
  available everywhere.
- **Brewfile**: This is a list of applications for [Homebrew Cask](http://caskroom.io) to install: things like Chrome and 1Password and Adium and stuff. Might want to edit this file before running any initial setup.
- **topic/\*.zsh**: Any files ending in `.zsh` get loaded into your
  environment.
- **topic/path.zsh**: Any file named `path.zsh` is loaded first and is
  expected to setup `$PATH` or similar.
- **topic/completion.zsh**: Any file named `completion.zsh` is loaded
  last and is expected to setup autocomplete.
- **topic/install.sh**: Any file named `install.sh` is executed when you run `script/install`. To avoid being loaded automatically, its extension is `.sh`, not `.zsh`.
- **topic/\*.symlink**: Any file ending in `*.symlink` gets symlinked into
  your `$HOME`. This is so you can keep all of those versioned in your dotfiles
  but still keep those autoloaded files in your home directory. These get
  symlinked in when you run `script/bootstrap`.

## install

Run this:

```sh
git clone https://github.com/holman/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
script/bootstrap
```

This will symlink the appropriate files in `.dotfiles` to your home directory.
Everything is configured and tweaked within `~/.dotfiles`.

The main file you'll want to change right off the bat is `zsh/zshrc.symlink`,
which sets up a few paths that'll be different on your particular machine.

`dot` is a simple script that installs some dependencies, sets sane macOS
defaults, and so on. Tweak this script, and occasionally run `dot` from
time to time to keep your environment fresh and up-to-date. You can find
this script in `bin/`.

## bugs

I want this to work for everyone; that means when you clone it down it should
work for you even though you may not have `rbenv` installed, for example. That
said, I do use this as *my* dotfiles, so there's a good chance I may break
something if I forget to make a check for a dependency.

If you're brand-new to the project and run into any blockers, please
[open an issue](https://github.com/holman/dotfiles/issues) on this repository
and I'd love to get it fixed for you!

## thanks

I forked [Ryan Bates](http://github.com/ryanb)' excellent
[dotfiles](http://github.com/ryanb/dotfiles) for a couple years before the
weight of my changes and tweaks inspired me to finally roll my own. But Ryan's
dotfiles were an easy way to get into bash customization, and then to jump ship
to zsh a bit later. A decent amount of the code in these dotfiles stem or are
inspired from Ryan's original project.
