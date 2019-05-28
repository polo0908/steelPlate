package com.cal.bean;

import java.io.Serializable;

public class GoodsProcess implements Serializable {

	    
	  private Integer id;
	  private Integer orderDetailsId;  //产品id
	  private Integer processId;  //工艺id
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getOrderDetailsId() {
		return orderDetailsId;
	}
	public void setOrderDetailsId(Integer orderDetailsId) {
		this.orderDetailsId = orderDetailsId;
	}
	public Integer getProcessId() {
		return processId;
	}
	public void setProcessId(Integer processId) {
		this.processId = processId;
	}
	@Override
	public String toString() {
		return "GoodsProcess [id=" + id + ", orderDetailsId=" + orderDetailsId
				+ ", processId=" + processId + "]";
	}
	  
	  
	  
}
