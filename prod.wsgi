#!/usr/bin/python 
import os, site, sys  # Tell wsgi to add the Python site-packages to it's path. 

# to get correct site-packages on the path
sys.path.insert(0, '/home/adamlord/webapps/foreverland_python/lib/python2.7/site-packages')

sys.stdout = sys.stderr

os.environ['DJANGO_SETTINGS_MODULE'] = 'settings'
os.environ['ENV'] = 'prod'

from django.core.handlers.wsgi import WSGIHandler
application = WSGIHandler()  
