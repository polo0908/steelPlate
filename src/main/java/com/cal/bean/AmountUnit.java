package com.cal.bean;

import java.io.Serializable;

public class AmountUnit implements Serializable {
      
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;    
	private String currency; //货币
	private String currencyShorthand; //货币英文简称
	private Double exchangeRate;    //汇率
	private String updateDate;      //更新时间
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getCurrency() {
		return currency;
	}
	public void setCurrency(String currency) {
		this.currency = currency;
	}
	
	
	public String getCurrencyShorthand() {
		return currencyShorthand;
	}
	public void setCurrencyShorthand(String currencyShorthand) {
		this.currencyShorthand = currencyShorthand;
	}
	
	
	public Double getExchangeRate() {
		return exchangeRate;
	}
	public void setExchangeRate(Double exchangeRate) {
		this.exchangeRate = exchangeRate;
	}
	
	
	
	
	public String getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}
	@Override
	public String toString() {
		return "AmountUnit [id=" + id + ", currency=" + currency
				+ ", currencyShorthand=" + currencyShorthand
				+ ", exchangeRate=" + exchangeRate + ", updateDate="
				+ updateDate + "]";
	}
	
	
	
	
}
