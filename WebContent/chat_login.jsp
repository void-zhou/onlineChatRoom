<%@ page language="java" contentType="text/html; charset=gb2312"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>聊天室登录界面</title>
</head>
<body style="background:url(login_back.jpg) no-repeat;">
	<%
		if(session.getAttribute("sess_uname")!=null){
			out.print("您上次未正常退出，即将返回聊天室！");
			response.setHeader("refresh","2;url=main.jsp");
		}
		else{
	%>
	<form action="chat_check.jsp" name="form1" >
		<div style="position:absolute;top:200px;left:600px;">
		<label for="username">用户名：</label><input type="text" id="username" name="username" required="required" pattern="[A-Za-z0-9]{1,9}"/><br/><br>
		<span ><input type="submit" value="登录"/></span>
		</div>
	</form>
	<%
	}
	%>
</body>
</html>