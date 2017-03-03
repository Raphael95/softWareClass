package com.controller;

import com.interceptor.AuthInterceptor;
import com.jfinal.aop.Clear;
import com.jfinal.core.Controller;

@Clear(AuthInterceptor.class)
public class ErrorController extends Controller {
	
	public void index(){
		this.render("401.jsp");
	}
	
	public void denyAccess(){
		this.render("403.jsp");
	}
	
	public void denyOperation(){
		this.render("500.jsp");
	}
	
	public void PassPort(){
		Integer bId = this.getParaToInt(0);
		this.setAttr("bId", bId);
		this.render("PassPort.jsp");
	}

}
