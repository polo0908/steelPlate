package com.cal.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cal.bean.ProfitManagment;
import com.cal.dao.ProfitManagmentMapper;
import com.cal.service.ProfitManagmentService;

@Service
public class ProfitManagmentServiceImpl implements ProfitManagmentService {
   
	@Resource
	private ProfitManagmentMapper profitManagmentMapper;
	@Override
	public ProfitManagment queryById(Integer id) {

		return profitManagmentMapper.queryById(id);
	}

}
