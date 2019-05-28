package com.cal.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cal.bean.ClientOrder;
import com.cal.bean.OrderDetails;
import com.cal.dao.ClientOrderMapper;
import com.cal.dao.OrderDetailsMapper;
import com.cal.service.OrderDetailsService;

@Service
public class OrderDetailsServiceImpl implements OrderDetailsService {
    @Resource 
    private OrderDetailsMapper orderDetailsMapper;
    @Resource 
    private ClientOrderMapper clientOrderMapper;
	@Override
	public OrderDetails queryById(Integer id) {
		
		return orderDetailsMapper.queryById(id);
	}

	@Transactional
	@Override
	public void insertOrderDetails(OrderDetails orderDetails,ClientOrder clientOrder)throws Exception{
		orderDetailsMapper.insertOrderDetails(orderDetails);
		clientOrderMapper.updateClientOrder(clientOrder);
	}

	@Override
	public List<OrderDetails> queryByQuoteId(String quoteId) {
		
		return orderDetailsMapper.queryByQuoteId(quoteId);
	}

	@Override
	public void updateOrderDetails(OrderDetails orderDetails) {
		orderDetailsMapper.updateOrderDetails(orderDetails);
		
	}

	@Transactional
	@Override
	public void insertArray(List<OrderDetails> list) {
		
		orderDetailsMapper.insertArray(list);		
	}

	@Transactional
	@Override
	public void deleteByQuoteId(String quoteId) {
		orderDetailsMapper.deleteByQuoteId(quoteId);
		
	}

	@Transactional
	@Override
	public void deleteById(Integer id) {
		orderDetailsMapper.deleteById(id);
		
	}

	@Override
	public void insertOrderDetails(OrderDetails orderDetails) {
		orderDetailsMapper.insertOrderDetails(orderDetails);
		
	}

}
