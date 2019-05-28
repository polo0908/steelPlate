package com.yf.service.impl;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.yf.bean.LianXiUser;
import com.yf.dao.LianXiUserMapper;
import com.yf.service.LianXiUserService;
@Service
public class LianXiUserServiceImpl implements LianXiUserService {
	@Resource
	private LianXiUserMapper lianXiUserMapper;
	@Override
	public void insertLianXiUser(HttpServletRequest request, LianXiUser lianXiUser) {
		String userName=request.getParameter("username");
		String email=request.getParameter("email");
		String iphone=request.getParameter("phone");
		String ship=request.getParameter("ship");
		String newqupr=request.getParameter("newqupr");
		String yijian=request.getParameter("yijian");
		String yuyaofuwu=request.getParameter("yuyaofuwu");
		int iskam=Integer.valueOf(yuyaofuwu);
		lianXiUser.setUsername(userName);
		lianXiUser.setEmail(email);
		lianXiUser.setHuowu(ship);
		lianXiUser.setIphone(iphone);;
		lianXiUser.setYijian(yijian);
		lianXiUser.setIskam(iskam);
		lianXiUser.setLeixing(newqupr);
		lianXiUserMapper.insertSelective(lianXiUser);
	}

}
