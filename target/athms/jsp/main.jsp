<%--
  Created by IntelliJ IDEA.
  User: malaganguo
  Date: 2019/3/4
  Time: 13:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>农业管理系统</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Le styles -->
    <link href="http://fonts.googleapis.com/css?family=Oxygen|Marck+Script" rel="stylesheet" type="text/css">
    <link href="<%=request.getContextPath()%>/assets/css/bootstrap.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/assets/css/font-awesome.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/assets/css/admin.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/assets/css/smallchart.css" rel="stylesheet">

    <script src="https://img.hcharts.cn/jquery/jquery-1.8.3.min.js"></script>
    <%--<script src="https://img.hcharts.cn/highcharts/highcharts.js"></script>--%>
    <%--<script src="https://img.hcharts.cn/highcharts/modules/exporting.js"></script>--%>
    <%--<script src="https://img.hcharts.cn/highcharts/modules/data.js"></script>--%>
    <%--<script src="https://img.hcharts.cn/highcharts/modules/series-label.js"></script>--%>
    <%--<script src="https://img.hcharts.cn/highcharts/modules/oldie.js"></script>--%>
    <%--<script src="https://img.hcharts.cn/highcharts-plugins/highcharts-zh_CN.js"></script>--%>
    <%--<script src="https://img.hcharts.cn/highcharts/themes/dark-unica.js"></script>--%>

    <script src="https://img.highcharts.com.cn/highcharts/highcharts.js"></script>
    <script src="https://img.highcharts.com.cn/highcharts/modules/exporting.js"></script>
    <script src="https://img.hcharts.cn/highcharts-plugins/highcharts-zh_CN.js"></script>
    <script src="https://img.highcharts.com.cn/highcharts/themes/dark-unica.js"></script>

    <script type="text/javascript" src="http://cdn.bootcss.com/jquery/3.1.0/jquery.min.js"></script>
    <script type="text/javascript" src="http://cdn.bootcss.com/sockjs-client/1.1.1/sockjs.js"></script>

    <script src="<%=request.getContextPath()%>/assets/js/websocket.js"></script>


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
                    <li><a href="http://www.xiyou.edu.cn/"><i class="icon-globe"></i>
                        <v></v>
                        西安邮电大学</a></li>
                    <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#" name="user.username"><i
                            class="icon-user"></i> ${user.username} <b
                            class="caret"></b> </a>
                        <ul class="dropdown-menu">
                            <li><a href="profile.html">个人资料</a></li>
                            <li><a href="form.html">用户设置</a></li>
                            <li class="divider"></li>
                            <li><a href="">注销</a></li>
                        </ul>
                    </li>
                </ul>
                <ul class="breadcrumb">
                    <li><a href="#">首页</a> <span class="divider">/</span></li>
                    <li class="active">首页</li>
                </ul>
            </div>
            <!--第二报头结束-->

            <!--主仪表盘开始-->
            <div class="main-area ">
                <div class="row">
                    <div class="span10">
                        <div class="slate clearfix"><a class="stat-column" href="#"> <span class="number">16</span>
                            <span>采集点数</span> </a> <a class="stat-column" href="#"> <span class="number">452</span>
                            <span>管理人员数</span> </a> <a class="stat-column" href="#"> <span class="number">1</span>
                            <span>当前在线人数</span> </a> <a class="stat-column" href="#"> <span class="number">1</span>
                            <span>异常点数</span> </a></div>
                    </div>
                </div>
                <div class="row">
                    <div class="span10">
                        <div class="slate">
                            <div class="page-header"><span style="font-size: large"><i
                                    class="icon-signal pull-right"></i>实时数据</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <span>
                <select>
                  <option value="">- - -请选择- - -</option>
                  <option value=""> A点实时数据 </option>
                  <option value=""> B点实时数据 </option>
                </select>
                <select>
                  <option value="">- - -请选择- - -</option>
                  <option value=""> 温湿度数据 </option>
                  <option value=""> 温度数据 </option>
                  <option value=""> 湿度数据 </option>
                </select>
                </span></div>
                            <div id="realtime_data" style="height: 297px;"></div>
                            <div class="message"></div>
                            <script>
                                //var temperature = parseInt(JSON.parse(thdata).temperature);
                                //var humidity = parseInt(JSON.parse(thdata).humidity);
                                //console.log("humidity:"+humidity);
                            </script>
                            <script src="<%=request.getContextPath()%>/assets/js/highcharts/realtime_interaction.js"></script><!--websocket引入实时数据-->

                        </div>
                    </div>
                    <div class="row">
                        <div class="span10">
                            <div class="span10">
                                <div class="page-header">
                                    <h2><i class="icon-shopping-cart pull-right"></i>监测点状况</h2>
                                </div>
                                <table class="table">
                                    <tbody>
                                    <tr class="alert-heading">
                                        <td><a href="">西安邮电大学监测点</a></td>
                                        <td><a href="">检测点位置</a></td>
                                        <td>监测点状态</td>
                                    </tr>
                                    <tr>
                                        <td><a href="">西安邮电大学监测点</a></td>
                                        <td><a href="">检测点位置</a></td>
                                        <td>监测点状态</td>
                                    </tr>
                                    <tr>
                                        <td><a href="">西安邮电大学监测点</a></td>
                                        <td><a href="">检测点位置</a></td>
                                        <td>监测点状态</td>
                                    </tr>
                                    <tr>
                                        <td><a href="">西安邮电大学监测点</a></td>
                                        <td><a href="">检测点位置</a></td>
                                        <td>监测点状态</td>
                                    </tr>
                                    <tr>
                                        <td><a href="">西安邮电大学监测点</a></td>
                                        <td><a href="">检测点位置</a></td>
                                        <td>监测点状态</td>
                                    </tr>
                                    <tr>
                                        <td><a href="">西安邮电大学监测点</a></td>
                                        <td><a href="">检测点位置</a></td>
                                        <td>监测点状态</td>
                                    </tr>
                                    <tr>
                                        <td><a href="">西安邮电大学监测点</a></td>
                                        <td><a href="">检测点位置</a></td>
                                        <td>监测点状态</td>
                                    </tr>
                                    <tr>
                                        <td><a href="">西安邮电大学监测点</a></td>
                                        <td><a href="">检测点位置</a></td>
                                        <td>监测点状态</td>
                                    </tr>
                                    <tr>
                                        <td colspan="2"><a href="">View more orders</a></td>
                                    </tr>
                                    </tbody>
                                </table>

                            </div>

                            <div class="span10">
                                <div class="slate">
                                    <div class="page-header">
                                        <h2><i class="icon-envelope-alt pull-right"></i>状态图</h2>
                                    </div>

                                    <div id="wind-chart" style="min-width:400px;height:400px"></div>
                                    <script src="<%=request.getContextPath()%>/assets/js/highcharts/wind-chart.js"></script>
                                </div>
                            </div>
                        </div>
                    </div>


                </div>
                <div class="row">
                    <div class="span10">
                        <div class="slate">
                            <div class="page-header">
                                <h2><a class="pull-right iconlink" href=""><i class="icon-rss"></i></a>新闻</h2>
                            </div>
                            <table class="table" id="newsReport">
                                <tbody>
                                <tr>
                                    <td><a href="">新闻新闻新闻新闻</a></td>
                                    <td class="date">10点28分</td>
                                </tr>
                                <tr>
                                    <td><a href="">新闻新闻新闻新闻</a></td>
                                    <td class="date">10点28分</td>
                                </tr>
                                <tr>
                                    <td><a href="">新闻新闻新闻新闻</a></td>
                                    <td class="date">10点28分</td>
                                </tr>
                                <tr>
                                    <td><a href="">新闻新闻新闻新闻</a></td>
                                    <td class="date">10点28分</td>
                                </tr>
                                <tr>
                                    <td><a href="">新闻新闻新闻新闻</a></td>
                                    <td class="date">10点28分</td>
                                </tr>
                                <tr>
                                    <td colspan="2"><a href="http://www.agronet.com.cn/" target="_blank">更多农业新闻</a></td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="span10 footer">
                        <p>&copy; copyed by aloha</p>
                    </div>
                </div>
            </div>
            <!--主仪表盘结束-->
        </div>
        <!--正文结束-->
    </div>
    <!-- end row -->

</div>
<!-- end container -->

<!-- Le javascript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="<%=request.getContextPath()%>/assets/js/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/assets/js/bootstrap.js"></script>
<script src="<%=request.getContextPath()%>/assets/js/excanvas.min.js"></script>
<script src="<%=request.getContextPath()%>/assets/js/jquery.flot.min.js"></script>
<script src="<%=request.getContextPath()%>/assets/js/jquery.flot.resize.js"></script>
<script>
    var newsData ;
    $.ajax({
        cache: false,
        type: "GET",
        url:'<%=request.getContextPath()%>/getNews.action',
        async: false,
        dataType: 'json',
        error: function(request)
        {
            console.log("ajax error");
        },
        success: function(data)
        {
            newsData = data;
            var trList = $("#newsReport tbody").children("tr");
            var j = 0;
                for(var key in data){
                        console.log(key +'  '+ data[key]);
                        var tdArr = trList.eq(j++).find("td");
                        tdArr.eq(0).find("a").html(key).attr("href",data[key]);
                        tdArr.eq(1).find("a");//  链接
                        //bb1.html(key);
                        //bb1.attr("href",data[key])
                    if(j == trList.length){
                        var bb1= tdArr.eq(0).find("a");//新闻标题
                        var bb2= tdArr.eq(1).find("a");//新闻时间
                        bb1.html("查看更多新闻").attr("href","http://www.agronet.com.cn/");
                    }
                }
        }
    });
</script>



</body>
</html>
