package com.cal.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cal.bean.ClientOrder;
import com.cal.bean.ProcessDetails;
import com.cal.dao.ClientOrderMapper;
import com.cal.dao.ProcessDetailsMapper;
import com.cal.service.ProcessDetailsService;

@Service
public class ProcessDetailsServiceImpl implements ProcessDetailsService {

	@Resource
	private ProcessDetailsMapper processDetailsMapper;
	@Resource
	private ClientOrderMapper clientOrderMapper;
	@Override
	public ProcessDetails queryById(Integer id) {
		
		return processDetailsMapper.queryById(id);
	}


	@Override
	public List<ProcessDetails> queryByOrderDetailsId(Integer orderDetailsId) {
		
		return processDetailsMapper.queryByOrderDetailsId(orderDetailsId);
	}

	@Override
	public void insertProcessDetails(ArrayList<Map<Object, Object>> arrayList,ClientOrder clientOrder)throws Exception{
	    if(arrayList.size() != 0){
			processDetailsMapper.insertProcessDetails(arrayList);
			clientOrderMapper.updateClientOrder(clientOrder);
	    }
	}


	@Override
	public void insertProcess(ProcessDetails processDetails) {
		processDetailsMapper.insertProcess(processDetails);
		
	}


	@Override
	public void deleteByOrderDetailsId(Integer orderDetailsId) {
		processDetailsMapper.deleteByOrderDetailsId(orderDetailsId);
		
	}

}
