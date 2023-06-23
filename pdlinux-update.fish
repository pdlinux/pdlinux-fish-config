if status --is-interactive
    # I reallyyyy don't want to alias sudo, so let's do this absolute garbage code instaed
    function __pdlinux_pdlinux-update --on-event fish_preexec
        if string match -q 'sudo pacman *' -- "$argv"
            set actual_args (string sub -s 13 "$argv")
            argparse --name=pacman -i 'S' 'y' 'u' -- $actual_args
            or set actual_args "cancel"
            if ! set -q __pdlinux_pdlinux_update_ignore && set -q _flag_S &&  set -q _flag_y &&  set -q _flag_u && [ -z "$argv" ]
                echo 'pdlinux is updated via the "pdlinux-update" command instead of pacman -Syu. https://wiki.pdlinux.org/en/pdlinux-update'
                read -l -P 'Would you like to run "pdlinux-update" instead? (i = never ask again/ignore) [y/N/i] ' confirm
                switch $confirm
                case Y y
                    echo ''
                    /usr/bin/pdlinux-update
                    set -g __pdlinux_pdlinux_update_status $status
                    function sudo --wraps sudo
                        functions -e sudo
                        return $__pdlinux_pdlinux_update_status
                    end
                case I i
                    set -U __pdlinux_pdlinux_update_ignore true
                case N n
                    echo ''
                end
            end
        end
    end
end
