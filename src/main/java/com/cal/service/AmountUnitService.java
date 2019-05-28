package com.cal.service;

import java.io.Serializable;
import java.util.List;

import com.cal.bean.AmountUnit;

public interface AmountUnitService extends Serializable {

	/**
	 * 查询所有国家汇率
	 * @return
	 */
	public List<AmountUnit> queryAll();
	
	
	/**
	 * 根据国家币种缩写查询汇率
	 * @param currencyShorthand
	 * @return
	 */
	public AmountUnit queryByCurrencyShorthand(String currencyShorthand);
	
	
	
	/**
	 * 根据国家查询汇率
	 * @param currency
	 * @return
	 */
	public AmountUnit queryByCurrency(String currency);
	
	
	
	/**
	 * 更新汇率
	 * @param currencyShorthand
	 * @param rate
	 * @return
	 */
	public AmountUnit updateRate( String currencyShorthand, Double rate);
	
	
	/**
	 * 根据id查询
	 * @author polo
	 * 2017年5月11日
	 *
	 */
	public AmountUnit queryById(Integer id);
}
