package com.interceptor;

import com.jfinal.aop.Interceptor;
import com.jfinal.aop.Invocation;
import com.jfinal.core.Controller;
import com.model.Blog;

public class ReadBlogInterceptor implements Interceptor {

	@Override
	public void intercept(Invocation invocation) {
		// TODO Auto-generated method stub
		
		Controller controller = invocation.getController();
		Integer bId = controller.getParaToInt(0);
		String ssl = controller.getPara(1);
		System.out.println("或得到的秘钥是："+ssl);
		String snumber = controller.getSessionAttr("snumber");
		controller.setSessionAttr("errorPass", "");
		Blog blog = Blog.dao.findById(bId);
		if(ssl==null&&blog.getStr("encrypt").equals("1")&&(!blog.getStr("snumber").equals(snumber))){
			controller.redirect("/errorPage/PassPort/"+bId);
		}else{
			invocation.invoke();
		}

	}

}
