package com.cal.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cal.bean.CustomerInfo;
import com.cal.dao.CustomerInfoMapper;
import com.cal.service.CustomerInfoService;

@Service
public class CustomerInfoServiceImpl implements CustomerInfoService {
    
	@Resource
	private CustomerInfoMapper customerInfoMapper;
	
	@Override
	public void insertCustomerInfo(CustomerInfo customerInfo) {
		customerInfoMapper.insertCustomerInfo(customerInfo);

	}

	@Override
	public void updateCustomerInfo(CustomerInfo customerInfo) {
		customerInfoMapper.updateCustomerInfo(customerInfo);

	}

	@Override
	public CustomerInfo queryByEmail(String email) {
		return customerInfoMapper.queryByEmail(email);
	}

}
