package com.cal.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cal.bean.ClientOrder;
import com.cal.bean.CustomerInfo;
import com.cal.service.ClientOrderService;
import com.cal.service.CustomerInfoService;
import com.cal.util.DateFormat;



@Controller
@RequestMapping("/calculator")
public class CustomerInfoController {
	
	@Resource
	private ClientOrderService clientOrderService;
	@Resource
	private CustomerInfoService customerInfoService;
    
	@RequestMapping("/register.do")
    public String register(HttpServletRequest request, HttpServletResponse response){
		String quoteId = request.getParameter("quoteId");
        request.setAttribute("quoteId", quoteId);
		return "calculator5.jsp";
	}
	
	@ResponseBody
    @RequestMapping("/saveCustomer.do")
    public String saveCustomer(HttpServletRequest request, HttpServletResponse response){
		
    	try {
			ClientOrder clientOrder = null;
			String quoteId = "";
			String country = "";
			String city = "";

			if(!(request.getParameter("quoteId") == null || "".equals(request.getParameter("quoteId")))){
				quoteId = request.getParameter("quoteId");
				clientOrder = clientOrderService.queryByQuoteId(quoteId);
				if(clientOrder.getCountry() != null && !"".equals(clientOrder.getCountry())){
					country = clientOrder.getCountry();				   
				}
				if(clientOrder.getCity() != null && !"".equals(clientOrder.getCity())){
					 city = clientOrder.getCity();	
				}
			}
			 String userName = request.getParameter("userName");
			 String companyName = request.getParameter("companyName");
			 String email = request.getParameter("email");
			 CustomerInfo customer = new CustomerInfo();
			 customer.setCity(city);
			 customer.setCompanyName(companyName);
			 customer.setCountry(country);
			 customer.setCreateTime(DateFormat.format());
			 customer.setEmail(email);
			 customer.setUsername(userName);
			 customerInfoService.insertCustomerInfo(customer);

			 Integer id = customer.getId();
			 clientOrder.setUserId(id);
			 clientOrderService.updateClientOrder(clientOrder);
		} catch (Exception e) {
			e.printStackTrace();
			return "Register failed!";
		}
    	 
    	return "  Register success!";
    }

    
    
}    