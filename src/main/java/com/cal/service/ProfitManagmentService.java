package com.cal.service;

import java.io.Serializable;

import com.cal.bean.ProfitManagment;

public interface ProfitManagmentService extends Serializable {


	/**
	 * 根据id查询
	 * @param id
	 * @return
	 */
	public ProfitManagment queryById(Integer id);
	
}
