package com.builder;

public class CommenBuilder implements RoleBuilder {

	@Override
	public void buildName() {
		// TODO Auto-generated method stub
		user.setUserName("��ͨ�û�");
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
		user.setRole("ѧ��");
	}

	@Override
	public void buildJob() {
		// TODO Auto-generated method stub
		user.setJob("user");
	}

}
