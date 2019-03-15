<%--
  Created by IntelliJ IDEA.
  User: malaganguo
  Date: 2019/3/11
  Time: 9:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<button id="btnSend" >
    发送
</button>
<button id="btnClose" >
    关闭
</button>
<script>
    var socket;
    var realtime_data;
    if(typeof(WebSocket) == "undefined") {
        console.log("您的浏览器不支持WebSocket");
    }else {
        console.log("您的浏览器支持WebSocket");

        //实现化WebSocket对象，指定要连接的服务器地址与端口  建立连接
        socket = new WebSocket("ws://localhost:8086/athmsssm/websocket/socketServer.action");
        //打开事件
        socket.onopen = function () {
            console.log("Socket 已打开");
        };
        //获得消息事件
        socket.onmessage = function (msg) {
            realtime_data = msg.data;
            //服务端返回的消息
            console.log("来自服务端的消息：" + msg.data);
        };
        //关闭事件
        socket.onclose = function () {
            console.log("Socket已关闭");
        };
        //发生了错误事件
        socket.onerror = function () {
            alert("Socket发生了错误");
        }

        $("#btnSend").click(function () {
            socket.send("这是来自客户端的消息:" + new Date());
        });

        $("#btnClose").click(function () {
            socket.close();
        });
    }
</script>
</body>
</html>
