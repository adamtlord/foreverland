from settings.common import *

# prod overrides
DEBUG = False
IS_PROD = True

COMPRESS_ENABLED = True
COMPRESS_OFFLINE = True

# domains/hosts etc.
# TLD_NAME = '%s.com' % PROJECT_NAME
# DOMAIN_NAME = 'www.%s' % TLD_NAME
TLD_NAME = DOMAIN_NAME = 'flstaging.adamlord.com'
PROJECT_ROOT = os.path.dirname(os.path.abspath(__file__)) 
PROJECT_URL = '/'

# Django 1.5 requirement
ALLOWED_HOSTS = [TLD_NAME]

WWW_ROOT = 'http://%s/' % DOMAIN_NAME
DEFAULT_FROM_EMAIL = 'no-reply@%s' % TLD_NAME

# change or add multiple if hosts don't map to domain (load balancer situation)
SSH_HOSTS = 'adamlord.webfactional.com'

SESSION_ENGINE = 'django.contrib.sessions.backends.cached_db'
CACHES = {
    'default': {
        'BACKEND': 'johnny.backends.memcached.MemcachedCache',
        'LOCATION': '127.0.0.1:11211',
        'TIMEOUT': 86400,
        'JOHNNY_CACHE': True,
    }
}

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'foreverland_db',
        'HOST': 'localhost',
        'USER': 'adamlord_fl',
        'PASSWORD': 'IiT77j58tR7yUoKO',
        'OPTIONS': {
           'init_command': 'SET storage_engine=INNODB',
        }
    }
}

COMPRESS_URL = STATIC_URL
COMPRESS_ROOT = STATIC_ROOT
