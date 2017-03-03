package com.controller;

import java.util.List;

import com.MD5.MD5Util;
import com.interceptor.AuthInterceptor;
import com.javamail.SendMail;
import com.jfinal.aop.Clear;
import com.jfinal.core.Controller;
import com.model.Comment;
import com.model.Student;
import com.model.User;

@Clear(AuthInterceptor.class)
public class LoginController extends Controller {
	
	public void index(){
		this.render("login.jsp");
	}

	public void validate(){
		String snumber=this.getPara("userName");
		String passWord=this.getPara("passWord");
		List<Student> stu=Student.dao.find("select * from student where snumber =? and passWord =?",snumber,MD5Util.MD5(passWord));
		if(stu.size()<=0){
			this.setAttr("errorMsg", "学号或密码错误");
			this.render("login.jsp");
		}else{
			this.setSessionAttr("student", stu.get(0));
			this.setSessionAttr("snumber", stu.get(0).get("snumber"));
			this.setSessionAttr("job", stu.get(0).getStr("job"));
			this.setSessionAttr("flag", true);
			this.setSessionAttr("snameStr", stu.get(0).getStr("sname").substring(1, stu.get(0).getStr("sname").length()));
			this.redirect("/soft/welcome");
		}
	}
	
	public void loginOut(){
		this.removeSessionAttr("student");
		this.removeSessionAttr("snumber");
		this.setSessionAttr("flag", false);
		this.removeSessionAttr("snameStr");
		this.removeSessionAttr("job");
		this.removeSessionAttr("errorPass");
		this.redirect("/login");
	}
	
	
	
	public void sendEmail(){
		try{
			String email =this.getPara("email");
			User user=new User();
			user.setEmail(email);
			SendMail send=new SendMail(user);
			send.start();
			this.redirect("/soft");
		}catch(Exception e){
			e.printStackTrace();
			this.redirect("/login");
		}
		
		
	}
}
