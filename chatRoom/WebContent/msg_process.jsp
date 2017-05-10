<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="gbk"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%!List<String> list1 = new ArrayList<String>(); %>
<%
	String sess_uname, fy, tmp,fasong,siliao,slyh;
	request.setCharacterEncoding("gbk");
	sess_uname = (String)session.getAttribute("sess_uname");
	fasong=request.getParameter("fasong");
	slyh=request.getParameter("select_user");
	fy = request.getParameter("say");
	if(fasong.equals("·¢ËÍ")||slyh==""){
		Date now = new Date();
		if(fy!=null){
			String ans = now.toLocaleString()+" "+sess_uname+"Ëµ:"+fy+"<br>";
			tmp = (String)application.getAttribute("app_fy");
			ans = tmp + ans;
		    application.setAttribute("app_fy",ans);
		}
	}
	else{
		Date now = new Date();
		list1.add(now.toLocaleString()+"# #"+sess_uname+"#¶Ô#"+slyh+"#Ëµ:"+fy);
	}
	application.setAttribute("siliao",list1);
	response.sendRedirect("main.jsp");
%>
</body>
</html>