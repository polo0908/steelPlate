package com.cbt.mapper;

import java.util.List;

import com.cbt.model.SteelPlate;


public interface SteelPateDao {
	//查询所有的
	List<SteelPlate> querySteelPate();
	//按条件查询
	public List<SteelPlate> querySteelPateinfo(String zhonglei,
			String pinming, String caizhi, String high,String staWidth,String endWidth,String staSize,String endSize, String guapaishangjia,String changjia,
			String cunhuodi, String staJiage,String endJiage);
}
