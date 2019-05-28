package com.cal.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cal.bean.ProcessInfo;
import com.cal.dao.ProcessInfoMapper;
import com.cal.service.ProcessInfoService;

@Service
public class ProcessInfoServiceImpl implements ProcessInfoService {
    
	@Resource
	private ProcessInfoMapper processInfoMapper;
	@Override
	public List<ProcessInfo> queryAll() {
		// TODO Auto-generated method stub
		return processInfoMapper.queryAll();
	}

	@Override
	public ProcessInfo queryById(Integer id) {
		// TODO Auto-generated method stub
		return processInfoMapper.queryById(id);
	}

	@Override
	public List<ProcessInfo> queryByLevel1(String level1) {
		
		return processInfoMapper.queryByLevel1(level1);
	}

	@Override
	public ProcessInfo queryByProcess(String level1, String level2) {

		return processInfoMapper.queryByProcess(level1, level2);
	}



}
