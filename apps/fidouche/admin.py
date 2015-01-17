from django.contrib import admin
from fidouche.models import Payment, SubPayment, Payee, ExpenseCategory, TaxExpenseCategory


admin.site.register(Payment)
admin.site.register(SubPayment)
admin.site.register(Payee)
admin.site.register(ExpenseCategory)
admin.site.register(TaxExpenseCategory)
