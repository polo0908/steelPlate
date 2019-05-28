package com.cal.service;

import java.io.Serializable;
import java.util.List;

import com.cal.bean.ClientOrder;
import com.cal.bean.OrderDetails;

public interface ClientOrderService extends Serializable{

	
	/**
	 * 根据id查询订单
	 * @param id
	 * @return
	 */
	public ClientOrder queryById(Integer id);
	
	/**
	 * 生成订单
	 * @param clientOrder
	 */
	public void insertClientOrder(ClientOrder clientOrder,OrderDetails orderDetails)throws Exception;
	
	/**
	 * 更新订单
	 * @param clientOrder
	 */
	public void updateClientOrder(ClientOrder clientOrder);
	
	/**
	 * 根据quoteId查询订单
	 * @param quoteId
	 * @return
	 */
	public ClientOrder queryByQuoteId(String quoteId);
	
	
	
	
	/**
	 * 查询所有数据
	 * @return
	 */
	public List<ClientOrder> queryAllData();
}
