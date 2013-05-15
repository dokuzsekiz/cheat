Usage of cheat.sh
=================

* Display cheat sheet of something:

    `cheat.sh -d <on_what>`

* Create or edit a cheat sheet:

    `cheat.sh -e <on_what>`

* List all the cheat sheets:

    `cheat.sh -l`

Reasons
-------

1. The original idea is from http://cheat.errtheblog.com/
2. This time it uses an own git repo as a common database of markdown files
3. This repo contains a very simple bash script which manages cheat sheets
4. Easily manage cheat accounts via Github
5. You can create convenient aliases to use this script. Good luck!

Helpful aliases
---------------

```
alias ch="~/.cheat/cheat -d"
alias ch?="~/.cheat/cheat -l | grep"
```
