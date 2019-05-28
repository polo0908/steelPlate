package com.yf.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yf.bean.KongYunPort;
import com.yf.service.KongYunPortService;

import net.sf.json.JSONArray;

@Controller
@RequestMapping("/freight")
public class KongYunPortController {

	public static Logger logger = Logger.getLogger(KongYunPortController.class);

	@Resource
	private KongYunPortService kongYunPortService;

	@RequestMapping("/ajaxKongYunName")
	public void ajaxKongYunName(HttpServletRequest request, HttpServletResponse response) throws Exception {
		try {
			String doctor_name = request.getParameter("doctor_name");
			doctor_name = new String(doctor_name.getBytes("ISO8859-1"), "utf-8");
			List<KongYunPort> kongYunPortList = this.kongYunPortService.ajaxKongYunName(doctor_name);
			JSONArray json = JSONArray.fromObject(kongYunPortList);
			response.setCharacterEncoding("UTF-8");
			response.setContentType("application/json; charset=UTF-8");
			response.getWriter().write(json.toString(1, 1));
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage(), e);
			throw new Exception(e);
		}
	}

	@RequestMapping("/ajaxQiDian")
	public void ajaxQiDian(HttpServletRequest request, HttpServletResponse response) throws Exception {
		try {
			String doctor_name = request.getParameter("doctor_name");
			if (doctor_name == null || "".equals(doctor_name)) {
				doctor_name = "";
			} else {
				doctor_name = new String(doctor_name.getBytes("ISO8859-1"), "utf-8");
			}

			List<KongYunPort> kongYunPortList = this.kongYunPortService.ajaxQiDian(doctor_name);
			JSONArray json = JSONArray.fromObject(kongYunPortList);
			response.setCharacterEncoding("UTF-8");
			response.setContentType("application/json;charset=UTF-8");
			response.getWriter().write(json.toString(1, 1));
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage(), e);
			throw new Exception(e);
		}
	}

	@RequestMapping("/insertKongYunPort")
	public void insertKongYunPort(HttpServletRequest request, HttpServletResponse response) throws Exception {

		try {
			KongYunPort kongYunPort = new KongYunPort();

			kongYunPort.setEnPortName(request.getParameter("enPortName"));
			kongYunPort.setChPortName(request.getParameter("chPortName"));
			kongYunPort.setEnCityName(request.getParameter("enCityName"));
			kongYunPort.setChCityName(request.getParameter("chCityName"));
			kongYunPort.setEnCountryName(request.getParameter("enCountryName"));
			kongYunPort.setChCountryName(request.getParameter("chCountryName"));
			kongYunPort.setAirportCode(request.getParameter("airportCode"));

			kongYunPortService.insert(kongYunPort);

			System.out.println("success : ," + kongYunPort);
			List<String> scList = new ArrayList<String>();
			scList.add("success");
			JSONArray json = JSONArray.fromObject(scList);
			response.setCharacterEncoding("UTF-8");
			response.setContentType("application/json;charset=UTF-8");
			response.getWriter().write(json.toString(1, 1));
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage(), e);
			throw new Exception(e);
		}
	}
}
