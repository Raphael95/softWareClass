package com.builder;

public class AdminBuilder implements RoleBuilder {

	@Override
	public void buildName() {
		// TODO Auto-generated method stub
		user.setUserName("超级用户");
	}

	@Override
	public void buildPassword() {
		// TODO Auto-generated method stub
		user.setPassWord("root");

	}

	@Override
	public void buildEmail() {
		// TODO Auto-generated method stub
		user.setEmail("raphael-95@outlook.com");
	}

	@Override
	public void buildRole() {
		// TODO Auto-generated method stub
		user.setRole("管理员");
	}

	@Override
	public void buildJob() {
		// TODO Auto-generated method stub
		user.setJob("administrator");
	}

}
