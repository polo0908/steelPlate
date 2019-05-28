package com.yf.bean;

import java.io.Serializable;

public class KongYunPort implements Serializable {

	private static final long serialVersionUID = 908345721L;

	private Integer id;
	private String enPortName;// 机场英文名
	private String chPortName;// 机场中文名
	private String enCityName;// 机场所在城市英文名
	private String chCityName;// 机场所在城市中文名
	private String enCountryName;// 机场所在国家英文名
	private String chCountryName;// 机场所在国家中文名
	private String airportCode;// 机场三字代码

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getEnPortName() {
		return enPortName;
	}

	public void setEnPortName(String enPortName) {
		this.enPortName = enPortName;
	}

	public String getChPortName() {
		return chPortName;
	}

	public void setChPortName(String chPortName) {
		this.chPortName = chPortName;
	}

	public String getEnCityName() {
		return enCityName;
	}

	public void setEnCityName(String enCityName) {
		this.enCityName = enCityName;
	}

	public String getChCityName() {
		return chCityName;
	}

	public void setChCityName(String chCityName) {
		this.chCityName = chCityName;
	}

	public String getEnCountryName() {
		return enCountryName;
	}

	public void setEnCountryName(String enCountryName) {
		this.enCountryName = enCountryName;
	}

	public String getChCountryName() {
		return chCountryName;
	}

	public void setChCountryName(String chCountryName) {
		this.chCountryName = chCountryName;
	}

	public String getAirportCode() {
		return airportCode;
	}

	public void setAirportCode(String airportCode) {
		this.airportCode = airportCode;
	}

	@Override
	public String toString() {
		return "KongYunPort [id=" + id + ", enPortName=" + enPortName + ", chPortName=" + chPortName + ", enCityName="
				+ enCityName + ", chCityName=" + chCityName + ", enCountryName=" + enCountryName + ", chCountryName="
				+ chCountryName + ", airportCode=" + airportCode + "]";
	}

}