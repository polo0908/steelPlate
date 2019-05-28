package com.cbt.service.impl;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cbt.mapper.SteelPlateCategoryMapper;
import com.cbt.mapper.SteelPlateMapper;
import com.cbt.mapper.SteelPlateOrderMapper;
import com.cbt.model.SteelPateCategory;
import com.cbt.model.SteelPlate;
import com.cbt.model.SteelPlateOrder;
import com.cbt.service.SteelPateService;

@Service
public class SteelPateServiceImpl implements SteelPateService{	
	@Autowired
	private SteelPlateMapper steelPlateMapper;
	@Autowired
	private SteelPlateOrderMapper steelPlateOrderMapper;

	//首页固定展示


	@Override
	public SteelPlate findById1(Integer id) {
		return steelPlateMapper.selectByPrimaryKey(id);
	}
	//保存订单信息
	@Override
	public int saveGoods(SteelPlateOrder order) {
			
        return steelPlateOrderMapper.insert(order);
	}
	
	
	@Override
	public List<SteelPlate> queryByKey(SteelPlate steelPlate) {
		return steelPlateMapper.queryByKey(steelPlate);
	}
	@Override
	public int queryTotal(SteelPlate steelPlate) {		
		return steelPlateMapper.queryTotal(steelPlate);
	}
	@Override
	public SteelPlateOrder selectByPrimaryKey(String itemId) {
	
		return steelPlateOrderMapper.selectByPrimaryKey(itemId);
	}
	@Override
	public List<SteelPlate> queryByPinMing(String... pinming) {
		return steelPlateMapper.queryByPinMing(pinming);
	}
	@Override
	public List<SteelPlate> queryPinMing(String pinming) {

		return steelPlateMapper.queryPinMing(pinming);
	}

	
	

}

















