from django.db import models
from django.contrib.auth.models import User

from imagekit.models import ImageSpecField
from imagekit.processors import ResizeToFill


class UserProfile(models.Model):
    user = models.ForeignKey(User, unique=True)
    newsletter_subscribe = models.BooleanField(default=False)
    picture = models.ImageField(upload_to='user_pics/', blank=True)
    picture_thumbnail = ImageSpecField(source='picture',
                                       processors=[ResizeToFill(270, 270)],
                                       format='JPEG',
                                       options={'quality': 90})
