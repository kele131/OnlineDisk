<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="bootstrap-3.3.5-dist/css/bootstrap.min.css" rel="stylesheet">
<title>Insert title here</title>
</head>
<body>
	<div class="container" style="margin-top: 100px">
		<form action="login.jspx" method="post" class="well"
			style="width: 220px; margin: 0px auto;">
			<h3>系统登录</h3>

			<label>用户名:</label>
			 <input type="text" name="username"	style="height: 30px" class="span3" />
			 <label>密码：</label>
			 <input	type="password" name="password" style="height: 30px" class="span3">
			 
			<button type="submit" class="btn btn-primary">登陆系统</button>
		</form>
	</div>
</body>
</html>