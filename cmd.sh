main() {
    local args=( $@ )
    local arg=${args[0]}
    local adpath=$( dirname "${BASH_SOURCE:-${(%):-%x}}" )
    local core=. cmd=$SHELL
    if [ -d "$adpath/core" ]; then core=core; fi
    if [[ "$arg" =~ ^__.*__$ ]]; then cmd=.; fi
    local nxt_args="$core ${args[@]}"
    . "$adpath/$core/tools/cmd/init.sh" "$nxt_args"
    if [ -f "$__APATH__" ]
    then $cmd "$__APATH__" "${args[@]:1}"
    elif [ -f "$adpath/core/cmd/$arg/main.sh" ]
    then . "$adpath/core/cmd.sh" ${args[@]}
    else . "$adpath/$core/tools/cmd/help.sh" "$adpath"
    fi
}
main $@
unset -f main
