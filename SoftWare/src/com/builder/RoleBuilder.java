package com.builder;

import com.model.User;

public interface RoleBuilder {
	public User user=new User();
	
	public void buildName();
	public void buildPassword();
	public void buildEmail();
	public void buildRole();
	public void buildJob(); 
	
	public static User createRole(){
		return user;
	}

}
