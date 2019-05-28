package com.cbt.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cbt.mapper.SteelPlateCategoryMapper;
import com.cbt.model.SteelPateCategory;
import com.cbt.service.SteelPlateCategoryService;
@Service
public class SteelPlateCategoryServerImpl implements SteelPlateCategoryService {
    @Resource
    private SteelPlateCategoryMapper steelPlateCategoryMapper;
	@Override
	public List<SteelPateCategory> ccategory(SteelPateCategory steelPateCategory) {

		return steelPlateCategoryMapper.selectByExample(steelPateCategory);
	}

}
