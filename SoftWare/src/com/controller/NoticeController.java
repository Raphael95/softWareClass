package com.controller;

import java.util.List;

import com.interceptor.AccessInterceptor;
import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.model.Notice;
import com.model.NoticeType;

public class NoticeController extends Controller {
	
	public void index(){
		Integer pageSize=this.getParaToInt(0);
		if(pageSize==null){
			pageSize=1;
		}
		String Str = this.getSessionAttr("snumber");
		String numberStr = Str.substring(0, 8);
		Page<Notice> notices=Notice.dao.paginate(pageSize, 10, "select n.*,s.sname as sname", "from notice n left join student s on n.snumber = s.snumber where n.classNumber=? order by ntime desc",numberStr);
		this.setAttr("notices", notices);
		this.render("notice-lists.jsp");
	}
	
	@Before(AccessInterceptor.class)
	public void addNotice(){
		String job = this.getSessionAttr("job");
		List<NoticeType> list = NoticeType.dao.find("select noticeType from classes where job =?",job);
		this.setAttr("noticeType", list.get(0).getStr("noticeType"));
		this.render("add-notice.jsp");
	}
	
	public void add(){
		Notice notice=this.getModel(Notice.class,"notice");
		String classNumber = notice.getStr("snumber").substring(0, 8);
		notice.set("classNumber", classNumber);
		notice.save();
		this.redirect("/notice");
	}
	
	@Before(AccessInterceptor.class)
	public void myNotice(){
		Integer pageSize=this.getParaToInt(0);
		if(pageSize==null){
			pageSize=1;
		}
		String snumber=this.getSessionAttr("snumber");
		Page<Notice> notices=Notice.dao.paginate(pageSize, 10, "select *", "from notice where snumber=? order by ntime desc",snumber);
		this.setAttr("notices", notices);
		this.render("my-notice.jsp");
	}
	
	public void editNotice(){
		Integer nId=this.getParaToInt(0);
		if(nId!=null && nId>0){
			this.setAttr("notice", Notice.dao.findById(nId));
		}
		this.render("edit-notice.jsp");
	}
	
	public void edit(){
		Notice notice=this.getModel(Notice.class,"notice");
		notice.update();
		this.redirect("/notice/myNotice");
		
	}
	
	public void delete(){
		Integer nId=this.getParaToInt(0);
		Notice.dao.deleteById(nId);
		this.redirect("/notice/myNotice/");
	}
	
	public void read(){
		Integer nId=this.getParaToInt(0);
		Notice notice = Notice.dao.findById(nId);
		this.setAttr("notice", notice);
		this.render("read_notice.jsp");
	}
	
	public void checkAll(){
		
		String[] ids = this.getParaValues("checkbox[]");
		if(this.getParaValues("checkbox[]") == null){
			this.redirect("/notice/myNotice");
		}else{
			String sql="delete from notice where nId in(?)";
			Object nids[][] =new Object[ids.length][1];
			for(int i=0;i<ids.length;i++){
				for(int j=0;j<1;j++){
					nids[i][j] = ids[i];
				}
			}
			int[] size = Db.batch(sql, nids, 200);
			this.redirect("/notice/myNotice");
		}
		
	}

}
