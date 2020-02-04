import http.server
import ssl

key_dir = "../a123456789"

ip = "0.0.0.0"
port = 5443
certfile = "%s/cert.pem" % key_dir
keyfile = "%s/key.pem" % key_dir

httpd = http.server.HTTPServer((ip, port), http.server.SimpleHTTPRequestHandler)
httpd.socket = ssl.wrap_socket(httpd.socket, certfile=certfile, keyfile=keyfile)
httpd.serve_forever()
