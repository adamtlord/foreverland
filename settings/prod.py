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
print "---" * 20
print TLD_NAME
print PROJECT_ROOT
ALLOWED_HOSTS = [TLD_NAME]

WWW_ROOT = 'http://%s/' % DOMAIN_NAME
DEFAULT_FROM_EMAIL = 'no-reply@%s' % TLD_NAME

# change or add multiple if hosts don't map to domain (load balancer situation)
SSH_HOSTS = [TLD_NAME]

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
        'PASSWORD': 'Candybeans97',
        'OPTIONS': {
           'init_command': 'SET storage_engine=INNODB',
        }
    }
}

#override for ubuntu 11.10+
# DATABASES['default']['HOST'] = '/var/run/mysqld/mysqld.sock'
MEDIA_ROOT = os.path.join(PROJECT_ROOT, 'uploads/') 
MEDIA_URL = '/uploads/'
STATIC_ROOT = os.path.join(PROJECT_ROOT, 'static_collected/')
STATIC_URL = '/static/'
STATICFILES_DIRS = [ os.path.join(PROJECT_ROOT, 'static'), ]

ADMIN_MEDIA_PREFIX = STATIC_URL + 'admin/'

COMPRESS_URL = STATIC_URL
COMPRESS_ROOT = STATIC_ROOT
