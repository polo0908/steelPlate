package com.cal.dao;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.cal.bean.ProcessDetails;

public interface ProcessDetailsMapper extends Serializable {

	/**
	 * 根据id查询订单
	 * @param id
	 * @return
	 */
	ProcessDetails queryById(Integer id);
	
	/**
	 * 生成订单
	 * @param OrderDetails
	 */
	void insertProcess(ProcessDetails processDetails);
	
    /**
     * 根据产品id查询
     * @param orderDetailsId
     * @return
     */
	List<ProcessDetails> queryByOrderDetailsId(Integer orderDetailsId);
	
	
	   /**
	    * 批量插入对象
	    * @param ArrayList
	    */
	void insertProcessDetails(ArrayList<Map<Object, Object>> arrayList);   

	/**
	 * 根据orderDetailsId删除
	 * @param orderDetailsId
	 */
	void deleteByOrderDetailsId(Integer orderDetailsId);
}
