main() {
    shs __trap__
    local adpath v
    local dpaths="./core ."
    for adpath in $( for v in $dpaths; do ( cd $v && pwd ); done )
    do (
        shs __echo__ Update \'$adpath\' repo
        cd $adpath
        git add .
        git commit -m "continue previous working" || :
        git push origin master
    ) done
}
main
