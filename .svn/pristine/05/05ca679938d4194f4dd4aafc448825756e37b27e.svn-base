package com.yf.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yf.bean.HaiYunPort;
import com.yf.bean.PinXiang;
import com.yf.bean.QueryPortInfo;
import com.yf.dao.HaiYunPortMapper;
import com.yf.dao.PinXiangMapper;
import com.yf.service.PinXiangService;

@Service
public class PinXiangServiceImpl implements PinXiangService {
	@Resource
	private PinXiangMapper pinXiangMapper;
	@Resource
	private HaiYunPortMapper haiYunPortMapper;

	public List<PinXiang> getAllPinXiang(QueryPortInfo portInfo) {
		return pinXiangMapper.getAllPinXiang(portInfo);
	}

	@Override
	public Long getAllCount(QueryPortInfo portInfo) {
		return this.pinXiangMapper.getAllCount(portInfo);
	}

	@Override
	public List<PinXiang> getHasRepeatList(QueryPortInfo portInfo) {
		return this.pinXiangMapper.getHasRepeatList(portInfo);	
	}

	@Override
	public List<PinXiang> getNoRepeatList(QueryPortInfo portInfo) {
		return this.pinXiangMapper.getNoRepeatList(portInfo);
	}

	@Override
	public List<PinXiang> getMatchList(PinXiang pinXiang) {
		return this.pinXiangMapper.getMatchList(pinXiang);
	}

	@Override
	public List<PinXiang> getHotPortRepeatList() {
		return this.pinXiangMapper.getHotPortRepeatList();
	}

	@Override
	public List<PinXiang> getHotPortNoRepeatList() {
		return this.pinXiangMapper.getHotPortNoRepeatList();
	}

	@Override
	public List<PinXiang> getMatchHotList(PinXiang pinXiang) {
		return this.pinXiangMapper.getMatchHotList(pinXiang);
	}

	@Override
	public List<PinXiang> queryLclDestinationPortByCountry(String country) {

		return pinXiangMapper.queryLclDestinationPortByCountry(country);
	}

	@Override
	public Double calculatePriceByKGS(String country, String destinationPort) {

		return pinXiangMapper.calculatePriceByKGS(country, destinationPort);
	}

	@Override
	public Double calculatePriceByCBM(String country, String destinationPort) {
		
		return pinXiangMapper.calculatePriceByCBM(country, destinationPort);
	}

}
