<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.linkyuji.bean.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户修改</title>
</head>
<body>
	<%
		UsersBean a = (UsersBean) session.getAttribute("obj");
		if (a == null)
			return;
	%>
	EDI ID :<%=a.getUserid()%>
	<form action="user_editor">
		用户：<input type="text" name="user.userid" value="<%=a.getUserid()%>"
			disabled="disabled" /><br> 密码：<input type="text"
			name="user.userpsw" value="<%=a.getUserpsw()%>" /><br> 昵称：<input
			type="text" name="user.username" value="<%=a.getUsername()%>" /><br>
		<input type="submit" value="提交">
	</form>
</body>
</html>