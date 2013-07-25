from settings.common import *

# Staging overrides
DEBUG = True
IS_STAGING = True

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
DATABASES['default']['PASSWORD'] = ''

# AWS S3 SECTION
# comment this section do disable S3 static files

DEFAULT_FILE_STORAGE = 'storages.backends.s3boto.S3BotoStorage'
AWS_ACCESS_KEY_ID = '0XEZ6NQWRTNJ0NQZWDR2'
AWS_SECRET_ACCESS_KEY = 'ydsjgUdlG4tUK7JHCf87h7oIVyaRy3I0WuMykXKM'
AWS_STORAGE_BUCKET_NAME = 'base2.tivixlabs.com'
AWS_S3_SECURE_URLS = False
from S3 import CallingFormat
AWS_CALLING_FORMAT = CallingFormat.SUBDOMAIN
S3_URL = "http://%s.s3.amazonaws.com/" % AWS_STORAGE_BUCKET_NAME
STATIC_URL = S3_URL

COMPRESS_URL = S3_URL
COMPRESS_ROOT = STATIC_ROOT
COMPRESS_STORAGE = 'common.storage.CachedS3BotoStorage'
STATICFILES_STORAGE = COMPRESS_STORAGE
AWS_QUERYSTRING_AUTH = False
# END OF AWS S3 SECTION

#override for ubuntu 11.10+
# DATABASES['default']['HOST'] = '/var/run/mysqld/mysqld.sock'

