<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%  
	String path = request.getContextPath();  
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
<html>
<head>
<base href="<%=basePath%>"> 
<title>个人博客</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="css/normalize.css">
<link rel="stylesheet" href="css/font-awesome.css">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/templatemo-style.css">
<script src="js/vendor/modernizr-2.6.2.min.js"></script>

</head>
<body>
<!--[if lt IE 7]>
	<p class="browsehappy">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
<![endif]-->
<jsp:useBean id="stude" class="com.model.Student" scope="session"></jsp:useBean>
<%
	Date today=new Date();
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
	String time=sdf.format(today);
%>
<div class="responsive-header visible-xs visible-sm">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="top-section">
					<div class="profile-image">
						<img src="images/profile.jpg" alt="Volton">
					</div>
					<div class="profile-content">
						<h3 class="profile-title">Volton</h3>
						<p class="profile-description">Pro Photography</p>
					</div>
				</div>
			</div>
		</div>
		<a href="#" class="toggle-menu"><i class="fa fa-bars"></i></a>
		<div class="main-navigation responsive-menu">
			<ul class="navigation">
				<li><a href="#top"><i class="fa fa-home"></i>个人Blog</a></li>
				<li><a href="#about"><i class="fa fa-user"></i>凑热闹</a></li>
				<li><a href="#contact"><i class="fa fa-envelope"></i>留下你的足迹</a></li>
				
			</ul>
		</div>
	</div>
</div>

<!-- SIDEBAR -->
<div class="sidebar-menu hidden-xs hidden-sm">
	<div class="top-section">
		<div class="profile-image">
			<img src="images/profile.jpg" alt="Volton">
		</div>
		<h3 class="profile-title" style="font-family:微软雅黑;font-size:30px;">${stu.sname }</h3>
		<p class="profile-description" style="font-family:微软雅黑;">${stu.tel }&nbsp;&nbsp;(电话常联系)</p>
		<a href="article"><p class="profile-description" style="font-family:微软雅黑; color:red;">返回</p></a>
	</div> <!-- top-section -->
	<div class="main-navigation">
		<ul class="navigation">
			<li style="font-family:微软雅黑;"><a href="#top"><i class="fa fa-globe"></i>个人Blog</a></li>
			<li style="font-family:微软雅黑;"><a href="#about"><i class="fa fa-pencil"></i>凑热闹</a></li>
			<li style="font-family:微软雅黑;"><a href="#contact"><i class="fa fa-link"></i>留下你的足迹</a></li>
		</ul>
	</div> <!-- .main-navigation -->
	<div class="social-icons">
		<ul>
			<li><a href="#"><i class="fa fa-facebook"></i></a></li>
			<li><a href="#"><i class="fa fa-twitter"></i></a></li>
			<li><a href="#"><i class="fa fa-linkedin"></i></a></li>
			<li><a href="#"><i class="fa fa-google-plus"></i></a></li>
			<li><a href="#"><i class="fa fa-youtube"></i></a></li>
			<li><a href="#"><i class="fa fa-rss"></i></a></li>
		</ul>
	</div> <!-- .social-icons -->
</div> <!-- .sidebar-menu -->

<div class="copyrights">Collect from <a href="http://www.17sucai.com/" >网页模板</a></div>
	
<div class="banner-bg" id="top">
	<div class="banner-overlay"></div>
	<div class="welcome-text">
		
		<h2 style="font-family:微软雅黑;">| <b>${blog.btitle }</b></h2>
		<h5 style="font-family:微软雅黑;">${blog.bcontent }</h5>
	</div>
</div>

<!-- MAIN CONTENT -->
<div class="main-content">
	<div class="fluid-container">

		<div class="content-wrapper">
		
			<!-- ABOUT -->
			<div class="page-section" id="about">
			<div class="row">
				<div class="col-md-12">
					<h4 class="widget-title" style="font-size:20px;">||&nbsp;&nbsp;他们都说了什么&nbsp;&nbsp;(⊙▽⊙)</h4>
					<div class="about-image">
						<img src="images/8.jpg" alt="about me">
					</div>
					
					<c:forEach items="${comments }" var="comment">
						<b style="color:#36648B;">${comment.sname }</b>&nbsp;&nbsp;说  : &nbsp;<em style="font-family:微软雅黑;">${comment.content }</em>
						<form action="article/sendMessage" method="post">
							<table>
								<tr>
									<td><input type="text" id="inputTitle" name="message.content" class="form-control" placeholder="回复" style="width:700px;">
										<input type="hidden" name="message.receiveNumber" value="${comment.snumber }">
										<input type="hidden" name="message.bId" value="${comment.bId }">
										<input type="hidden" name="message.sendNumber" value="${student.snumber }"></td>
									<td><button class="input-type-text">发送</button></td>
									
								</tr>
							</table>
						</form>
					</c:forEach><hr/>
					<c:forEach items="${messages }" var="message">
						
						<b style="color:#36648B;">${message.sendName }</b>&nbsp;&nbsp;回复   &nbsp;<b style="color:#36648B;">${message.receiveName }&nbsp;:&nbsp;</b><em style="font-family:微软雅黑;">${message.content }</em><br/>
					</c:forEach>
					
				</div>
			</div> <!-- #about -->
			</div>
			
			
			

			<!-- CONTACT -->
			<div class="page-section" id="contact">
			<div class="row">
				<div class="col-md-12">
					<h3 class="widget-title" style="font-size:20px;">对我的Blog你有什么想说的，赶紧说，不要藏着</h3>
					
				</div>
			</div>
			<div class="row">
				<form action="article/addComment" method="post" class="contact-form">
					
					<fieldset class="col-md-12 col-sm-12">
						<textarea name="comment.content" id="message" cols="30" rows="6" placeholder="看什么看，还不快写"></textarea>
					</fieldset>
					<input type="hidden" name="comment.snumber" value="${student.snumber }"/>
					<input type="hidden" name="comment.bId" value="${blog.bId }"/>
					<input type="hidden" name="comment.ctime" value=<%=time %>>
					<fieldset class="col-md-12 col-sm-12">
						<input type="submit" class="button big default" value="说出去的话，如泼出去的水" style="font-family:微软雅黑;">
					</fieldset>
				</form>
			</div> <!-- .contact-form -->
			</div>
			<hr>

			<div class="row" id="footer">
				<div class="col-md-12 text-center">
					<p class="copyright-text">Copyright &copy &nbsp;淮阴工学院 13届    Raphael</p>
				</div>
			</div>

		</div>

	</div>
</div>

<script src="js/vendor/jquery-1.10.2.min.js"></script>
<script src="js/min/plugins.min.js"></script>
<script src="js/min/main.min.js"></script>
</body>
</html>