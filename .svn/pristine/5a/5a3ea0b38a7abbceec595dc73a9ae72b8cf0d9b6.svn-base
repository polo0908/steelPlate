package com.cbt.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cbt.model.SteelPlate;
import com.cbt.model.SteelSortDetails;
import com.cbt.service.SteelPateService;
import com.cbt.service.SteelSortDetailsService;
/**
 * 根据种类查询产品
 * @author polo
 *
 */
@Controller
@RequestMapping("/SteelPlate")
public class SteelPlateCategoryController {
	@Resource
	private SteelPateService steelPateService;
	@Resource
	private SteelSortDetailsService steelSortDetailsService;
	/**
	 * 进入种类
	* @Title: query 
	* @param @param request
	* @param @return    返回页面Category.jsp
	* @return ModelAndView    返回类型 
	* @throws
	 */
	@RequestMapping("/queryPlateByCategory")
	public String category(HttpServletRequest request, HttpServletResponse response){
		response.setCharacterEncoding("UTF-8");
		String pinming = request.getParameter("pinming");
		//查询steel_sort_details表中品名对应多类型
		String[] sorts = {};
		try {
			sorts = steelSortDetailsService.querySortByBelongType(pinming);
		} catch (Exception e) {
			e.printStackTrace();
		}
		List<SteelPlate>  list = null;
		SteelSortDetails steelSortDetails = null;
		if(sorts.length != 0){
	     	list = steelPateService.queryByPinMing(sorts);
	     	steelSortDetails = steelSortDetailsService.queryByBelongType(pinming);
		}
		
		
		
	   return "/website/Category.jsp";  
   }	
	
}
