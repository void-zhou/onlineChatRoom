<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="gbk" import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<% 
	response.setContentType("text/xml; charset=UTF-8");  
	response.setHeader("Pragma","No-cache"); 
	response.setHeader("Cache-Control","no-cache");
   	List<String> list1=(List<String>)application.getAttribute("siliao");
	if (list1 == null || list1.isEmpty()){
		out.println("<i>ÔÝÎÞË½ÁÄÏûÏ¢~</i>");
	} 
	else{
		String name = session.getAttribute("sess_uname").toString();
		for (int i = 0; i < list1.size(); i++){
			String []sp = list1.get(i).split("#");
			if (sp[2].equals(name)){
			out.println(sp[0]+sp[1]+"Äã"+sp[3]+sp[4]+sp[5]+"<br/>");
			}
			if(sp[4].equals(name)){
				out.println(sp[0]+sp[1]+sp[2]+sp[3]+"Äã"+sp[5]+"<br/>");
			}
		}
	}
	out.close();
	%>
</body>
</html>