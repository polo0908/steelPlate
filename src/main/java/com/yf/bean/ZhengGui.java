package com.yf.bean;

import java.io.Serializable;
import java.util.Date;

public class ZhengGui implements Serializable {

	private static final long serialVersionUID = 779953221L;

	private Integer itemid;

	private Date youxiaoqi;

	private String huodaicompany;

	private String chuancompany;

	private String qidianport;

	private String zhongdianport;

	private String qiDianRegion;

	private String zhongDianRegion;

	private String gp20;

	private String gp40;

	private String hq40;

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

	public String getGp20() {
		return gp20;
	}

	public void setGp20(String gp20) {
		this.gp20 = gp20 == null ? null : gp20.trim();
	}

	public String getGp40() {
		return gp40;
	}

	public void setGp40(String gp40) {
		this.gp40 = gp40 == null ? null : gp40.trim();
	}

	public String getHq40() {
		return hq40;
	}

	public void setHq40(String hq40) {
		this.hq40 = hq40 == null ? null : hq40.trim();
	}

	@Override
	public String toString() {
		return "ZhengGui [itemid=" + itemid + ", youxiaoqi=" + youxiaoqi + ", huodaicompany=" + huodaicompany
				+ ", chuancompany=" + chuancompany + ", qidianport=" + qidianport + ", zhongdianport=" + zhongdianport
				+ ", qiDianRegion=" + qiDianRegion + ", zhongDianRegion=" + zhongDianRegion + ", gp20=" + gp20
				+ ", gp40=" + gp40 + ", hq40=" + hq40 + "]";
	}

}