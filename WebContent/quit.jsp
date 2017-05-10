<%@ page language="java" contentType="text/html; charset=gbk"%>
<%@page import="java.util.* " %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>×¢ÏúÓÃ»§ÐÅÏ¢</title>
</head>
<body>
	<%
		out.print("ÍË³ö³É¹¦£¬ÕýÔÚÇåÀíÓÃ»§Êý¾Ý...");
		String username=(String)session.getAttribute("sess_uname");
		List onlineUserList=(List)application.getAttribute("onlineUserList");
		onlineUserList.remove(username);
	    String tmp;
	    tmp=(String)application.getAttribute("app_fy");
	    tmp=tmp+username+"ÍË³öÁËÁÄÌìÊÒ¡£"+"<br/>";
	    application.setAttribute("app_fy",tmp);
		session.invalidate();
		response.setHeader("refresh","2;url=chat_login.jsp");
	%>
</body>
</html>