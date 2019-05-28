package com.cal.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cal.bean.MaterialInfo;
import com.cal.dao.MaterialInfoMapper;
import com.cal.service.MaterialInfoService;

@Service
public class MaterialInfoServiceImpl implements MaterialInfoService {
    
	/**
	 * @fieldName serialVersionUID
	 * @fieldType long
	 * @Description TODO
	 */
	private static final long serialVersionUID = 1L;
	@Resource MaterialInfoMapper materialInfoMapper;


	@Override
	public MaterialInfo queryById(Integer id) {
		
		return materialInfoMapper.queryById(id);
	}



	@Override
	public List<MaterialInfo> queryByGoodsType(String goodsType) {
	
		return materialInfoMapper.queryByGoodsType(goodsType);
	}



	@Override
	public MaterialInfo queryByType(String materialType, String goodsType) {

		return materialInfoMapper.queryByType(materialType, goodsType);
	}

}
