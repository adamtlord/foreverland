from django.contrib import admin
from shows.models import Venue, Show

class VenueAdmin(admin.ModelAdmin):
    pass

admin.site.register(Venue, VenueAdmin)


class ShowAdmin(admin.ModelAdmin):
	ordering = ['-date']

admin.site.register(Show, ShowAdmin)
