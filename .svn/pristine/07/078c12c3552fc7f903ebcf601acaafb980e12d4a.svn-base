package com.cal.dao;

import java.io.Serializable;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.cal.bean.CustomerDrawingName;

public interface CustomerDrawingNameMapper extends Serializable{
	
	/**
	 * 生成客户报价表
	 * @param 
	 */
	void insertCustomerDrawingName(CustomerDrawingName customerDrawingName);
	
	
	   /**
	    * 批量插入对象
	    * @param ArrayList
	    */
    void insertCustomerDrawingNames(List<CustomerDrawingName> list); 
    
    
    /**
     * 
     * @param customerDrawingName
     * @return
     */
    List<CustomerDrawingName> queryRepeate(@Param("quoteId")String quoteId,@Param("originalName")String[] originalName);
	
}
