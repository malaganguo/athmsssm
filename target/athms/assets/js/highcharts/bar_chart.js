var chart = Highcharts.chart('container3', {
    chart: {
        type: 'column'
    },
    title: {
        text: '全球各大城市人口排行'
    },
    subtitle: {
        text: '数据截止 2017-03，来源: <a href="https://en.wikipedia.org/wiki/List_of_cities_proper_by_population">Wikipedia</a>'
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
            text: '人口 (百万)'
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
        data: [
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
        ],
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