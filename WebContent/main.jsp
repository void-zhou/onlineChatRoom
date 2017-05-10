<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="gbk" import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<link rel="stylesheet" href="./kindeditor/themes/default/default.css" />
<link rel="stylesheet" href="./kindeditor/plugins/code/prettify.css" />
<script charset="utf-8" src="./kindeditor/kindeditor-min.js"></script>
<script charset="utf-8" src="./kindeditor/lang/zh_CN.js"></script>
<script charset="utf-8" src="./kindeditor/plugins/code/prettify.js"></script>
<script type="text/javascript">
var s=setInterval("sc()",100);
function sc(){
		var div = document.getElementById("chat_div");
		div.scrollTop = div.scrollHeight;
}
function jud(){
	var l;
	l=document.chats.say.value.length;
	if(l==0){
		alert("输入不能为空！请重新输入");
		return false;
	}
	return true;
}
function quit(){
	if(confirm("确定要退出吗？")){
		return true;
	}
	return false;
}
var XMLHttp,XMLHttp1;
function sendRequest(url,func){
	if(window.XMLHttpRequest){
		XMLHttp=new XMLHttpRequest();
	}
	else if(window.ActiveXObject){
		try{
			XMLHttp=new ActiveXObject("Msxml2.XMLHTTP");
		}catch(e){
			try{
				XMLHttp=new ActiveXObject("Microsoft.XMLHTTP");
			}catch(e){}
		}
	}
	XMLHttp.open("GET",url,true);
	XMLHttp.onreadystatechange=func;
	XMLHttp.send(null);
}
function sendRequest1(url,func){
	if(window.XMLHttpRequest){
		XMLHttp1=new XMLHttpRequest();
	}
	else if(window.ActiveXObject){
		try{
			XMLHttp1=new ActiveXObject("Msxml2.XMLHTTP");
		}catch(e){
			try{
				XMLHttp1=new ActiveXObject("Microsoft.XMLHTTP");
			}catch(e){}
		}
	}
	XMLHttp1.open("GET",url,true);
	XMLHttp1.onreadystatechange=func;
	XMLHttp1.send(null);
}
function fresh_chat_div(){
	sendRequest("ajax.jsp",function(){
		if(XMLHttp.readyState==4&&XMLHttp.status==200){
			document.getElementById("chat_div").innerHTML=XMLHttp.responseText;
			setTimeout("fresh_chat_div()",3000);
		}
	});
}
function fresh_online_user(){
	sendRequest1("ajaxx.jsp",function(){
		if(XMLHttp1.readyState==4&&XMLHttp1.status==200){
			document.getElementById("onlineUser").innerHTML=XMLHttp1.responseText;
			setTimeout("fresh_online_user()",10000);
		}
	});
}
function load(){
	fresh_chat_div();
	fresh_online_user();
}
function fresh(){
	window.location.replace("main.jsp");
}
function openNew(){
	window.showModalDialog("page.jsp",window,"dialogHeight=300px;dialogWidth=300px;center=yes;status=0;edge=sunken;help=no;"); 
}
KindEditor.ready(function(K){
	window.editor=K.create('textarea[name="say"]',{
		height:'180px',
		items:["fontname","fontsize","fontcolor","bold","italic","underline","|","emoticons",],
		resizeType:'0',
	});
});
</script>
<title>简单聊天室</title>
<style type="text/css" >
body{
	height:700px;
	width:800px;
	background:url(back.jpg) repeat fixed;
}
</style>

</head>
<body onload="load()">
<%
	String sess_uname, fy, tmp;
	request.setCharacterEncoding("gbk");
	sess_uname = (String)session.getAttribute("sess_uname");
	if(sess_uname==null){
		response.sendRedirect("chat_login.jsp");
	}
	Date now = new Date();
	fy = request.getParameter("say");
	if(fy!=null){
		String ans = now.toLocaleString()+" "+sess_uname+"说: "+fy+"<br>";
		tmp = (String)application.getAttribute("app_fy");
		ans = tmp + ans;
	    application.setAttribute("app_fy",ans);
	}
%>
<form name="form2" action="quit.jsp" >
<div  style="width:145px;height:698px;border:1px solid #000;float:left;">
在线用户：<img  src="fresh.png" alt="点击刷新页面"  style="cursor:pointer;width:30px;height:30px;" onclick="fresh()" />
<br/>
<div id="onlineUser" style="width:140px;height:600px;border:none;">
</div>
<input type="submit" name="button1" value="退出" onclick="return quit()"/><br>
</div>
</form>

<div id="chat_div" style="width:650px;height:500px;border:1px solid #000;float:left;overflow-y:scroll;"></div>

<form action="main.jsp" method="post" name="chats">
  <div style="float:left;"><textarea id="say" name="say" style="width:540px;height:94px;resize:none;" ></textarea></div>
  <div style="width:50px;height:95px;float:right;" ><input type = "submit" value="发送"/></div>
</form>
</body>
</html>
