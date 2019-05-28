package com.yf.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yf.bean.Customer;
import com.yf.dao.CustomerMapper;
import com.yf.service.CustomerService;


@Service
public class CustomerServiceImpl implements CustomerService {

	@Resource
	private CustomerMapper customerMapper;

	public void insert(Customer customer) {
		customerMapper.insert(customer);
	}

}
