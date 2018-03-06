var app = angular.module('EitiWelcome', []);


app.controller('eitiWelcomeCtrl',['$scope', function($scope){

    $scope.users = [
        {
            id: 0,
            name: 'Tyrion',
            lastname: 'Lannister',
            avilable: 'now'
        },
        {
            id: 2,
            name: 'Daenerys',
            lastname: 'Targaryen',
            avilable: '3 days ago'
        },
        {
            id: 3,
            name: 'Arya',
            lastname: 'Stark',
            avilable: 'now'
        }
        ,
        {
            id: 4,
            name: 'Jon',
            lastname: 'Snow',
            avilable: '3 days ago'
        },
        {
            id: 5,
            name: 'Sandor',
            lastname: 'Clegane',
            avilable: 'now'
        },
        {
            id: 2,
            name: 'Daenerys',
            lastname: 'Targaryen'
        },
        {
            id: 3,
            name: 'Arya',
            lastname: 'Stark'
        }
        ,
        {
            id: 4,
            name: 'Jon',
            lastname: 'Snow'
        },
        {
            id: 5,
            name: 'Sandor',
            lastname: 'Clegane'
        },
        {
            id: 2,
            name: 'Daenerys',
            lastname: 'Targaryen'
        },
        {
            id: 3,
            name: 'Arya',
            lastname: 'Stark'
        }
        ,
        {
            id: 4,
            name: 'Jon',
            lastname: 'Snow'
        },
        {
            id: 5,
            name: 'Sandor',
            lastname: 'Clegane'
        },
        {
            id: 2,
            name: 'Daenerys',
            lastname: 'Targaryen'
        },
        {
            id: 3,
            name: 'Arya',
            lastname: 'Stark'
        }
        ,
        {
            id: 4,
            name: 'Jon',
            lastname: 'Snow'
        },
        {
            id: 5,
            name: 'Sandor',
            lastname: 'Clegane'
        }]


    $scope.isTheUserAvailable = function(x)
    {
        if(x.avilable == "now") {
            return {color: "green"}
        }
        else
        {
            return {color: "red"}
        }
    }

}]);



