package com.yf.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.util.Date;
import java.util.List;
import java.util.Properties;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yf.bean.KuaiYun;
import com.yf.service.KuaiYunService;
import com.yf.util.DateFormatUtil;

import net.sf.json.JSONArray;

@Controller
@RequestMapping("/freight")
public class KuaiYunController {

	public static Logger logger = Logger.getLogger(KuaiYunController.class);

	@Resource
	private KuaiYunService kuaiYunService;

	@RequestMapping("/ajaxKuaiYunName")
	public void ajaxKuaiYunName(HttpServletRequest request, HttpServletResponse response) throws Exception {
		try {
			String doctor_name = request.getParameter("doctor_name");
			doctor_name = new String(doctor_name.getBytes("ISO8859-1"), "utf-8");
			List<KuaiYun> kuaiYunList = this.kuaiYunService.ajaxKuaiYunName(doctor_name);
			JSONArray json = JSONArray.fromObject(kuaiYunList);
			response.setCharacterEncoding("utf-8");
			response.setContentType("application/json; charset=UTF-8");
			response.getWriter().write(json.toString(1, 1));
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage(), e);
			throw new Exception(e);
		}
	}

	@RequestMapping("/kuaYuQingQiu")
	@ResponseBody
	public void kuaYuQingQiu(HttpServletRequest request, HttpServletResponse response) throws Exception {

		long queryBegin = System.currentTimeMillis();
		logger.info("queryBegin:" + DateFormatUtil.getWithMicroseconds(new Date(queryBegin)));

		StringBuilder json = new StringBuilder();
		String countryid = request.getParameter("countryid");
		String weight = request.getParameter("weight");
		String volume = request.getParameter("volume");
		String url = "";
		try {
			url = getUrlByProperties();
			url += "/zone/getFreight?countryid=" + countryid + "&weight=" + weight + "&volume=" + volume;
			URL urlObject;
			urlObject = new URL(url);
			URLConnection uc = urlObject.openConnection();
			uc.setRequestProperty("User-Agent", "Mozilla/4.0 (compatible; MSIE 5.0; Windows NT; DigExt)");
			BufferedReader in = new BufferedReader(new InputStreamReader(uc.getInputStream()));
			String inputLine = "";
			if ((inputLine = in.readLine()) != null) {
				json.append(inputLine);
			}
			in.close();

			long queryEnd = System.currentTimeMillis();
			logger.info("queryEnd:" + DateFormatUtil.getWithMicroseconds(new Date(queryEnd)));
			logger.info("The total time consuming: " + (queryEnd - queryBegin) + " microseconds");

			JSONArray jsonArray = JSONArray.fromObject(json.toString());
			// System.err.println(jsonArray.toString());
			response.setCharacterEncoding("UTF-8");
			response.setContentType("application/json; charset=UTF-8");
			response.getWriter().write(jsonArray.toString(1, 1));
		} catch (MalformedURLException urlEx) {
			urlEx.printStackTrace();
			logger.error(urlEx.getMessage(), urlEx);
			throw new Exception(urlEx.getMessage());
		} catch (IOException IoEx) {
			IoEx.printStackTrace();
			logger.error(IoEx.getMessage(), IoEx);
			throw new Exception(IoEx.getMessage());
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage(), e);
			throw new Exception(e.getMessage());
		}

	}

	private String getUrlByProperties() throws Exception {
		Properties prop = new Properties();
		prop.load(this.getClass().getResourceAsStream("/yfwUrl.properties"));
		return prop.getProperty("url");
	}

}
