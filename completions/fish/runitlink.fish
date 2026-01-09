function __runitlink_service_list
    if contains --user (commandline -opc)
        ls $HOME/.runit/sv 2>/dev/null
    else
        ls /etc/runit/sv $HOME/.runit/sv 2>/dev/null
    end
end

complete -c runitlink -f -a \
    "--user --link --unlink --enable --disable --down --up --status --start --stop --restart --list --help"

complete -c runitlink -n "__fish_seen_subcommand_from --link --enable --unlink --disable --down --up --status --start --stop --restart" -a "(__runitlink_service_list)"
