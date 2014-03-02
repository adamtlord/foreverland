from django.contrib import admin
from fidouche.models import Payment, SubPayment, Payee


class PaymentAdmin(admin.ModelAdmin):
    pass

admin.site.register(Payment, PaymentAdmin)


class SubPaymentAdmin(admin.ModelAdmin):
	pass

admin.site.register(SubPayment, SubPaymentAdmin)


class PayeeAdmin(admin.ModelAdmin):
	pass

admin.site.register(Payee, PayeeAdmin)
