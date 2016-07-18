var app = angular.module('myModule', []);

    app.controller('myController', function($scope,$http) {
        $http.get("/../ApollobitNewApp/visualize/line").success(function(data){
            var contains = function(needle) {
                // Per spec, the way to identify NaN is that it is not equal to itself
                var findNaN = needle !== needle;
                var indexOf;

                if(!findNaN && typeof Array.prototype.indexOf === 'function') {
                    indexOf = Array.prototype.indexOf;
                } else {
                    indexOf = function(needle) {
                        var i = -1, index = -1;

                        for(i = 0; i < this.length; i++) {
                            var item = this[i];

                            if((findNaN && item !== item) || item === needle) {
                                index = i;
                                break;
                            }
                        }

                        return index;
                    };
                }

                return indexOf.call(this, needle) > -1;
            };

            var category = []
            var pre = [];
            var topic = [];

            for(var i = 0; i < data.length; i++) {
                var obj = data[i];
                if(contains.call(category, obj.timestamp)==false){
                    category.push(obj.timestamp);
                }
                if(contains.call(topic, obj.viewedTopics)==false){
                    topic.push(obj.viewedTopics);
                }

/*
                function addValueToKey(aMap,key, value) {
                    aMap[key] = aMap[key] || [];
                    aMap[key].push(value);
                }
                if(chartData[obj.viewedTopics]==undefined){
                    chartData[obj.viewedTopics] = {name:obj.viewedTopics,y:obj.timeSpent};
                }else{
                    addValueToKey(chartData,obj.viewedTopics,obj.timeSpent);
                }
                */
            }
            var f = new Array();
            for (i=0;i<topic.length;i++) {
                f[i]=new Array();
                for (var j=0;j<data.length;j++) {
                    obj = data[j];
                    if(obj.viewedTopics==topic[i]){
                        f[i][f[i].length]=obj.timeSpent;
                    }
                }
            }

            for(i=0;i<topic.length;i++){
                pre.push({name:topic[i],data:f[i]})
            }
            console.log(f)
            console.log(topic);

            var standard = [{
                name: 'Crime',
                data: [7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6]
            }, {
                name: 'Tragedy',
                data: [-0.2, 0.8, 5.7, 11.3, 17.0, 22.0, 24.8, 24.1, 20.1, 14.1, 8.6, 2.5]
            }, {
                name: 'Sports',
                data: [-0.9, 0.6, 3.5, 8.4, 13.5, 17.0, 18.6, 17.9, 14.3, 9.0, 3.9, 1.0]
            }, {
                name: 'Travel',
                data: [3.9, 4.2, 5.7, 8.5, 11.9, 15.2, 17.0, 16.6, 14.2, 10.3, 6.6, 4.8]
            }];
            console.log(standard[0].data)

            console.log(standard)
            Highcharts.chart('container', {
                title: {
                    text: 'Daily Time Spent on Topics'
                },

                xAxis: {
                    categories: category
                },
                yAxis: {
                    title: {
                        text: 'Minutes'
                    },
                    plotLines: [{
                        value: 0,
                        width: 1,
                        color: '#808080'
                    }]
                },
                tooltip: {
                    valueSuffix: 'min'
                },
                legend: {
                    layout: 'vertical',
                    align: 'right',
                    verticalAlign: 'middle',
                    borderWidth: 0
                },
                series: pre
            });
        }).error(function(){
            alert("An unexpected error occurred!")
        });

    });

app.controller('PieCtrl', function($scope,$http) {
    $http.get("/../ApollobitNewApp/visualize/getArticles").success(function(data){

        var contains = function(needle) {
            // Per spec, the way to identify NaN is that it is not equal to itself
            var findNaN = needle !== needle;
            var indexOf;

            if(!findNaN && typeof Array.prototype.indexOf === 'function') {
                indexOf = Array.prototype.indexOf;
            } else {
                indexOf = function(needle) {
                    var i = -1, index = -1;

                    for(i = 0; i < this.length; i++) {
                        var item = this[i];

                        if((findNaN && item !== item) || item === needle) {
                            index = i;
                            break;
                        }
                    }

                    return index;
                };
            }

            return indexOf.call(this, needle) > -1;
        };

        var chartData = []
        var topic = []
        for(var i = 0; i < data.length; i++) {
            var obj = data[i];
            if(contains.call(topic, obj.viewedTopics)==false){
                topic.push(obj.viewedTopics);
                chartData.push({name: obj.viewedTopics,y: obj.articlesRead})
            }
        }
        console.log(chartData)

        Highcharts.chart('pieContainer', {

            title: {
                text: 'Articles Read for Each Topic'
            },

            chart: {
                plotBackgroundColor: null,
                plotBorderWidth: null,
                plotShadow: false,
                type: 'pie'
            },
            tooltip: {
                pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
            },
            plotOptions: {
                pie: {
                    allowPointSelect: true,
                    cursor: 'pointer',
                    dataLabels: {
                        enabled: true,
                        format: '<b>{point.name}</b>: {point.percentage:.1f} %',
                        style: {
                            color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                        }
                    }
                }
            },
            series: [{
                name: 'Brands',
                colorByPoint: true,
                data: chartData
            }]
        });
    }).error(function(){
        alert("An unexpected error occurred!")
    });

});

