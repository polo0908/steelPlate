package com.yf.service;

import java.util.List;

import com.yf.bean.HaiYunPort;

public interface HaiYunPortService {
	/**
	 * 根据名称找id
	 * 
	 * @param chName
	 * @return
	 */
	public List<HaiYunPort> getByName(String chName);

	/**
	 * 根据名称动态搜索框
	 * 
	 * @param doctor_name
	 * @return
	 */
	public List<HaiYunPort> ajaxDoctorName(String doctor_name);

	/**
	 * 这是出发港
	 * 
	 * @param doctor_name
	 * @return
	 */
	public List<HaiYunPort> ajaxChuFa(String doctor_name);

	public List<HaiYunPort> getAllPort();

	public HaiYunPort getById(Integer id);

	/**
	 * 获取fcl的DeparturePort数据
	 * 
	 * @return
	 */
	public List<HaiYunPort> queryFclDeparturePort();

	/**
	 * 获取fcl的Destination数据
	 * 
	 * @return
	 */
	public List<HaiYunPort> queryFclDestinationPort();

	/**
	 * 获取lcl的DeparturePort数据
	 * 
	 * @return
	 */
	public List<HaiYunPort> queryLclDeparturePort();

	/**
	 * 获取lcl的Destination数据
	 * 
	 * @return
	 */
	public List<HaiYunPort> queryLclDestinationPort();
	
	
	/**
	 * 查询海运有拼箱运输的国家
	 * @return
	 */
	public List<HaiYunPort> queryLclCountry();
	


}
