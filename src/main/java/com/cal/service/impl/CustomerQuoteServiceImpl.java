package com.cal.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cal.bean.CustomerQuote;
import com.cal.dao.CustomerQuoteMapper;
import com.cal.service.CustomerQuoteService;
@Service
public class CustomerQuoteServiceImpl implements CustomerQuoteService {

	@Resource
	private CustomerQuoteMapper customerQuoteMapper;
	
	
	public void insertCustomerQuote(CustomerQuote customerQuote) {
		customerQuoteMapper.insertCustomerQuote(customerQuote);

	}

}
