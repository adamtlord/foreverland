from django.conf.urls import patterns, url, include
from django.contrib.auth import views as auth_views

from accounts.backends.custom import CustomRegistrationView, CustomActivationView
from accounts.forms import RegistrationForm, PasswordResetForm


urlpatterns = patterns('accounts.views',
    url(r'^register/$',
        CustomRegistrationView.as_view(form_class=RegistrationForm),
        name='registration_register'),

    url(r'^login/$',
        auth_views.login, {'template_name': 'registration/login.html'},
        name='auth_login'),
    url(r'^login/modal/$',
        auth_views.login, {'template_name': 'registration/fragments/login_modal.html'},
        name='auth_login_modal'),
    url(r'^login/error/$', 'login_error', name='login_error'),

    url(r'^password/reset/$',
        auth_views.password_reset,
        {'password_reset_form': PasswordResetForm},
        name='auth_password_reset'),

    url(r'^activate/(?P<activation_key>(?!complete)\w+)/$',
        CustomActivationView.as_view(),
        name='registration_activate'),

    (r'', include('registration.backends.default.urls')),

    url(r'^profile/(?P<username>[A-Za-z0-9_-]+)$', 'profile_page', name='profile_page'),
    url(r'^profile/edit/$', 'profile_edit', name='profile_edit'),
)
