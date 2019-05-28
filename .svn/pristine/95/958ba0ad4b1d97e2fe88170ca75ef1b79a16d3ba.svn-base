package com.yf.service;

import java.util.List;

import com.yf.bean.KongYun;
import com.yf.bean.QueryPortInfo;

public interface KongYunService {

	/**
	 * 获取所有热门的空运数据
	 * 
	 * @return
	 */
	public List<KongYun> getHotKongYun();

	/**
	 * 动态搜索list
	 * 
	 * @param request
	 * @param model
	 * @param kongYun
	 * @return
	 */
	public List<KongYun> getAllKongYun(QueryPortInfo portInfo);

	/**
	 * 动态获取多少条
	 * 
	 * @param request
	 * @param kongYun
	 * @return
	 */
	public Long getAllCount(QueryPortInfo portInfo);
}
