# runitlink to control runit service

runitlink is a helper script for managing runit services easily, supporting both system and user-level services. It wraps sv commands with convenient flags, provides dynamic multi-column listing, and includes tab completion for Bash, Zsh, and Fish.

## User features
assumes you have for runsvdir
```
$HOME/.runit
$HOME/.runit/sv
$HOME/.runit/runsvdir
```
add it as startup command for you let say wm
```
runsvdir $HOME/.runit/runsvdir/
```
or use system level runit service to enable the runsvdir
```
/etc/runit/service/runit-user/run
```
script located at service/



## Features

Enable / disable services (--link / --unlink / --enable / --disable)

Start / stop / restart services (--start / --stop / --restart)

Mark service down/up (--down / --up)

Check status (--status)

List services in dynamic multi-column format (--list) with markers:

(linked) – service is linked/running

(down) – service is down

(user) – user-level service

Supports user mode with --user

Auto-detects user vs system service if --user is not provided

Compatible with Bash, Zsh, and Fish tab completion

### Installation

Copy the script to a location in your PATH, e.g.:
```
sudo cp runitlink /usr/local/bin/
sudo chmod +x /usr/local/bin/runitlink
```

### Optional: enable shell completions.

#### Bash
```
source /path/to/runitlink.bash
```

Or copy to `/etc/bash_completion.d/runitlink` for system-wide completion.

#### Zsh
add to .zshrc
```
fpath=(/path/to/completions $fpath)
autoload -Uz compinit
compinit
```
example
```
fpath=(~/.zsh/completions $fpath)
autoload -Uz compinit
compinit
```
Save the file as example
```
mkdir -p $HOME/.zsh/completions
$HOME/.zsh/completions/_runitlink
```
Fish

Save the file as:
```
~/.config/fish/completions/runitlink.fish
```

##Usage
### List all system services
`runitlink --list`

### List user services
`runitlink --user --list`

### Enable / link a service
`runitlink --enable <service>`

### Disable / unlink a service
`runitlink --disable <service>`

### Mark a service down or up
```
runitlink --down <service>
runitlink --up <service?
```
### Start, stop, or restart a service
```
runitlink --start <service>
runitlink --stop <service>
runitlink --restart <service>
```
### Check service status
`runitlink --status <service>`

Notes

If --user is not specified, the script will attempt to auto-detect whether the service exists in system (/etc/runit/sv) or user ($HOME/.runit/sv) directories.

The --list output adapts to your terminal width and aligns services in multiple columns with markers displayed next to the service.

This README is fully ready to paste into your GitHub repository.

easy install


curl -Lo /usr/local/bin/runitlink https://github.com/yourusername/runitlink/raw/main/runitlink
chmod +x /usr/local/bin/runitlink
