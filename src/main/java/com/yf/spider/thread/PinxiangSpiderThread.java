package com.yf.spider.thread;

import com.yf.spider.util.FreightSpiderDataDealUtil;
import com.yf.spider.util.FreightSpiderUtil;

public class PinxiangSpiderThread implements Runnable {
	private String chinaPortEnName;
	private String foreignPortEnName;

	public String getChinaPortEnName() {
		return chinaPortEnName;
	}

	public void setChinaPortEnName(String chinaPortEnName) {
		this.chinaPortEnName = chinaPortEnName;
	}

	public String getForeignPortEnName() {
		return foreignPortEnName;
	}

	public void setForeignPortEnName(String foreignPortEnName) {
		this.foreignPortEnName = foreignPortEnName;
	}

	public PinxiangSpiderThread(String chinaPortEnName, String foreignPortEnName) {
		super();
		this.chinaPortEnName = chinaPortEnName;
		this.foreignPortEnName = foreignPortEnName;
	}

	@Override
	public void run() {
		try {
			int insertTotal = 0;
			insertTotal = FreightSpiderUtil.getPinXiangInfoByPort(this.chinaPortEnName, this.foreignPortEnName);
			if (insertTotal > 0) {
				FreightSpiderDataDealUtil.dealPinxiangData(chinaPortEnName, foreignPortEnName);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
