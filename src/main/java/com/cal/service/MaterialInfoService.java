package com.cal.service;

import java.io.Serializable;
import java.util.List;

import com.cal.bean.MaterialInfo;

public interface MaterialInfoService extends Serializable {

	
	/**
	 * 查询产品对应材料信息
	 * @return
	 */
	List<MaterialInfo> queryByGoodsType(String goodsType);
	
	/**
	 * 根据id查询产品信息
	 * @param id
	 * @return
	 */
	public MaterialInfo queryById(Integer id);
	
	/**
	 * 根据materialType查询产品信息
	 * @param materialType
	 * @return
	 */
	public MaterialInfo queryByType(String materialType,String goodsType);
}
