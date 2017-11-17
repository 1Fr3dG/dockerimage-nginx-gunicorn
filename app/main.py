import sys


def application(env, start_response):
    start_response('200 OK', [('Content-Type', 'text/html')])
    return iter([("Hello World from an Nginx Gunicorn WSGI Python (%s) app in a\
            Docker container" % sys.version).encode('utf-8')])
