angular.module('setter', ['ui.router'])
    .config(function config($stateProvider){
        $stateProvider.state("index", {
            url: '',
            controller: 'SetterController as setter',
            templateUrl: 'templates/setter/index.html'
        })
    })
    .controller('SetterController', function SetterController($scope) {
    $scope.songs = [
        {
            "id": 1,
            "singer": [{
                "display_first": "Lisa"
            }],
            "name": "ABC",
            "original_artist": "The Jackson Five",
            "original_album": "ABC",
            "release_year": "1970",
            "display": true,
            "foh_notes": ""
        }, {
            "id": 2,
            "singer": [{
                "display_first": "Matthew"
            }],
            "name": "Another Part of Me",
            "original_artist": "Michael Jackson",
            "original_album": "Bad",
            "release_year": "1988",
            "display": true,
            "foh_notes": ""
        }, {
            "id": 3,
            "singer": [],
            "name": "Baby Be Mine",
            "original_artist": "Michael Jackson",
            "original_album": "Thriller",
            "release_year": "1982",
            "display": true,
            "foh_notes": ""
        }, {
            "id": 4,
            "singer": [{
                "display_first": "Lisa"
            }],
            "name": "Bad",
            "original_artist": "Michael Jackson",
            "original_album": "Bad",
            "release_year": "1987",
            "display": true,
            "foh_notes": ""
        }, {
            "id": 5,
            "singer": [{
                "display_first": "Matthew"
            }],
            "name": "Beat It",
            "original_artist": "Michael Jackson",
            "original_album": "Thriller",
            "release_year": "1983",
            "display": true,
            "foh_notes": ""
        }, {
            "id": 6,
            "singer": [{
                "display_first": "Carlos"
            }],
            "name": "Billie Jean",
            "original_artist": "Michael Jackson",
            "original_album": "Thriller",
            "release_year": "1983",
            "display": true,
            "foh_notes": ""
        }, {
            "id": 7,
            "singer": [{
                "display_first": "Mark"
            }],
            "name": "Blame It On The Boogie",
            "original_artist": "The Jacksons",
            "original_album": "Destiny",
            "release_year": "1978",
            "display": true,
            "foh_notes": ""
        }, {
            "id": 8,
            "singer": [{
                "display_first": "Matthew"
            }],
            "name": "Black or White",
            "original_artist": "Michael Jackson",
            "original_album": "Dangerous",
            "release_year": "1991",
            "display": true,
            "foh_notes": ""
        }, {
            "id": 9,
            "singer": [{
                "display_first": "Lisa"
            }],
            "name": "Burn This Disco Out",
            "original_artist": "Michael Jackson",
            "original_album": "Off the Wall",
            "release_year": "1979",
            "display": true,
            "foh_notes": ""
        }, {
            "id": 10,
            "singer": [{
                "display_first": "Matthew"
            }],
            "name": "Dirty Diana",
            "original_artist": "Michael Jackson",
            "original_album": "Bad",
            "release_year": "1988",
            "display": true,
            "foh_notes": ""
        }
    ]
});