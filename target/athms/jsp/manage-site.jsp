<%--
  Created by IntelliJ IDEA.
  User: malaganguo
  Date: 2019/4/9
  Time: 11:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>

    <meta charset="utf-8">
    <title>农业管理系统——系统配置</title>
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
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=v1tyWPrOvRo2wtdo1BqLGusRouOKsH3j"></script>

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
                        <a id="titleUserName" class="dropdown-toggle" data-toggle="dropdown" href="#"><i class="icon-user"></i> ${user.username} <b
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
                    <li class="active">站点管理</li>
                </ul>

            </div>
            <!--第二报头结束-->

            <!--主仪表盘开始-->
            <div class="main-area dashboard">
                <div class="row">
                    <div class="page-header">
                        <h2>&nbsp;站点管理</h2>
                    </div>
                    <div class="span2">
                        <div class="control-group span12">
                            <button class="btn btn-large" data-toggle="modal" data-target="#addSiteModal">&nbsp;添加监测点&nbsp;</button>
                        </div>
                        <!--添加单站点的模态框-->
                        <div class="modal fade" id="addSiteModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                            &times;
                                        </button>
                                        <h4 class="modal-title" id="myModalLabel">
                                            添加监测点
                                        </h4>
                                    </div>
                                    <div class="modal-body">
                                        <form class="form-horizontal" onsubmit="addSite();return false">
                                            <fieldset id="fieldset3">
                                                <div class="control-group">

                                                    <!-- Text input-->
                                                    <label class="control-label" >站点名称</label>
                                                    <div class="controls">
                                                        <input type="text" placeholder="请输入站点名称" class="input-xlarge">
                                                        <p class="help-block"></p>
                                                    </div>
                                                </div>

                                                <div class="control-group">

                                                    <!-- Text input-->
                                                    <label class="control-label" >站点地址</label>
                                                    <div class="controls">
                                                        <input id="siteAddress" type="text" placeholder="请在地图上选择站点地址" class="input-xlarge" readonly>
                                                        <p class="help-block"></p>
                                                    </div>
                                                </div>
                                                <div class="control-group">
                                                    <div style="width:520px;height:200px;" id="dituContent"></div>
                                                </div>
                                                <div>
                                                    <div class="form-group">
                                                        <label for="dtp_input3" class="col-lg-2 control-label">添加日期</label>
                                                        <div class="input-group date form_date col-lg-3" data-date="" data-date-format="" data-link-field="dtp_input3" data-link-format="yyyy-mm-dd">
                                                            <input name="addSite_time" class="form-control" size="16" type="text" value="" readonly>
                                                            <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
                                                            <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                                                        </div>
                                                        <input type="hidden" id="dtp_input3" value="" />
                                                    </div>
                                                </div>
                                            </fieldset>
                                        </form>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                                        </button>
                                        <button type="button" class="btn btn-info" id="createSite">
                                            创建
                                        </button>
                                    </div>
                                </div><!-- /.modal-content -->
                            </div><!-- /.modal -->
                        </div>


                    </div>
                    <div class="span7">

                        <table class="table">
                            <thead>
                            <tr>
                                <th >站点ID</th>
                                <th >站点名</th>
                                <th >站点区域</th>
                                <th >添加时间</th>
                                <th >添加人</th>
                            </tr>
                            </thead>
                            <tbody id="siteTable">

                            </tbody>
                        </table>
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
<script>
    var currentMarker;
    //创建和初始化地图函数：
    function initMap(id){
        createMap(id);//创建地图
        setMapEvent();//设置地图事件
        //addMapControl();//向地图添加控件
        addMarker();//向地图中添加marker

        map.addEventListener("click",function(e){
            var x = e.point.lng;
            var y = e.point.lat;
            var point = new BMap.Point(x,y);
            var marker = new BMap.Marker(point);

            currentMarker = marker;
            if(currentMarker != undefined){
                map.removeOverlay(currentMarker);
            }
            map.addOverlay(currentMarker);
            $("#fieldset3 div:eq(2) input").val(x+","+y);
        });
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

    //标注点数组
    var markerArr = [{title:"我的标记",content:"我的备注",point:"108.896288|34.330744",isOpen:0,icon:{w:21,h:21,l:0,t:0,x:6,lb:5}}
    ];
    //创建marker
    function addMarker(){
        for(var i=0;i<markerArr.length;i++){
            var json = markerArr[i];
            var p0 = json.point.split("|")[0];
            var p1 = json.point.split("|")[1];
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
    $(document).ready(function(){
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
                for(var i=0;i<data.length;i++){
                    $("#siteTable").append("<tr>" +
                        "<td>"+data[i].siteId+"</td>"+"<td>"+data[i].siteName+"</td>"+"<td>"+data[i].siteArea+"</td>"+"<td>"+data[i].addPerson+"</td>"+"<td>"+data[i].addTime+"</td>"+"<td><a class='btn btn-small btn-primary' href='#' >修改</a><a class='btn btn-small btn-warning'>删除</a></tr>");
                }
                console.log(data);
            }
        });
    });

    function alterUser(i) {
        console.log("i"+i);
    }
</script>
<script>

    $("#createSite").click(function () {
        var siteName = $("#fieldset3 div:first input").val();
        var siteArea = $("#fieldset3 div:eq(2) input").val();
        var addPerson = $("#titleUserName").text();
        var addTime = $("#dtp_input3").val();
        var params = $.param({
            'siteName':siteName,
            'siteArea':siteArea,
            'addPerson':addPerson,
            'addTime':addTime
        });
        console.log(params);

        $.ajax({
            cache: false,
            type: "POST",
            url:'<%=request.getContextPath()%>/addSite.action',
            async: false,
            data: params,
            dataType: 'json',
            error: function(request)
            {
                console.log(" authorUsers ajax error");
            },
            success: function(data)
            {
                console.log("data"+data)
                if(null != data){
                    $("#addSiteModal").modal('hide');
                }
            }
        });
    });
</script>
</body>
</html>