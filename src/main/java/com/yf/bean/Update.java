package com.yf.bean;

public class Update {
    private String tablename;

    private String updatetitle;

    public String getTablename() {
        return tablename;
    }

    public void setTablename(String tablename) {
        this.tablename = tablename == null ? null : tablename.trim();
    }

    public String getUpdatetitle() {
        return updatetitle;
    }

    public void setUpdatetitle(String updatetitle) {
        this.updatetitle = updatetitle == null ? null : updatetitle.trim();
    }
}