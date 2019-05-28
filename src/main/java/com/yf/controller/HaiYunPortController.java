package com.yf.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yf.bean.HaiYunPort;
import com.yf.service.HaiYunPortService;

import net.sf.json.JSONArray;

@Controller
@RequestMapping("/freight")
public class HaiYunPortController {

	public static Logger logger = Logger.getLogger(HaiYunPortController.class);

	@Resource
	private HaiYunPortService haiYunPortService;

	@RequestMapping("/ajaxDoctorName")
	public void ajaxDoctorName(HttpServletRequest request, HttpServletResponse response) throws Exception {
		try {
			String doctor_name = request.getParameter("doctor_name");
			doctor_name = new String(doctor_name.getBytes("ISO8859-1"), "utf-8");
			List<HaiYunPort> list = this.haiYunPortService.ajaxDoctorName(doctor_name);
			JSONArray json = JSONArray.fromObject(list);
			response.setCharacterEncoding("UTF-8");
			response.setContentType("application/json; charset=UTF-8");
			response.getWriter().write(json.toString(1, 1));
		} catch (Exception e) {
			e.printStackTrace();
			Logger logger = Logger.getLogger(HaiYunPortController.class);
			logger.error(e.getMessage(), e);
			throw new Exception(e);

		}
	}

	@RequestMapping("/")
	public String getAllPort(Model model) throws Exception {
		try {
			List<HaiYunPort> haiYunPortList = haiYunPortService.getAllPort();
			model.addAttribute("haiYunPortList", haiYunPortList);
			return null;
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage(), e);
			throw new Exception(e);
		}
	}

	@RequestMapping("/ajaxChuFa")
	public void ajaxChuFa(HttpServletRequest request, HttpServletResponse response) throws Exception {
		try {
			String doctor_name = request.getParameter("doctor_name");
			doctor_name = new String(doctor_name.getBytes("ISO8859-1"), "utf-8");
			List<HaiYunPort> list = this.haiYunPortService.ajaxChuFa(doctor_name);
			JSONArray json = JSONArray.fromObject(list);
			response.setCharacterEncoding("UTF-8");
			response.setContentType("application/json; charset=UTF-8");
			response.getWriter().write(json.toString(1, 1));
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage(), e);
			throw new Exception(e);
		}
	}

	@RequestMapping("/queryFclDeparturePort.do")
	public void queryFclDeparturePort(HttpServletRequest request, HttpServletResponse response) throws Exception {
		try {
			List<HaiYunPort> list = this.haiYunPortService.queryFclDeparturePort();
			JSONArray json = JSONArray.fromObject(list);
			response.setCharacterEncoding("UTF-8");
			response.setContentType("application/json; charset=UTF-8");
			response.getWriter().write(json.toString(1, 1));
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage(), e);
			throw new Exception(e);
		}
	}

	@RequestMapping("/queryFclDestinationPort.do")
	public void queryFclDestinationPort(HttpServletRequest request, HttpServletResponse response) throws Exception {
		try {
			List<HaiYunPort> list = this.haiYunPortService.queryFclDestinationPort();
			JSONArray json = JSONArray.fromObject(list);
			response.setCharacterEncoding("UTF-8");
			response.setContentType("application/json; charset=UTF-8");
			response.getWriter().write(json.toString(1, 1));
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage(), e);
			throw new Exception(e);
		}
	}

	@RequestMapping("/queryLclDeparturePort")
	public void queryLclDeparturePort(HttpServletRequest request, HttpServletResponse response) throws Exception {
		try {
			List<HaiYunPort> list = this.haiYunPortService.queryLclDeparturePort();
			JSONArray json = JSONArray.fromObject(list);
			response.setCharacterEncoding("UTF-8");
			response.setContentType("application/json; charset=UTF-8");
			response.getWriter().write(json.toString(1, 1));
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage(), e);
			throw new Exception(e);
		}
	}

	@RequestMapping("/queryLclDestinationPort")
	public void queryLclDestinationPort(HttpServletRequest request, HttpServletResponse response) throws Exception {
		try {
			List<HaiYunPort> list = this.haiYunPortService.queryLclDestinationPort();
			JSONArray json = JSONArray.fromObject(list);
			response.setCharacterEncoding("UTF-8");
			response.setContentType("application/json; charset=UTF-8");
			response.getWriter().write(json.toString(1, 1));
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage(), e);
			throw new Exception(e);
		}
	}

}
