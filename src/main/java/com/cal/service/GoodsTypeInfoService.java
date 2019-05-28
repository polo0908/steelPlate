package com.cal.service;

import java.io.Serializable;
import java.util.List;

import com.cal.bean.GoodsTypeInfo;

public interface GoodsTypeInfoService extends Serializable {
	
	/**
	 * 查询所有产品信息
	 * @return
	 */
	public List<GoodsTypeInfo> queryAll();
	
	/**
	 * 根据id查询产品信息
	 * @param id
	 * @return
	 */
	public GoodsTypeInfo queryById(Integer id);

	
	/**
	 * 根据id查询产品信息
	 * @param id
	 * @return
	 */
	public GoodsTypeInfo queryByGoodsType(String goodsType);
}
