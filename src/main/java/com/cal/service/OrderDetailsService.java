package com.cal.service;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.cal.bean.ClientOrder;
import com.cal.bean.OrderDetails;

public interface OrderDetailsService extends Serializable {
       
	
	/**
	 * 根据id查询订单
	 * @param id
	 * @return
	 */
	public OrderDetails queryById(Integer id);
	
	/**
	 * 生成订单
	 * @param OrderDetails
	 */
	public void insertOrderDetails(OrderDetails orderDetails,ClientOrder clientOrder)throws Exception;
	
	/**
	 * 生成订单
	 * @param OrderDetails
	 */
	public void insertOrderDetails(OrderDetails orderDetails);
	
    /**
     * 根据报价号查询
     * @param quoteId
     * @return
     */
	public List<OrderDetails> queryByQuoteId(String quoteId);
	
	/**
	 * 更新订单
	 * @param orderDetails
	 */
	public void updateOrderDetails(OrderDetails orderDetails);
	
	   /**
	    * 批量插入对象
	    * @param ArrayList
	    */
	public void insertArray(List<OrderDetails> list); 
	
	/**
	 * 根据报价号删除
	 * @param quoteId
	 */
	public void deleteByQuoteId(String quoteId);
	
	
	/**
	 * 根据id查询
	 * @param id
	 */
	public void deleteById(Integer id);
}
