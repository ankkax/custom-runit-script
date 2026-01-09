#!/bin/bash

_runitlink_completions() {
    local cur prev opts
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"

    # Main flags
    opts="--user --link --unlink --enable --disable --down --up --status --start --stop --restart --list --help"

    # Determine if a flag expects a service argument
    case "$prev" in
        --link|--unlink|--enable|--disable|--down|--up|--status|--start|--stop|--restart)
            if [[ " ${COMP_WORDS[@]} " =~ "--user" ]]; then
                COMPREPLY=( $(compgen -W "$(ls -1 $HOME/.runit/sv 2>/dev/null)" -- "$cur") )
            else
                COMPREPLY=( $(compgen -W "$(ls -1 /etc/runit/sv $HOME/.runit/sv 2>/dev/null)" -- "$cur") )
            fi
            return
            ;;
    esac

    COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
}

complete -F _runitlink_completions runitlink

