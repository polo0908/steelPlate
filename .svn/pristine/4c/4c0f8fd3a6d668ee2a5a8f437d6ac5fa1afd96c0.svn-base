package com.yf.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yf.bean.QueryPortInfo;
import com.yf.bean.ZhengGui;
import com.yf.dao.ZhengGuiMapper;
import com.yf.service.ZhengGuiService;

@Service
public class ZhengGuiServiceImpl implements ZhengGuiService {
	@Autowired
	private ZhengGuiMapper zhengGuiMapper;

	/**
	 * 动态查询
	 */
	public List<ZhengGui> getAll(QueryPortInfo portInfo) {
		return this.zhengGuiMapper.getAll(portInfo);
	}

	@Override
	public Long findListByDynamicCount(QueryPortInfo portInfo) {
		return this.zhengGuiMapper.findListByDynamicCount(portInfo);
	}

	@Override
	public List<ZhengGui> getHasRepeatList(QueryPortInfo portInfo) {
		return this.zhengGuiMapper.getHasRepeatList(portInfo);
	}

	@Override
	public List<ZhengGui> getNoRepeatList(QueryPortInfo portInfo) {
		return this.zhengGuiMapper.getNoRepeatList(portInfo);
	}

	@Override
	public List<ZhengGui> getMatchList(ZhengGui zhengGui) {
		return this.zhengGuiMapper.getMatchList(zhengGui);
	}

	@Override
	public List<ZhengGui> getHotPortRepeatList() {
		return this.zhengGuiMapper.getHotPortRepeatList();
	}

	@Override
	public List<ZhengGui> getHotPortNoRepeatList() {
		return this.zhengGuiMapper.getHotPortNoRepeatList();
	}

	@Override
	public List<ZhengGui> getMatchHotList(ZhengGui zhengGui) {
		return this.zhengGuiMapper.getMatchHotList(zhengGui);
	}

	@Override
	public Double calculateGP20AveragePrice(String destinationPort) {

		return zhengGuiMapper.calculateGP20AveragePrice(destinationPort);
	}

	@Override
	public Double calculateGP40AveragePrice(String destinationPort) {

		return zhengGuiMapper.calculateGP40AveragePrice(destinationPort);
	}

	@Override
	public Double calculateHQ40AveragePrice(String destinationPort) {

		return zhengGuiMapper.calculateHQ40AveragePrice(destinationPort);
	}

	
}