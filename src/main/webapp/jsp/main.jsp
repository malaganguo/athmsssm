<%--
  Created by IntelliJ IDEA.
  User: malaganguo
  Date: 2019/3/4
  Time: 13:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=v1tyWPrOvRo2wtdo1BqLGusRouOKsH3j"></script>

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
                            <li><a href="<%=request.getContextPath()%>/UserLogout.action">注销</a></li>
                        </ul>
                    </li>
                </ul>
                <ul class="breadcrumb">
                    <li><a href="<%=request.getContextPath()%>/toMain.action">首页</a> <span class="divider">/</span></li>
                    <li class="active">首页</li>
                </ul>
            </div>
            <!--第二报头结束-->

            <!--主仪表盘开始-->
            <div class="main-area ">
                <div class="row">
                    <div class="span10">
                        <div class="slate clearfix">
                            <a class="stat-column" href="#"> <span class="number">${countSite}</span><span>采集点数</span> </a>
                            <a class="stat-column" href="#"> <span class="number">${countAdmin}</span><span>管理人员数</span> </a>
                            <a class="stat-column" href="#"> <span class="number">${countUser}</span><span>普通用户数</span> </a>
                            <a class="stat-column" href="#"> <span class="number">1</span><span>异常点数</span> </a></div>
                    </div>
                </div>
                <div class="row">
                    <div class="span10">
                        <div class="slate">
                            <div class="page-header"><span style="font-size: large"><i
                                    class="icon-signal pull-right"></i>实时数据</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <span>
                                    <select id="realTimeDataSelect">
                                    </select>
                                </span>
                            </div>
                            <div id="realtime_data" style="height: 297px;"></div>
                            <div class="message"></div>
                            <script src="<%=request.getContextPath()%>/assets/js/highcharts/realtime_interaction.js"></script><!--websocket引入实时数据-->

                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="span10">
                        <div class="slate">
                            <div class="page-header">
                                <h2><i class="icon-shopping-cart pull-right"></i>监测点分布</h2>
                            </div>
                            <div style="width:950px;height:550px;" id="dituContent"></div>
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
                                    <td><a href="" target="_blank">新闻新闻新闻新闻</a></td>
                                </tr>
                                <tr>
                                    <td><a href="" target="_blank">新闻新闻新闻新闻</a></td>
                                </tr>
                                <tr>
                                    <td><a href="" target="_blank">新闻新闻新闻新闻</a></td>
                                </tr>
                                <tr>
                                    <td><a href="" target="_blank">新闻新闻新闻新闻</a></td>
                                </tr>
                                <tr>
                                    <td><a href="" target="_blank">新闻新闻新闻新闻</a></td>
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
<!--百度地图-->
<script>
    //标注点数组
    /*var markerArr = [{title:"我的标记",content:"我的备注",point:"108.896288|34.330744",isOpen:0,icon:{w:21,h:21,l:0,t:0,x:6,lb:5}}];*/
    var markerArr = new Array();
    //创建和初始化地图函数：
    function initMap(id){
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
                for(var i=0;i<data.length;i++){
                    var site = data[i].siteArea;//x:93.435085,y:44.261267

                    markerArr[i] = {title: "站点名："+data[i].siteName ,content:"添加人："+data[i].addPerson ,point:data[i].siteArea,isOpen:0,icon:{w:21,h:21,l:0,t:0,x:6,lb:5}};
                }
            }
        });
        createMap(id);//创建地图
        setMapEvent();//设置地图事件
        addMapControl();//向地图添加控件
        addMarker();//向地图中添加marker
    }

    //创建地图函数：
    function createMap(id){
        var map = new BMap.Map(id);//在百度地图容器中创建一个地图
        var point = new BMap.Point(108.953098279,34.2777998978);//定义一个中心点坐标
        map.centerAndZoom(point,12);//设定地图的中心点和坐标并将地图显示在地图容器中
        window.map = map;//将map变量存储在全局
    }

    //地图事件设置函数：
    function setMapEvent(){
        map.enableDragging();//启用地图拖拽事件，默认启用(可不写)
        map.enableScrollWheelZoom();//启用地图滚轮放大缩小
        map.enableDoubleClickZoom();//启用鼠标双击放大，默认启用(可不写)
        map.enableKeyboard();//启用键盘上下左右键移动地图
    }

    //地图控件添加函数：
    function addMapControl(){
        //向地图中添加缩放控件
        var ctrl_nav = new BMap.NavigationControl({anchor:BMAP_ANCHOR_TOP_LEFT,type:BMAP_NAVIGATION_CONTROL_LARGE});
        map.addControl(ctrl_nav);
        //向地图中添加缩略图控件
        var ctrl_ove = new BMap.OverviewMapControl({anchor:BMAP_ANCHOR_BOTTOM_RIGHT,isOpen:1});
        map.addControl(ctrl_ove);
        //向地图中添加比例尺控件
        var ctrl_sca = new BMap.ScaleControl({anchor:BMAP_ANCHOR_BOTTOM_LEFT});
        map.addControl(ctrl_sca);
    }


    //创建marker
    function addMarker(){
        for(var i=0;i<markerArr.length;i++){
            var json = markerArr[i];
            var p0 = json.point.split(",")[0];
            var p1 = json.point.split(",")[1];
            var point = new BMap.Point(p0,p1);
            var iconImg = createIcon(json.icon);
            var marker = new BMap.Marker(point,{icon:iconImg});
            var iw = createInfoWindow(i);
            var label = new BMap.Label(json.title,{"offset":new BMap.Size(json.icon.lb-json.icon.x+10,-20)});
            marker.setLabel(label);
            map.addOverlay(marker);
            label.setStyle({
                borderColor:"#808080",
                color:"#333",
                cursor:"pointer"
            });

            (function(){
                var index = i;
                var _iw = createInfoWindow(i);
                var _marker = marker;
                _marker.addEventListener("click",function(){
                    this.openInfoWindow(_iw);
                });
                _iw.addEventListener("open",function(){
                    _marker.getLabel().hide();
                })
                _iw.addEventListener("close",function(){
                    _marker.getLabel().show();
                })
                label.addEventListener("click",function(){
                    _marker.openInfoWindow(_iw);
                })
                if(!!json.isOpen){
                    label.hide();
                    _marker.openInfoWindow(_iw);
                }
            })()
        }
    }
    //创建InfoWindow
    function createInfoWindow(i){
        var json = markerArr[i];
        var iw = new BMap.InfoWindow("<b class='iw_poi_title' title='" + json.title + "'>" + json.title + "</b><div class='iw_poi_content'>"+json.content+"</div>");
        return iw;
    }
    //创建一个Icon
    function createIcon(json){
        var localObj = window.location;
        var contextPath = localObj.pathname.split("/")[1];
        var basePath = localObj.protocol+"//"+localObj.host+"/"+contextPath;
        var server_context=basePath;
        var icon = new BMap.Icon(server_context+"/assets/img/timg.jpg", new BMap.Size(json.w,json.h),{imageOffset: new BMap.Size(-json.l,-json.t),infoWindowOffset:new BMap.Size(json.lb+5,1),offset:new BMap.Size(json.x,json.h)})
        return icon;
    }

    initMap("dituContent");//创建和初始化地图
</script>
<!--获取新闻-->
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
                        // console.log(key +'  '+ data[key]);
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
                $("#realTimeDataSelect").append("<option value='"+data[0].siteTable+"' selected> "+data[0].siteName+"点实时数据 </option>");
                for(var i=1;i<data.length;i++){
                    $("#realTimeDataSelect").append("<option value='"+data[i].siteTable+"'> "+data[i].siteName+"点实时数据 </option>");
                }
            }
        });
</script>


</body>
</html>
