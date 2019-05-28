package com.yf.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yf.bean.KongYunPort;
import com.yf.dao.KongYunPortMapper;
import com.yf.service.KongYunPortService;
@Service
public class KongYunPortServiceImpl implements KongYunPortService {
	@Resource
	private KongYunPortMapper kongYunPortMapper;
	@Override
	public List<KongYunPort> ajaxKongYunName(String doctor_name) {
		
		return this.kongYunPortMapper.ajaxKongYunName(doctor_name);
	}
	@Override
	public List<KongYunPort> ajaxQiDian(String doctor_name) {
		return this.kongYunPortMapper.ajaxQiDian(doctor_name);
	}
	@Override
	public KongYunPort getById(Integer id) {
		return this.kongYunPortMapper.selectByPrimaryKey(id);
	}
	@Override
	public void insert(KongYunPort kongYunPort) {
		kongYunPortMapper.insert(kongYunPort);
		
	}

}
