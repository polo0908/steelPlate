package com.cbt.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cbt.mapper.SteelSortDetailsMapper;
import com.cbt.model.SteelSortDetails;
import com.cbt.service.SteelSortDetailsService;

@Service
public class SteelSortDetailsServiceImpl implements SteelSortDetailsService {

	@Resource
	private SteelSortDetailsMapper steelSortDetailsMapper;
	
	public List<SteelSortDetails> queryBySteelType(String sort) {
		return steelSortDetailsMapper.queryBySteelType(sort);
	}

	@Override
	public SteelSortDetails queryByBelongType(String belongType) {

		return steelSortDetailsMapper.queryByBelongType(belongType);
	}

	@Override
	public String[] querySortByBelongType(String belongType) {
		
		return steelSortDetailsMapper.querySortByBelongType(belongType);
	}

}
