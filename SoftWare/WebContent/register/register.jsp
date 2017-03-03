<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%  
	String path = request.getContextPath();  
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<base href="<%=basePath%>"> 
<title>注册</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/\style.css">
<link rel="stylesheet" type="text/css" href="css/login.css">
<link rel="apple-touch-icon-precomposed" href="images/icon/icon.png">
<link rel="shortcut icon" href="images/icon/favicon.ico">
<script src="js/jquery-2.1.4.min.js"></script>
</head>
<body>
<div class="container">
  <div class="siteIcon"><img src="images/icon/icon.png" alt="" data-toggle="tooltip" data-placement="top" title="没事点这个干嘛，还不赶紧注册！" draggable="false" /></div>
  <form action="register/register" method="post" autocomplete="off" class="form-signin">
    <h2 class="form-signin-heading">Software 登录</h2>
    <label for="userName" class="sr-only">用户名</label>
    <input type="text" id="userName" name="stu.snumber" class="form-control" placeholder="请输入个人学号" required autofocus autocomplete="off" maxlength="10">
    <label for="userName" class="sr-only">姓名</label>
    <input type="text" id="sName" name="stu.sname" class="form-control" placeholder="请输入姓名" required autofocus autocomplete="off" maxlength="10">
    <label for="userPwd" class="sr-only">密码</label>
    <input type="password" id="userPwd" name="stu.passWord" class="form-control" placeholder="请输入密码(最多18位)" required autocomplete="off" maxlength="18">
    <label for="userName" class="sr-only">手机号码</label>
    <input type="text" id="stel" name="stu.tel" class="form-control" placeholder="请输入手机" required autofocus autocomplete="off" maxlength="11">
   
    <a href="main.html"><button class="btn btn-lg btn-primary btn-block" type="submit" id="signinSubmit">注册</button></a>
  </form>
  <div class="footer">
    <p><a href="login" data-toggle="tooltip" data-placement="left" title="赶紧滴！去登录，就差你啦">已有一个账号 →</a></p>
  </div>
</div>
<script src="js/bootstrap.min.js"></script> 
</body>
</html>