Models
------
MEMBER
~~~~~~
* display name
* instrument
* first
* last
* middle initial
* dob
* date of join

VENUE
~~~~~
* name
* image
* address
* city
* state
* zip
* phone
* website

GIG
~~~
* -> venue
* date
* door time
* show time
* ticket price
* ticket url
* ages
* notes

SETLIST
~~~~~~~
* -> gig
* -> songs
* song order ???

SONG
~~~~
* -> lead singer (member)
* notes for FOH
* original artist
* year released
* album

PHOTO
~~~~~
* -> gig

VIDEO
~~~~~
* -> gig
* embed url ?

todo:
-----
* How to model setlist relationship, vis-a-vis songs and song order
* Import existing gig and venue data
* Publish calendar/rss feed
* Embed videos by url?
* Photo galleries?

components:
-----------
* videos
* dates
* contact
* twitter
* facebook
* comments/testimonials
* photos
