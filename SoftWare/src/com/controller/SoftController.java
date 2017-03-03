package com.controller;

import java.util.List;

import com.MD5.MD5Util;
import com.interceptor.AccessInterceptor;
import com.interceptor.OperationInterceptor;
import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.model.Blog;
import com.model.Comment;
import com.model.Message;
import com.model.Student;

public class SoftController extends Controller {
	
	public void index(){
		String snumber = this.getSessionAttr("snumber");
		List<Blog> blog=Blog.dao.find("select count(bId) as counts,sum(readCounts) as total from blog where snumber =?",snumber);
		List<Comment> comment = Comment.dao.find("select count(cId) as ccounts from comment where bId in(select bId from blog where snumber=?)",snumber);
		List<Comment> comms = Comment.dao.find("select c.*,s.sname as sname from comment c left join student s on c.snumber=s.snumber where bId in(select bId from blog where snumber=?) and isRead=?",snumber,0);
		List<Message> messages = Message.dao.find("select m.*,s.sname as sname from message m left join student s on m.sendNumber = s.snumber where receiveNumber =? and isRead =?",snumber,0);
		this.setAttr("comment", comment.get(0));
		this.setAttr("blog", blog.get(0));
		this.setAttr("comments", comms);
		this.setAttr("messages", messages);
		this.setAttr("size", comms.size()+messages.size());
		this.render("index.jsp");
	}
	
	public void welcome(){
		this.render("welcome.jsp");
	}
	
	public void editStudentInfo(){
		Student stu=this.getModel(Student.class,"stu");
		stu.set("passWord", MD5Util.MD5(stu.getStr("passWord")));
		stu.update();
		this.redirect("/soft");
	}
	
	public void allStudent(){
		String str = this.getSessionAttr("snumber");
		String snumberStr = str.substring(0,8);
		List<Student> lists;
		
		if(str.equals("1131315123")){
			lists = Student.dao.find("select s.*,count(b.snumber) as blogs from student s left join blog b on s.snumber = b.snumber group by s.snumber order by snumber");
		}else{
			lists=Student.dao.find("select s.*,count(b.snumber) as blogs from student s left join blog b on s.snumber = b.snumber where s.classNumber=? group by s.snumber order by snumber",snumberStr);
		}
		
		
		this.setAttr("stuCount", lists.size());
		this.setAttr("students", lists);
		this.render("allStudent.jsp");
	}
	
	@Before(OperationInterceptor.class)
	public void updateJob(){
		Integer sId=this.getParaToInt(0);
		Student stu=Student.dao.findById(sId);
		this.setAttr("stud", stu);
		this.render("updateJob.jsp");
	}
	
	public void update(){
		Student stu=this.getModel(Student.class,"student");
		stu.update();
		this.redirect("/soft/allStudent");
	}
	
	@Before(OperationInterceptor.class)
	public void delete(){
		Integer sId=this.getParaToInt(0);
		Student.dao.deleteById(sId);
		this.redirect("/soft/allStudent");
	}
	

}
