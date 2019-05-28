package com.cal.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cal.bean.ClientOrder;
import com.cal.service.ClientOrderService;




@Controller
@RequestMapping("/calculator")
public class BackStageController {
	
	@Resource
	private ClientOrderService clientOrderService;
	
	
	/**
	 * 获取最近一个月的订单
	 * @param request
	 * @param response
	 * @return
	 */
    @RequestMapping("/queryAllData.do")
    public String queryAllData(HttpServletRequest request, HttpServletResponse response){
		
    	try {    		
    		List<ClientOrder> clientOrders = clientOrderService.queryAllData();
    		request.setAttribute("clientOrders", clientOrders);

		} catch (Exception e) {
			e.printStackTrace();
		}
    	 
    	return "backstage.jsp";
    }

    
    
}    