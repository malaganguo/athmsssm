<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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

    <!--
        <script src="https://img.hcharts.cn/jquery/jquery-1.8.3.min.js"></script>
        <script src="https://img.hcharts.cn/highcharts/highcharts.js"></script>
        <script src="https://img.hcharts.cn/highcharts/modules/exporting.js"></script>
        <script src="https://img.hcharts.cn/highcharts/modules/data.js"></script>
        <script src="https://img.hcharts.cn/highcharts/modules/series-label.js"></script>
        <script src="https://img.hcharts.cn/highcharts/modules/oldie.js"></script>
        <script src="https://img.hcharts.cn/highcharts-plugins/highcharts-zh_CN.js"></script>
        <script src="https://img.hcharts.cn/highcharts/themes/dark-unica.js"></script>
    -->

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
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#"><i class="icon-user"></i> 张毅飞 <b
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
							<form class="form-inline">
								
								<select class="span2  select-aloha">
									<option value=""> - 起始日期 - </option>
								</select>
								<select class="span2 select-aloha">
									<option value=""> - 结束日期 - </option>
								</select>
								
								<select class="span2 select-aloha">
									<option value=""> - 监测点 - </option>
								</select>
								<select class="span2 select-aloha">
									<option value=""> - 温湿度选择 - </option>
								</select>
								
								<input type="text" class="input-medium  select-aloha" placeholder="请输入输入关键字...">
								<button type="submit" class="btn btn-primary pull-right  select-aloha">查询数据</button>
								
							</form>
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
							
							
							
							<table class="table">
						<thead>
							<tr>
								<th class="starttime">起始时间</th>
								<th class="endtime">结束时间</th>
								<th class="monitoringpoint">监测点</th>
								<th class="datatype">数据类型</th>
								<th class="operate">操作</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><a href="vieworder.html">2019-1-2 14:09</a></td>
								<td><a href="vieworder.html">2019-1-4 15:09</a></td>
								<td><a href="#">西安邮电大学监测点</a></td>
								<td><a href="#">湿度数据</a></td>
								<td>
									<a class="btn btn-small btn-info" href="#">图表查看</a>
									<a class="btn btn-small btn-primary" href="#">下载</a>
									<a class="btn btn-small btn-danger" href="#">删除</a>
								</td>
							</tr>
							<tr>
								<td><a href="vieworder.html">2019-1-2 14:09</a></td>
								<td><a href="vieworder.html">2019-1-4 15:09</a></td>
								<td><a href="#">西安邮电大学监测点</a></td>
								<td><a href="#">湿度数据</a></td>
								<td>
									<a class="btn btn-small btn-info" href="#">图表查看</a>
									<a class="btn btn-small btn-primary" href="#">下载</a>
									<a class="btn btn-small btn-danger" href="#">删除</a>
								</td>
							</tr>
							<tr>
								<td><a href="vieworder.html">2019-1-2 14:09</a></td>
								<td><a href="vieworder.html">2019-1-4 15:09</a></td>
								<td><a href="#">西安邮电大学监测点</a></td>
								<td><a href="#">湿度数据</a></td>
								<td>
									<a class="btn btn-small btn-info" href="#">图表查看</a>
									<a class="btn btn-small btn-primary" href="#">下载</a>
									<a class="btn btn-small btn-danger" href="#">删除</a>
								</td>
							</tr>
							<tr>
								<td><a href="vieworder.html">2019-1-2 14:09</a></td>
								<td><a href="vieworder.html">2019-1-4 15:09</a></td>
								<td><a href="#">西安邮电大学监测点</a></td>
								<td><a href="#">湿度数据</a></td>
								<td>
									<a class="btn btn-small btn-info" href="#">图表查看</a>
									<a class="btn btn-small btn-primary" href="#">下载</a>
									<a class="btn btn-small btn-danger" href="#">删除</a>
								</td>
							</tr>
							<tr>
								<td><a href="vieworder.html">2019-1-2 14:09</a></td>
								<td><a href="vieworder.html">2019-1-4 15:09</a></td>
								<td><a href="#">西安邮电大学监测点</a></td>
								<td><a href="#">湿度数据</a></td>
								<td>
									<a class="btn btn-small btn-info" href="#">图表查看</a>
									<a class="btn btn-small btn-primary" href="#">下载</a>
									<a class="btn btn-small btn-danger" href="#">删除</a>
								</td>
							</tr>
							<tr>
								<td><a href="vieworder.html">2019-1-2 14:09</a></td>
								<td><a href="vieworder.html">2019-1-4 15:09</a></td>
								<td><a href="#">西安邮电大学监测点</a></td>
								<td><a href="#">湿度数据</a></td>
								<td>
									<a class="btn btn-small btn-info" href="#">图表查看</a>
									<a class="btn btn-small btn-primary" href="#">下载</a>
									<a class="btn btn-small btn-danger" href="#">删除</a>
								</td>
							</tr>
							<tr>
								<td><a href="vieworder.html">2019-1-2 14:09</a></td>
								<td><a href="vieworder.html">2019-1-4 15:09</a></td>
								<td><a href="#">西安邮电大学监测点</a></td>
								<td><a href="#">湿度数据</a></td>
								<td>
									<a class="btn btn-small btn-info" href="#">图表查看</a>
									<a class="btn btn-small btn-primary" href="#">下载</a>
									<a class="btn btn-small btn-danger" href="#">删除</a>
								</td>
							</tr>
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
</body>
</html>