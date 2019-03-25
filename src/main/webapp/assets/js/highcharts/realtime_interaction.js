Highcharts.setOptions({
    global: {
        useUTC: false
    }
});
function activeLastPointToolip(chart) {
    var points = chart.series[0].points;
    chart.tooltip.refresh(points[points.length -1]);

}
var chart = Highcharts.chart('realtime_data', {
    chart: {
        type: 'spline',
        marginRight: 10,
        events: {
            load: function () {
                //湿度
                var series = this.series[0],
                    chart = this;
                activeLastPointToolip(chart);
                setInterval(function () {
                    var x = (new Date()).getTime(), // 当前时间
                        y = parseInt(JSON.parse(thdata).humidity);
                    if(y != 0) {
                        series.addPoint([x, y], true, true);
                        activeLastPointToolip(chart);
                    }
                    y = 0;

                }, 1000);
                //温度
                var series1 = this.series[1],
                    chart1 = this ;
                activeLastPointToolip(chart1);
                setInterval(function () {
                    var x = (new Date()).getTime(),
                        y = parseInt(JSON.parse(thdata).temperature);
                    if(y != 0) {
                        series1.addPoint([x, y], true, true);
                        activeLastPointToolip(chart1);
                    }
                    y = 0;
                },1000);
            }
        }
    },
    title: {
        text: '生产环境实时状态'
    },
    xAxis: {
        type: 'datetime',
        tickPixelInterval: 150
    },
   /* yAxis: {
        title: {
            text: null
        }
    },*/
    yAxis: [{ // 第一个 Y 轴，放置在左边（默认在坐标）
        title: {
            text: "温度数据（℃）"
        },
        labels: {
            align: 'left',
            x: 3,
            y: 16,
            format: '{value:.,0f}'
        },
        showFirstLabel: false
    }, {    // 第二个坐标轴，放置在右边
        linkedTo: 0,
        gridLineWidth: 0,
        opposite: true,  // 通过此参数设置坐标轴显示在对立面
        title: {
            text: "湿度数据（%RH）"
        },
        labels: {
            align: 'right',
            x: -3,
            y: 16,
            format: '{value:.,0f}'
        },
        showFirstLabel: false
    }],
    tooltip: {
        formatter: function () {
            return '<b>' + this.series.name + '</b><br/>' +
                Highcharts.dateFormat('%Y-%m-%d %H:%M:%S', this.x) + '<br/>' +
                Highcharts.numberFormat(this.y, 2);
        }
    },
    legend: {
        enabled: true,
        align: 'left',
        verticalAlign: 'top',
        y: 20,
        floating: true,
        borderWidth: 0

    },
    series: [{
        name: '湿度数据',
        data: (function () {

                    // 生成随机值
                    var data = [],
                    time = (new Date()).getTime(),
                    i;
                for (i = -19; i <= 0; i += 1) {
                    data.push({
                        x: time + i * 1000,
                    y: 1

                });
            }
            return data;
        }())
    },{
        name: '温度数据',
        data: (function () {

            // 生成随机值
            var data = [],
                time = (new Date()).getTime(),
                i;
            for (i = -19; i <= 0; i += 1) {
                data.push({
                    x: time + i * 1000,
                    y: Math.random()

                });
            }
            return data;
        }())
    }]
});