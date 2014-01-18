Models
------
member
~~~~~~
* display name
* instrument
* first
* last
* middle initial?
* dob
* date of join

venue
~~~~~
* name
* image
* address
* city
* state
* zip
* phone
* website

show
~~~
* -> venue
* date
* door time
* show time
* ticket price
* ticket url
* ages
* opener
* notes
* poster
* financial info

setlist
~~~~~~~
* -> gig
* -> songs
* song order (thru table)

song
~~~~
* -> lead singer(s) (member)
* notes for FOH
* original artist
* year released
* album

photo
~~~~~
* -> gig
* -> album -> show

video
~~~~~
* -> gig
* tags
* embed url
* video id
* platform (youtube, vimeo, etc)


To-Dos:
-----
* X How to model setlist relationship, vis-a-vis songs and song order
* X Import existing gig and venue data
* X Publish calendar/rss feed https://bitbucket.org/IanLewis/django-ical
* X Embed videos by url
* X Photo galleries https://django-photologue.readthedocs.org/en/latest/

Components:
-----------
* videos
* dates
* contact
* twitter
* facebook
* comments/testimonials
* photos
