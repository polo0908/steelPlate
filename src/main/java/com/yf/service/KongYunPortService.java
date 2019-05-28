package com.yf.service;

import java.util.List;

import com.yf.bean.KongYunPort;

public interface KongYunPortService {
	/**
	 * 动态搜索框名称终点
	 * @param doctor_name
	 * @return
	 */
	public List<KongYunPort> ajaxKongYunName(String doctor_name);
	public List<KongYunPort> ajaxQiDian(String doctor_name);
	public KongYunPort getById(Integer id);
	public void insert(KongYunPort kongYunPort);
}
