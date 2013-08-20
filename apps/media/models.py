import os
from PIL import Image as PImage
from settings import MEDIA_ROOT, MEDIA_URL
from os.path import join as pjoin
from tempfile import NamedTemporaryFile
from string import join

from django.db import models
from django.core.files import File

from shows.models import Show


class Album(models.Model):
    title = models.CharField(max_length=100)
    public = models.BooleanField(default=False)
    show = models.ManyToManyField(Show, blank=True)

    def __unicode__(self):
        return self.title

    def images(self):
        lst = [x.image.name for x in self.image_set.all()]
        lst = ["<a href='%s/%s'>%s</a>" % (MEDIA_URL, x, x.split('/')[-1]) for x in lst]
        return join(lst, ', ')
    images.allow_tags = True


class Tag(models.Model):
    tag = models.CharField(max_length=50)
    def __unicode__(self):
        return self.tag


class Image(models.Model):
    title = models.CharField(max_length=60, blank=True, null=True)
    image = models.FileField(upload_to="images/")
    thumbnail = models.ImageField(upload_to="images/", blank=True, null=True)
    tags = models.ManyToManyField(Tag, blank=True)
    show = models.ManyToManyField(Show, blank=True)
    albums = models.ManyToManyField(Album, blank=True)
    created = models.DateTimeField(auto_now_add=True)
    width = models.IntegerField(blank=True, null=True)
    height = models.IntegerField(blank=True, null=True)
    thumbnail2 = models.ImageField(upload_to="images/", blank=True, null=True)

    def save(self, *args, **kwargs):
        """Save image dimensions"""
        super(Image, self).save(*args, **kwargs)
        im = PImage.open(os.path.join(MEDIA_ROOT, self.image.name))
        self.width, self.height = im.size

       # large thumbnail
        fn, ext = os.path.splitext(self.image.name)
        im.thumbnail((128,128), PImage.ANTIALIAS)
        thumb_fn = fn + "-thumb2" + ext
        tf2 = NamedTemporaryFile()
        im.save(tf2.name, "JPEG")
        self.thumbnail2.save(thumb_fn, File(open(tf2.name)), save=False)
        tf2.close()

        # small thumbnail
        im.thumbnail((40,40), PImage.ANTIALIAS)
        thumb_fn = fn + "-thumb" + ext
        tf = NamedTemporaryFile()
        im.save(tf.name, "JPEG")
        self.thumbnail.save(thumb_fn, File(open(tf.name)), save=False)
        tf.close()

        super(Image, self).save(*args, **kwargs)

    def size(self):
        """Image size"""
        return "%s x %s" % (self.width, self.height)

    def __unicode__(self):
        return self.image.name

    def tags_(self):
        lst = [x[1] for x in self.tags.values_list()]
        return str(join(lst, ', '))

    def albums_(self):
        lst = [x[1] for x in self.albums.values_list()]
        return str(join(lst, ', '))

    def thumbnail_(self):
        return "<img border='0' alt='' src='%s/%s' height='40' />" % (
                                                                        (MEDIA_URL, self.image.name))
    thumbnail_.allow_tags = True
