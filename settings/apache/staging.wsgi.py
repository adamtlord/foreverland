import os, sys, site


project = os.path.dirname(os.path.dirname(os.path.dirname(__file__)))
sys.path.append(project)
sys.path.append(os.path.dirname(project))

# to get correct site-packages on the path
sys.path.insert(0, '/home/baseproject/webapps/django_base_project/lib/python2.6/site-packages')

sys.stdout = sys.stderr

os.environ['DJANGO_SETTINGS_MODULE'] = 'settings'
os.environ['ENV'] = 'staging'

import django.core.handlers.wsgi
application = django.core.handlers.wsgi.WSGIHandler()
