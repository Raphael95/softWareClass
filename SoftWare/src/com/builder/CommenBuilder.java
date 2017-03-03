package com.builder;

public class CommenBuilder implements RoleBuilder {

	@Override
	public void buildName() {
		// TODO Auto-generated method stub
		user.setUserName("普通用户");
	}

	@Override
	public void buildPassword() {
		// TODO Auto-generated method stub
		user.setPassWord("000000");
	}

	@Override
	public void buildEmail() {
		// TODO Auto-generated method stub
		user.setEmail("");
	}

	@Override
	public void buildRole() {
		// TODO Auto-generated method stub
		user.setRole("学生");
	}

	@Override
	public void buildJob() {
		// TODO Auto-generated method stub
		user.setJob("user");
	}

}
