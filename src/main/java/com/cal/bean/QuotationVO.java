package com.cal.bean;

import java.io.Serializable;
import java.util.List;

public class QuotationVO implements Serializable {
   
	private ClientOrder clientOrder;
    private List<OrderDetails> orderDetails;
    
    
	public ClientOrder getClientOrder() {
		return clientOrder;
	}
	public void setClientOrder(ClientOrder clientOrder) {
		this.clientOrder = clientOrder;
	}
	public List<OrderDetails> getOrderDetails() {
		return orderDetails;
	}
	public void setOrderDetails(List<OrderDetails> orderDetails) {
		this.orderDetails = orderDetails;
	}
	
	@Override
	public String toString() {
		return "QuotationVO [clientOrder=" + clientOrder + ", orderDetails="
				+ orderDetails + "]";
	}
    
    
	
}
