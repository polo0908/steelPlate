package com.yf.bean;

import java.util.Date;

public class Supply {
    private Integer itemid;

    private Integer supplierid;

    private String pinzhong;

    private String paihao;

    private String changshang;

    private Date fabutime;

    private Date createtime;

    private Double danjia;

    private Integer status;

    public Integer getItemid() {
        return itemid;
    }

    public void setItemid(Integer itemid) {
        this.itemid = itemid;
    }

    public Integer getSupplierid() {
        return supplierid;
    }

    public void setSupplierid(Integer supplierid) {
        this.supplierid = supplierid;
    }

    public String getPinzhong() {
        return pinzhong;
    }

    public void setPinzhong(String pinzhong) {
        this.pinzhong = pinzhong == null ? null : pinzhong.trim();
    }

    public String getPaihao() {
        return paihao;
    }

    public void setPaihao(String paihao) {
        this.paihao = paihao == null ? null : paihao.trim();
    }

    public String getChangshang() {
        return changshang;
    }

    public void setChangshang(String changshang) {
        this.changshang = changshang == null ? null : changshang.trim();
    }

    public Date getFabutime() {
        return fabutime;
    }

    public void setFabutime(Date fabutime) {
        this.fabutime = fabutime;
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public Double getDanjia() {
        return danjia;
    }

    public void setDanjia(Double danjia) {
        this.danjia = danjia;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}