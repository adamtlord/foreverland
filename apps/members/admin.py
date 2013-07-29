from django.contrib import admin
from members.models import Member

class MemberAdmin(admin.ModelAdmin):
    pass

admin.site.register(Member, MemberAdmin)
