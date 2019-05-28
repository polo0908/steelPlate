package com.yf.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yf.bean.KuaiYun;
import com.yf.dao.KuaiYunMapper;
import com.yf.service.KuaiYunService;
@Service
public class KuaiYunServiceImpl implements KuaiYunService {
	@Resource
	private KuaiYunMapper kuaiYunMapper;
	@Override
	public List<KuaiYun> ajaxKuaiYunName(String doctor_name) {
		
		return this.kuaiYunMapper.ajaxKuaiYunName(doctor_name);
	}

}
