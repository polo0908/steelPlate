package com.yf.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yf.bean.HaiYunPort;

public interface HaiYunPortMapper {
	/**
	 * 根据名字找id
	 * 
	 * @param chName
	 * @return
	 */
	HaiYunPort selectByPrimaryKey(Integer id);

	List<HaiYunPort> selectName(String chName);

	/**
	 * 动态搜索框
	 * 
	 * @param doctor_name
	 * @return
	 */
	public List<HaiYunPort> ajaxDoctorName(@Param("doctor_name") String doctor_name);

	/**
	 * 出发港
	 * 
	 * @param doctor_name
	 * @return
	 */
	public List<HaiYunPort> ajaxChuFa(@Param("doctor_name") String doctor_name);

	public List<HaiYunPort> getAllPort();

	/**
	 * 获取fcl的DeparturePort数据
	 * 
	 * @return
	 */
	List<HaiYunPort> queryFclDeparturePort();

	/**
	 * 获取fcl的Destination数据
	 * 
	 * @return
	 */
	List<HaiYunPort> queryFclDestinationPort();

	/**
	 * 获取lcl的DeparturePort数据
	 * 
	 * @return
	 */
	List<HaiYunPort> queryLclDeparturePort();

	/**
	 * 获取lcl的Destination数据
	 * 
	 * @return
	 */
	List<HaiYunPort> queryLclDestinationPort();

	
	/**
	 * 查询海运有拼箱运输的国家
	 * @return
	 */
	List<HaiYunPort> queryLclCountry();


}