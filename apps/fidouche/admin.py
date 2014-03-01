from django.contrib import admin
from fidouche.models import Payment


class PaymentAdmin(admin.ModelAdmin):
    pass

admin.site.register(Payment, PaymentAdmin)
