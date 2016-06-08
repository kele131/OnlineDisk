<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.linkyuji.bean.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户列表</title>
</head>
<body>
	<center>
		<h1>用户管理</h1>
	</center>
	<p>
		<a href="javascript:history.back(-1)">返回</a>
	<table width="100%" border="1" cellpadding="1">
		<tr>
			<td width="20%">用户登录号</td>
			<td width="20%">用户密码</td>
			<td width="20%">用户昵称</td>
			<td width="20%">修改</td>
			<td width="20%">删除</td>
		</tr>
		<%
			List objlist = (List) session.getAttribute("USERLIST");
			if (objlist != null) {
				for (int i = 0; i < objlist.size(); i++) {
					UsersBean user = (UsersBean) objlist.get(i);
		%>
		<tr>
			<td><%=user.getUserid()%></td>
			<td><%=user.getUserpsw()%></td>
			<td><%=user.getUsername()%></td>
			<td><a href="user_getuserinfo?user.userid=<%=user.getUserid()%>">修改</a></td>
			<td><a href="user_delete?user.userid=<%=user.getUserid()%>">删除</a></td>
		</tr>
		<%
			}
			}
		%>
	</table>
</body>
</html>