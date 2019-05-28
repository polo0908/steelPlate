package com.cbt.model;

import java.io.Serializable;

public class SteelPlate implements Serializable{
    private Integer id;

    private String itemid;

    private String guapaishangjia;

    private String pinming;

    private String caizhi;

    private String guige;

    private String changjia;

    private String cunhuodi;

    private String zhongliang;

    private String jiage;

    private String shopid;

    private String high;

    private String width;

    private String length;

    private String zhonglei;

    private Integer categoryid;
    
    
    //虚拟字段
    private String width1;
    private String width2;
    private String length1;
    private String length2;
    private Integer start;
    private Integer pageSize;
    private String minUnitPrice; 
    
    
    public String getMinUnitPrice() {
		return minUnitPrice;
	}

	public void setMinUnitPrice(String minUnitPrice) {
		this.minUnitPrice = minUnitPrice;
	}

	public Integer getStart() {
		return start;
	}

	public void setStart(Integer start) {
		this.start = start;
	}

	public Integer getPageSize() {
		return pageSize;
	}

	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}

	public String getWidth1() {
		return width1;
	}

	public void setWidth1(String width1) {
		this.width1 = width1;
	}

	public String getWidth2() {
		return width2;
	}

	public void setWidth2(String width2) {
		this.width2 = width2;
	}

	public String getLength1() {
		return length1;
	}

	public void setLength1(String length1) {
		this.length1 = length1;
	}

	public String getLength2() {
		return length2;
	}

	public void setLength2(String length2) {
		this.length2 = length2;
	}

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getItemid() {
        return itemid;
    }

    public void setItemid(String itemid) {
        this.itemid = itemid == null ? null : itemid.trim();
    }

    public String getGuapaishangjia() {
        return guapaishangjia;
    }

    public void setGuapaishangjia(String guapaishangjia) {
        this.guapaishangjia = guapaishangjia == null ? null : guapaishangjia.trim();
    }

    public String getPinming() {
        return pinming;
    }

    public void setPinming(String pinming) {
        this.pinming = pinming == null ? null : pinming.trim();
    }

    public String getCaizhi() {
        return caizhi;
    }

    public void setCaizhi(String caizhi) {
        this.caizhi = caizhi == null ? null : caizhi.trim();
    }

    public String getGuige() {
        return guige;
    }

    public void setGuige(String guige) {
        this.guige = guige == null ? null : guige.trim();
    }

    public String getChangjia() {
        return changjia;
    }

    public void setChangjia(String changjia) {
        this.changjia = changjia == null ? null : changjia.trim();
    }

    public String getCunhuodi() {
        return cunhuodi;
    }

    public void setCunhuodi(String cunhuodi) {
        this.cunhuodi = cunhuodi == null ? null : cunhuodi.trim();
    }

    public String getZhongliang() {
        return zhongliang;
    }

    public void setZhongliang(String zhongliang) {
        this.zhongliang = zhongliang == null ? null : zhongliang.trim();
    }

    public String getJiage() {
        return jiage;
    }

    public void setJiage(String jiage) {
        this.jiage = jiage == null ? null : jiage.trim();
    }

    public String getShopid() {
        return shopid;
    }

    public void setShopid(String shopid) {
        this.shopid = shopid == null ? null : shopid.trim();
    }

    public String getHigh() {
        return high;
    }

    public void setHigh(String high) {
        this.high = high == null ? null : high.trim();
    }

    public String getWidth() {
        return width;
    }

    public void setWidth(String width) {
        this.width = width == null ? null : width.trim();
    }

    public String getLength() {
        return length;
    }

    public void setLength(String length) {
        this.length = length == null ? null : length.trim();
    }

    public String getZhonglei() {
        return zhonglei;
    }

    public void setZhonglei(String zhonglei) {
        this.zhonglei = zhonglei == null ? null : zhonglei.trim();
    }

    public Integer getCategoryid() {
        return categoryid;
    }

    public void setCategoryid(Integer categoryid) {
        this.categoryid = categoryid;
    }

	@Override
	public String toString() {
		return "SteelPlate [id=" + id + ", itemid=" + itemid
				+ ", guapaishangjia=" + guapaishangjia + ", pinming=" + pinming
				+ ", caizhi=" + caizhi + ", guige=" + guige + ", changjia="
				+ changjia + ", cunhuodi=" + cunhuodi + ", zhongliang="
				+ zhongliang + ", jiage=" + jiage + ", shopid=" + shopid
				+ ", high=" + high + ", width=" + width + ", length=" + length
				+ ", zhonglei=" + zhonglei + ", categoryid=" + categoryid
				+ ", width1=" + width1 + ", width2=" + width2 + ", length1="
				+ length1 + ", length2=" + length2 + ", start=" + start
				+ ", pageSize=" + pageSize + ", minUnitPrice=" + minUnitPrice
				+ "]";
	}
    
    
    
}