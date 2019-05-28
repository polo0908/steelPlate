package com.yf.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yf.bean.LianXiUser;
import com.yf.service.LianXiUserService;

@Controller
@RequestMapping("/freight")
public class LianXiUserController {
	@Resource
	private LianXiUserService lianXiUserService;
	@RequestMapping("/insertLianXiUser")
	public String insertLianXiUser(HttpServletRequest request,LianXiUser lianXiUser){
		lianXiUserService.insertLianXiUser(request, lianXiUser);
		return "index";
	}
}
