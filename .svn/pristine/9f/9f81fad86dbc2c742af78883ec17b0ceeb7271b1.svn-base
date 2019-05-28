package com.cbt.mapper;

import java.io.Serializable;
import java.util.List;

import com.cbt.model.SteelSortDetails;

public interface SteelSortDetailsMapper extends Serializable {

	/**
	 * 根据型材类型查询
	 * @return
	 */
	List<SteelSortDetails> queryBySteelType(String sort);
	
	/**
	 * 根据从属类型查询
	 * @return
	 */
	SteelSortDetails queryByBelongType(String belongType);
	
	/**
	 * 根据从属类型查询详细种类
	 * @return
	 */
	String[] querySortByBelongType(String belongType);
}
