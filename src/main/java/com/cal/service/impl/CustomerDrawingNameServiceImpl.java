package com.cal.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cal.bean.CustomerDrawingName;
import com.cal.dao.CustomerDrawingNameMapper;
import com.cal.service.CustomerDrawingNameService;
@Service
public class CustomerDrawingNameServiceImpl implements CustomerDrawingNameService {

	@Resource
	private CustomerDrawingNameMapper customerDrawingNameMapper;
	
	
	
	public void insertCustomerDrawingName(CustomerDrawingName customerDrawingName) {
		customerDrawingNameMapper.insertCustomerDrawingName(customerDrawingName);
	}
	@Override
	public void insertCustomerDrawingNames(List<CustomerDrawingName> list) {
		customerDrawingNameMapper.insertCustomerDrawingNames(list);
		
	}

	@Override
	public List<CustomerDrawingName> queryRepeate(String quoteId,String[] originalName) {

		return customerDrawingNameMapper.queryRepeate(quoteId, originalName);
	}

}
