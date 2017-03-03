package com.interceptor;

import com.jfinal.aop.Interceptor;
import com.jfinal.aop.Invocation;
import com.jfinal.core.Controller;

public class AuthInterceptor implements Interceptor {

	@Override
	public void intercept(Invocation invocation) {
		// TODO Auto-generated method stub
		
		Controller controller=invocation.getController();
		Boolean loginUser = controller.getSessionAttr("flag");
		if(loginUser != null && loginUser == true){
			invocation.invoke();
		}else{
			controller.redirect("/errorPage");
		}

	}

}
