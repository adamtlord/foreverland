from django.contrib import admin
from shows.models import Venue, Show
from fidouche.models import Expense
from sorl.thumbnail.admin import AdminImageMixin


class VenueAdmin(admin.ModelAdmin):
    pass

admin.site.register(Venue, VenueAdmin)


class ExpenseAdmin(AdminImageMixin, admin.ModelAdmin):
	pass

admin.site.register(Expense, ExpenseAdmin)


class ExpenseInline(admin.TabularInline):
	model = Expense


class ShowAdmin(admin.ModelAdmin):
	ordering = ['-date']
	inlines = [ExpenseInline]

admin.site.register(Show, ShowAdmin)
