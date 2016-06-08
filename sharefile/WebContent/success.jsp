<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="com.linkyuji.bean.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>注册成功</title>
</head>
<body>
	<%
		UsersBean a = (UsersBean) session.getAttribute("USER");
		if (a == null)
			return;
		if (a.getUsertype() == 1) {
	%>
	<meta http-equiv="refresh" content="1;url=adminjsp/admin.jsp">
	<%
		} else {
	%>
	<meta http-equiv="refresh" content="1;url=userjsp/user.jsp">
	<%
		}
	%>
	登录成功！页面正在跳转

</body>
</html>