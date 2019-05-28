package com.yf.bean;

import java.io.Serializable;
import java.util.Date;

public class PinXiang implements Serializable {

	private static final long serialVersionUID = 52793381L;

	private Integer itemid;

	private Date youxiaoqi;

	private String huodaicompany;

	private String chuancompany;

	private String qidianport;

	private String zhongdianport;

	private String qiDianRegion;

	private String zhongDianRegion;

	private String kgs;

	private String cbm;
	
	private HaiYunPort haiYunPort;

	
	
	public HaiYunPort getHaiYunPort() {
		return haiYunPort;
	}

	public void setHaiYunPort(HaiYunPort haiYunPort) {
		this.haiYunPort = haiYunPort;
	}

	public Integer getItemid() {
		return itemid;
	}

	public void setItemid(Integer itemid) {
		this.itemid = itemid;
	}

	public Date getYouxiaoqi() {
		return youxiaoqi;
	}

	public void setYouxiaoqi(Date youxiaoqi) {
		this.youxiaoqi = youxiaoqi;
	}

	public String getHuodaicompany() {
		return huodaicompany;
	}

	public void setHuodaicompany(String huodaicompany) {
		this.huodaicompany = huodaicompany == null ? null : huodaicompany.trim();
	}

	public String getChuancompany() {
		return chuancompany;
	}

	public void setChuancompany(String chuancompany) {
		this.chuancompany = chuancompany == null ? null : chuancompany.trim();
	}

	public String getQidianport() {
		return qidianport;
	}

	public void setQidianport(String qidianport) {
		this.qidianport = qidianport;
	}

	public String getZhongdianport() {
		return zhongdianport;
	}

	public void setZhongdianport(String zhongdianport) {
		this.zhongdianport = zhongdianport;
	}

	public String getQiDianRegion() {
		return qiDianRegion;
	}

	public void setQiDianRegion(String qiDianRegion) {
		this.qiDianRegion = qiDianRegion;
	}

	public String getZhongDianRegion() {
		return zhongDianRegion;
	}

	public void setZhongDianRegion(String zhongDianRegion) {
		this.zhongDianRegion = zhongDianRegion;
	}

	public String getKgs() {
		return kgs;
	}

	public void setKgs(String kgs) {
		this.kgs = kgs == null ? null : kgs.trim();
	}

	public String getCbm() {
		return cbm;
	}

	public void setCbm(String cbm) {
		this.cbm = cbm == null ? null : cbm.trim();
	}

	@Override
	public String toString() {
		return "PinXiang [itemid=" + itemid + ", youxiaoqi=" + youxiaoqi + ", huodaicompany=" + huodaicompany
				+ ", chuancompany=" + chuancompany + ", qidianport=" + qidianport + ", zhongdianport=" + zhongdianport
				+ ", qiDianRegion=" + qiDianRegion + ", zhongDianRegion=" + zhongDianRegion + ", kgs=" + kgs + ", cbm="
				+ cbm + "]";
	}

}