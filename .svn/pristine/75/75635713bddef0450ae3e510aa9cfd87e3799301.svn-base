package com.cal.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.cal.bean.AmountUnit;

public interface AmountUnitMapper {
  
	
	/**
	 * 查询所有国家汇率
	 * @return
	 */
	List<AmountUnit> queryAll();
	
	
	/**
	 * 根据国家币种缩写查询汇率
	 * @param currencyShorthand
	 * @return
	 */
	AmountUnit queryByCurrencyShorthand(String currencyShorthand);
	
	/**
	 * 根据国家查询汇率
	 * @param currency
	 * @return
	 */
	AmountUnit queryByCurrency(String currency);
	
	
	/**
	 * 更新汇率
	 * @param currencyShorthand
	 * @param rate
	 * @return
	 */
	AmountUnit updateRate(@Param("currencyShorthand") String currencyShorthand, @Param("rate") Double rate);
	
	
	/**
	 * 根据id查询
	 * @author polo
	 * 2017年5月11日
	 *
	 */
	AmountUnit queryById(Integer id);
	
	
}
