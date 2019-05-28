package com.yf.bean;

import java.util.Date;

public class Suppliers {
    private Integer supplierid;

    private Date lastfabutime;

    private Date createtime;

    public Integer getSupplierid() {
        return supplierid;
    }

    public void setSupplierid(Integer supplierid) {
        this.supplierid = supplierid;
    }

    public Date getLastfabutime() {
        return lastfabutime;
    }

    public void setLastfabutime(Date lastfabutime) {
        this.lastfabutime = lastfabutime;
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }
}