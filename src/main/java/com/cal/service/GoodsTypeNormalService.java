package com.cal.service;

import java.io.Serializable;
import java.util.List;

import com.cal.bean.GoodsTypeNormal;

public interface GoodsTypeNormalService extends Serializable {
	/**
	 * 根据id查询标准参数
	 * @author polo
	 * 2017年5月11日
	 *
	 */
	public GoodsTypeNormal queryById(Integer id);
	
	
	/**
	 * 根据种类表id查询所有标准参数
	 * @author polo
	 * 2017年5月11日
	 *
	 */
	public List<GoodsTypeNormal> queryByGoodsTypeInfoId(Integer goodsTypeInfoId);
}
