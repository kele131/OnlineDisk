<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="com.linkyuji.bean.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>管理员界面</title>
</head>
<body>

	<%
		UsersBean a = (UsersBean) session.getAttribute("USER");
		if (a == null)
			return;
	%>
	welcome! your ID :<%=a.getUserid()%>
	<div align="right">
		<a href="user_loadalluser">用户管理</a>
	</div>
</body>
</html>