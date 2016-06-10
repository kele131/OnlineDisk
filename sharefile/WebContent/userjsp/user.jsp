<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.linkyuji.bean.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="bootstrap-3.3.5-dist/css/bootstrap.min.css" rel="stylesheet">
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
	<a href="user_exit">注销</a>
	<center>
	<div  style="width: 540px">
		<table  border="1" class="table table-striped" >
			<tr>
				<td><a
					href="folder_loadFolderbyid?folder.idfolder=0&&folder.userid=<%=a.getUserid()%>">主目录</a>
					<%
						List objlist = (List) session.getAttribute("ROOTFOLDER");
						List filelist = (List) session.getAttribute("FILELIST");
						int upp = 0;
						try {
							upp = Integer.parseInt(session.getAttribute("oldp").toString());
						} catch (Exception e) {

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
				<td><div style='float:left;width:80%'>
					文件夹：<a id="<%=folder.getFoldername()%>"
					href="folder_loadFolderbyid?folder.idfolder=<%=folder.getIdfolder()%>&&folder.userid=<%=a.getUserid()%>"><%=folder.getFoldername()%></a>
					</div>
					<div align="right" style='float:right;width:20%'><a  href="folder_deleteFolder?folderid=<%=folder.getIdfolder()%>">删除</a></div>
				</td>
					
			</tr>
			<%
				}
				}
				if (filelist != null) {
					for (int i = 0; i < filelist.size(); i++) {
						FileBean file = (FileBean) filelist.get(i);
			%>
			<tr>
				<td >
				<div style='float:left;width:80%'>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp文件：
				<a href="file_download?fileid=<%=file.getIdfile() %>"><%=file.getFilename()%></a></div>
				<div align="right" style='float:right;width:20%'><a  href="file_delete?fileid=<%=file.getIdfile() %>">删除</a></div>
				</td>
			</tr>
			<%
				}

				}
			%>
		</table>
</div>

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

		<form action="file_upload" method="post" enctype="multipart/form-data">
			<lable>选择本地文件：</lable><input type="file" name="file" onchange="couldupload(this)" multiple />
			<input id="submitfile" type="submit" value="上传" style="display: none">
		</form>

	</div>
</body>
</html>
<script type="text/javascript">
	function couldupload(inputfile) {
		var file = inputfile.value;
		var btn = document.getElementById("submitfile");
		if (file == null) {
			btn.style.display = "none";
		} else {
			var re=/^([\u4E00-\u9FA5]|\w)*$/; 
			var name = file.substring(file.lastIndexOf('\\')+1,file.lastIndexOf('.'));
			
			if(re.test(name)){
				btn.style.display = "";
			}else{
				btn.style.display = "none";
				alert("文件名中含有特殊字符请重新选择")
				
			}			
		}
	}
		
</script>