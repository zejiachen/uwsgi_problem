import webapp2

class TestApp(webapp2.RequestHandler):
    def get(self):
        self.response.write('hello world')

application = webapp2.WSGIApplication([('/', TestApp)])
