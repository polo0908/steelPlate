package com.cal.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.cal.bean.ProcessInfo;


public interface ProcessInfoMapper {
	
	/**
	 * 查询所有产品信息
	 * @return
	 */
	List<ProcessInfo> queryAll();
	
	/**
	 * 根据id查询产品信息
	 * @param id
	 * @return
	 */
	ProcessInfo queryById(Integer id);
	
	
	/**
	 * 根据一级菜单查询
	 * @param level1
	 * @return
	 */
	List<ProcessInfo> queryByLevel1(String level1);
	
	/**
	 * 根据菜单1和菜单2查询工艺
	 * @param level1
	 * @param level2
	 * @return
	 */
	ProcessInfo queryByProcess(@Param("level1") String level1,@Param("level2") String level2);

}
