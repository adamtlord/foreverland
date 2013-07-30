import os, sys

####
# Change per project
####
PROJECT_NAME = 'foreverland'


####
# Other settings
####
ADMINS = (
    ('Alerts', 'adam@foreverlandsf.com'),
)
SITE_ID = 1
TIME_ZONE = 'America/Los_Angeles'  # changed to UTC
LANGUAGE_CODE = 'en-us'
USE_I18N = True
SECRET_KEY = '(t+-%@*6%3v4*ffgg7yhfjj$d0wby^uk(d%)a+5_6__jlnye#'
DEFAULT_CHARSET = 'utf-8'
ROOT_URLCONF = 'urls'

# project root and add "apps" to the path
PROJECT_ROOT = os.path.abspath(os.path.split(os.path.split(__file__)[0])[0])
sys.path.append(os.path.join(PROJECT_ROOT, 'apps/'))

UPLOADS_DIR_NAME = 'uploads'
MEDIA_URL = '/%s/' % UPLOADS_DIR_NAME
MEDIA_ROOT = os.path.join(PROJECT_ROOT, '%s' % UPLOADS_DIR_NAME)
FILE_UPLOAD_MAX_MEMORY_SIZE = 4194304  # 4mb


# static resources related. See documentation at: http://docs.djangoproject.com/en/dev/ref/contrib/staticfiles/
STATIC_URL = '/static/'
STATIC_ROOT = '%s/staticserve' % PROJECT_ROOT
STATICFILES_DIRS = (
    ('global', '%s/static' % PROJECT_ROOT),
)

# static serving
STATICFILES_FINDERS = (
    "django.contrib.staticfiles.finders.FileSystemFinder",
    "django.contrib.staticfiles.finders.AppDirectoriesFinder",

    # other finders..
    "compressor.finders.CompressorFinder",
)

DEBUG = False
IS_DEV = False
IS_STAGING = False
IS_PROD = False

# Get the ENV setting. Needs to be set in .bashrc or similar.
ENV = os.getenv('ENV')
if not ENV:
    raise Exception('Environment variable ENV is required!')

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': '%s' % PROJECT_NAME,
        'HOST': 'localhost',
        'USER': 'root',
        'PASSWORD': '',
        'OPTIONS': {
           'init_command': 'SET storage_engine=INNODB',
        }
    }
}

MIDDLEWARE_CLASSES = [
    'johnny.middleware.LocalStoreClearMiddleware',
    'johnny.middleware.QueryCacheMiddleware',

    'django.middleware.common.CommonMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.transaction.TransactionMiddleware',

    # 'userswitch.middleware.UserSwitchMiddleware',
    # 'social_auth.middleware.SocialAuthExceptionMiddleware',
]

TEMPLATE_CONTEXT_PROCESSORS = [
    'django.contrib.auth.context_processors.auth',
    'django.core.context_processors.debug',
    'django.core.context_processors.media',
    'django.core.context_processors.request',
    'django.contrib.messages.context_processors.messages',
    'django.core.context_processors.static',

    'django_common.context_processors.common_settings',
]

TEMPLATE_DIRS = (
    os.path.join(PROJECT_ROOT, 'templates'),
)

INSTALLED_APPS = [
    # 'grappelli',
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.humanize',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.sites',
    'django.contrib.sitemaps',
    'django.contrib.staticfiles',

    'south',
    # 'social_auth',
    'registration',
    'compressor',
    #'indexer',
    'imagekit',
    'django_common',
    # 'endless_pagination',
    'storages',

    'marketing',
    'members',
    'shows',
    'songs',
    'accounts',
    'common',
]

TEMPLATE_LOADERS = [
    'django.template.loaders.filesystem.Loader',
    'django.template.loaders.app_directories.Loader',
]

# Email settings #
EMAIL_BACKEND = 'django.core.mail.backends.smtp.EmailBackend'

EMAIL_HOST = 'smtp.sendgrid.net'
EMAIL_PORT = 587
EMAIL_HOST_USER = 'adam@foreverlandsf.com'
EMAIL_HOST_PASSWORD = 'Bubbles14'
EMAIL_USE_TLS = True
DEFAULT_FROM_EMAIL = 'noreply@foreverlandsf.com'


# auth / django-registration params
ACCOUNT_ACTIVATION_DAYS = 7
LOGIN_URL = '/accounts/login/'
LOGIN_REDIRECT_URL = '/'
LOGIN_ERROR_URL = '/accounts/login/error/'
SEND_EMAIL_AFTER_REGISTRATION = False  # default: False
SEND_EMAIL_AFTER_ACTIVATION = True  # default: True
AUTOMATIC_ACTIVATION_AFTER_REGISTRATION = True  # default: True

AUTHENTICATION_BACKENDS = [
    #'social_auth.backends.twitter.TwitterBackend',
    #'social_auth.backends.facebook.FacebookBackend',
    'django_common.auth_backends.EmailBackend',
    'django.contrib.auth.backends.ModelBackend',
]
AUTH_PROFILE_MODULE = 'accounts.UserProfile'

SOCIAL_AUTH_PIPELINE = (
    'social_auth.backends.pipeline.social.social_auth_user',
    # Pipeline associate_by_email is disabled by default because it can
    # be a dangerouse behavior that could lead to accounts take over, see:
    # http://django-social-auth.readthedocs.org/en/latest/pipeline.html
    #'social_auth.backends.pipeline.associate.associate_by_email',
    'social_auth.backends.pipeline.user.get_username',
    'social_auth.backends.pipeline.user.create_user',
    'social_auth.backends.pipeline.social.associate_user',
    'social_auth.backends.pipeline.social.load_extra_data',
    'social_auth.backends.pipeline.user.update_user_details',

    # Custom pipelines
    'accounts.social_pipelines.create_profile',
)

# To enable social authentication just add backend specific settings here
# (FaceBook etc.), see: http://django-social-auth.readthedocs.org/en/latest/backends/index.html
# and enable chosen backends in AUTHENTICATION_BACKENDS above, then link it
# in templates: http://django-social-auth.readthedocs.org/en/latest/configuration.html#linking-in-your-templates

JOHNNY_MIDDLEWARE_KEY_PREFIX = 'jc_'

if 'test' in sys.argv:
    DATABASES['default'] = {'ENGINE': 'django.db.backends.sqlite3', 'PASSWORD': '', 'USER': ''}

COMPRESS_PRECOMPILERS = (
    ('text/less', 'lessc {infile} {outfile}'),
)

COMPRESS_CSS_FILTERS = [
    #css minimizer
    'compressor.filters.cssmin.CSSMinFilter'
]
COMPRESS_JS_FILTERS = [
    'compressor.filters.jsmin.JSMinFilter'
]

USERSWITCH_OPTIONS = {
    # Make userswitch z-index higher and move it to left-bottom to not cover up grappelli admin navbar.
    'css_inline': 'position:fixed !important; bottom: 10px !important; left: 10px !important; opacity:0.50; z-index: 9999;',
}

# helper function to extend all the common lists
def extend_list_avoid_repeats(list_to_extend, extend_with):
    """Extends the first list with the elements in the second one, making sure its elements are not already there in the
    original list."""
    list_to_extend.extend(filter(lambda x: not list_to_extend.count(x), extend_with))


LOGS_PATH = os.path.join(PROJECT_ROOT, 'logs/')

if not os.path.exists(LOGS_PATH):
    os.makedirs(LOGS_PATH)

LOGGING = {
    'version': 1,
    'disable_existing_loggers': True,
    'formatters': {
        'standard': {
            'format': '%(asctime)s [%(levelname)s] %(name)s: %(message)s'
        },
    },
    'filters': {
        'require_debug_false': {
            '()': 'django.utils.log.RequireDebugFalse'
        }
    },
    'handlers': {
        'default': {
            'level': 'DEBUG',
            'class': 'logging.handlers.RotatingFileHandler',
            'filename': os.path.join(LOGS_PATH, 'project.log'),
            'maxBytes': 1024*1024*5,  # 5 MB
            'backupCount': 5,
            'formatter': 'standard'},
        'mail_admins': {
            'level': 'ERROR',
            'class': 'django.utils.log.AdminEmailHandler',
            'filters': ['require_debug_false'],
        }
    },
    'loggers': {
        '': {
            'handlers': ['default'],
            'level': 'INFO',
            'propagate': True},
        'django.request': {
            'handlers': ['mail_admins'],
            'level': 'ERROR',
            'propagate': False,
        },
    }
}
