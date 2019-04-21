<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>

    <meta charset="utf-8">
    <title>农业管理系统——数据查询</title>
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

    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

</head>
<body>
<div class="container">
    <div class="row">
		<%--导航栏--%>
		<jsp:include page="frame-left.jsp" />

        <!--正文开始-->
        <div class="span10">
            <!--第二报头开始-->
            <div class="secondary-masthead">

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
                    <li class="active">数据查询</li>
                </ul>

            </div>
            <!--第二报头结束-->

            <!--主仪表盘开始-->
            <div class="main-area dashboard">
              <div class="row">
                    <div class="span10">
                        
                        <div class="slate">
								<div>
									<div class="form-group">
										<label for="dtp_input2" class="col-lg-2 control-label">开始时间</label>
										<div class="input-group date form_date col-lg-3" data-date="" data-date-format="" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
											<input id="start_time" name="start_time" class="form-control" size="16" type="text" value="" readonly>
											<span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
											<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
										</div>

										<label for="dtp_input1" class="col-md-2 control-label">结束时间</label>
										<div class="input-group date form_date col-md-3" data-date="" data-date-format="" data-link-field="dtp_input1" data-link-format="yyyy-mm-dd">
											<input id="end_time" name="start_time" class="form-control" size="16" type="text" value="" readonly>
											<span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
											<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
										</div>
										<select class="span2 select-aloha" id="sitechose">
											<%--<option value="site_1_hourdata" selected>A点</option><!--value等于表名-->
											<option value="site_2_hourdata">B点</option>--%>
										</select>
										<input type="hidden" id="dtp_input2" value="" />
										<input type="hidden" id="dtp_input1" value="" />

										<button type="submit" class="btn btn-primary pull-right  select-aloha" id="queryButton">查询数据</button>
									</div>
								</div>
                        </div>
                  		
				  	</div>
				  	
				  <div class="row">
				  	<div class="span5">
				  		<div class="slate">
							<div class="page-header">
								<%--<div class="btn-group pull-right" >
									<button class="btn dropdown-toggle" data-toggle="dropdown">
										<i class="icon-download-alt"></i> 下载
										<span class="caret"></span>
									</button>
									<ul class="dropdown-menu">
										<li><a href="">CSV</a></li>
										<li><a href="">Excel</a></li>
										<li><a href="">PDF</a></li>
									</ul>
								</div>--%>
								<%--<h2>查询结果</h2>--%>
                                <%--<button class="btn btn-small btn-info" data-toggle="modal" data-target="#addSiteModal" onclick="createChart()">图表查看</button>--%>
							</div>
							
                            <table class="table" id="dataList">
						<thead>
							<tr>
								<th class="starttime">时间</th>
								<th class="monitoringpoint">监测点</th>
                                <th class="datatype">温度</th>
                                <th class="datatype">湿度</th>
								<th class="operate">操作</th>
							</tr>
						</thead>
						<tbody><!--表格内容 -->

						</tbody>
						</table>
							<div class="span10 ">
                                <div class="modal fade" id="addSiteModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                                    &times;
                                                </button>
                                                <h4 class="modal-title" id="myModalLabel">
                                                    图表展示
                                                </h4>
                                            </div>
                                            <div class="modal-body">
                                                <div id="chartContaina"  style="min-width: 550px; min-height: 400px; float:left"></div>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                                                </button>
                                            </div>
                                        </div><!-- /.modal-content -->
                                    </div><!-- /.modal -->
                                </div>
				
					<%--<div class="pagination pull-center">
						<ul>
							<li><a href="#">首页</a></li>
							<li class="active">
							  <a href="#">1</a>
							</li>
							<li><a href="#">2</a></li>
							<li><a href="#">3</a></li>
							<li><a href="#">4</a></li>
							<li><a href="#">4</a></li>
							<li><a href="#">4</a></li>
							<li><a href="#">4</a></li>
							<li><a href="#">4</a></li>
							<li><a href="#">4</a></li>
							<li><a href="#">4</a></li>
							<li><a href="#">4</a></li>
							<li><a href="#">4</a></li>
							<li><a href="#">4</a></li>
							<li><a href="#">4</a></li>
							<li><a href="#">4</a></li>
							<li><a href="#">4</a></li>
							<li><a href="#">4</a></li>
							<li><a href="#">4</a></li>
							<li><a href="#">4</a></li>
							<li><a href="#">4</a></li>
							<li><a href="#">4</a></li>
							<li><a href="#">...</a></li>
							<li><a href="#">尾页</a></li>
						</ul>
					</div>--%>

                            </div>
						</div>
				  	</div>
                      <div class="span5">
                          <div id="container"  style="min-width: 550px; min-height: 400px; float:left"></div>
                      </div>
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
<script src="<%=request.getContextPath()%>/assets/js/datetime/bootstrap-datetimepicker.js" ></script>
<script src="<%=request.getContextPath()%>/assets/js/datetime/bootstrap-datetimepicker.zh-CN.js"></script>
<script src="https://img.highcharts.com.cn/highcharts/highcharts.js"></script>
<script src="https://img.highcharts.com.cn/highcharts/modules/exporting.js"></script>
<script src="https://img.hcharts.cn/highcharts-plugins/highcharts-zh_CN.js"></script>
<script>

</script>
<script type="text/javascript">
    $('.form_date').datetimepicker({
        language: 'zh-CN',
        weekStart: 1,
        todayBtn: 1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 2,
        minView: 2,
        forceParse: 0
    });
</script>
<script>
	var dataQueryResult ;
    $("#queryButton").click(function(){
        var starttime = $("#dtp_input2").val();
        var endtime = $("#dtp_input1").val();
        var site = $("#sitechose option:selected").val();
        var params = $.param({'site':site, 'starttime':starttime, 'endtime':endtime},true);
        $.ajax({
            cache: false,
            type: "GET",
            url:'<%=request.getContextPath()%>/dataQuery.action',
            async: false,
			data: params,
            dataType: 'json',
            error: function(request)
            {
                console.log("ajax error");
            },
            success: function(data)
            {
                console.log(data);
                if(null == data || "" == data){
                    alsert("查无结果！");
                    return ;
				}
                dataQueryResult = data;
                insertResultIntoTable(data);
                var date = new Array();
                var temperature = new Array();
                var humidity = new Array();
                for(var i=0;i<data.length;i++){
                    date[i] = data[i].date;
                    temperature[i] = parseInt(data[i].temperature);
                    humidity[i] = parseInt(data[i].humidity);
                }
                showChart(date,temperature,humidity);
            }
        });
    });
    function showChart(date,temperature,humidity) {
        Highcharts.chart('container', {
            chart: {
                zoomType: 'xy'
            },
            title: {
                text: '查询时间内的温温度和湿度'
            },

            xAxis: [{
                categories: date,
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
                    format: '{value} %RH',
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
                x: 50,
                verticalAlign: 'top',
                y: 0,
                floating: true,
                backgroundColor: (Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF'
            },
            series: [{
                name: '相对湿度',
                type: 'column',
                yAxis: 1,
                data: humidity,
                tooltip: {
                    valueSuffix: ' %'
                }
            }, {
                name: '温度',
                type: 'spline',
                data: temperature,
                tooltip: {
                    valueSuffix: '°C'
                }
            }]
        });
    }
    function insertResultIntoTable(data) {
        $("#dataList tbody").html("");
        if(${user.status == 1}) {
            for (var i = 0; i < data.length; i++) {
                var site = $("#sitechose option:selected").val().substring(0,6);
                var labelIntbody = "<tr>\n" +
                    "\t\t\t\t\t\t\t\t<td><a href=\"#\">" + data[i].date + "</a></td>\n" +
                    "\t\t\t\t\t\t\t\t<td><a href=\"#\">" + $("#sitechose option:selected").val() + "</a></td>\n" +
                    "\t\t\t\t\t\t\t\t<td><a href=\"#\">" + data[i].temperature + "℃</a></td>\n" +
                    "                                <td><a href=\"#\">" + data[i].humidity + "RH</a></td>\n" +
                    "\t\t\t\t\t\t\t\t<td>\n" +
                    // "\t\t\t\t\t\t\t\t\t<button class=\"btn btn-small btn-info\" data-toggle=\"modal\" data-target=\"#addSiteModal\" onclick='createChart("+site+","+data[i].date+")'>图表查看</button>\n" +
                    "\t\t\t\t\t\t\t\t\t<a class=\"btn btn-small btn-danger\" href=\"javascript:void(0);\" onclick='deleteData(" + data[i].date + ")'>删除</a>\n" +
                    "\t\t\t\t\t\t\t\t</td>\n" +
                    "\t\t\t\t\t\t\t</tr>";

                $("#dataList tbody").append(labelIntbody);
            }
        }else {
            for (var i = 0; i < data.length; i++) {

                var labelIntbody = "<tr>\n" +
                    "\t\t\t\t\t\t\t\t<td><a href=\"#\">" + data[i].date + "</a></td>\n" +
                    "\t\t\t\t\t\t\t\t<td><a href=\"#\">" + $("#sitechose option:selected").text() + "</a></td>\n" +
                    "\t\t\t\t\t\t\t\t<td><a href=\"#\">" + data[i].temperature + "℃</a></td>\n" +
                    "                                <td><a href=\"#\">" + data[i].humidity + "RH</a></td>\n" +
                    "\t\t\t\t\t\t\t\t<td>\n" +
                    // "\t\t\t\t\t\t\t\t\t<a class=\"btn btn-small btn-info\" href=\"#\">图表查看</a>\n" +
                    "\t\t\t\t\t\t\t\t</td>\n" +
                    "\t\t\t\t\t\t\t</tr>";

                $("#dataList tbody").append(labelIntbody);
            }
        }
    }

    function deleteData(date) {
		var flag = confirm("确定要删除吗？");
		if(true == flag){
		    var params = $.param({"site":$("#sitechose option:selected").val(),"date":date});
            $.ajax({
                cache: false,
                type: "POST",
                url:'<%=request.getContextPath()%>/dataDelete.action',
                async: false,
                data: params,
                error: function(request)
                {
                    console.log(" dataDelete ajax error");
                },
                success: function(data)
                {
                    if(data == "success"){
                        $("#queryButton").trigger("click");
                        console.log("删除成功!");
					}else{
                        console.log("data"+data);
					}
                }
            });
		}
    }

    function createChart() {
        $.ajax({
            cache: false,
            type: "GET",
            url:'<%=request.getContextPath()%>/selectAllSite.action',
            async: false,
            data: {},
            dataType: 'json',
            error: function(request)
            {
                console.log("ajax error");
            },
            success: function(data)
            {
                $("#sitechose").append("<option value='' selected>--请选择--</option>");
                $("#sitechose").append("<option value='"+data[0].siteTable+"_hourdata' selected> "+data[0].siteName+"点 </option>");
                for(var i=1;i<data.length;i++){
                    $("#sitechose").append("<option value='"+data[i].siteTable+"_hourdata'> "+data[i].siteName+"点 </option>");
                }
            }
        });
    }

</script>
<script>
    $.ajax({
        cache: false,
        type: "GET",
        url:'<%=request.getContextPath()%>/selectAllSite.action',
        async: false,
        data: {},
        dataType: 'json',
        error: function(request)
        {
            console.log("ajax error");
        },
        success: function(data)
        {
            $("#sitechose").append("<option value='' selected>--请选择--</option>");
            $("#sitechose").append("<option value='"+data[0].siteTable+"_hourdata' selected> "+data[0].siteName+"点 </option>");
            for(var i=1;i<data.length;i++){
                $("#sitechose").append("<option value='"+data[i].siteTable+"_hourdata'> "+data[i].siteName+"点 </option>");
            }
        }
    });
</script>
<%--<script>

    var chart = Highcharts.chart('chartContain', {
        chart: {
            zoomType: 'xy'
        },
        title: {
            text: '东京月平均温度和降雨量'
        },
        subtitle: {
            text: '数据来源: WorldClimate.com'
        },
        xAxis: [{
            categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
                'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
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
                text: '降雨量',
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
            name: '降雨量',
            type: 'column',
            yAxis: 1,
            data: [49.9, 71.5, 106.4, 129.2, 144.0, 176.0, 135.6, 148.5, 216.4, 194.1, 95.6, 54.4],
            tooltip: {
                valueSuffix: ' mm'
            }
        }, {
            name: '温度',
            type: 'spline',
            data: [7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6],
            tooltip: {
                valueSuffix: '°C'
            }
        }]
    });
</script>--%>
</body>
</html>