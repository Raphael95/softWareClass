<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%  
	String path = request.getContextPath();  
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<base href="<%=basePath%>"> 
<title>咱们班所有的学生</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
<link rel="apple-touch-icon-precomposed" href="images/icon/icon.png">
<link rel="shortcut icon" href="images/icon/favicon.ico">
<script src="js/jquery-2.1.4.min.js"></script>
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
            <li><a href="login/loginOut" onClick="if(!confirm('你以为说走就走啊，必须再确认一下，哼(⊙_⊙)?'))return false;">说走就走</a></li>
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
        <li><a href="article">文章</a></li>
        <li><a href="notice">通知公告</a></li>
        <li><a href="article/myBlog">我的Blog</a></li>
        <li><a href="notice/myNotice">我发布的公告</a></li>
      </ul>
    
      <ul class="nav nav-sidebar">
          <li class="active"><a class="dropdown-toggle" id="userMenu"  aria-haspopup="true" aria-expanded="false" href="soft/allStudent">我们都在这</a>
         
        </li>
       
      </ul>
    </aside>
    <div class="col-sm-9 col-sm-offset-3 col-md-10 col-lg-10 col-md-offset-2 main" id="main">
         <div class="row">
        <form action="soft/update" method="post" autocomplete="off" draggable="false">
          <div class="col-md-9">
            <h1 class="page-header">用户设置</h1>
            <div class="add-article-box">
              <h2 class="add-article-box-title"><span>学号</span></h2>
              <div class="add-article-box-content">
                <input type="text" name="student.snumber" class="form-control" placeholder="请输入站点标题" required autofocus autocomplete="off" value="${stud.snumber }">
                <input type="hidden" name="student.sId" value="${stud.sId }"/>
                
              </div>
            </div>
            <div class="add-article-box">
              <h2 class="add-article-box-title"><span>姓名</span></h2>
              <div class="add-article-box-content">
                <input type="text" name="student.sname" class="form-control" placeholder="请输入站点副标题" autocomplete="off" value="${stud.sname }">
                <span class="prompt-text">写下独一无二的名字，什么，你连咱们班级同学的名字都记不住? 拖出去斩了！！！</span> </div>
            </div>
            
            
           	
          </div>
          <div class="col-md-3">
            <h1 class="page-header">职务</h1>
            <div class="add-article-box">
              <h2 class="add-article-box-title"><span>请选择</span></h2>
              <div class="add-article-box-content">
                <select class="form-control" placeholder="在此处输入邮箱" autocomplete="off" name="student.job">
                	<option value="团支书" <c:if test="${stud.job =='团支书'}">selected="selected" </c:if> >团支书</option>
                	<option value="班长" <c:if test="${stud.job =='班长'}">selected="selected" </c:if> >班长</option>
                	<option value="学习委员" <c:if test="${stud.job =='学习委员'}">selected="selected" </c:if> >学习委员</option>
                	<option value="生活委员" <c:if test="${stud.job =='生活委员'}">selected="selected" </c:if> >生活委员</option>
                	<option value="体育委员" <c:if test="${stud.job =='体育委员'}">selected="selected" </c:if> >体育委员</option>
                	<option value="心里委员" <c:if test="${stud.job =='心里委员'}">selected="selected" </c:if> >心里委员</option>
                	<option value="组织委员" <c:if test="${stud.job =='组织委员'}">selected="selected" </c:if> >组织委员</option>
                	<option value="文艺委员" <c:if test="${stud.job =='文艺委员'}">selected="selected" </c:if> >文艺委员</option>
                	<option value="学生" <c:if test="${stud.job =='学生'}">selected="selected" </c:if> >学生</option>
                </select>
                <span class="prompt-text">每个人的职务不同哦</span> </div>
            </div>
           
            <div class="add-article-box">
              <h2 class="add-article-box-title"><span>保存</span></h2>
              <div class="add-article-box-content">
              <span class="prompt-text">请确定您对所有选项所做的更改</span>
              </div>
              <div class="add-article-box-footer">
                <button class="btn btn-primary" type="submit" name="submit">更新</button>
              </div>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</section>
<!--增加用户模态框-->
<div class="modal fade" id="addUser" tabindex="-1" role="dialog" aria-labelledby="addUserModalLabel">
  <div class="modal-dialog" role="document" style="max-width:450px;">
    <form action="/User/add" method="post" autocomplete="off" draggable="false">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <h4 class="modal-title" >修改职务</h4>
        </div>
        <div class="modal-body">
          <table class="table" style="margin-bottom:0px;">
            <thead>
              <tr> </tr>
            </thead>
            <tbody>
              <tr>
                <td wdith="20%">姓名:</td>
                <td width="80%"><input type="text" value="" class="form-control" name="truename" maxlength="10" autocomplete="off" /></td>
              </tr>
              <tr>
                <td wdith="20%">用户名:</td>
                <td width="80%"><input type="text" value="" class="form-control" name="username" maxlength="10" autocomplete="off" /></td>
              </tr>
              <tr>
                <td wdith="20%">职务:</td>
                <td width="80%"><input type="text" value="" class="form-control" name="student.job" maxlength="13" autocomplete="off" /></td>
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
<!--用户信息模态框-->
<div class="modal fade" id="seeUser" tabindex="-1" role="dialog" aria-labelledby="seeUserModalLabel">
  <div class="modal-dialog" role="document" style="max-width:450px;">
    <form action="/User/update" method="post" autocomplete="off" draggable="false">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <h4 class="modal-title">修改用户</h4>
        </div>
        <div class="modal-body">
          <table class="table" style="margin-bottom:0px;">
            <thead>
              <tr> </tr>
            </thead>
            <tbody>
              <tr>
                <td wdith="20%">姓名:</td>
                <td width="80%"><input type="text" value="" class="form-control" id="truename" name="truename" maxlength="10" autocomplete="off" /></td>
              </tr>
              <tr>
                <td wdith="20%">用户名:</td>
                <td width="80%"><input type="text" value="" class="form-control" id="username" name="username" maxlength="10" autocomplete="off" /></td>
              </tr>
              <tr>
                <td wdith="20%">电话:</td>
                <td width="80%"><input type="text" value="" class="form-control" id="usertel" name="usertel" maxlength="13" autocomplete="off" /></td>
              </tr>
              <tr>
                <td wdith="20%">旧密码:</td>
                <td width="80%"><input type="password" class="form-control" name="old_password" maxlength="18" autocomplete="off" /></td>
              </tr>
              <tr>
                <td wdith="20%">新密码:</td>
                <td width="80%"><input type="password" class="form-control" name="password" maxlength="18" autocomplete="off" /></td>
              </tr>
              <tr>
                <td wdith="20%">确认密码:</td>
                <td width="80%"><input type="password" class="form-control" name="new_password" maxlength="18" autocomplete="off" /></td>
              </tr>
            </tbody>
            <tfoot>
              <tr></tr>
            </tfoot>
          </table>
        </div>
        <div class="modal-footer">
          <input type="hidden" name="userid" value="" />
          <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
          <button type="submit" class="btn btn-primary">提交</button>
        </div>
      </div>
    </form>
  </div>
</div>
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
<script>


$(function () {
    $("#main table tbody tr td a").click(function () {
        var name = $(this);
        var id = name.attr("rel"); //对应id   
        if (name.attr("name") === "see") {
            $.ajax({
                type: "POST",
                url: "/User/see",
                data: "id=" + id,
                cache: false, //不缓存此页面   
                success: function (data) {
                    var data = JSON.parse(data);
					$('#truename').val(data.truename);
					$('#username').val(data.username);
					$('#usertel').val(data.usertel);
					$('#userid').val(data.userid);
                    $('#seeUser').modal('show');
                }
            });
        } else if (name.attr("name") === "delete") {
            if (window.confirm("此操作不可逆，是否确认？")) {
                $.ajax({
                    type: "POST",
                    url: "/User/delete",
                    data: "id=" + id,
                    cache: false, //不缓存此页面   
                    success: function (data) {
                        window.location.reload();
                    }
                });
            };
        };
    });
});
</script>
</body>
</html>