<%--
  Created by IntelliJ IDEA.
  User: malaganguo
  Date: 2019/3/4
  Time: 0:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>ATHMS</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <!-- font files  -->

    <!-- css files -->
    <link href="<%=request.getContextPath()%>/assets/css/loginstyle.css" rel='stylesheet' type='text/css' media="all" charset="UTF-8"/>
    <!-- /css files -->
</head>
<body>
<h1>欢迎来到作物监控系统</h1>
<div class="log">

    <div class="content2">
        <h2>注册</h2>
        <form action="userRegister.action" method="post" id="registerForm">
            <input type="text" name="username" value="username" placeholder="请输入用户名">
            <input type="password" name="password" placeholder="请输入密码">
            <input type="password" name="rePassword" placeholder="请再次输入密码">
            <input type="email" name="email" placeholder="请输入邮箱">
            <input type="hidden" name="regIp">
            <input type="submit" class="register" value="注册">
        </form>
    </div>
    <div class="clear"></div>
</div>
<div class="footer">
</div>

</body>
<script src="<%=request.getContextPath()%>/assets/js/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/assets/js/bootstrap.js"></script>
<script src="<%=request.getContextPath()%>/assets/js/bootstrap.min.js"></script>
<!--搜狐接口获取客户端的ip和城市-->
<script src="http://pv.sohu.com/cityjson?ie=utf-8"></script>
<script>
    $("input[name='regIp']").val(returnCitySN["cip"]+','+returnCitySN["cname"]);
</script>
</html>