from settings.common import *

# prod overrides
DEBUG = False
IS_PROD = True

COMPRESS_ENABLED = True
COMPRESS_OFFLINE = True

# domains/hosts etc.
# TLD_NAME = '%s.com' % PROJECT_NAME
# DOMAIN_NAME = 'www.%s' % TLD_NAME
TLD_NAME = DOMAIN_NAME = 'base.tivixlabs.com'

# Django 1.5 requirement
print "---" * 20
print TLD_NAME
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

# override for db password... not needed for most projects
DATABASES['default']['PASSWORD'] = 'tivix-rules'

#override for ubuntu 11.10+
# DATABASES['default']['HOST'] = '/var/run/mysqld/mysqld.sock'
