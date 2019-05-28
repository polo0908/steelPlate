package com.cal.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cal.bean.GoodsTypeInfo;
import com.cal.dao.GoodsTypeInfoMapper;
import com.cal.service.GoodsTypeInfoService;

@Service

public class GoodsTypeInfoServiceImpl implements GoodsTypeInfoService {

	private static final long serialVersionUID = 1L;
	@Resource
	private GoodsTypeInfoMapper goodsTypeInfoMapper;
	@Override
	public List<GoodsTypeInfo> queryAll() {
		List<GoodsTypeInfo> list = goodsTypeInfoMapper.queryAll();
		return list;
	}

	@Override
	public GoodsTypeInfo queryById(Integer id) {
		GoodsTypeInfo goodsTypeInfo = goodsTypeInfoMapper.queryById(id);
		return goodsTypeInfo;
	}

	@Override
	public GoodsTypeInfo queryByGoodsType(String goodsType) {
		
		return goodsTypeInfoMapper.queryByGoodsType(goodsType);
	}

}
