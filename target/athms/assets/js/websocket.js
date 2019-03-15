var websocket = null;
if ('WebSocket' in window) {
    console.log("websocket");
    websocket = new WebSocket("ws://"+window.location.host+"/athmsssm/websocket/socketServer.action");

}
else if ('MozWebSocket' in window) {
    console.log("Mozwebsocket");
    websocket = new MozWebSocket("ws://localhost:8086/athmsssm/websocket/socketServer");

}
else {
    console.log("sockJs");
    websocket = new SockJS("http://localhost:8086/athmsssm/sockjs/socketServer");

}
websocket.onopen = onOpen;
websocket.onmessage = onMessage;
websocket.onerror = onError;
websocket.onclose = onClose;

function onOpen(openEvt) {
    //alert(openEvt.Data);
    console.log("socket已打开");
}

var thdata ;
function onMessage(evt) {
    // alert(evt.data);
    //console.log("后台消息"+evt.data);
    thdata = evt.data;
}
function onError() {}
function onClose() {}

function doSend() {
    if (websocket.readyState == websocket.OPEN) {
        var msg = document.getElementById("inputMsg").value;
        websocket.send(msg);//调用后台handleTextMessage方法
        alert("发送成功!");
    } else {
        alert("连接失败!");
    }
}
window.close=function()
    {
        websocket.onclose();
    }
