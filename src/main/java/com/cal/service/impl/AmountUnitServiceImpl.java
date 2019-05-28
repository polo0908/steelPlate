package com.cal.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cal.bean.AmountUnit;
import com.cal.dao.AmountUnitMapper;
import com.cal.service.AmountUnitService;

@Service
public class AmountUnitServiceImpl implements AmountUnitService {
    
	@Resource
	private AmountUnitMapper  amountUnitMapper;
	@Override
	public AmountUnit queryByCurrency(String currency) {
		return amountUnitMapper.queryByCurrency(currency);
	}
	@Override
	public AmountUnit updateRate(String currencyShorthand, Double rate) {

		return amountUnitMapper.updateRate(currencyShorthand, rate);
	}
	@Override
	public List<AmountUnit> queryAll() {
		return amountUnitMapper.queryAll();
	}
	@Override
	public AmountUnit queryByCurrencyShorthand(String currencyShorthand) {
		return amountUnitMapper.queryByCurrencyShorthand(currencyShorthand);
	}
	@Override
	public AmountUnit queryById(Integer id) {
		return amountUnitMapper.queryById(id);
	}

}
