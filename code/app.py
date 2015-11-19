from webapp2 import RequestHandler, WSGIApplication

class TestApp(RequestHandler):
    def get(self):
        self.response.write('hello world')

application = WSGIApplication([('/', TestApp)])
