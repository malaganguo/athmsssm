<%--
  Created by IntelliJ IDEA.
  User: malaganguo
  Date: 2019/2/27
  Time: 10:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>ATHMS</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <!-- font files  -->

    <!-- css files -->
    <link href="<%=request.getContextPath()%>/assets/css/loginstyle.css" rel='stylesheet' type='text/css'charset="UTF-8" />
    <!-- /css files -->
</head>
<body>
<h1>欢迎来到作物监控系统</h1>
<div class="log">
    <div class="content1">
        <h2>登录</h2>
        <form action="" method="post" id="loginForm" onsubmit="login()">
            <input type="text" name="userid" placeholder="请输入用户名" />
            <input type="password" name="psw" placeholder="请输入密码" />
            <div class="button-row">
                <input type="submit" class="sign-in" value="登录" onclick="login()">
                <input type="reset" class="reset" value="重置">

            </div>
            <div class="button-row">
                <!--<input type="submit" class="register" value="注册">-->
                <!--<input type="reset" class="reset" value="重置">-->
                <a href="register.html">还没有账号？注册一个</a>
            </div>
            <div class="clear"></div>
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

<script type="text/javascript">
    alert("aaa");
    function login(){
        alert("hello");
        $.ajax({
            type:"POST",
            url:"<%=request.getContextPath()%>/doLogin",
            data:{},
            async:true,
            error:function(){
                alert('index.jsp的ajax提交出错');
            },
            success:function(){
              <%--location.href = "<%=request.getContextPath()%>/login/login.action";--%>
                alert('dddd');
              location.href = "<%=request.getContextPath()%>/jsp/index.jsp";
            }
        });
        return false;
    }
</script>
</html>
