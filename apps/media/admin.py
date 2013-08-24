from django.contrib import admin
from media.models import Album, Tag, Image, Video


class AlbumAdmin(admin.ModelAdmin):
    search_fields = ["title"]
    list_display = ["title", "images", "public"]


class TagAdmin(admin.ModelAdmin):
    list_display = ["tag"]


class ImageAdmin(admin.ModelAdmin):
    list_display = ["__unicode__", "title", "size", "tags_", "albums_", "thumbnail_", "created"]
    list_filter = ["tags", "albums"]

class VideoAdmin(admin.ModelAdmin):
	list_display = ["title", "embed_type", "tags_",  "albums_", "created"]

admin.site.register(Album, AlbumAdmin)
admin.site.register(Image, ImageAdmin)
admin.site.register(Video, VideoAdmin)
admin.site.register(Tag, TagAdmin)
