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
		<div style="width: 540px">
			<table border="1" class="table table-striped">
				<tr>
					<td><a
						href="folder_loadFolderbyid?folder.idfolder=0&&folder.userid=<%=a.getUserid()%>">主目录</a>
						<%
							List filelist = (List) session.getAttribute("sharelist");
							
 						%></td>
				</tr>
				<%
					if (filelist != null) {
						for (int i = 0; i < filelist.size(); i++) {
							FileBean file = (FileBean) filelist.get(i);
				%>
				<tr>
					<td>
						<div style='float: left; width: 80%'>
							&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp文件： <a
								href="file_download?fileid=<%=file.getIdfile()%>"><%=file.getFilename()%></a>
						</div>
						</td>
				</tr>
				<%
					}

					}
				%>
			</table>
		</div>

	</center>
</body>
</html>
<script type="text/javascript">
	function couldupload(inputfile) {
		var file = inputfile.value;
		var btn = document.getElementById("submitfile");
		if (file == null) {
			btn.style.display = "none";
		} else {
			var re = /^([\u4E00-\u9FA5]|\w)*$/;
			var name = file.substring(file.lastIndexOf('\\') + 1, file
					.lastIndexOf('.'));

			if (re.test(name)) {
				btn.style.display = "";
			} else {
				btn.style.display = "none";
				alert("文件名中含有特殊字符请重新选择")

			}
		}
	}
</script>