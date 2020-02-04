(
    # key_dir="a123456789"
    # if ! [ -d "$key_dir" ]
    # then (
    #     cd $key_dir
    #     openssl req -x509 -newkey rsa:4096 -keyout key.pem -out cert.pem -days 365
    #     openssl x509 -outform der -in cert.pem -out cert.crt
    # ) fi
    lines=( $( ps -ax | grep http.server ) )
    kill $lines &> /dev/null
    (
        cd dist
        python3 -m http.server
    ) &
    path=${HOST_SHS_PATH%/*}
    bat_filepath="$path/Anaconda3/Scripts/activate.bat"
    anaconda_path="$path/Anaconda3"
    { cmd.exe /c "$bat_filepath $anaconda_path & python tools/main.py"; } &
)
