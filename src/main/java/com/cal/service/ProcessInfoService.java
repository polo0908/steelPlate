package com.cal.service;

import java.io.Serializable;
import java.util.List;

import com.cal.bean.ProcessInfo;

public interface ProcessInfoService extends Serializable {
	/**
	 * 查询所有产品信息
	 * @return
	 */
	public List<ProcessInfo> queryAll();
	
	/**
	 * 根据id查询产品信息
	 * @param id
	 * @return
	 */
	public ProcessInfo queryById(Integer id);
	
	
	/**
	 * 根据一级菜单查询
	 * @param level1
	 * @return
	 */
	public List<ProcessInfo> queryByLevel1(String level1);
	
	/**
	 * 根据菜单1和菜单2查询工艺
	 * @param level1
	 * @param level2
	 * @return
	 */
	public ProcessInfo queryByProcess(String level1,String level2);
}
