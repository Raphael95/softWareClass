package com.config;

import com.controller.ArticleController;
import com.controller.ErrorController;
import com.controller.LoginController;
import com.controller.NoticeController;
import com.controller.RegisterController;
import com.controller.SoftController;
import com.interceptor.AuthInterceptor;
import com.jfinal.config.Constants;
import com.jfinal.config.Handlers;
import com.jfinal.config.Interceptors;
import com.jfinal.config.JFinalConfig;
import com.jfinal.config.Plugins;
import com.jfinal.config.Routes;
import com.jfinal.plugin.activerecord.ActiveRecordPlugin;
import com.jfinal.plugin.c3p0.C3p0Plugin;
import com.jfinal.render.ViewType;
import com.model.Blog;
import com.model.Comment;
import com.model.Message;
import com.model.Notice;
import com.model.NoticeType;
import com.model.Student;

public class MyAppConfig extends JFinalConfig {

	@Override
	public void configConstant(Constants me) {
		// TODO Auto-generated method stub
		
		me.setViewType(ViewType.JSP);
		me.setDevMode(true);

	}

	@Override
	public void configHandler(Handlers arg0) {
		// TODO Auto-generated method stub

	}

	@Override
	public void configInterceptor(Interceptors me) {
		// TODO Auto-generated method stub
		me.add(new AuthInterceptor());

	}

	@Override
	public void configPlugin(Plugins me) {
		// TODO Auto-generated method stub
		C3p0Plugin cp = new C3p0Plugin("jdbc:mysql://localhost/software", "root", "123456");
		me.add(cp);
		ActiveRecordPlugin arp = new ActiveRecordPlugin(cp); 
		me.add(arp);
		arp.addMapping("student", "sId",Student.class); 
		arp.addMapping("blog", "bId",Blog.class);
		arp.addMapping("notice","nId", Notice.class);
		arp.addMapping("comment","cId", Comment.class);
		arp.addMapping("message", "mId",Message.class);
		arp.addMapping("classes","cId" ,NoticeType.class);

	}

	@Override
	public void configRoute(Routes me) {
		// TODO Auto-generated method stub
		
		me.add("/login", LoginController.class);
		me.add("/soft", SoftController.class);
		me.add("/register",RegisterController.class);
		me.add("/article",ArticleController.class);
		me.add("/notice",NoticeController.class);
		me.add("/errorPage",ErrorController.class);
	}

}
