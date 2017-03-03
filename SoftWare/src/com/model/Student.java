package com.model;

import java.util.List;

import com.jfinal.plugin.activerecord.Model;

public class Student extends Model<Student> {
	
	public static final Student dao=new Student();
	
	public String selectName(String snumber){
		List<Student> list = Student.dao.find("select sname from student where snumber =?",snumber);
		return list.get(0).getStr("sname");
	}

}
