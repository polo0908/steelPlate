package com.cal.dao;

import java.io.Serializable;

import com.cal.bean.ProfitManagment;

public interface ProfitManagmentMapper extends Serializable {

	/**
	 * 根据id查询
	 * @param id
	 * @return
	 */
	ProfitManagment queryById(Integer id);
}
