package com.yf.service;

import javax.servlet.http.HttpServletRequest;

import com.yf.bean.LianXiUser;

public interface LianXiUserService {
	public void insertLianXiUser(HttpServletRequest request,LianXiUser lianXiUser);
}
