package com.yf.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yf.bean.KongYun;
import com.yf.bean.KongYunPort;
import com.yf.bean.QueryPortInfo;
import com.yf.service.KongYunPortService;
import com.yf.service.KongYunService;
import com.yf.spider.thread.KongyunSpiderThread;
import com.yf.util.CityTranslateUtil;
import com.yf.util.DateFormatUtil;
import com.yf.util.ResponseUtil;
import com.yf.util.StringHelp;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
@RequestMapping("/freight")
public class KongYunController {

	public static Logger logger = Logger.getLogger(KongYunController.class);

	@Resource
	private KongYunService kongYunService;

	@Resource
	private KongYunPortService KongYunPortService;

	@RequestMapping("/getAllKongYun")
	public void getAll(HttpServletRequest request, Model model, HttpServletResponse response) throws Exception {

		try {
			long queryBegin = System.currentTimeMillis();
			logger.info("queryBegin:" + DateFormatUtil.getWithMicroseconds(new Date(queryBegin)));

			QueryPortInfo portInfo = getQueryPortInfo(request);
			// 记录起始和终点机场港口的英文缩写
			String depaPortAbbreviation = portInfo.getDepaPortAbbreviation();
			String destPortAbbreviation = portInfo.getDestPortAbbreviation();
			List<KongYun> kongYunList = kongYunService.getAllKongYun(portInfo);
			List<KongYun> showList = new ArrayList<KongYun>();
			if (kongYunList.size() == 0) {
				showList = getAllChKyList(request, model, portInfo);
				// 如果查询结果为0，则进行异步的线程直接抓取
				doAsynchronousThreadFetching(depaPortAbbreviation, destPortAbbreviation);
			} else {
				showList.addAll(kongYunList);
			}
			int begin = portInfo.getPageNo();
			int end = begin + 6;
			JSONArray jsonArray = null;
			// 设置分页显示效果的数据
			JSONObject result = new JSONObject();
			// 防止在异步抓取数据时显示不正常，默认显示第一页数据
			if (showList.size() <= begin) {
				result.put("pageNo", 0);
				begin = 0;
				end = 6;
			} else {
				result.put("pageNo", begin);
			}
			List<KongYun> nwList = new ArrayList<>();
			if (begin <= showList.size() && showList.size() <= end) {
				for (int m = begin; m < showList.size(); m++) {
					nwList.add(showList.get(m));
				}
			} else if (end <= showList.size()) {
				for (int n = begin; n < end; n++) {
					nwList.add(showList.get(n));
				}

			}

			// 翻译起始港口的中文数据
			List<KongYun> resaultLst = translateQidianportChNameToEnName(nwList);
			jsonArray = JSONArray.fromObject(resaultLst);
			result.put("result", jsonArray);
			result.put("total", showList.size());

			long queryEnd = System.currentTimeMillis();
			logger.info("queryEnd:" + DateFormatUtil.getWithMicroseconds(new Date(queryEnd)));
			logger.info("The total time consuming: " + (queryEnd - queryBegin) + " microseconds");

			ResponseUtil.write(response, result);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage(), e);
			throw new Exception(e);
		}
	}

	@RequestMapping("/getHotKongYun")
	public void getHotKongYun(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		long loadBegin = System.currentTimeMillis();
		logger.info("loadBegin:" + DateFormatUtil.getWithMicroseconds(new Date(loadBegin)));

		// 分别查询热门终点港口数据，根据热门终点港口数据排列，每个港口按照顺序各自显示一条数据，依次排列
		QueryPortInfo newYorkPortInfo = new QueryPortInfo("NEW YORK", "纽约", "JFK");//
		QueryPortInfo sanFranciscoPortInfo = new QueryPortInfo("SAN FRANCISCO", "旧金山", "SFO");
		QueryPortInfo londonPortInfo = new QueryPortInfo("LONDON", "伦敦", "LON");
		QueryPortInfo parisPortInfo = new QueryPortInfo("PARIS", "巴黎", "PAR");
		QueryPortInfo sydneyPortInfo = new QueryPortInfo("SYDNEY", "悉尼", "SYD");

		try {
			List<KongYun> newYorkList = translateQidianportChNameToEnName(
					kongYunService.getAllKongYun(newYorkPortInfo));
			List<KongYun> sanFranciscoList = translateQidianportChNameToEnName(
					kongYunService.getAllKongYun(sanFranciscoPortInfo));
			List<KongYun> londonList = translateQidianportChNameToEnName(kongYunService.getAllKongYun(londonPortInfo));
			List<KongYun> parisList = translateQidianportChNameToEnName(kongYunService.getAllKongYun(parisPortInfo));
			List<KongYun> sydneyList = translateQidianportChNameToEnName(kongYunService.getAllKongYun(sydneyPortInfo));

			// 获取五个列表的最大值
			int newYorkSize = newYorkList.size();
			int sanFranciscoSize = sanFranciscoList.size();
			int londonSize = londonList.size();
			int parisSize = parisList.size();
			int sydneySize = sydneyList.size();
			int maxSize = getHotListMaxSize(newYorkSize, sanFranciscoSize, londonSize, parisSize, sydneySize);

			// 循环获取每个列表的数据
			List<KongYun> showHotList = new ArrayList<KongYun>();
			for (int i = 0; i < maxSize; i++) {
				if (i < newYorkSize) {
					showHotList.add(newYorkList.get(newYorkSize - 1 - i));
				}
				if (i < sanFranciscoSize) {
					showHotList.add(sanFranciscoList.get(i));
				}
				if (i < londonSize) {
					showHotList.add(londonList.get(londonSize - 1 - i));
				}
				if (i < parisSize) {
					showHotList.add(parisList.get(i));
				}
				if (i < sydneySize) {
					showHotList.add(sydneyList.get(sydneySize - 1 - i));
				}
			}

			int begin = 1;
			String regex = "[0-9]+";
			String startPoss = request.getParameter("pageno");// 当前页码
			if (startPoss != null && startPoss != "") {
				if (StringHelp.isNum(startPoss, regex)) {
					begin = Integer.parseInt(startPoss);
				}
			}
			if (begin < 0) {
				begin = 0;
			}

			int end = begin + 6;
			JSONArray jsonArray = null;
			int total = showHotList.size();
			// 设置分页显示效果的数据
			if (begin <= total && total <= end) {
				List<KongYun> nwList = new ArrayList<>();
				for (int m = begin; m < total; m++) {
					nwList.add(showHotList.get(m));
				}
				jsonArray = JSONArray.fromObject(nwList);
			} else if (end <= total) {
				List<KongYun> nwList = new ArrayList<>();
				for (int n = begin; n < end; n++) {
					nwList.add(showHotList.get(n));
				}
				jsonArray = JSONArray.fromObject(nwList);

			}

			JSONObject result = new JSONObject();
			result.put("result", jsonArray);
			result.put("total", total);
			
			long loadEnd = System.currentTimeMillis();
			logger.info("loadEnd:" + DateFormatUtil.getWithMicroseconds(new Date(loadEnd)));
			logger.info("The total time consuming: " + (loadEnd - loadBegin) + " microseconds");
			
			ResponseUtil.write(response, result);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage(), e);
			throw new Exception(e);
		}
	}

	private int getHotListMaxSize(int newYork, int sanFrancisco, int london, int paris, int sydney) {

		int maxSize = newYork;
		if (maxSize < sanFrancisco) {
			maxSize = sanFrancisco;
		}
		if (maxSize < london) {
			maxSize = london;
		}
		if (maxSize < paris) {
			maxSize = paris;
		}
		if (maxSize < sydney) {
			maxSize = sydney;
		}
		return maxSize;
	}

	private QueryPortInfo getQueryPortInfo(HttpServletRequest request) {
		Integer depaPortid = Integer.valueOf(request.getParameter("qidian"));
		KongYunPort depaPort = KongYunPortService.getById(depaPortid);

		Integer destPortid = Integer.valueOf(request.getParameter("zhongdian"));
		KongYunPort destPort = KongYunPortService.getById(destPortid);

		int pageNo = 1;
		String regex = "[0-9]+";
		String startPoss = request.getParameter("pageno");// 当前页码
		if (startPoss != null && startPoss != "") {
			if (StringHelp.isNum(startPoss, regex)) {
				pageNo = Integer.parseInt(startPoss);
			}
		}
		if (pageNo < 0) {
			pageNo = 0;
		}
		QueryPortInfo portInfo = new QueryPortInfo();
		portInfo.setDepaPortChName(depaPort.getChPortName());// 起始港口中文名称
		portInfo.setDepaPortEnName(depaPort.getEnPortName());// 起始港口英文名称
		portInfo.setDepaPortAbbreviation(depaPort.getAirportCode());// 起始港口三字代码

		portInfo.setDestPortChName(destPort.getChPortName());// 终点港口中文名称
		portInfo.setDestPortEnName(destPort.getEnPortName());// 终点港口英文名称
		portInfo.setDestPortAbbreviation(destPort.getAirportCode());// 终点港口三字代码

		portInfo.setPageNo(pageNo);
		return portInfo;
	}

	private List<KongYun> getAllChKyList(HttpServletRequest request, Model model, QueryPortInfo portInfo)
			throws Exception {
		try {
			portInfo.setDepaPortChName(null);
			portInfo.setDepaPortEnName(null);
			portInfo.setDepaPortAbbreviation(null);
			List<KongYun> kongYunList = kongYunService.getAllKongYun(portInfo);
			return kongYunList;
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage(), e);
			throw new Exception(e);
		}
	}

	private void doAsynchronousThreadFetching(String depaPortEnName, String destPortEnName) {
		KongyunSpiderThread kySpider = new KongyunSpiderThread(depaPortEnName, destPortEnName);
		Thread spiderTh = new Thread(kySpider);
		spiderTh.start();
	}

	private List<KongYun> translateQidianportChNameToEnName(List<KongYun> nwList) {
		List<KongYun> resaultLst = new ArrayList<KongYun>();
		for (KongYun kYun : nwList) {
			String qidianPort = kYun.getQidianport();// 起始港口
			String zhongdianport = kYun.getZhongdianport();// 终点港口
			List<String> chinesePortLst = getChinesePort(qidianPort);
			for (String chinesePort : chinesePortLst) {
				String nwChinesePort = CityTranslateUtil.toEnglishName(chinesePort);
				qidianPort = qidianPort.replace(chinesePort, nwChinesePort + " ");
			}
			// 判断起始港口数据是否没有翻译成功，未成功的，放入机场数据
			if (qidianPort == null || "".equals(qidianPort.trim())) {
				kYun.setQidianport(kYun.getQiDianRegion());
			} else {
				kYun.setQidianport(qidianPort);
			}
			// 判断终点港口数据是否含有中文，含有的，放入机场数据
			if (StringHelp.isHasChinese(zhongdianport)) {
				kYun.setZhongdianport(kYun.getZhongDianRegion());
			}
			resaultLst.add(kYun);
		}
		return resaultLst;
	}

	// 获取中文港口数据中的中文名称
	private List<String> getChinesePort(String qidianPort) {
		if (qidianPort == null || "".equals(qidianPort)) {
			return null;
		}
		List<String> chinesePortLst = new ArrayList<String>();
		StringBuffer sb = new StringBuffer();
		int count = 0;
		for (int i = 0; i < qidianPort.length(); i++) {
			if (StringHelp.isChinese(qidianPort.charAt(i))) {
				count++;
				sb.append(qidianPort.charAt(i));
				// 如果是最后一个字符匹配成功，需要添加
				if (i == qidianPort.length() - 1) {
					chinesePortLst.add(sb.toString());
				}
			} else {
				if (count > 0) {
					if (sb.length() > 0) {
						chinesePortLst.add(sb.toString());
					}
				}
				count = 0;
				sb.delete(0, sb.length());
			}
		}
		return chinesePortLst;
	}

}
