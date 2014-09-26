from django.forms import ModelForm
from songs.models import Setlist, SetlistSong


class SetlistForm(ModelForm):
	class Meta:
		model = Setlist

	def __init__(self, *args, **kwargs):
		super(SetlistForm, self).__init__(*args, **kwargs)
		for field in self.fields:
			self.fields[field].widget.attrs['class'] = 'form-control'


class SetlistSongForm(ModelForm):
	class Meta:
		model = SetlistSong

	def __init__(self, *args, **kwargs):
		super(SetlistSongForm, self).__init__(*args, **kwargs)
		for field in self.fields:
			self.fields[field].widget.attrs['class'] = 'form-control'
