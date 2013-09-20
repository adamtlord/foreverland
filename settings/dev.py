from settings.common import *

# dev overrides
DEBUG = True
IS_DEV = True

COMPRESS = False
#COMPRESS = True   # so we can test compressor locally. setting debug=False leads to other url / static serving issues.

# domains/hosts etc.
DOMAIN_NAME = 'localhost:8000'
WWW_ROOT = 'http://%s/' % DOMAIN_NAME
ALLOWED_HOSTS = ["localhost", "127.0.0.1"]

# other
FIXTURE_DIRS = '%s/fixtures/auth' % PROJECT_ROOT
EMAIL_BACKEND = 'django.core.mail.backends.console.EmailBackend'


CACHES = {
    'default': {
        'BACKEND': 'johnny.backends.locmem.LocMemCache',
        'TIMEOUT': 1800,
        'JOHNNY_CACHE': True,
    }
}

# change logging level to debug
LOGGING['loggers']['']['level'] = 'DEBUG'
LOGGING['loggers']['django.request']['level'] = 'DEBUG'

TEMPLATE_DEBUG = True

extend_list_avoid_repeats(INSTALLED_APPS, [
    'django_extensions'
])

try:
    from local import *
except ImportError:
    pass
