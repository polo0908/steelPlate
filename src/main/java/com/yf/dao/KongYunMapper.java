package com.yf.dao;

import java.util.List;

import com.yf.bean.KongYun;
import com.yf.bean.QueryPortInfo;

public interface KongYunMapper {

	/**
	 * 获取所有热门的空运数据
	 * 
	 * @return
	 */
	List<KongYun> getHotKongYun();

	/**
	 * 获取所有匹配的空运数据
	 * 
	 * @param portInfo
	 * @return
	 */
	List<KongYun> getAllKongYun(QueryPortInfo portInfo);

	/**
	 * 空运动态总记录数
	 * 
	 * @param portInfo
	 * @return
	 */
	Long getAllCount(QueryPortInfo portInfo);
}