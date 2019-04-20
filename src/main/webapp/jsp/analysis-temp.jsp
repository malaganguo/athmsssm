<%--
  Created by IntelliJ IDEA.
  User: malaganguo
  Date: 2019/3/26
  Time: 11:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>

    <meta charset="utf-8">
    <title>农业管理系统——数据分析</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Le styles -->
    <link href="http://fonts.googleapis.com/css?family=Oxygen|Marck+Script" rel="stylesheet" type="text/css">
    <link href="<%=request.getContextPath()%>/assets/css/bootstrap.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/assets/css/font-awesome.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/assets/css/admin.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/assets/css/aloha.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/assets/css/datetime/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
    <script src="https://img.hcharts.cn/jquery/jquery-1.8.3.min.js"></script>
    <script src="https://img.highcharts.com.cn/highcharts/highcharts.js"></script>
    <script src="https://img.highcharts.com.cn/highcharts/modules/exporting.js"></script>
    <script src="https://img.highcharts.com.cn/highcharts/modules/oldie.js"></script>
    <script src="https://img.highcharts.com.cn/highcharts-plugins/highcharts-zh_CN.js"></script>
    <!--<script src="https://img.highcharts.com.cn/highcharts/themes/dark-unica.js"></script>-->





    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

</head>
<body>
<div class="container">
    <div class="row">
        <!--导航栏开始-->
        <jsp:include page="frame-left.jsp" />
        <!-- 导航栏结束 -->

        <!--正文开始-->
        <div class="span10">
            <div class="row">


                <!--第二报头开始-->
                <div class="secondary-masthead span12">

                    <ul class="nav nav-pills pull-right">
                        <li>
                            <a href="http://www.xiyou.edu.cn/"><i class="icon-globe"></i>
                                <v></v>
                                西安邮电大学</a>
                        </li>
                        <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#"><i class="icon-user"></i> ${user.username} <b
                                    class="caret"></b>
                            </a>
                            <ul class="dropdown-menu">
                                <li><a href="profile.html">个人资料</a></li>
                                <li><a href="form.html">用户设置</a></li>
                                <li class="divider"></li>
                                <li><a href="<%=request.getContextPath()%>/UserLogout.action">注销</a></li>
                            </ul>
                        </li>
                    </ul>

                    <ul class="breadcrumb">
                        <li>
                            <a href="<%=request.getContextPath()%>/toMain.action">首页</a> <span class="divider">/</span>
                        </li>
                        <li class="active">数据分析</li> <span class="divider">/</span>
                        <li class=""><a href="<%=request.getContextPath()%>/toAnalysisTemp.action">温度分析</a></li>
                    </ul>
                </div>
            </div>
            <!--第二报头结束-->

            <!--主仪表盘开始-->
            <div class="main-area dashboard">
                <div class="row">
                    <div class="span12">
                        <div class="slate">
                            <form class="form-horizontal" onsubmit="fun1();return false;">
                                <fieldset>
                                    <div id="legend" class="">
                                        <legend class="">筛选分析</legend>
                                    </div>
                                    <div class="control-group span12">
                                        <!-- Select Basic -->
                                        <label class="control-label">选择站点</label>
                                        <div class="controls">
                                            <select class="input-xlarge" id="select-site">
                                                <option value="site_1_hourdata">A</option>
                                                <option value="site_2_hourdata">B</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="control-group span12">
                                        <label class="control-label">分析范围</label>
                                            <div class="controls">
                                                <select class="input-xlarge" id="analysis-scope">
                                                    <option value="day">日</option>
                                                    <option value="month">月</option>
                                                    <option value="year">年</option></select>
                                            </div>
                                    </div>
                                        <div class="control-group span12">
                                            <label class="control-label">开始时间</label>
                                            <div class="controls input-group date form_datetime col-md-5" data-date="" data-date-format="yyyy-MM-dd HH:ii p" data-link-field="dtp_input1">
                                                <div class="input-append" id="analysis-starttime">
                                                    <input class="span2" type="text" placeholder="请选择开始时间" readonly>
                                                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
                                                    <span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
                                                </div>
                                            </div>
                                            <input type="hidden" id="dtp_input1" value="" /><br/>
                                        </div>
                                        <div class="control-group span12" >
                                            <label class="control-label">结束时间</label>
                                            <div class="controls input-group date form_datetime col-md-5" data-date="" data-date-format="yyyy-MM-dd HH:ii p" data-link-field="dtp_input2">
                                                <div class="input-append" id="analysis-endtime">
                                                    <input class="span2" type="text" placeholder="请选择结束时间" readonly>
                                                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
                                                    <span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
                                                </div>
                                            </div>
                                            <input type="hidden" id="dtp_input2" value="" /><br/>
                                        </div>
                                    <div class="control-group span5">
                                        <!-- Search input-->
                                        <label class="control-label">最低门限</label>
                                        <div class="controls" id="analysis-minthreshold">
                                            <input type="text" placeholder="请输入温度最低门限" class="input-xlarge search-query">
                                            <p class="help-block">-20℃~70℃</p>
                                        </div>

                                    </div>
                                    <div class="control-group span5">
                                        <!-- Text input-->
                                        <label class="control-label">最高门限</label>
                                        <div class="controls" id="analysis-maxthreshold">
                                            <input type="text" placeholder="请输入温度最高门限" class="input-xlarge">
                                            <p class="help-block">-20℃~70℃</p>
                                        </div>
                                    </div>
                                    <div class="control-group span12">
                                        <label class="control-label">开始分析^_^</label>
                                        <!-- Button -->
                                        <div class="controls">
                                            <button class="btn btn-inverse" id="startAnalysisButton">开始分析</button>
                                        </div>
                                    </div>
                                </fieldset>
                            </form>



                        </div>


                    </div>


                </div>

                <!--图表展示-->
                <div class="row">

                    <!--表格展示-->
                    <div class="span12">
                        <table class="table table-striped" id="displayPeak">
                            <thead>
                            <tr>
                                <th>最高温度</th>
                                <th>最低温度</th>
                                <th>平均温度</th>
                                <th>适宜温度比重</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <!--<iframe src="../html/orders.html" width="200" height="200"></iframe>-->
                    <!--图表分析展示-->
                </div>
                <div class="row">
                    <div class="span12">
                        <div id="container1"  class="span2" style="min-width: 550px; min-height: 400px; float:left"></div>
                        <%--<script type="text/javascript">
                            function fun() {
                                var chart = Highcharts.chart('container1', {
                                    chart: {
                                        type: 'line'
                                    },
                                    title: {
                                        text: '温度折线图'
                                    },
                                    subtitle: {
                                        text: '数据来源: site'
                                    },
                                    xAxis: {
                                        // categories: ['一月', '二月', '三月', '四月', '五月', '六月', '七月', '八月', '九月', '十月', '十一月', '十二月']
                                        categories: timeStr
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
                                        data: chart1Data
                                    }]
                                });
                            }

                        </script>--%>
                        <div id="container2" class="span2" style="min-width: 550px; min-height: 400px; float:left"></div>
                        <%--<script type="text/javascript">
                            // Build the chart
                            Highcharts.chart('container2', {
                                chart: {
                                    plotBackgroundColor: null,
                                    plotBorderWidth: null,
                                    plotShadow: false,
                                    type: 'pie'
                                },
                                title: {
                                    text: '温度阈值占比'
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
                                    name: 'Brands',
                                    colorByPoint: true,
                                    data: [{
                                        name: '<',
                                        y: 61.41,
                                        sliced: true,
                                        selected: true
                                    }, {
                                        name: '>',
                                        y: 11.84
                                    }, {
                                        name: '之间',
                                        y: 10.85
                                    }]
                                }]
                            });
                        </script>--%>

                    </div>
                </div>
                <div class="row">
                    <div class="span12">
                        <div id="container3" class="span2" style="min-width: 550px; min-height: 400px; float:left"></div>

                        <div id="container4" class="span2" style="min-width: 550px; min-height: 400px; float:left"></div>

                    </div>

                </div>


            </div>
        </div>
    </div>
</div>



<!-- Placed at the end of the document so the pages load faster -->
<script src="<%=request.getContextPath()%>/assets/js/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/assets/js/bootstrap.js"></script>
<script src="<%=request.getContextPath()%>/assets/js/excanvas.min.js"></script>
<script src="<%=request.getContextPath()%>/assets/js/jquery.flot.min.js"></script>
<script src="<%=request.getContextPath()%>/assets/js/jquery.flot.resize.js"></script>

<script type="text/javascript" src="<%=request.getContextPath()%>/assets/js/datetime/jquery-1.8.3.min.js" charset="UTF-8"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/js/datetime/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/js/datetime/bootstrap-datetimepicker.js" charset="UTF-8"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/js/datetime/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
<script src="<%=request.getContextPath()%>/assets/js/highcharts/highcharts.js"></script>

<!--highcharts的图标引入-->

<script>
    $.ajax({
        cache: false,
        type: "GET",
        url:'<%=request.getContextPath()%>/selectAllSite.action',
        async: false,
        dataType: 'json',
        error: function(request)
        {
            console.log("select site ajax error");
        },
        success: function(data)
        {
            $("#select-site").append("<option value='"+data[0].siteTable+"' selected> "+data[0].siteName+" </option>");
            for(var i=1;i<data.length;i++){
                $("#select-site").append("<option value='"+data[i].siteTable+"'> "+data[i].siteName+"</option>");
            }
        }
    });
</script>

<script type="text/javascript">
    var analysisdata = null;
    var timeStr = new Array();
    var chart1Data = new Array();

    $('.form_datetime').datetimepicker({
        language:  'zh-CN',
        weekStart: 1,
        todayBtn:  1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 2,
        forceParse: 0,
        showMeridian: 1
    });

    function fun1() {
        var params = $.param({
            'site':$("#select-site option:selected").val(),
            'analysisScope':$("#analysis-scope option:selected").val(),
            'starttime':$("#analysis-starttime input").val(),
            'endtime':$("#analysis-endtime input").val(),
            'maxthreshold':$("#analysis-maxthreshold input").val(),
            'minthreshold':$("#analysis-minthreshold input").val()
        });
        $.ajax({
            cache: false,
            type: "GET",
            url:'<%=request.getContextPath()%>/getAnalysisResult.action',
            async: false,
            data: params,
            dataType: 'json',
            error: function(request)
            {
                console.log(" analysis ajax error");
            },
            success: function(data)
            {

                console.log(data);
                analysisdata = data;
                insertAnalysisResultIntoHtml(data);

            }
        });
    }


    function insertAnalysisResultIntoHtml(data){

        //表单数据
        $("#displayPeak tbody tr td").eq(0).text(data[0].maxTemp+"℃");
        $("#displayPeak tbody tr td").eq(1).text(data[0].minTemp+"℃");
        $("#displayPeak tbody tr td").eq(2).text(data[0].avgTemp+"℃");
        $("#displayPeak tbody tr td").eq(3).text(data[0].percent);
        //折线图数据
        var arr = data[1];

        for(var i=0;i<analysisdata[1].length;i++){
            timeStr[i] = arr[i].date;
            chart1Data[i] = parseInt(arr[i].temperature);
        }
        chart1(chart1Data);


        var percentt = new Array();
        percentt[0] = data[2].lowScopeTemp;
        percentt[1] = data[2].highScopeTemp;
        percentt[2] = data[2].betweenScopeTemp;
        chart2(percentt);


        var chart3Data = new Array();
        for(var i=0;i<data[3].length;i++){
            chart3Data[i] = new Array();
            chart3Data[i][0] = data[3][i].temperature;
            chart3Data[i][1] = data[3][i].countTemp;
        }
        chart3(chart3Data);

        var chart4date = new Array();
        var chart4temperature = new Array();
        var chart4humidity = new Array();
        for(var i=0;i<data[4].length;i++){
            chart4date[i] = parseInt(data[4][i].date);
            chart4temperature[i] = parseInt(data[4][i].temperature);
            chart4humidity[i] = parseInt(data[4][i].humidity);
        }
        chart4(chart4date,chart4temperature,chart4humidity);
    }
</script>
</body>
</html>
