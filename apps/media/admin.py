from django.contrib import admin
from media.models import Album, Tag, Image


class AlbumAdmin(admin.ModelAdmin):
    search_fields = ["title"]
    list_display = ["title"]


class TagAdmin(admin.ModelAdmin):
    list_display = ["tag"]


class ImageAdmin(admin.ModelAdmin):
    list_display = ["__unicode__", "title", "tags_", "size", "albums_",
        "thumbnail", "created"]
    list_filter = ["albums"]

    def save_model(self, request, obj, form, change):
        obj.user = request.user
        obj.save()


admin.site.register(Album, AlbumAdmin)
admin.site.register(Image, ImageAdmin)
admin.site.register(Tag, TagAdmin)
