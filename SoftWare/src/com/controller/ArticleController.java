package com.controller;

import java.util.List;

import com.MD5.MD5Util;
import com.interceptor.ReadBlogInterceptor;
import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.model.Blog;
import com.model.Comment;
import com.model.Message;
import com.model.Student;

public class ArticleController extends Controller {
	
	public void index(){
		String snumber = this.getSessionAttr("snumber");
		List<Comment> comms = Comment.dao.find("select c.*,s.sname as sname from comment c left join student s on c.snumber=s.snumber where bId in(select bId from blog where snumber=?) and isRead=?",snumber,0);
		List<Message> messages = Message.dao.find("select m.*,s.sname as sname from message m left join student s on m.sendNumber = s.snumber where receiveNumber =? and isRead =?",snumber,0);
		this.setAttr("comments", comms);
		this.setAttr("messages", messages);
		this.setAttr("size", comms.size()+messages.size());
		Integer pageSize=this.getParaToInt(0);
		if(pageSize == null){
			pageSize=1;
		}
		Page<Blog> blogPage=Blog.dao.paginate(pageSize, 10, "select b.*,s.sname as sname", "from blog b left join student s on b.snumber = s.snumber order by btime ,readCounts desc");
		this.setAttr("blogs", blogPage);
		this.render("article-lists.jsp");
	}
	
	public void addArticle(){
		this.render("add-article.jsp");
	}
	
	public void add(){
		Blog blog=this.getModel(Blog.class,"blog");
		blog.set("ssl", MD5Util.MD5(blog.getStr("ssl")));
		blog.save();
		this.redirect("/article");
	}
	
	public void myBlog(){
		String snumber=this.getSessionAttr("snumber");
		List<Comment> comms = Comment.dao.find("select c.*,s.sname as sname from comment c left join student s on c.snumber=s.snumber where bId in(select bId from blog where snumber=?) and isRead=?",snumber,0);
		List<Message> messages = Message.dao.find("select m.*,s.sname as sname from message m left join student s on m.sendNumber = s.snumber where receiveNumber =? and isRead =?",snumber,0);
		Integer pageSize=this.getParaToInt(0);
		if(pageSize == null){
			pageSize=1;
		}
		
		Page<Blog> lists=Blog.dao.paginate(pageSize, 10, "select *", "from blog  where snumber=? order by btime,readCounts desc",snumber);
		this.setAttr("blogs", lists);
		this.render("my-article.jsp");
		this.setAttr("comments", comms);
		this.setAttr("messages", messages);
		this.setAttr("size", comms.size()+messages.size());
	}
	
	public void editArticle(){
		Integer bId=this.getParaToInt(0);
		if(bId != null && bId > 0){
			this.setAttr("blog", Blog.dao.findById(bId));
		}
		this.render("edit-article.jsp");
	}
	
	public void edit(){
		Blog blog=this.getModel(Blog.class,"blog");
		blog.set("ssl", MD5Util.MD5(blog.getStr("ssl")));
		blog.update();
		this.redirect("/article/myBlog");
	}
	
	public void delete(){
		Integer bId=this.getParaToInt(0);
		Blog.dao.deleteById(bId);
		this.redirect("/article/myBlog");
	}
	
	@Before(ReadBlogInterceptor.class)
	public void blog(){
		String snumber=this.getSessionAttr("snumber");
		Integer bId = this.getParaToInt(0);
		String ssl = this.getPara(1);
		Blog blog = Blog.dao.findById(bId);
		
		List<Student> stu = Student.dao.find("select * from student where snumber=?",blog.getStr("snumber"));
		List<Comment> comments = Comment.dao.find("select c.*,s.sname as sname from comment c left join student s on c.snumber = s.snumber where bId=?",bId);
		List<Message> messages = Message.dao.find("select m.*,s2.sname as sendName,s1.sname as receiveName from message m left join student s1 on m.receiveNumber = s1.snumber left join student s2 on m.sendNumber = s2.snumber where bId=?",bId);
		
		Integer readCounts = blog.getInt("readCounts");
		readCounts = readCounts + 1;
		blog.set("readCounts", readCounts);
		blog.update();
		
		
		
		this.setAttr("blog", blog);
		this.setAttr("stu", stu.get(0));
		this.setAttr("comments", comments);
		this.setAttr("messages", messages);
		
		
		this.render("blog.jsp");
	}
	
	
	
	public void addComment(){
		Comment comment = this.getModel(Comment.class,"comment");
		String bId=this.getPara("comment.bId");
		List<Blog> list = Blog.dao.find("select * from blog where bId = ?",bId);
		String ssl = list.get(0).getStr("ssl");
		comment.save();
		if(ssl == null){
			this.redirect("/article/blog/"+bId);
		}else{
			this.redirect("/article/blog/"+bId+"-"+MD5Util.MD5(ssl));
		}
		
		
	}
	
	public void readMessage(){
		String snumber=this.getSessionAttr("snumber");
		Integer bId = this.getParaToInt(0);
		Blog blog = Blog.dao.findById(bId);
		
		List<Student> stu = Student.dao.find("select * from student where snumber=?",blog.getStr("snumber"));
		List<Comment> comments = Comment.dao.find("select c.*,s.sname as sname from comment c left join student s on c.snumber = s.snumber where bId=?",bId);
		List<Message> messages = Message.dao.find("select m.*,s2.sname as sendName,s1.sname as receiveName from message m left join student s1 on m.receiveNumber = s1.snumber left join student s2 on m.sendNumber = s2.snumber where bId=?",bId);
	
		Integer readCounts = blog.getInt("readCounts");
		readCounts = readCounts + 1;
		blog.set("readCounts", readCounts);
		blog.update();
		
		for(Comment c:comments){
			c.set("isRead", 1);
			c.update();
		}
		
		this.setAttr("blog", blog);
		this.setAttr("stu", stu.get(0));
		this.setAttr("comments", comments);
		this.setAttr("messages", messages);
		
		
		this.render("blog.jsp");
	}
	
	public void sendMessage(){
		Message message = this.getModel(Message.class,"message");
		String bId=this.getPara("message.bId");
		List<Blog> list = Blog.dao.find("select * from blog where bId = ?",bId);
		String ssl = list.get(0).getStr("ssl");
		message.save();
		if(ssl == null){
			this.redirect("/article/blog/"+bId);
		}else{
			this.redirect("/article/blog/"+bId+"-"+MD5Util.MD5(ssl));
		}
		
	}
	
	public void readReturn(){
		String snumber=this.getSessionAttr("snumber");
		Integer bId = this.getParaToInt(0);
		Blog blog = Blog.dao.findById(bId);
		
		List<Student> stu = Student.dao.find("select * from student where snumber=?",blog.getStr("snumber"));
		List<Comment> comments = Comment.dao.find("select c.*,s.sname as sname from comment c left join student s on c.snumber = s.snumber where bId=?",bId);
		List<Message> messages = Message.dao.find("select m.*,s2.sname as sendName,s1.sname as receiveName from message m left join student s1 on m.receiveNumber = s1.snumber left join student s2 on m.sendNumber = s2.snumber where bId=?",bId);
		
		Integer readCounts = blog.getInt("readCounts");
		readCounts = readCounts + 1;
		blog.set("readCounts", readCounts);
		blog.update();
		
		for(Message me:messages){
			me.set("isRead", 1);
			me.update();
		}
		
		this.setAttr("blog", blog);
		this.setAttr("stu", stu.get(0));
		this.setAttr("comments", comments);
		this.setAttr("messages", messages);
		
		
		this.render("blog.jsp");
	}
	
	public void checkAll(){
		
		String[] ids=this.getParaValues("checkbox[]");
		if(this.getParaValues("checkbox[]") == null){
			this.redirect("/article/myBlog");
		}else{
			String sql="delete from blog where bId in(?)";
			Object bids[][] = new Object[ids.length][1];
			for(int i=0;i<ids.length;i++){
				for(int j=0;j<1;j++){
					bids[i][j] = ids[i];
				}
			}
			int[] size = Db.batch(sql, bids, 200);
			this.redirect("/article/myBlog");
		}
		
	}
	
	public void deciphering(){
		String bId = this.getPara("bId");
		String ssl = this.getPara("ssl");
		System.out.println("得到的秘钥是："+ssl+" 得到的bId是："+bId);
		List<Blog> list = Blog.dao.find("select * from blog where bId = ?",bId);
		if(list.get(0).getStr("ssl").equals(MD5Util.MD5(ssl))){
			this.redirect("/article/blog/"+bId+"-"+MD5Util.MD5(ssl));
		}else{
			this.setSessionAttr("errorPass", "秘钥错误");
			this.redirect("/errorPage/PassPort/"+bId);
		}
		
	}

}
