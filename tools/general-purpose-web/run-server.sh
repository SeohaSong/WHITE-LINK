(
    # key_dir="a123456789"
    # if ! [ -d "$key_dir" ]
    # then (
    #     cd $key_dir
    #     openssl req -x509 -newkey rsa:4096 -keyout key.pem -out cert.pem -days 365
    #     openssl x509 -outform der -in cert.pem -out cert.crt
    # ) fi
    cd dist
    shs run python -m http.server -b 0.0.0.0
)
