package com.cal.dao;

import java.io.Serializable;

import com.cal.bean.CustomerQuote;

public interface CustomerQuoteMapper extends Serializable{
	
	/**
	 * 生成客户报价表
	 * @param 
	 */
	void insertCustomerQuote(CustomerQuote customerQuote);
	
}
