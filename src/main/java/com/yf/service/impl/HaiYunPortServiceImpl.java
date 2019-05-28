package com.yf.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yf.bean.HaiYunPort;
import com.yf.dao.HaiYunPortMapper;
import com.yf.service.HaiYunPortService;

@Service
public class HaiYunPortServiceImpl implements HaiYunPortService {
	@Resource
	private HaiYunPortMapper haiYunPortMapper;

	public List<HaiYunPort> getByName(String chName) {
		return haiYunPortMapper.selectName(chName);
	}

	@Override
	public List<HaiYunPort> ajaxDoctorName(String doctor_name) {

		return this.haiYunPortMapper.ajaxDoctorName(doctor_name);
	}

	@Override
	public List<HaiYunPort> getAllPort() {
		return this.haiYunPortMapper.getAllPort();
	}

	@Override
	public List<HaiYunPort> ajaxChuFa(String doctor_name) {
		return this.haiYunPortMapper.ajaxChuFa(doctor_name);
	}

	@Override
	public HaiYunPort getById(Integer id) {
		HaiYunPort port = haiYunPortMapper.selectByPrimaryKey(id);
		return port;
	}

	@Override
	public List<HaiYunPort> queryFclDeparturePort() {
		return haiYunPortMapper.queryFclDeparturePort();
	}

	@Override
	public List<HaiYunPort> queryFclDestinationPort() {
		return haiYunPortMapper.queryFclDestinationPort();
	}

	@Override
	public List<HaiYunPort> queryLclDeparturePort() {
		return haiYunPortMapper.queryLclDeparturePort();
	}

	@Override
	public List<HaiYunPort> queryLclDestinationPort() {
		return haiYunPortMapper.queryLclDestinationPort();
	}

	@Override
	public List<HaiYunPort> queryLclCountry() {
		
		return haiYunPortMapper.queryLclCountry();
	}


}
