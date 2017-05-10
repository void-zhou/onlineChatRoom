<%@ page language="java" contentType="text/html; charset=gbk"
    import="java.util.*,java.io.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>»ñÈ¡ÔÚÏßÓÃ»§</title>
<style type="text/css">
.astyle{
	text-decoration:none;
	color:black;
	cursor:pointer;
}
</style>
</head>
<body>
	<% 
	response.setContentType("text/xml; charset=UTF-8");  
	response.setHeader("Cache-Control","no-cache");
	String username=(String)session.getAttribute("sess_uname");
	List onlist=(List)application.getAttribute("onlineUserList");
	for(int i=0;i<onlist.size();i++){
		String s=(String)onlist.get(i);
		if(s.equals(username)){
			out.println("<b style='color:red;'>"+s+" "+"(×Ô¼º)"+"</b>"+"<br/>");
		}
		else{
			out.println("<a class='astyle'>"+s+"</a>"+"<br/>");
		}
	}
	out.close();
	%>
</body>
</html>