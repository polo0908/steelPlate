package com.cal.bean;

import java.io.Serializable;

public class CustomerQuote implements Serializable {
   
	
	private Integer id;
	private String quoteId;    //报价号
	private Integer customerId; //客户Id
	private String requirements; //需求
	private String createTime;   //创建时间
	
	
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getQuoteId() {
		return quoteId;
	}
	public void setQuoteId(String quoteId) {
		this.quoteId = quoteId;
	}
	public Integer getCustomerId() {
		return customerId;
	}
	public void setCustomerId(Integer customerId) {
		this.customerId = customerId;
	}
	public String getRequirements() {
		return requirements;
	}
	public void setRequirements(String requirements) {
		this.requirements = requirements;
	}
	@Override
	public String toString() {
		return "CustomerQuote [id=" + id + ", quoteId=" + quoteId
				+ ", customerId=" + customerId + ", requirements="
				+ requirements + ", createTime=" + createTime + "]";
	}
	
	
	
}
