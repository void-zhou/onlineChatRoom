<%@ page language="java" contentType="text/html; charset=gbk"%>
<%@page import="java.util.* " %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>注销用户信息</title>
</head>
<body>
	<%
		out.print("退出成功，正在清理用户数据...");
		String username=(String)session.getAttribute("sess_uname");
		List onlineUserList=(List)application.getAttribute("onlineUserList");
		onlineUserList.remove(username);
	    String tmp;
	    tmp=(String)application.getAttribute("app_fy");
	    tmp=tmp+username+"退出了聊天室。"+"<br/>";
	    application.setAttribute("app_fy",tmp);
		session.invalidate();
		response.setHeader("refresh","2;url=chat_login.jsp");
	%>
</body>
</html>