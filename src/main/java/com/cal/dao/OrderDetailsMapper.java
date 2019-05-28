package com.cal.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.cal.bean.ClientOrder;
import com.cal.bean.OrderDetails;

public interface OrderDetailsMapper {
 
	/**
	 * 根据id查询订单
	 * @param id
	 * @return
	 */
	OrderDetails queryById(Integer id);
	
	/**
	 * 生成订单
	 * @param OrderDetails
	 */
	void insertOrderDetails(OrderDetails orderDetails);
	
    /**
     * 根据报价号查询
     * @param quoteId
     * @return
     */
	List<OrderDetails> queryByQuoteId(String quoteId);
	
	
	
	/**
	 * 更新订单
	 * @param orderDetails
	 */
	void updateOrderDetails(OrderDetails orderDetails);
	
	   /**
	    * 批量插入对象
	    * @param list
	    */
	void insertArray(List<OrderDetails> list); 
	
	
	/**
	 * 根据报价号删除
	 * @param quoteId
	 */
	void deleteByQuoteId(String quoteId);
	
	/**
	 * 根据id查询
	 * @param id
	 */
	void deleteById(Integer id);
}
