<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="bootstrap-3.3.5-dist/css/bootstrap.min.css" rel="stylesheet">
<title>用户登录</title>

<style type="text/css">
body {
	background-image: url(res/img/805219.jpg);
	background-repeat: repeat;
}

input {
	color: #bfbfbf
}
</style>

<script type="text/javascript">


	function loadXMLDoc() {

		var userid = document.getElementById("userid").value;
		var psw = document.getElementById("psw").value;
		if (userid == '请输入用户名') {
			alert("请输入用户名")
		} else if (psw == '请输入密码') {
			alert("请输入密码");
		}
		if (userid != '请输入用户名' && psw != '请输入密码') {
			var xmlhttp;
			if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
				xmlhttp = new XMLHttpRequest();
			} else {// code for IE6, IE5
				xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
			}
			xmlhttp.onreadystatechange = function() {
				if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
					if( xmlhttp.responseText.indexOf('登录成功')>=0){
						window.location.href = "user_signin?user.userid=" + userid
						+ "&&user.userpsw=" + psw;
					}
					else
					document.getElementById("myDiv").innerHTML = xmlhttp.responseText;
				}
			}
			xmlhttp.open("POST", "user_signin?user.userid=" + userid
					+ "&&user.userpsw=" + psw, false);
			xmlhttp.send();
		}

	}
</script>
</head>
<body>
	<div
		style="position: absolute; top: 50%; height: 240px; margin: 0 auto; margin-top: -120px; width: 300px; left: 50%; margin-left: -150px;">

		<form action="user_signin" method="post" class="well"
			style="width: 220px; margin: 0px auto;">
			<center>
				<h3>用户登录</h3>
			</center>
			<div id="myDiv"></div>
			<label> 用户：</label><input id="userid" type="text" name="user.userid"
				style="height: 30px" class="span3" value="请输入用户名"
				onfocus="if(this.value=='请输入用户名'){this.value='',this.style.color='#000000',this.style.imeMode='disabled'}"
				onblur="if(this.value==''){this.value='请输入用户名',this.style.color='#bfbfbf'}" />

			<br> <label>密码：</label> <input id="psw" type="text"
				name="user.userpsw" style="height: 30px" clss="span3" value="请输入密码"
				
				onfocus="if(this.value=='请输入密码'){this.value='',this.style.color='#000000',this.type='password',this.style.imeMode='disabled' }"
				onblur="if(this.value==''){this.value='请输入密码',this.style.color='#bfbfbf',this.type='text'}" />

			<br> <br>

			<div>
				<input type="button" value="登陆" style="width: 140px"
					onclick="loadXMLDoc()" class="btn btn-primary" /> <a
					href="regist.jsp" style="width: 50px">注册</a>
			</div>

		</form>
	</div>
</body>
</html>
