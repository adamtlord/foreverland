from string import join

import os
from PIL import Image as PImage
from settings import MEDIA_ROOT, MEDIA_URL

from django.db import models
from shows.models import Show


class Album(models.Model):
    title = models.CharField(max_length=100)
    public = models.BooleanField(default=False)
    show = models.ManyToManyField(Show, blank=True)

    def __unicode__(self):
        return self.title


class Tag(models.Model):
    tag = models.CharField(max_length=50)
    def __unicode__(self):
        return self.tag


class Image(models.Model):
    title = models.CharField(max_length=60, blank=True, null=True)
    image = models.FileField(upload_to="images/")
    tags = models.ManyToManyField(Tag, blank=True)
    show = models.ManyToManyField(Show, blank=True)
    albums = models.ManyToManyField(Album, blank=True)
    created = models.DateTimeField(auto_now_add=True)
    width = models.IntegerField(blank=True, null=True)
    height = models.IntegerField(blank=True, null=True)

    def save(self, *args, **kwargs):
        """Save image dimensions"""
        super(Image, self).save(*args, **kwargs)
        im = PImage.open(os.path.join(MEDIA_ROOT, self.image.name))
        self.width, self.height = im.size
        super(Image, self).save(*args, **kwargs)

    def size(self):
        """Image size"""
        return "%s x %s" % (self.width, self.height)

    def __unicode__(self):
        return self.title

    def tags_(self):
        lst = [x[1] for x in self.tags.values_list()]
        return str(join(lst, ', '))

    def albums_(self):
        lst = [x[1] for x in self.albums.values_list()]
        return str(join(lst, ', '))

    def thumbnail(self):
        return "<img border='0' alt='' src='%s/%s' height='40' />" % (
                                                                        (MEDIA_URL, self.image.name))
    thumbnail.allow_tags = True
