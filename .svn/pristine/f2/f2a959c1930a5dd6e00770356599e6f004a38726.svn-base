package com.yf.controller;

import java.sql.Timestamp;
import java.util.Date;
import java.util.Enumeration;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yf.bean.Customer;
import com.yf.service.CustomerService;

import net.sf.json.JSONObject;

@Controller
@RequestMapping("/freight")
public class CustomerController {

	public static Logger logger = Logger.getLogger(CustomerController.class);

	@Resource
	private CustomerService customerService;

	@RequestMapping("/insetCustomer")
	@ResponseBody
	public JSONObject insetCustomer(HttpServletRequest request, HttpServletResponse response) {
		Enumeration<String> nameLst = request.getParameterNames();
		String records = "";
		while (nameLst.hasMoreElements()) {
			String praValue = nameLst.nextElement();
			records += "," + praValue + ":[" + request.getParameter(praValue) + "]";
		}
		if("".equals(records)){
			logger.info("insert customer info is empty");
		} else{	
			logger.info("insert customer info: " + records.substring(1));
		}
		JSONObject result = new JSONObject();
		try {

			Customer customer = getCustomer(request);// 获取客户实体对象
			if (customer.getEmail() == null || "".equals(customer.getEmail().trim()) || customer.getShipping() == null
					|| "".equals(customer.getShipping().trim())) {
				result.put("success", false);
				result.put("message", "Email or shipping is empty,Please try again!");
			} else {
				customerService.insert(customer);
				result.put("success", true);
				result.put("message", "Submit data successfully!");
			}

		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage(), e);
			result.put("success", false);
			result.put("message", "Submit data failure,Please try again!");	
		}	
		return result;
	}

	// 根据前端参数，生成客户实体对象
	private Customer getCustomer(HttpServletRequest request) {
		Customer customer = new Customer();
		// customer.setCompanyName(request.getParameter("companyName"));
		// customer.setPhoneNumber(request.getParameter("phoneNumber"));
		customer.setEmail(request.getParameter("email"));
		customer.setShipping(request.getParameter("shipping"));

		String containersNumberStr = request.getParameter("containersNumber");
		if (!(containersNumberStr == null || "".equals(containersNumberStr))) {
			customer.setContainersNumber(Integer.valueOf(containersNumberStr));
		}
		String weightStr = request.getParameter("weight");
		if (!(weightStr == null || "".equals(weightStr))) {
			customer.setWeight(Float.valueOf(weightStr));
		}
		String volumeStr = request.getParameter("volume");
		if (!(volumeStr == null || "".equals(volumeStr))) {
			customer.setVolume(Float.valueOf(volumeStr));
		}
		customer.setOtherService(request.getParameter("otherService"));
		customer.setOtherComments(request.getParameter("otherComments"));
		customer.setTrafficType(request.getParameter("trafficType"));
		customer.setSelectRecords(request.getParameter("selectRecords"));
		customer.setDealStatus(1);
		customer.setCreateTime(new Timestamp(new Date().getTime()));
		return customer;
	}

}
