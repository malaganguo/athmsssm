<%--
  Created by IntelliJ IDEA.
  User: malaganguo
  Date: 2019/4/8
  Time: 10:33
  To change this template use File | Settings | File Templates.
--%>
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
                        <a href="<%=request.getContextPath()%>/toMain.action">首页</a> <span class="divider">/</span>
                    </li>
                    <li class="active">创建用户</li>
                </ul>

            </div>
            <!--第二报头结束-->

            <!--主仪表盘开始-->
            <div class="main-area dashboard">
                <div class="row">
                    <div class="page-header">
                        <h2>&nbsp;权限管理</h2>
                    </div>
                    <div class="span2">
                        <div class="control-group span12">
                            <button class="btn btn-large" data-toggle="modal" data-target="#addUserModal">&nbsp;&nbsp;添&nbsp;加&nbsp;用&nbsp;户&nbsp;&nbsp;</button>
                        </div>
                        <!--添加单用户的模态框-->
                        <div class="modal fade" id="addUserModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                            &times;
                                        </button>
                                        <h4 class="modal-title" id="myModalLabel">
                                            添加用户
                                        </h4>
                                    </div>
                                    <div class="modal-body">
                                        <form class="form-horizontal" onsubmit="authorOne();return false">
                                            <fieldset id="fieldset1">


                                                <div class="control-group">

                                                    <!-- Text input-->
                                                    <label class="control-label" >用户名</label>
                                                    <div class="controls">
                                                        <input type="text" placeholder="请输入用户名" class="input-xlarge">
                                                        <p class="help-block"></p>
                                                    </div>
                                                </div>

                                                <div class="control-group">

                                                    <!-- Text input-->
                                                    <label class="control-label" >密码</label>
                                                    <div class="controls">
                                                        <input type="text" placeholder="请输入密码" class="input-xlarge">
                                                        <p class="help-block"></p>
                                                    </div>
                                                </div>

                                                <div class="control-group">

                                                    <!-- Text input-->
                                                    <label class="control-label" >邮箱（选填）</label>
                                                    <div class="controls">
                                                        <input type="text" placeholder="请输入邮箱" class="input-xlarge">
                                                        <p class="help-block"></p>
                                                    </div>
                                                </div>



                                                <div class="control-group">

                                                    <!-- Select Basic -->
                                                    <label class="control-label">请选择角色</label>
                                                    <div class="controls">
                                                        <select class="input-xlarge">
                                                            <option value="part">普通用户</option>
                                                            <option value="root">管理员</option>
                                                            </select>
                                                    </div>

                                                </div>

                                            </fieldset>
                                        </form>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                                        </button>
                                        <button type="button" class="btn btn-info" id="authorOneUser">
                                            注册
                                        </button>
                                    </div>
                                </div><!-- /.modal-content -->
                            </div><!-- /.modal -->
                        </div>
                        <div class="control-group span12">
                            <button class="btn btn-large" data-toggle="modal" data-target="#addUsersModal2" >批量添加用户</button>
                        </div>
                        <!--批量添加用户模态框-->
                        <div class="modal fade" id="addUsersModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel2" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                            &times;
                                        </button>
                                        <h4 class="modal-title" id="myModalLabel2">
                                            <B>批量添加用户</B>
                                        </h4>
                                    </div>
                                    <div class="modal-body">
                                        <form class="form-horizontal">
                                            <fieldset id="fieldset2">
                                                <div class="control-group">

                                                    <!-- Text input-->
                                                    <label class="control-label" >创建用户数</label>
                                                    <div class="controls">
                                                        <input type="text" placeholder="请输入创建用户个数" class="input-xlarge">
                                                        <p class="help-block"></p>
                                                    </div>
                                                </div>

                                                <div class="control-group">

                                                    <!-- Text input-->
                                                    <label class="control-label" >用户名前缀</label>
                                                    <div class="controls">
                                                        <input type="text" placeholder="请输入用户名前缀" class="input-xlarge">
                                                        <p class="help-block"></p>
                                                    </div>
                                                </div>

                                                <div class="control-group">

                                                    <!-- Text input-->
                                                    <label class="control-label" >密码（统一）</label>
                                                    <div class="controls">
                                                        <input type="text" placeholder="请输入密码" class="input-xlarge">
                                                        <p class="help-block"></p>
                                                    </div>
                                                </div>

                                                <div class="control-group">

                                                    <!-- Select Basic -->
                                                    <label class="control-label">请选择角色</label>
                                                    <div class="controls">
                                                        <select class="input-xlarge">
                                                            <option value="part">普通用户</option>
                                                            <option value="root">管理员</option>
                                                            <option></option></select>
                                                    </div>

                                                </div>

                                            </fieldset>
                                        </form>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                                        </button>
                                        <button type="button" class="btn btn-info" id="authorUsers">
                                            注册
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
                                <th >用户名</th>
                                <th >email</th>
                                <th >角色</th>
                                <th >注册时间</th>
                                <th >注册IP</th>
                                <th >操作</th>
                            </tr>
                            </thead>
                            <tbody>

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
            url:'<%=request.getContextPath()%>/userShow.action',
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
                    $("tbody").append("<tr>" +
                        "<td>"+data[i].username+"</td>"+"<td>"+data[i].email+"</td>"+"<td>"+data[i].role+"</td>"+"<td>"+data[i].regTime+"</td>"+"<td>"+data[i].regIp+"</td>"+"<td><a class='btn btn-small btn-primary' href='#' >修改</a><a class='btn btn-small btn-warning'>删除</a></tr>");
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

    $("#authorOneUser").click(function () {
        var username = $("#fieldset1 div:first input").val();
        var password = $("#fieldset1 div:eq(2) input").val();
        var email = $("#fieldset1 div:eq(4) input").val();
        var role = $("#fieldset1 select option:selected").val();
        var params = $.param({
            'username':username,
            'password':password,
            'email':email,
            'role':role
        });
        console.log(params);

        $.ajax({
            cache: false,
            type: "POST",
            url:'<%=request.getContextPath()%>/authorOneUser.action',
            async: false,
            data: params,
            dataType: 'json',
            error: function(request)
            {
                console.log(" authorOneUser ajax error");
            },
            success: function(data)
            {
                // console.log(request.getAttr("saveStatus"));
                console.log("data"+data)
                if(null != data){
                    $("#addUserModal").modal('hide');
                }
            }
        });
    });

    $("#authorUsers").click(function () {
        var userNumber = $("#fieldset2 div:first input").val();
        var usernamePrefix = $("#fieldset2 div:eq(2) input").val();
        var password = $("#fieldset2 div:eq(4) input").val();
        var role = $("#fieldset2 select option:selected").val();
        var params = $.param({
            'userNumber':userNumber,
            'usernamePrefix':usernamePrefix,
            'password':password,
            'role':role
        });
        console.log(params);

        $.ajax({
            cache: false,
            type: "POST",
            url:'<%=request.getContextPath()%>/authorUsers.action',
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
                    $("#addUserModal2").modal('hide');
                }
            }
        });
    });
</script>
</body>
</html>