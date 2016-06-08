<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.linkyuji.bean.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户界面</title>
</head>
<body>
	<center>
		<h1>linkyuji网盘</h1>
	</center>
	<%
		UsersBean a = (UsersBean) session.getAttribute("USER");
		if (a == null)
			return;
	%>

	<div align="center">
		<form action="file_createfolder">
			<input type="text" value="新建文件夹" /> <input type="submit"
				value="新建文件夹" />
		</form>

		<form action="file_upload">
			<input type="file" /> <input type="submit" value="上传">
		</form>

	</div>

	<br>
	<br>
	<br>
	<br>

	<center>
		<table width="540" border="1">
			<tr>
				<td><a
					href="folder_loadFolderbyid?folder.idfolder=0&&folder.userid=<%=a.getUserid()%>">主目录</a>
					<%
						List objlist = (List) session.getAttribute("ROOTFOLDER");
						List filelist = (List) session.getAttribute("FILELIST");
						String up = (String) session.getAttribute("up");
						if (up != null && up.equals("true")) {
					%> <a href="javascript:history.back(-1)">上一级</a> <%
 	}
 %></td>
			</tr>

			<%
				if (objlist != null) {
					for (int i = 0; i < objlist.size(); i++) {
						FolderBean folder = (FolderBean) objlist.get(i);
			%>
			<tr>
				<td><a
					href="folder_loadFolderbyid?folder.idfolder=<%=folder.getIdfolder()%>&&folder.userid=<%=a.getUserid()%>"><%=folder.getFoldername()%></a></td>
			</tr>
			<%
				}
				}
			if(filelist!=null){
				for(int i = 0;i < filelist.size();i++){
					FileBean file = (FileBean) filelist.get(i);
					%>
					<tr>
						<td><%=file.getFilename()%></td>
					</tr>
					<%
					
				}
				
			}
			%>
		</table>
	</center>
</body>
</html>