package com.yf.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import com.yf.bean.KongYunPort;

public interface KongYunPortMapper {
	// int deleteByPrimaryKey(String id);
	//
	// int insert(KongYunPort record);
	//
	// int insertSelective(KongYunPort record);
	//
	// KongYunPort selectByPrimaryKey(String id);
	//
	// int updateByPrimaryKeySelective(KongYunPort record);
	//
	// int updateByPrimaryKey(KongYunPort record);

	/**
	 * 根据ID找到港口
	 * 
	 * @param id
	 * @return
	 */
	KongYunPort selectByPrimaryKey(Integer id);

	/**
	 * 根据名字找到id
	 * 
	 * @param chName
	 * @return
	 */
	List<KongYunPort> selectByName(@Param(value = "chPortName") String chPortName);

	/**
	 * 动态搜索框终点
	 * 
	 * @param doctor_name
	 * @return
	 */
	public List<KongYunPort> ajaxKongYunName(@Param("doctor_name") String doctor_name);

	/**
	 * 动态搜索框起点中国
	 * 
	 * @param doctor_name
	 * @return
	 */
	public List<KongYunPort> ajaxQiDian(@Param("doctor_name") String doctor_name);

	void insert(KongYunPort kongYunPort);

}