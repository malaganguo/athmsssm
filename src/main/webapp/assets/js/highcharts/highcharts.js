function chart1() {
    Highcharts.chart('container1', {
        chart: {
            type: 'line'
        },
        title: {
            text: '温度折线图'
        },
        subtitle: {
            text: '数据来源: #{site}'
        },
        xAxis: {
            // categories: ["一月",'二月', '三月', '四月', '五月', '六月', '七月', '八月', '九月', '十月', '十一月', '十二月']
            categories:timeStr
        },
        yAxis: {
            title: {
                text: '温度(°C)'
            }
        },
        plotOptions: {
            line: {
                dataLabels: {
                    // 开启数据标签
                    enabled: true
                },
                // 关闭鼠标跟踪，对应的提示框、点击事件会失效
                enableMouseTracking: false
            }
        },
        series: [{
            name: $("#select-site option:selected").text(),
            // data: [7.0, 6.9, 9.5, 14.5, 18.4, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6]
            data:chart1Data
        }]
    });
}

function chart2(percentt){
    Highcharts.chart('container2', {
        chart: {
            plotBackgroundColor: null,
            plotBorderWidth: null,
            plotShadow: false,
            type: 'pie'
        },
        title: {
            text: '温度占比'
        },
        tooltip: {
            pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
        },
        plotOptions: {
            pie: {
                allowPointSelect: true,
                cursor: 'pointer',
                dataLabels: {
                    enabled: false
                },
                showInLegend: true
            }
        },
        series: [{
            name: '占比',
            colorByPoint: true,
            data: [{
                name: '<'+$("#analysis-minthreshold input").val(),
                // y: 61.41,
                y: percentt[0],
                sliced: true,
                selected: true
            }, {
                name: '>'+$("#analysis-maxthreshold input").val(),
                // y: 11.84
                y: percentt[1]
            }, {
                name: $("#analysis-minthreshold input").val()+'和'+$("#analysis-maxthreshold input").val()+'之间',
                // y: 10.85
                y: percentt[2]
            }]
        }]
    });
}


function chart3(chart3data) {
    var chart = Highcharts.chart('container3', {
        chart: {
            type: 'column'
        },
        title: {
            text: '温度统计'
        },
        subtitle: {
            text: ''
        },
        xAxis: {
            type: 'category',
            labels: {
                rotation: -45  // 设置轴标签旋转角度
            }
        },
        yAxis: {
            min: 0,
            title: {
                text: '温度（℃）'
            }
        },
        legend: {
            enabled: false
        },
        tooltip: {
            pointFormat: '人口总量: <b>{point.y:.1f} 百万</b>'
        },
        series: [{
            name: '总人口',
            /*data: [
                ['上海', 24.25],
                ['卡拉奇', 23.50],
                ['北京', 21.51],
                ['德里', 16.78],
                ['拉各斯', 16.06],
                ['天津', 15.20],
                ['伊斯坦布尔', 14.16],
                ['东京', 13.51],
                ['广州', 13.08],
                ['孟买', 12.44],
                ['莫斯科', 12.19],
                ['圣保罗', 12.03],
                ['深圳', 10.46],
                ['雅加达', 10.07],
                ['拉合尔', 10.05],
                ['首尔', 9.99],
                ['武汉', 9.78],
                ['金沙萨', 9.73],
                ['开罗', 9.27],
                ['墨西哥', 8.87]
            ],*/
            data:chart3data,
            dataLabels: {
                enabled: true,
                rotation: -90,
                color: '#FFFFFF',
                align: 'right',
                format: '{point.y:.1f}', // :.1f 为保留 1 位小数
                y: 10
            }
        }]
    });
}


function chart4(chart4date,chart4temperature,chart4humidity) {
    Highcharts.chart('container4', {
        chart: {
            zoomType: 'xy'
        },
        title: {
            text: $("#select-site option:selected").text()+'温度和湿度数据对比'
        },
        subtitle: {
            text: '数据来源: '+$("#select-site option:selected").text()
        },
        xAxis: [{
            // categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
            //     'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
            categories:chart4date,
            crosshair: true
        }],
        yAxis: [{ // Primary yAxis
            labels: {
                format: '{value}°C',
                style: {
                    color: Highcharts.getOptions().colors[1]
                }
            },
            title: {
                text: '温度',
                style: {
                    color: Highcharts.getOptions().colors[1]
                }
            }
        }, { // Secondary yAxis
            title: {
                text: '湿度',
                style: {
                    color: Highcharts.getOptions().colors[0]
                }
            },
            labels: {
                format: '{value} mm',
                style: {
                    color: Highcharts.getOptions().colors[0]
                }
            },
            opposite: true
        }],
        tooltip: {
            shared: true
        },
        legend: {
            layout: 'vertical',
            align: 'left',
            x: 120,
            verticalAlign: 'top',
            y: 100,
            floating: true,
            backgroundColor: (Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF'
        },
        series: [{
            name: '湿度',
            type: 'column',
            yAxis: 1,
            // data: [49.9, 71.5, 106.4, 129.2, 144.0, 176.0, 135.6, 148.5, 216.4, 194.1, 95.6, 54.4],
            data: chart4humidity,
            tooltip: {
                valueSuffix: ' %RH'
            }
        }, {
            name: '温度',
            type: 'spline',
            // data: [7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6],
            data: chart4temperature,
            tooltip: {
                valueSuffix: '°C'
            }
        }]
    });
}