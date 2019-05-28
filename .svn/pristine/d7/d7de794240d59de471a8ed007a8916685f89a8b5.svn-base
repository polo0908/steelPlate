package com.cal.dao;

import java.util.List;

import com.cal.bean.ClientOrder;

public interface ClientOrderMapper {
 
	/**
	 * 根据id查询订单
	 * @param id
	 * @return
	 */
	ClientOrder queryById(Integer id);
	/**
	 * 根据quoteId查询订单
	 * @param quoteId
	 * @return
	 */
	ClientOrder queryByQuoteId(String quoteId);
	
	/**
	 * 生成订单
	 * @param clientOrder
	 */
	void insertClientOrder(ClientOrder clientOrder);
	
	/**
	 * 更新订单
	 * @param clientOrder
	 */
	void updateClientOrder(ClientOrder clientOrder);
	
	
	/**
	 * 查询所有数据
	 * @return
	 */
	List<ClientOrder> queryAllData();
	
}
