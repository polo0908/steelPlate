package com.yf.bean;

import java.util.Date;

public class Myplas {
    private Integer itemid;

    private String pingzhong;

    private String jiagonglevel;

    private String xianqi;

    private String changjia;

    private Integer jiage;

    private Date gengxintime;

    private Date createtime;

    public Integer getItemid() {
        return itemid;
    }

    public void setItemid(Integer itemid) {
        this.itemid = itemid;
    }

    public String getPingzhong() {
        return pingzhong;
    }

    public void setPingzhong(String pingzhong) {
        this.pingzhong = pingzhong == null ? null : pingzhong.trim();
    }

    public String getJiagonglevel() {
        return jiagonglevel;
    }

    public void setJiagonglevel(String jiagonglevel) {
        this.jiagonglevel = jiagonglevel == null ? null : jiagonglevel.trim();
    }

    public String getXianqi() {
        return xianqi;
    }

    public void setXianqi(String xianqi) {
        this.xianqi = xianqi == null ? null : xianqi.trim();
    }

    public String getChangjia() {
        return changjia;
    }

    public void setChangjia(String changjia) {
        this.changjia = changjia == null ? null : changjia.trim();
    }

    public Integer getJiage() {
        return jiage;
    }

    public void setJiage(Integer jiage) {
        this.jiage = jiage;
    }

    public Date getGengxintime() {
        return gengxintime;
    }

    public void setGengxintime(Date gengxintime) {
        this.gengxintime = gengxintime;
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }
}