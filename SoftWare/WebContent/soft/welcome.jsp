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
<link rel="stylesheet" type="text/css" href="css/normalize.css" />
<link rel="stylesheet" type="text/css" href="css/default.css">
<link rel="stylesheet" type="text/css" href="css/sty.css">

<title>Welcome</title>
</head>
<body>
	<main>
      <div id="overlay"></div>
      <ul id="scene">
        <li class="layer" data-depth="0.1">
          <div class="layer1"></div>
        </li>
        <li class="layer" data-depth="0.2">
          <div class="layer2"></div>
        </li>
      </ul>
      <div class="wrapper">
      	<center style="color:white;font-size:100px; font-family:Calibri;">FRIENDS</center>
       
        	<div class="htmleaf-header">
			<a href="soft" style="color:white; font-family:微软雅黑;text-decoration :none;"><h1 >点击进入<span></span></h1></a>
		</div>      
      </div>
    </main>
	
	<script src="http://libs.useso.com/js/jquery/2.1.1/jquery.min.js" type="text/javascript"></script>
	<script>window.jQuery || document.write('<script src="js/jquery-2.1.1.min.js"><\/script>')</script>
	<script src='js/jquery.parallax.min.js'></script>
	<script>
	$(document).ready(function () {
	    $('#scene').parallax();
	});
	</script>

</body>
</html>