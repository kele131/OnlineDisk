<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.linkyuji.bean.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="bootstrap-3.3.5-dist/css/bootstrap.min.css" rel="stylesheet">
<title>Insert title here</title>
</head>
<body>
<%
	FileBean sharefile = (FileBean)session.getAttribute("sharefile");
%>
	<form action="share_share">
	<label>您需要分享的文件是：</label><br/>
	<label>文件ID</label>
	<input type="text" name="fileid" readonly="readonly" value="<%=sharefile.getIdfile()%>"/>
	<br/>
	<label>文件名</label>
	<input type="text" readonly="readonly" value="<%=sharefile.getFilename() %>"/>
	<br/>
	<label>被分享的帐号</label>
	<input type="text" name="userid" >
	<input type="submit" value="分享"/>
	</form>
</body>
</html>