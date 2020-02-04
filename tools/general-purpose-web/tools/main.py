import time
import tornado
from tornado import websocket

class ChannelHandler(websocket.WebSocketHandler):
    @classmethod
    def urls(cls):
        return [("/ws", cls, {})]
    def open(self):
        self.write_message("OPEN")
    def on_message(self, msg):
        self.write_message(str(time.time()))
    def on_close(self):
        print("XXXXXXXXXX")
        exit()
    def check_origin(self, origin):
        return True

if __name__ == '__main__':
    app = tornado.web.Application(ChannelHandler.urls())
    http_server = tornado.httpserver.HTTPServer(app)
    http_server.listen(8888, 'localhost')
    tornado.ioloop.IOLoop.instance().start()
