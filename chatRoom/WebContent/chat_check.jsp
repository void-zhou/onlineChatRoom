<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<title>�����֤��...</title>
</head>
<body>
	<% 
		String name="";
		name=request.getParameter("username");
		List onlineUserList =(List)application.getAttribute("onlineUserList");
		if(onlineUserList==null){
			onlineUserList=new ArrayList();
			application.setAttribute("onlineUserList",onlineUserList);
		}
		int flag=0;
		List onlist =(List)application.getAttribute("onlineUserList");
		for(int i=0;i<onlist.size();i++){
			String s=(String)onlist.get(i);
			if(s.equals(name)){
				flag=1;
				break;
			}
		}
		if(flag==1){
			out.print("�û����Ѵ���,���������룡");
			response.setHeader("refresh","2;url=chat_login.jsp");
		}
		else{
			onlineUserList.add(name);
			out.print("��ӭ��,"+"<font style='color:red;font-size:30px;font-weight:bold;'>"+name+"</font>"+"<br/>"+"�����ǣ�"+new Date().toLocaleString());
			%>
			<div  >
				<img src="welcome1.jpg" style="width:800px;height:600px;">
			</div>
			<% 
			session.setAttribute("sess_uname",name);
			if(application.getAttribute("app_fy")==null){
				application.setAttribute("app_fy"," ");
			}
			String tmp;
		    tmp=(String)application.getAttribute("app_fy");
		    tmp=tmp+name+"�����������ҡ�"+"<br/>";
		    application.setAttribute("app_fy",tmp);
			response.setHeader("refresh", "3;url=main.jsp");
		}
	%>
</body>
</html>