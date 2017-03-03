package com.interceptor;

import com.jfinal.aop.Interceptor;
import com.jfinal.aop.Invocation;
import com.jfinal.core.Controller;
import com.model.Student;

public class AccessInterceptor implements Interceptor {

	@Override
	public void intercept(Invocation invocation) {
		// TODO Auto-generated method stub
		
		Controller controller=invocation.getController();
		Student stu = controller.getSessionAttr("student");
		
		if(stu.getStr("job").equals("学生")){
			controller.redirect("/errorPage/denyAccess");
		}
		else{
			invocation.invoke();
		}

	}

}
