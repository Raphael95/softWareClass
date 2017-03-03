<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%  
	String path = request.getContextPath();  
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<base href="<%=basePath%>"> 
<title>写点什么吧，时间在变，但不变的是自己的内心！</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
<link rel="apple-touch-icon-precomposed" href="images/icon/icon.png">
<link rel="shortcut icon" href="images/icon/favicon.ico">
<script src="js/jquery-2.1.4.min.js"></script>
<script type="text/javascript">
	function to_change(){
		if(document.getElementById("public").checked == true){
			document.getElementById("ssl").disabled = true;
		}
		if(document.getElementById("private").checked == true){
			document.getElementById("ssl").disabled = false;
		}
		
	}
	
</script>
<!--[if gte IE 9]>
  <script src="js/jquery-1.11.1.min.js" type="text/javascript"></script>
  <script src="js/html5shiv.min.js" type="text/javascript"></script>
  <script src="js/respond.min.js" type="text/javascript"></script>
  <script src="js/selectivizr-min.js" type="text/javascript"></script>
<![endif]-->
<!--[if lt IE 9]>
  <script>window.location.href='upgrade-browser.html';</script>
<![endif]-->
</head>
<body>
<%
	Date today=new Date();
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
	String time=sdf.format(today);
%>
<section class="container-fluid">
  <header>
    <nav class="navbar navbar-default navbar-fixed-top">
      <div class="container-fluid">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false"> <span class="sr-only">切换导航</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
          <a class="navbar-brand" href="soft">what we all have is love &copy</a> </div>
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
          <ul class="nav navbar-nav navbar-right">
            <li><a >消息 <span class="badge">0</span></a></li>
            <li class="dropdown"> <a class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">${student.sname }<span class="caret"></span></a>
              <ul class="dropdown-menu dropdown-menu-left">
                <li><a title="查看或修改个人信息" data-toggle="modal" data-target="#seeUserInfo">个人信息</a></li>
               
              </ul>
            </li>
            <li><a href="login/loginOut" onClick="if(!confirm('你以为说走就走啊，必须再确认一下，哼(⊙_⊙)?'))return false;">兄弟们，撤</a></li>
            <li><a data-toggle="modal" data-target="#WeChat">支付宝</a></li>
          </ul>
          <form action="" method="post" class="navbar-form navbar-right" role="search">
            <div class="input-group">
              <input type="text" class="form-control" autocomplete="off" placeholder="敬请期待" maxlength="15">
              <span class="input-group-btn">
              <button class="btn btn-default" type="submit">搜索</button>
              </span> </div>
          </form>
        </div>
      </div>
    </nav>
  </header>
  <div class="row">
    <aside class="col-sm-3 col-md-2 col-lg-2 sidebar">
      <ul class="nav nav-sidebar">
        <li><a href="soft">主页Home</a></li>
      </ul>
      <ul class="nav nav-sidebar">
       
        <li class="active"><a href="article">文章</a></li>
        <li><a href="notice">通知公告</a></li>
        <li><a href="article/myBlog">我的Blog</a></li>
        <li><a href="notice/myNotice">我发布的公告</a></li>
      
      </ul>
     
      <ul class="nav nav-sidebar">
         <li ><a class="dropdown-toggle" id="userMenu"  aria-haspopup="true" aria-expanded="false" href="soft/allStudent">我们都在这</a>
         
        </li>
        
      </ul>
    </aside>
    <div class="col-sm-9 col-sm-offset-3 col-md-10 col-lg-10 col-md-offset-2 main" id="main">
      <div class="row">
        <form action="article/add" method="post" class="add-article-form">
          <div class="col-md-9">
            <h1 class="page-header">撰写新文章</h1>
            <div class="form-group">
              <label for="article-title" class="sr-only">标题</label>
              <input type="text" id="article-title" name="blog.btitle" class="form-control" placeholder="在此处输入标题" required autofocus autocomplete="off">
            </div>
            <div class="form-group">
              <label for="article-content" class="sr-only">内容</label>
              <script id="article-content" name="blog.bcontent" type="text/plain"></script>
            </div>
           
            <div class="add-article-box">
              <h2 class="add-article-box-title"><span>描述</span></h2>
              <div class="add-article-box-content">
              	<textarea class="form-control" name="blog.bdes" autocomplete="off"></textarea>
                <span class="prompt-text">描述是可选的手工创建的内容总结，并可以在网页描述中使用</span>
              </div>
            </div>
          </div>
          <div class="col-md-3">
            <h1 class="page-header">操作</h1>
            <div class="add-article-box">
              <h2 class="add-article-box-title"><span>类型</span></h2>
              <div class="add-article-box-content">
                <ul class="category-list">
                  <li>
                    <label>
                      <input name="blog.btype" type="radio" value="情感类" checked>
                      情感类<em class="hidden-md">(  <span>1</span> )</em></label>
                  </li>
                  <li>
                    <label>
                      <input name="blog.btype" type="radio" value="生活类">
                      生活类 <em class="hidden-md">(  <span>2</span> )</em></label>
                  </li>
                  <li>
                    <label>
                      <input name="blog.btype" type="radio" value="发牢骚">
                     没事 发发牢骚 <em class="hidden-md">(  <span>3</span> )</em></label>
                  </li>
                  <li>
                    <label>
                      <input name="blog.btype" type="radio" value="学习类">
                      我要学习 <em class="hidden-md">( <span>4</span> )</em></label>
                  </li>
                  <li>
                    <label>
                      <input name="blog.btype" type="radio" value="毒鸡汤">
                      干了这碗毒鸡汤 <em class="hidden-md">( <span>5</span> )</em></label>
                  </li>
                </ul>
              </div>
            </div>
           
          
            <div class="add-article-box">
              <h2 class="add-article-box-title"><span>发布</span></h2>
              <div class="add-article-box-content">
              	<p><label>状态：</label><span class="article-status-display">未发布</span></p>
                <p><label>公开度：</label><input type="radio" id="public" name="blog.encrypt" value="0" onclick="to_change()" checked/>公开 <input type="radio" id="private" name="blog.encrypt" value="1" onclick="to_change()"/>加密</p>
                <p><input type="password" id="ssl" name="blog.ssl" class="form-control" placeholder="输入秘钥" required autofocus autocomplete="off" disabled="disabled"></p>
                <p><label>发布于：</label><span class="article-time-display"><input style="border: none;" type="datetime" name="blog.btime" value=<%=time %> /><input type="hidden" name="blog.snumber" value="${student.snumber }"/></span></p>
              </div>
              <div class="add-article-box-footer">
                <button class="btn btn-primary" type="submit" name="submit">发布</button>
              </div>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</section>
<!--个人信息模态框-->
<div class="modal fade" id="seeUserInfo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <form action="soft/editStudentInfo" method="post">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <h4 class="modal-title" >个人信息</h4>
        </div>
        <div class="modal-body">
          <table class="table" style="margin-bottom:0px;">
            <thead>
              <tr> </tr>
            </thead>
            <tbody>
              <tr>
                <td wdith="20%">姓名:</td>
                <td width="80%"><input type="text" value="${student.sname }" class="form-control" name="stu.sname" maxlength="10" autocomplete="off" disabled="disabled"/>
                <input type="hidden" value="${student.sId }" class="form-control" name="stu.sId" maxlength="10" autocomplete="off" /></td>
                
              </tr>
              <tr>
                <td wdith="20%">学号:</td>
                <td width="80%"><input type="text" value="${student.snumber }" class="form-control" name="stu.snumber" maxlength="10" autocomplete="off" disabled="disabled"/></td>
              </tr>
              <tr>
                <td wdith="20%">电话:</td>
                <td width="80%"><input type="text" value="${student.tel }" class="form-control" name="stu.tel" maxlength="13" autocomplete="off" required autofocus autocomplete="off"/></td>
              </tr>
             
              <tr>
                <td wdith="20%">新密码:</td>
                <td width="80%"><input type="password" class="form-control" name="stu.passWord" maxlength="18" autocomplete="off" required autofocus autocomplete="off"/></td>
              </tr>
              
            </tbody>
            <tfoot>
              <tr></tr>
            </tfoot>
          </table>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
          <button type="submit" class="btn btn-primary">提交</button>
        </div>
      </div>
    </form>
  </div>
</div>
<!--个人登录记录模态框-->
<div class="modal fade" id="seeUserLoginlog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" >登录记录</h4>
      </div>
      <div class="modal-body">
        <table class="table" style="margin-bottom:0px;">
          <thead>
            <tr>
              <th>登录IP</th>
              <th>登录时间</th>
              <th>状态</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>::1:55570</td>
              <td>2016-01-08 15:50:28</td>
              <td>成功</td>
            </tr>
            <tr>
              <td>::1:64377</td>
              <td>2016-01-08 10:27:44</td>
              <td>成功</td>
            </tr>
            <tr>
              <td>::1:64027</td>
              <td>2016-01-08 10:19:25</td>
              <td>成功</td>
            </tr>
            <tr>
              <td>::1:57081</td>
              <td>2016-01-06 10:35:12</td>
              <td>成功</td>
            </tr>
          </tbody>
        </table>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">朕已阅</button>
      </div>
    </div>
  </div>
</div>
<!--微信二维码模态框-->
<div class="modal fade user-select" id="WeChat" tabindex="-1" role="dialog" aria-labelledby="WeChatModalLabel">
  <div class="modal-dialog" role="document" style="margin-top:120px;max-width:280px;">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="WeChatModalLabel" style="cursor:default;">赞助</h4>
      </div>
      <div class="modal-body" style="text-align:center"> <img src="images/alipay.JPG" alt="" style="cursor:pointer;width:240px;height:290px;"/> </div>
    </div>
  </div>
</div>
<!--提示模态框-->
<div class="modal fade user-select" id="areDeveloping" tabindex="-1" role="dialog" aria-labelledby="areDevelopingModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="areDevelopingModalLabel" style="cursor:default;">该功能正在日以继夜的开发中…</h4>
      </div>
      <div class="modal-body"> <img src="images/baoman/baoman_01.gif" alt="深思熟虑" />
        <p style="padding:15px 15px 15px 100px; position:absolute; top:15px; cursor:default;">很抱歉，程序猿正在日以继夜的开发此功能，本程序将会在以后的版本中持续完善！</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-dismiss="modal">朕已阅</button>
      </div>
    </div>
  </div>
</div>
<!--右键菜单列表-->
<div id="rightClickMenu">
  <ul class="list-group rightClickMenuList">
    <li class="list-group-item disabled">欢迎访问异清轩博客</li>
    <li class="list-group-item"><span>IP：</span>172.16.10.129</li>
    <li class="list-group-item"><span>地址：</span>河南省郑州市</li>
    <li class="list-group-item"><span>系统：</span>Windows10 </li>
    <li class="list-group-item"><span>浏览器：</span>Chrome47</li>
  </ul>
</div>
<script src="js/bootstrap.min.js"></script> 
<script src="js/admin-scripts.js"></script>
<script src="lib/ueditor/ueditor.config.js"></script> 
<script src="lib/ueditor/ueditor.all.min.js"> </script> 
<script src="lib/ueditor/lang/zh-cn/zh-cn.js"></script>  
<script id="uploadEditor" type="text/plain" style="display:none;"></script>
<script type="text/javascript">
var editor = UE.getEditor('article-content');
window.onresize=function(){
    window.location.reload();
}
var _uploadEditor;
$(function () {
    //重新实例化一个编辑器，防止在上面的editor编辑器中显示上传的图片或者文件
    _uploadEditor = UE.getEditor('uploadEditor');
    _uploadEditor.ready(function () {
        //设置编辑器不可用
        //_uploadEditor.setDisabled();
        //隐藏编辑器，因为不会用到这个编辑器实例，所以要隐藏
        _uploadEditor.hide();
        //侦听图片上传
        _uploadEditor.addListener('beforeInsertImage', function (t, arg) {
            //将地址赋值给相应的input,只去第一张图片的路径
            $("#pictureUpload").attr("value", arg[0].src);
            //图片预览
            //$("#imgPreview").attr("src", arg[0].src);
        })
        //侦听文件上传，取上传文件列表中第一个上传的文件的路径
        _uploadEditor.addListener('afterUpfile', function (t, arg) {
            $("#fileUpload").attr("value", _uploadEditor.options.filePath + arg[0].url);
        })
    });
});
//弹出图片上传的对话框
$('#upImage').click(function () {
    var myImage = _uploadEditor.getDialog("insertimage");
    myImage.open();
});
//弹出文件上传的对话框
function upFiles() {
    var myFiles = _uploadEditor.getDialog("attachment");
    myFiles.open();
}
</script>
</body>
</html>