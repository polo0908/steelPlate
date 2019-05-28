package com.cal.service;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.cal.bean.ClientOrder;
import com.cal.bean.ProcessDetails;

public interface ProcessDetailsService extends Serializable {

	
	/**
	 * 根据id查询订单
	 * @param id
	 * @return
	 */
	public ProcessDetails queryById(Integer id);
	
	/**
	 * 生成订单
	 * @param OrderDetails
	 */
	public void insertProcess(ProcessDetails processDetails);
	
    /**
     * 根据产品id查询
     * @param orderDetailsId
     * @return
     */
	public List<ProcessDetails> queryByOrderDetailsId(Integer orderDetailsId);
	
	   /**
	    * 批量插入对象
	    * @param ArrayList
	    */
	public void insertProcessDetails(ArrayList<Map<Object, Object>> arrayList,ClientOrder clientOrder)throws Exception;   
	
	
	/**
	 * 根据orderDetailsId删除
	 * @param orderDetailsId
	 */
	public void deleteByOrderDetailsId(Integer orderDetailsId);

}
