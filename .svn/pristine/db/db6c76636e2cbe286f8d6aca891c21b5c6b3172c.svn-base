package com.cal.service;

import java.io.Serializable;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.cal.bean.CustomerDrawingName;

public interface CustomerDrawingNameService extends Serializable {

	
	
	/**
	 * 生成客户报价表
	 * @param 
	 */
	public void insertCustomerDrawingName(CustomerDrawingName customerDrawingName);
	
	
	
	   /**
	    * 批量插入对象
	    * @param ArrayList
	    */
    public void insertCustomerDrawingNames(List<CustomerDrawingName> list);   
    
    
    /**
     * 
     * @param customerDrawingName
     * @return
     */
   public List<CustomerDrawingName> queryRepeate(@Param("quoteId")String quoteId,@Param("originalName")String[] originalName);
}
