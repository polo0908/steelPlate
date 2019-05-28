package com.cal.bean;

import java.io.Serializable;
import java.util.Date;

public class MaterialPrice implements Serializable {
    private Integer id;

    private String materialType;    //材质类型

    private Integer unitPrice;      //单价

    private Date updateDate;        //更新时间

    private String sourceWebsite;   //来源网站

    private String materialDetail;  //材质中美德标显示

    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getMaterialType() {
        return materialType;
    }

    public void setMaterialType(String materialType) {
        this.materialType = materialType == null ? null : materialType.trim();
    }

    public Integer getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(Integer unitPrice) {
        this.unitPrice = unitPrice;
    }

    public Date getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }

    public String getSourceWebsite() {
        return sourceWebsite;
    }

    public void setSourceWebsite(String sourceWebsite) {
        this.sourceWebsite = sourceWebsite == null ? null : sourceWebsite.trim();
    }

    public String getMaterialDetail() {
        return materialDetail;
    }

    public void setMaterialDetail(String materialDetail) {
        this.materialDetail = materialDetail == null ? null : materialDetail.trim();
    }

	@Override
	public String toString() {
		return "MaterialPrice [id=" + id + ", materialType=" + materialType
				+ ", unitPrice=" + unitPrice + ", updateDate=" + updateDate
				+ ", sourceWebsite=" + sourceWebsite + ", materialDetail="
				+ materialDetail + "]";
	}
}