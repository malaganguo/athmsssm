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
                            <li><a href="">注销</a></li>
                        </ul>
                    </li>
                </ul>

                <ul class="breadcrumb">
                    <li>
                        <a href="index.html">首页</a> <span class="divider">/</span>
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
											<option value=""> - 监测点 - </option>
											<option value="site_1_hourdata">A点</option><!--value等于表名-->
											<option value="site_2_hourdata">B点</option>
										</select>
										<input type="hidden" id="dtp_input2" value="" />
										<input type="hidden" id="dtp_input1" value="" />

										<button type="submit" class="btn btn-primary pull-right  select-aloha" id="queryButton">查询数据</button>
									</div>
								</div>
                        </div>
                  		
				  	</div>
				  	
				  <div class="row">
				  	<div class="span10">
				  		<div class="slate">
							<div class="page-header">
								<div class="btn-group pull-right" >
									<button class="btn dropdown-toggle" data-toggle="dropdown">
										<i class="icon-download-alt"></i> 下载
										<span class="caret"></span>										 
									</button>
									<ul class="dropdown-menu">
										<li><a href="">CSV</a></li>
										<li><a href="">Excel</a></li>
										<li><a href="">PDF</a></li>
									</ul>
								</div>
								<h2>查询结果</h2>
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
				
					<div class="pagination pull-center">
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
					</div>
				
				</div>
						</div>
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
                dataQueryResult = data;
                insertResultIntoTable(data);
            }
        });
    });
    function insertResultIntoTable(data) {
        for(var i = 0 ; i < data.length ; i++){
        var labelIntbody = "<tr>\n" +
            "\t\t\t\t\t\t\t\t<td><a href=\"#\">"+data[i].date+"</a></td>\n" +
            "\t\t\t\t\t\t\t\t<td><a href=\"#\">"+$("#sitechose option:selected").text()+"</a></td>\n" +
            "\t\t\t\t\t\t\t\t<td><a href=\"#\">"+data[i].temperature+"℃</a></td>\n" +
            "                                <td><a href=\"#\">"+data[i].humidity+"RH</a></td>\n" +
            "\t\t\t\t\t\t\t\t<td>\n" +
            "\t\t\t\t\t\t\t\t\t<a class=\"btn btn-small btn-info\" href=\"#\">图表查看</a>\n" +
            "\t\t\t\t\t\t\t\t\t<a class=\"btn btn-small btn-primary\" href=\"#\">下载</a>\n" +
            "\t\t\t\t\t\t\t\t\t<a class=\"btn btn-small btn-danger\" href=\"#\">删除</a>\n" +
            "\t\t\t\t\t\t\t\t</td>\n" +
            "\t\t\t\t\t\t\t</tr>";
        $("#dataList tbody").append(labelIntbody);
        console.log(data);
        }
    }
</script>
</body>
</html>