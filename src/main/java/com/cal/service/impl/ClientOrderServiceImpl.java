package com.cal.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cal.bean.ClientOrder;
import com.cal.bean.OrderDetails;
import com.cal.dao.ClientOrderMapper;
import com.cal.dao.OrderDetailsMapper;
import com.cal.service.ClientOrderService;
import com.cal.util.NumberFormat;

@Service
public class ClientOrderServiceImpl implements ClientOrderService {

	@Resource
	private ClientOrderMapper clientOrderMapper;
    @Resource 
    private OrderDetailsMapper orderDetailsMapper;
    
    
	@Override
	public ClientOrder queryById(Integer id) {
		
		return clientOrderMapper.queryById(id);
	}

	@Override
	public void insertClientOrder(ClientOrder clientOrder,OrderDetails orderDetails)throws Exception{
		clientOrderMapper.insertClientOrder(clientOrder);
		String quoteId = "";
		   if(!(clientOrder.getId() == null || "".equals(clientOrder.getId()))){
			   quoteId = NumberFormat.number(clientOrder.getId());   

		   }       	   
		   clientOrder.setQuoteId(quoteId);
		 if(!(orderDetails == null || "".equals(orderDetails))){
		   orderDetails.setQuoteId(quoteId); 
		   orderDetailsMapper.insertOrderDetails(orderDetails);
		 }
		 clientOrderMapper.updateClientOrder(clientOrder); 
	}

	@Override
	public void updateClientOrder(ClientOrder clientOrder) {
		clientOrderMapper.updateClientOrder(clientOrder);

	}

	@Override
	public ClientOrder queryByQuoteId(String quoteId) {
		return clientOrderMapper.queryByQuoteId(quoteId);
	}

	@Override
	public List<ClientOrder> queryAllData() {
		return clientOrderMapper.queryAllData();
	}

}
