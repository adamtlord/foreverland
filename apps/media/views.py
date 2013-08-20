from django.shortcuts import render
from django.contrib.auth.decorators import login_required
from django.core.context_processors import csrf
from django.core.paginator import Paginator, InvalidPage, EmptyPage
from django.forms import ModelForm

from media.models import *


def main(request, template="media/list.html"):
    """Main listing."""
    albums = Album.objects.all()
    if not request.user.is_authenticated():
        albums = albums.filter(public=True)

    paginator = Paginator(albums, 10)
    try: page = int(request.GET.get("page", '1'))
    except ValueError: page = 1

    try:
        albums = paginator.page(page)
    except (InvalidPage, EmptyPage):
        albums = paginator.page(paginator.num_pages)

    for album in albums.object_list:
        album.images = album.image_set.all()[:4]

    d = {'albums': albums, 'user': request.user}

    return render(request, template, d)


def album(request, pk, view="thumbnails", template="media/album.html"):
    """Album listing."""
    num_images = 30
    if view == "full": num_images = 10

    album = Album.objects.get(pk=pk)
    images = album.image_set.all()
    paginator = Paginator(images, num_images)
    try: page = int(request.GET.get("page", '1'))
    except ValueError: page = 1

    try:
        images = paginator.page(page)
    except (InvalidPage, EmptyPage):
        images = paginator.page(paginator.num_pages)

    # add list of tags as string and list of album objects to each image object
    for img in images.object_list:
        tags = [x[1] for x in img.tags.values_list()]
        img.tag_lst = join(tags, ', ')
        img.album_lst = [x[1] for x in img.albums.values_list()]

    d = {
        'album': album,
        'images': images,
        'user': request.user,
        'view': view,
        'albums': Album.objects.all()
    }
    d.update(csrf(request))

    return render(request, template, d)


def image(request, pk, template="media/image.html"):
    """Image page."""
    img = Image.objects.get(pk=pk)
    d = {
        'image': img,
        'user': request.user,
        'backurl': request.META["HTTP_REFERER"]
    }

    return render(request, template, d)


def update(request):
    """Update image title, rating, tags, albums."""
    p = request.POST
    images = defaultdict(dict)

    # create dictionary of properties for each image
    for k, v in p.items():
        if k.startswith("title") or k.startswith("rating") or k.startswith("tags"):
            k, pk = k.split('-')
            images[pk][k] = v
        elif k.startswith("album"):
            pk = k.split('-')[1]
            images[pk]["albums"] = p.getlist(k)

    # process properties, assign to image objects and save
    for k, d in images.items():
        image = Image.objects.get(pk=k)
        image.title = d["title"]
        image.rating = int(d["rating"])

        # tags - assign or create if a new tag!
        tags = d["tags"].split(', ')
        lst = []
        for t in tags:
            if t: lst.append(Tag.objects.get_or_create(tag=t)[0])
        image.tags = lst

        if "albums" in d:
            image.albums = d["albums"]
        image.save()

    return HttpResponseRedirect(request.META["HTTP_REFERER"], dict(media_url=MEDIA_URL))

