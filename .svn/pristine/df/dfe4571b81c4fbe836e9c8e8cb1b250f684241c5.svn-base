package com.cal.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cal.service.MaterialPriceService;


@Controller
public class UpdateMaterialPrice {
      
	@Resource
	private MaterialPriceService materialPriceService;
	
	@RequestMapping("/updateMaterialPrice.do")
    public void register(HttpServletRequest request, HttpServletResponse response){
		materialPriceService.updateMaterialPrice();		
	}
	
}
