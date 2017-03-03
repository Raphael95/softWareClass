package com.proxy;

import com.model.User;

public class realDelete implements Delete {

	@Override
	public String result(User u) {
		// TODO Auto-generated method stub
		return "使用代理模式检查用户权限";
	}

}
