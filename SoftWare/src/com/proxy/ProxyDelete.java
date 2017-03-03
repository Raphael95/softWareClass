package com.proxy;

import com.interceptor.OperationInterceptor;
import com.jfinal.aop.Invocation;
import com.model.User;

public class ProxyDelete implements Delete {
	
	private OperationInterceptor oi;

	@Override
	public String result(User u) {
		// TODO Auto-generated method stub
		if(u.getUserName().equals("admin")){
			Invocation invocation = null;
			oi.intercept(invocation);
			return  "É¾³ý³É¹¦";
		}else{
			return "É¾³ýÊ§°Ü";
		}
	}

}
