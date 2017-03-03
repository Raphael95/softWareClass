package com.patterns;

import com.model.Student;
import com.model.User;

public class CommenUser implements Users {
	User stu=new User();

	@Override
	public User makeUser(Student s) {
		// TODO Auto-generated method stub
		return stu;
	}

}
