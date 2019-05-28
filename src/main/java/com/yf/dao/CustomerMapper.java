package com.yf.dao;

import com.yf.bean.Customer;

public interface CustomerMapper {

	Customer queryById(Integer id);

	void insert(Customer customer);

}
