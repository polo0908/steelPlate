package com.cal.dao;

import java.util.List;

import com.cal.bean.GoodsTypeInfo;

public interface GoodsTypeInfoMapper {
	
	/**
	 * 查询所有产品信息
	 * @return
	 */
	List<GoodsTypeInfo> queryAll();
	
	/**
	 * 根据id查询产品信息
	 * @param id
	 * @return
	 */
	GoodsTypeInfo queryById(Integer id);
	
	/**
	 * 根据类型查询产品信息
	 * @param goodsType
	 * @return
	 */
	GoodsTypeInfo queryByGoodsType(String goodsType);

}
