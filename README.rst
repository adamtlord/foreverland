Models
------
member
~~~~~~
* display name
* instrument
* first
* last
* middle initial
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

gig
~~~
* -> venue
* date
* door time
* show time
* ticket price
* ticket url
* ages
* notes

setlist
~~~~~~~
* -> gig
* -> songs
* song order ???

song
~~~~
* -> lead singer (member)
* notes for FOH
* original artist
* year released
* album

photo
~~~~~
* -> gig

video
~~~~~
* -> gig
* embed url ?


To-Dos:
-----
* How to model setlist relationship, vis-a-vis songs and song order
* Import existing gig and venue data
* Publish calendar/rss feed
* Embed videos by url?
* Photo galleries? https://django-photologue.readthedocs.org/en/latest/

Components:
-----------
* videos
* dates
* contact
* twitter
* facebook
* comments/testimonials
* photos
