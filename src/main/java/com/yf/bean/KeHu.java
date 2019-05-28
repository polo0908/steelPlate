package com.yf.bean;

import java.util.Date;

public class KeHu {
    private Integer id;

    private String jilu;

    private Date gentime;

    private Integer lianxiuserid;

    private Integer adminid;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getJilu() {
        return jilu;
    }

    public void setJilu(String jilu) {
        this.jilu = jilu == null ? null : jilu.trim();
    }

    public Date getGentime() {
        return gentime;
    }

    public void setGentime(Date gentime) {
        this.gentime = gentime;
    }

    public Integer getLianxiuserid() {
        return lianxiuserid;
    }

    public void setLianxiuserid(Integer lianxiuserid) {
        this.lianxiuserid = lianxiuserid;
    }

    public Integer getAdminid() {
        return adminid;
    }

    public void setAdminid(Integer adminid) {
        this.adminid = adminid;
    }
}