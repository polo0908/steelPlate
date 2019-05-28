package com.cal.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cal.bean.GoodsTypeNormal;
import com.cal.dao.GoodsTypeNormalMapper;
import com.cal.service.GoodsTypeNormalService;

@Service

public class GoodsTypeNormalServiceImpl implements GoodsTypeNormalService {

	@Resource
	private GoodsTypeNormalMapper goodsTypeNormalMapper;
	
	@Override
	public GoodsTypeNormal queryById(Integer id) {
		return goodsTypeNormalMapper.queryById(id);
	}

	@Override
	public List<GoodsTypeNormal> queryByGoodsTypeInfoId(Integer goodsTypeInfoId) {
		return goodsTypeNormalMapper.queryByGoodsTypeInfoId(goodsTypeInfoId);
	}

}
