<%--
  Created by IntelliJ IDEA.
  User: malaganguo
  Date: 2019/3/4
  Time: 13:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="utf-8">
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
    <script src="https://img.hcharts.cn/highcharts/highcharts.js"></script>
    <script src="https://img.hcharts.cn/highcharts/modules/exporting.js"></script>
    <script src="https://img.hcharts.cn/highcharts/modules/data.js"></script>
    <script src="https://img.hcharts.cn/highcharts/modules/series-label.js"></script>
    <script src="https://img.hcharts.cn/highcharts/modules/oldie.js"></script>
    <script src="https://img.hcharts.cn/highcharts-plugins/highcharts-zh_CN.js"></script>
    <script src="https://img.hcharts.cn/highcharts/themes/dark-unica.js"></script>


    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

</head>
<body>
<div class="container">
    <div class="row">
        <!--导航栏开始-->
        <div class="span2">
            <div class="main-left-col">
                <h1><img src="../assets/img/logo70-60.png" onerror="加载失败"></h1>
                <ul class="side-nav">
                    <li class="active"><a href="index.html"><i class="icon-home"></i> 首页</a></li>
                    <li><a class="dropdown-toggle" data-toggle="collapse" data-target="#website-dropdown"
                           href="data_query.html"><em class="icon-sitemap"></em> 数据查询 </a></li>
                    <!--<li class="dropdown">
                                  <a class="dropdown-toggle" data-toggle="collapse" data-target="#store-dropdown" href="#"><i class="icon-shopping-cart"></i> 数据统计 <b class="caret"></b></a>
                                  <ul id="store-dropdown" class="collapse">
                                      <li><a href="listing.html">Catalogue</a></li>
                                      <li><a href="orders.html">Orders</a></li>
                                      <li><a href="listing.html">Enquiries</a></li>
                                  </ul>
                              </li>-->
                    <li class="dropdown"><a class="dropdown-toggle" data-toggle="collapse"
                                            data-target="#reports-dropdown" href="#"><i
                            class="icon-signal"></i> 数据分析 <b class="caret"></b></a>
                        <ul id="reports-dropdown" class="collapse">
                            <li><a href="analysis-site.html">监测点分析</a></li>
                            <li><a href="temperaturep-site.html">数据类型分析</a></li>
                            <li><a href="time-site.html">时段分析</a></li>
                        </ul>
                    </li>
                    <li class="dropdown"><a class="dropdown-toggle" data-toggle="collapse"
                                            data-target="#members-dropdown" href="#"><i
                            class="icon-group"></i> 权限管理 <b class="caret"></b></a>
                        <ul id="members-dropdown" class="collapse">
                            <li><a href="listing.html">创建用户</a></li>
                            <li><a href="listing.html">访问权限</a></li>
                            <li><a href="listing.html">管理员名单</a></li>
                        </ul>
                    </li>
                    <li class="dropdown"><a class="dropdown-toggle" data-toggle="collapse"
                                            data-target="#settings-dropdown" href="#"><i
                            class="icon-cogs"></i> 系统配置 <b class="caret"></b></a>
                        <ul id="settings-dropdown" class="collapse">
                            <li><a href="listing.html">监测点管理</a></li>
                            <li><a href="listing.html">区域划分</a></li>
                            <li><a href="listing.html">操作日志</a></li>
                        </ul>
                    </li>
                    <li><a href="#"><i class="icon-bullhorn"></i> 通知 <span class="badge badge-warning">2</span></a></li>
                    <li class="dropdown"><a class="dropdown-toggle" data-toggle="collapse" data-target="#help-dropdown"
                                            href="#"><i
                            class="icon-info-sign"></i> 帮助 <b class="caret"></b></a>
                        <ul id="help-dropdown" class="collapse">
                            <li><a href="content.html">使用手册</a></li>
                            <li class="active"><a href="content.html">技术说明</a></li>
                            <li><a href="content.html">支持</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
            <!-- end main-left-col -->

        </div>
        <!-- 导航栏结束 -->

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
                            <div id="ajaxData" style="height: 297px;"></div>
                            <div class="message"></div>
                            <script src="<%=request.getContextPath()%>/assets/js/highcharts/realTimedata.js"></script><!--引入实时数据-->

                        </div>
                    </div>
                    <div class="row">
                        <div class="span10">
                            <div class="span4">
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

                            <div class="span5">
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
                            <table class="table">
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
                                    <td colspan="2"><a href="">更多农业新闻</a></td>
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


</body>
</html>