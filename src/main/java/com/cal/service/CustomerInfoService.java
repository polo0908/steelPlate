package com.cal.service;

import java.io.Serializable;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.cal.bean.CustomerDrawingName;
import com.cal.bean.CustomerInfo;

public interface CustomerInfoService extends Serializable {
       
	
	
	/**
	 * 生成客户表
	 * @param 
	 */
	public void insertCustomerInfo(CustomerInfo customerInfo);
	
	/**
	 * 更新客户信息
	 * @param CustomerInfo
	 */
    public void updateCustomerInfo(CustomerInfo customerInfo);
    
	
    /**
	 * 根据email查询客户
	 * @param email
	 * @return
	 */
	public CustomerInfo queryByEmail(String email);
}
