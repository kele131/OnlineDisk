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
						int upp = 0;
						try{
						upp = Integer.parseInt(session.getAttribute("oldp").toString());
						}catch(Exception e){
							
						}

						String up = (String) session.getAttribute("up");
						if (up != null && up.equals("true")) {
					%> <a
					href="folder_loadFolderbyid?folder.idfolder=<%=upp%>&&folder.userid=<%=a.getUserid()%>">上一级</a>
					<%
						}
					%></td>
			</tr>

			<%
				if (objlist != null) {
					for (int i = 0; i < objlist.size(); i++) {
						FolderBean folder = (FolderBean) objlist.get(i);
			%>
			<tr>
				<td><a id="<%=folder.getFoldername()%>"
					href="folder_loadFolderbyid?folder.idfolder=<%=folder.getIdfolder()%>&&folder.userid=<%=a.getUserid()%>">文件夹：<%=folder.getFoldername()%></a></td>
			</tr>
			<%
				}
				}
				if (filelist != null) {
					for (int i = 0; i < filelist.size(); i++) {
						FileBean file = (FileBean) filelist.get(i);
			%>
			<tr>
				<td>文件：<%=file.getFilename()%></td>
			</tr>
			<%
				}

				}
			%>
		</table>


	</center>
	<%
		String path = (String) session.getAttribute("path");
		if (path == null) {
			path = a.getUserid();
		}
	%>
	<div id="uploaddiv" align="center">
		<form action="folder_createfolder">
			<label>您当前的位置：</label> <input id="folderpath" type="text"
				name="folder.remark" disabled="disabled"
				style="background-color: transparent; width: 300px; border-left: 0px; border-top: 0px; border-right: 0px; border-bottom: 1px"
				value="<%=path%>" /> <input type="text" value="新建文件夹"
				name="folder.foldername" style="color: #bfbfbf"
				onfocus="if(this.value=='新建文件夹'){this.value='',this.style.color='#000000'}"
				onblur="if(this.value==''){this.value='新建文件夹',this.style.color='#bfbfbf'}" />
			<input type="submit" value="新建文件夹" />
		</form>

		<form action="file_upload"  method="post" enctype="multipart/form-data">
			<input type="file" name="file"  multiple/> <input type="submit" value="上传">
		</form>

	</div>
</body>
</html>