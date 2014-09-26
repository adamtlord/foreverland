var sortApp = angular.module('sortableApp', ['ui.sortable']);

sortApp.controller('sortableController', function($scope) {
    $scope.listData = [
        [{
            title: "ABC"
        }, {
            title: "Another Part of Me"
        }, {
            title: "Baby Be Mine"
        }, {
            title: "Bad"
        }, {
            title: "Beat It"
        }, {
            title: "Billie Jean"
        }, {
            title: "Black or White"
        }, {
            title: "Blame It On The Boogie"
        }, {
            title: "Blood on the Dance Floor"
        }, {
            title: "Burn This Disco Out"
        }, {
            title: "Can You Feel It"
        }, {
            title: "Dancing Machine"
        }, {
            title: "Dirty Diana"
        }, {
            title: "Don't Stop 'Til You Get Enough"
        }, {
            title: "Earth Song"
        }, {
            title: "Ease on Down the Road"
        }, {
            title: "Get On the Floor"
        }, {
            title: "Girlfriend"
        }, {
            title: "Human Nature"
        }, {
            title: "I Can't Help It"
        }, {
            title: "I Just Can't Stop Loving You"
        }, {
            title: "I Want You Back"
        }, {
            title: "I'll Be There"
        }, {
            title: "It's the Falling in Love"
        }, {
            title: "Lady in My Life"
        }, {
            title: "Leave Me Alone"
        }, {
            title: "Liberian Girl"
        }, {
            title: "Lovely One"
        }, {
            title: "Man in the Mirror"
        }, {
            title: "Never Can Say Goodbye"
        }, {
            title: "Off the Wall"
        }, {
            title: "P.Y.T."
        }, {
            title: "Rock With You"
        }, {
            title: "Say Say Say"
        }, {
            title: "Scream"
        }, {
            title: "Shake Your Body (Down to the Ground)"
        }, {
            title: "Smooth Criminal"
        }, {
            title: "Somebody's Watching Me"
        }, {
            title: "The Girl Is Mine"
        }, {
            title: "The Love You Save"
        }, {
            title: "The Way You Make Me Feel"
        }, {
            title: "They Don't Care About Us"
        }, {
            title: "Thriller"
        }, {
            title: "Wanna Be Startin' Something"
        }, {
            title: "Workin' Day and Night"
            }
        ],
        []
    ];


    $scope.sortingLog = [];

    function createOptions(listName) {
        var _listName = listName;
        var options = {
            placeholder: "ph",
            connectWith: ".songlist",
            activate: function() {
                console.log("list " + _listName + ": activate");
            },
            beforeStop: function() {
                console.log("list " + _listName + ": beforeStop");
            },
            change: function() {
                console.log("list " + _listName + ": change");
            },
            create: function() {
                console.log("list " + _listName + ": create");
            },
            deactivate: function() {
                console.log("list " + _listName + ": deactivate");
            },
            out: function() {
                console.log("list " + _listName + ": out");
            },
            over: function() {
                console.log("list " + _listName + ": over");
            },
            receive: function() {
                console.log("list " + _listName + ": receive");
            },
            remove: function() {
                console.log("list " + _listName + ": remove");
            },
            sort: function() {
                console.log("list " + _listName + ": sort");
            },
            start: function() {
                console.log("list " + _listName + ": start");
            },
            stop: function() {
                console.log("list " + _listName + ": stop");
            },
            update: function() {
                console.log("list " + _listName + ": update");
            }
        };
        return options;
    }

    $scope.sortableOptionsList = [createOptions('A'), createOptions('B')];

    $scope.logModels = function() {
        if($scope.listData[1].length){
            $scope.sortingLog = [];
            var logEntry = $scope.listData[1].map(function(x){
                return x.title;
            });
            for(var i=0; i < logEntry.length; i++){
                $scope.sortingLog.push(i + ': ' + logEntry[i]);
            }
        } else {
            alert('add some songs, yo');
        }
    };
});
$(function(){
    var allsongs = $('.allsongs');
    allsongs.affix({
        offset: {
            top: 70
        }
    });
    allsongs.on('affix.bs.affix', function () {
        $(this).css('width', $(this).width());
    }).on('affix-top.bs.affix', function(){
        $(this).css('width','auto');
    });    
});