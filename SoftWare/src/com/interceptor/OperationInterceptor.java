package com.interceptor;

import com.jfinal.aop.Interceptor;
import com.jfinal.aop.Invocation;
import com.jfinal.core.Controller;
import com.model.Student;

public class OperationInterceptor implements Interceptor {

	@Override
	public void intercept(Invocation invocation) {
		// TODO Auto-generated method stub
		
		Controller controller=invocation.getController();
		Student stu = controller.getSessionAttr("student");
		if(!stu.getStr("role").equals("管理员")){
			
			controller.redirect("/errorPage/denyOperation");
		}
		else{
			invocation.invoke();
		}

	}

}
