local CMD_PATH=$__CMD_PATH__
wl __trap__
wl echo Update \'$CMD_PATH\' repo
cd $CMD_PATH
git add .
git commit -m "continue previous working" || :
git push origin master
