package com.controller;

import com.MD5.MD5Util;
import com.interceptor.AuthInterceptor;
import com.jfinal.aop.Clear;
import com.jfinal.core.Controller;
import com.model.Student;

@Clear(AuthInterceptor.class)
public class RegisterController extends Controller {
	
	public void index(){
		this.render("register.jsp");
	}
	
	public void register(){
		Student stu=this.getModel(Student.class,"stu");
		stu.set("passWord", MD5Util.MD5(stu.getStr("passWord")));
		String snumberStr = stu.getStr("snumber").substring(0, 8);
		System.out.println(stu.getStr("sex"));
		stu.set("classNumber", snumberStr);
		stu.save();
		this.redirect("/login");
		
	}

}
