package com.cal.bean;

import java.io.Serializable;

public class CustomerInfo implements Serializable {
    
	  private Integer id;
	  private String username;   //客户名
	  private String companyName;  //公司名称
	  private String email;       //邮箱
	  private String createTime;  //创建时间
	  private String country;     //国家
	  private String city;        //城市
	  private String phone;       //电话
	  
	
	  
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
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
		this.username = username;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	@Override
	public String toString() {
		return "CustomerInfo [id=" + id + ", username=" + username
				+ ", companyName=" + companyName + ", email=" + email
				+ ", createTime=" + createTime + ", country=" + country
				+ ", city=" + city + ", phone=" + phone + "]";
	}
	  
	  
	  
}
