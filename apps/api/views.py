from rest_framework import generics, permissions, status
from rest_framework.response import Response
from rest_framework.decorators import api_view, permission_classes

from songs.models import Song, Setlist
from members.models import Member
from api.serializers import SongSerializer, MemberSerializer, SetlistSerializer


class SongList(generics.ListCreateAPIView):
    permission_classes = (permissions.IsAuthenticatedOrReadOnly,)
    queryset = Song.objects.all()
    serializer_class = SongSerializer


class SongDetail(generics.RetrieveUpdateDestroyAPIView):
    permission_classes = (permissions.IsAuthenticatedOrReadOnly,)
    queryset = Song.objects.all()
    serializer_class = SongSerializer


class SetlistList(generics.ListCreateAPIView):
    permission_classes = (permissions.IsAuthenticatedOrReadOnly,)
    queryset = Setlist.objects.all()
    serializer_class = SetlistSerializer


class MemberList(generics.ListAPIView):
    permission_classes = (permissions.IsAuthenticatedOrReadOnly,)
    queryset = Member.objects.all()
    serializer_class = MemberSerializer


class MemberDetail(generics.RetrieveAPIView):
    permission_classes = (permissions.IsAuthenticatedOrReadOnly,)
    queryset = Member.objects.all()
    serializer_class = MemberSerializer



@api_view(['GET'])
def setlist_detail(request, gig_id, format=None):
    """
    Retrieve, update or delete a setlist instance.
    """
    try:
        setlist = Setlist.objects.get(show=gig_id)
    except Setlist.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)

    if request.method == 'GET':
        serializer = SetlistSerializer(setlist)
        return Response(serializer.data)

    elif request.method == 'PUT':
        serializer = SetlistSerializer(setlist, data=request.DATA)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    elif request.method == 'DELETE':
        setlist.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)