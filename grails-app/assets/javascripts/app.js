var app = angular.module("myApp",[]);

app.controller('namedTopicCtrl',function($scope,$http){
    var load = function(){
        console.log('call load()...');
        $http.get("/../ApollobitNewApp/preference/list1").success(function(data){
            $scope.namedTopics = data;
        }).error(function(){
            alert("An unexpected error occurred!")
        });
    }

    load();
});

app.controller('generalTopicCtrl',function($scope,$http){
    var load = function(){
        console.log('call load()...');
        $http.get("/../ApollobitNewApp/preference/list2").success(function(data){
            $scope.generalTopics = data;
        }).error(function(){
            alert("An unexpected error occurred!")
        });
    }

    load();
});

app.controller('keyTermCtrl',function($scope,$http){
    var load = function(){
        console.log('call load()...');
        $http.get("/../ApollobitNewApp/preference/list3").success(function(data){
            $scope.keyterm = data;
        }).error(function(){
            alert("An unexpected error occurred!")
        });
    }

    load();
});

app.controller('insertCtrl',function($scope,$http){
    var load = function(){
        console.log('call load()...');
        $http.get("/../ApollobitNewApp/preference/list1").success(function(data){
            $scope.keyterm = data;
        }).error(function(){
            alert("An unexpected error occurred!")
        });

        $http.get("/../ApollobitNewApp/preference/list2").success(function(data){
            $scope.keyterm = data;
        }).error(function(){
            alert("An unexpected error occurred!")
        });

        $http.get("/../ApollobitNewApp/preference/list3").success(function(data){
            $scope.keyterm = data;
        }).error(function(){
            alert("An unexpected error occurred!")
        });
    }

    $scope.master = {};

    $scope.save = function(topic) {
        console.log(topic)
        $scope.master = angular.copy(topic);
        $http.post("/../ApollobitNewApp/preference/insert",{'name':topic.name,'location':topic.location,'category':topic.category,'type':topic.type})
            .success(function(){
                console.log("Data inserted successful");
            });

        load();
    };

    $scope.reset = function() {
        $scope.topic = angular.copy($scope.master);
    };

    $scope.reset();
});