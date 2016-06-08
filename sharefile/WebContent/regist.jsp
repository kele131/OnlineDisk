<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="bootstrap-3.3.5-dist/css/bootstrap.min.css" rel="stylesheet">
<title>注册</title>
 <style type="text/css">    
 body{    
      background-image: url(res/img/805219.jpg);    
      background-size:cover;
 } 
 </style>  
</head>
<body>

<div style="position:absolute;  top:50%;  height:240px;  margin:0 auto; margin-top:-120px; width:300px; left:50%; margin-left:-150px;">
<form action="user_regist" method="post"class="well"
			style="width: 220px; margin: 0px auto;">
		
			<h3>用户注册</h3>
		
		<label>	用户：</label><input type="text" name="user.userid" style="height: 30px" class="span3" ></input>

		<br>
		<label>	密码：</label><input type="password" name="user.userpsw" style="height: 30px" class="span3" ></input>

		<br><br>
	
			<input type="submit" value="注册" style="width: 140px" class="btn btn-primary"></input>

	</form>

</div>  
	
</body>
</html>