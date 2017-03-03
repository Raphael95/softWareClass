package com.builder;

import com.model.User;

public class RoleController {
	
	public User Construction(RoleBuilder rb){
		User user ;
		rb.buildName();
		rb.buildPassword();
		rb.buildEmail();
		rb.buildRole();
		rb.buildJob();
		user=RoleBuilder.createRole();
		return user;
	}

}
