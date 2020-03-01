main() {
    local args=( $@ )
    local arg=${args[0]}
    local adpath=$( dirname "${BASH_SOURCE:-${(%):-%x}}" )
    local core=. cmd='bash -c'
    if [ -d "$adpath/core" ]; then core=core; fi
    if [[ "$arg" =~ ^__.*__$ ]]; then cmd=eval; fi
    local nxt_args="$core ${args[@]}"
    . $adpath/$core/tools/cmd/init.sh "$nxt_args"
    if [ -f "$__APATH__" ]
    then $cmd 'main() { . $__APATH__; }; main'
    elif [ -f $adpath/core/cmd/$arg/main.sh ]
    then . $adpath/core/cmd.sh ${args[@]}
    else . $adpath/$core/tools/cmd/help.sh
    fi
    . $adpath/$core/tools/cmd/close.sh
}
main $@
unset -f main
