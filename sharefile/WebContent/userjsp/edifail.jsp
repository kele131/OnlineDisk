<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.linkyuji.bean.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	该目录下有同名文件，添加失败！
	<%
	String userid = ((UsersBean)session.getAttribute("USER")).getUserid();
	int folderid = Integer.parseInt(session.getAttribute("myp").toString());

%>
<meta http-equiv="refresh" content="1;url='folder_loadFolderbyid?folder.idfolder=<%=folderid%>&&folder.userid=<%=userid%>'">
</body>
</html>