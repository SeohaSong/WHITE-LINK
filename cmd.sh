main() {
    local args=( $@ )
    local nxt_args=${args[@]:1}
    local dir_path=$( cd $( dirname "$BASH_SOURCE" ) && pwd )
    local file=$dir_path/cmd/$args/main.sh

    if [ "${dir_path##*/}" == "core" ]
    then . "$dir_path/cmd/__reload__/main.sh" ""
    else
        cmd=$( cat $dir_path/env/cmd.txt )
        eval "$cmd() { . $dir_path/cmd.sh \$@; } && export -f $cmd"
    fi

    if [ -f "$file" ]
    then
        if [[ "$args" =~ ^__ ]]
        then . "$file" "$nxt_args"
        else bash "$file" "$nxt_args"
        fi
    else
        if [ -f "$dir_path/core/cmd/$args/main.sh" ]
        then . "$dir_path/core/cmd.sh" ${args[@]}
        else echo "$( ls "$dir_path/cmd" | grep -v ^__ )"
        fi
    fi
}
main $@
unset -f main
