<%@ page language="java" contentType="text/xml; charset=UTF-8"
	import="java.util.*,java.io.*"
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>获取application的值</title>
</head>
<body>
	<% 
	response.setContentType("text/xml; charset=UTF-8");  
	response.setHeader("Pragma","No-cache"); 
	response.setHeader("Cache-Control","no-cache");
   	out.println((String)application.getAttribute("app_fy"));
   	out.close();
	%>
</body>
</html>