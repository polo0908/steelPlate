package com.yf.bean;

public class LianXiUser {
    private Integer id;

    private String username;

    private String email;

    private String huowu;//货物

    private String leixing;//1是质量控制，2是其他

    private String yijian;

    private Integer iskam;//是不是需要请求得到1是选2是不选

    private String iphone;
    public String getIphone() {
		return iphone;
	}

	public void setIphone(String iphone) {
		this.iphone = iphone;
	}

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public String getHuowu() {
        return huowu;
    }

    public void setHuowu(String huowu) {
        this.huowu = huowu == null ? null : huowu.trim();
    }

    public String getLeixing() {
        return leixing;
    }

    public void setLeixing(String leixing) {
        this.leixing = leixing;
    }

    public String getYijian() {
        return yijian;
    }

    public void setYijian(String yijian) {
        this.yijian = yijian == null ? null : yijian.trim();
    }

    public Integer getIskam() {
        return iskam;
    }

    public void setIskam(Integer iskam) {
        this.iskam = iskam;
    }
}