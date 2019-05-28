package com.yf.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yf.bean.HaiYunPort;
import com.yf.bean.PinXiang;
import com.yf.bean.QueryPortInfo;
import com.yf.service.HaiYunPortService;
import com.yf.service.PinXiangService;
import com.yf.spider.thread.PinxiangSpiderThread;
import com.yf.util.DateFormatUtil;
import com.yf.util.ResponseUtil;
import com.yf.util.StringHelp;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
@RequestMapping("/lclChinese")
public class LclController {

	public static Logger logger = Logger.getLogger(LclController.class);

	@Resource
	private PinXiangService pinXiangService;

	@Resource
	private HaiYunPortService haiYunPortService;

	@RequestMapping("/queryByLclPort")
	public void queryByLclPort(HttpServletRequest request, HttpServletResponse response) throws Exception {
		try {
			long queryBegin = System.currentTimeMillis();
			logger.info("queryBegin:" + DateFormatUtil.getWithMicroseconds(new Date(queryBegin)));

			QueryPortInfo portInfo = getQueryPortInfo(request);
			// 记录起始和终点港口的英文名称
			String depaPortEnName = portInfo.getDepaPortEnName();
			String destPortEnName = portInfo.getDestPortEnName();
			// 获取匹配后的有重复的数据
			List<PinXiang> repeatPxList = pinXiangService.getHasRepeatList(portInfo);
			// 处理重复的数据，显示每个重复数据的合理一条数据
			List<PinXiang> nwRepeatPxList = getDealPxList(repeatPxList);
			// 获取没有重复的数据
			List<PinXiang> noRepeatPxList = pinXiangService.getNoRepeatList(portInfo);
			// 合并重复处理好的数据和没有重复的数据
			List<PinXiang> showPxList = new ArrayList<PinXiang>();
			if (nwRepeatPxList.size() > 0) {
				for (PinXiang pXiang : nwRepeatPxList) {
					showPxList.add(pXiang);
				}
			}
			if (noRepeatPxList.size() > 0) {
				for (PinXiang noPxiang : noRepeatPxList) {
					showPxList.add(noPxiang);
				}
			}
			// 如果查询结果为0，则列出所有的从中国到这个 destination的数据
			if (showPxList.size() == 0) {
				showPxList = getAllChPxList(portInfo);
				// 如果查询结果为0，则进行异步的线程直接抓取
				doAsynchronousThreadFetching(depaPortEnName, destPortEnName);
			}
			int begin = portInfo.getPageNo();
			int end = begin + 6;
			JSONArray jsonArray = null;
			// 设置分页显示效果的数据
			JSONObject result = new JSONObject();
			// 防止在异步抓取数据时显示不正常，默认显示第一页数据
			if (showPxList.size() <= begin) {
				result.put("pageNo", 0);
				begin = 0;
				end = 6;
			} else {
				result.put("pageNo", begin);
			}
			List<PinXiang> nwList = new ArrayList<>();
			if (begin <= showPxList.size() && showPxList.size() <= end) {
				for (int m = begin; m < showPxList.size(); m++) {
					nwList.add(showPxList.get(m));
				}
			} else if (end <= showPxList.size()) {
				for (int n = begin; n < end; n++) {
					nwList.add(showPxList.get(n));
				}
			}
			jsonArray = JSONArray.fromObject(nwList);
			result.put("result", jsonArray);
			result.put("total", showPxList.size());

			long queryEnd = System.currentTimeMillis();
			logger.info("The total time consuming: " + (queryEnd - queryBegin) + " microseconds");
			logger.info("queryEnd:" + DateFormatUtil.getWithMicroseconds(new Date(queryEnd)));

			ResponseUtil.write(response, result);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage(), e);
			throw new Exception(e);
		}
	}

	@RequestMapping("/queryByHotPort")
	public void queryByHotPort(HttpServletRequest request, HttpServletResponse response) throws Exception {
		try {

			long loadBegin = System.currentTimeMillis();
			logger.info("loadBegin:" + DateFormatUtil.getWithMicroseconds(new Date(loadBegin)));

			// 分别查询热门终点港口数据，根据热门终点港口数据排列，每个港口按照顺序各自显示一条数据，依次排列
			QueryPortInfo newYorkPortInfo = new QueryPortInfo("NEW YORK", "纽约");
			QueryPortInfo losAngelesPortInfo = new QueryPortInfo("LOS ANGELES", "洛杉矶");
			QueryPortInfo felixstowePortInfo = new QueryPortInfo("FELIXSTOWE", "费力克斯托");
			QueryPortInfo hamburgPortInfo = new QueryPortInfo("HAMBURG", "汉堡");
			QueryPortInfo rotterdamPortInfo = new QueryPortInfo("ROTTERDAM", "鹿特丹");

			List<PinXiang> newYorkList = getHotPortDealList(newYorkPortInfo);
			List<PinXiang> losAngelesList = getHotPortDealList(losAngelesPortInfo);
			List<PinXiang> felixstoweList = getHotPortDealList(felixstowePortInfo);
			List<PinXiang> hamburgList = getHotPortDealList(hamburgPortInfo);
			List<PinXiang> rotterdamList = getHotPortDealList(rotterdamPortInfo);

			// 获取五个列表的最大值
			int newYorkSize = newYorkList.size();
			int losAngelesSize = losAngelesList.size();
			int felixstoweSize = felixstoweList.size();
			int hamburgSize = hamburgList.size();
			int rotterdamSize = rotterdamList.size();
			int maxSize = getHotListMaxSize(newYorkSize, losAngelesSize, felixstoweSize, hamburgSize, rotterdamSize);
			// 循环获取每个列表的数据
			List<PinXiang> showHotList = new ArrayList<PinXiang>();
			for (int i = 0; i < maxSize; i++) {
				if (i < newYorkSize) {
					showHotList.add(newYorkList.get(i));
				}
				if (i < losAngelesSize) {
					showHotList.add(losAngelesList.get(losAngelesSize - i - 1));
				}
				if (i < felixstoweSize) {
					showHotList.add(felixstoweList.get(i));
				}
				if (i < hamburgSize) {
					showHotList.add(hamburgList.get(hamburgSize - i - 1));
				}
				if (i < rotterdamSize) {
					showHotList.add(rotterdamList.get(i));
				}
			}
			int begin = 0;
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
				List<PinXiang> nwList = new ArrayList<>();
				for (int m = begin; m < total; m++) {
					nwList.add(showHotList.get(m));
				}
				jsonArray = JSONArray.fromObject(nwList);
			} else if (end <= total) {
				List<PinXiang> nwList = new ArrayList<>();
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

	private QueryPortInfo getQueryPortInfo(HttpServletRequest request) {
		Integer depaPortid = Integer.valueOf(request.getParameter("qidian"));
		HaiYunPort depaPort = haiYunPortService.getById(depaPortid);

		Integer destPortid = Integer.valueOf(request.getParameter("zhongdian"));
		HaiYunPort destPort = haiYunPortService.getById(destPortid);

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
		portInfo.setDepaPortChName(depaPort.getChportname());
		portInfo.setDepaPortEnName(depaPort.getEnportname());
		portInfo.setDestPortChName(destPort.getChportname());
		portInfo.setDestPortEnName(destPort.getEnportname());
		portInfo.setPageNo(pageNo);
		return portInfo;
	}

	private List<PinXiang> getDealPxList(List<PinXiang> repeatPxList) throws Exception {

		List<PinXiang> nwDealPxList = new ArrayList<>();

		try {
			for (PinXiang rpPXiang : repeatPxList) {
				List<PinXiang> singleRepeatLst = pinXiangService.getMatchList(rpPXiang);
				// 新建一个存放重复数据的list，过滤特殊格式的数据
				List<PinXiang> nwSingleRepeatLst = new ArrayList<>();
				// 新建一个存放合理数据的list
				List<PinXiang> nwNotRepeatLst = new ArrayList<>();
				// 判断CBM无数据的直接跳出循环
				if (rpPXiang.getCbm() != null && !"".equals(rpPXiang.getCbm())) {
					// 按照拼箱要求的CBM进行数据的计算
					for (PinXiang singPXiang : singleRepeatLst) {
						String cbm = singPXiang.getCbm();
						// 如果当前cbm是含有小数点的数字字符串，则满足条件
						if (StringHelp.isNumberString(cbm)) {
							nwSingleRepeatLst.add(singPXiang);
						}
					}

					// 如果还是没有符合条件的数据，选择数据为全英文的第一个数据,再没有数据则不选择此重复的数据
					if (nwSingleRepeatLst.size() == 0) {
						for (PinXiang singPXiang : singleRepeatLst) {
							if (StringHelp.isEnglishString(singPXiang.getCbm())) {
								nwSingleRepeatLst.add(singPXiang);
								break;
							}
						}
					}
					int mtTotal = nwSingleRepeatLst.size();
					// 大于3个的要使用正态分布算法
					if (mtTotal > 3) {
						// 计算平均数和标准差
						float sum = 0;
						for (PinXiang nwPXiang : nwSingleRepeatLst) {
							String cbmStr = nwPXiang.getCbm();
							// 目前无特殊的格式，直接做数据的计算，以后有了可以在此处添加判断语句
							sum += Float.valueOf(cbmStr);
						}
						// 判断sum值是否合理，不合理就跳出计算,选取第一条数据
						if (sum > 0) {
							// 平均数
							float average = sum / mtTotal;
							float variance = 0;
							for (PinXiang nwPXiang : nwSingleRepeatLst) {
								variance += Math.pow(Float.valueOf(nwPXiang.getCbm()) - average, 2);
							}
							// 标准差
							float deviation = (float) Math.sqrt(variance / mtTotal);
							for (PinXiang nwPXiang : nwSingleRepeatLst) {
								float cbmV = Float.valueOf(nwPXiang.getCbm());
								// 在1σ内的数据就获取
								if (average - deviation <= cbmV && cbmV <= average + deviation) {
									nwNotRepeatLst.add(nwPXiang);
									break;
								} else if (average - deviation * 2 <= cbmV && cbmV <= average) {// 在2σ小数据部分的数据就获取
									nwNotRepeatLst.add(nwPXiang);
									break;
								} else if (average - deviation * 3 <= cbmV && cbmV <= average) {// 在3σ小数据部分的数据就获取
									nwNotRepeatLst.add(nwPXiang);
									break;
								}
							}
						} else {
							nwNotRepeatLst.add(nwSingleRepeatLst.get(0));
						}

						//
					} else if (mtTotal == 3) {
						// 含有3个数据的选择中间的那个
						float oneV = Float.valueOf(nwSingleRepeatLst.get(0).getCbm());
						float twoV = Float.valueOf(nwSingleRepeatLst.get(1).getCbm());
						float threeV = Float.valueOf(nwSingleRepeatLst.get(2).getCbm());
						if ((twoV <= oneV && oneV <= threeV) || (threeV <= oneV && oneV <= twoV)) {
							nwNotRepeatLst.add(nwSingleRepeatLst.get(0));
						} else if ((oneV <= twoV && twoV <= threeV) || (threeV <= twoV && twoV <= oneV)) {
							nwNotRepeatLst.add(nwSingleRepeatLst.get(1));
						} else if ((oneV <= threeV && threeV <= twoV) || (twoV <= threeV && threeV <= oneV)) {
							nwNotRepeatLst.add(nwSingleRepeatLst.get(2));
						}
					} else if (mtTotal == 2) {
						// 含有两个数据的选择大的那个
						float oneV = Float.valueOf(nwSingleRepeatLst.get(0).getCbm());
						float twoV = Float.valueOf(nwSingleRepeatLst.get(1).getCbm());
						if (oneV <= twoV) {
							nwNotRepeatLst.add(nwSingleRepeatLst.get(0));
						} else {
							nwNotRepeatLst.add(nwSingleRepeatLst.get(1));
						}
					} else if (mtTotal == 1) {
						nwNotRepeatLst.add(nwSingleRepeatLst.get(0));
					}

					// 如果存在过滤后的数据就放入返回的List之内
					if (nwNotRepeatLst.size() >= 1) {
						nwDealPxList.add(nwNotRepeatLst.get(0));
					}
				} else {
					// 选取当前数据后退出循环
					nwDealPxList.add(rpPXiang);
					break;
				}
			}
			return nwDealPxList;
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage(), e);
			throw new Exception(e);
		}
	}

	private List<PinXiang> getAllChPxList(QueryPortInfo portInfo) throws Exception {
		try {
			// 去掉起点港口的数据
			portInfo.setDepaPortChName(null);
			portInfo.setDepaPortEnName(null);
			// 获取匹配后的有重复的数据
			List<PinXiang> repeatPxList = pinXiangService.getHasRepeatList(portInfo);
			// 处理重复的数据，显示每个重复数据的合理一条数据
			List<PinXiang> nwRepeatPxList = getDealPxList(repeatPxList);

			// 获取没有重复的数据
			List<PinXiang> noRepeatPxList = pinXiangService.getNoRepeatList(portInfo);

			// 合并重复处理好的数据和没有重复的数据
			List<PinXiang> showList = new ArrayList<PinXiang>();
			if (nwRepeatPxList.size() > 0) {
				for (PinXiang pXiang : nwRepeatPxList) {
					showList.add(pXiang);
				}
			}
			if (noRepeatPxList.size() > 0) {
				for (PinXiang noPxiang : noRepeatPxList) {
					showList.add(noPxiang);
				}
			}
			return nwRepeatPxList;
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage(), e);
			throw new Exception(e);
		}
	}

	private void doAsynchronousThreadFetching(String depaPortEnName, String destPortEnName) {
		PinxiangSpiderThread pxSpider = new PinxiangSpiderThread(depaPortEnName, destPortEnName);
		Thread spiderTh = new Thread(pxSpider);
		spiderTh.start();
	}

	private List<PinXiang> getHotPortDealList(QueryPortInfo portInfo) throws Exception {

		try {
			// 获取匹配后的有重复的数据
			List<PinXiang> repeatZgList = pinXiangService.getHasRepeatList(portInfo);
			// 处理重复的数据，显示每个重复数据的合理一条数据
			List<PinXiang> nwRepeatZgList = getDealPxList(repeatZgList);
			// 获取没有重复的数据
			List<PinXiang> noRepeatZgList = pinXiangService.getNoRepeatList(portInfo);
			// 合并重复处理好的数据和没有重复的数据
			if (noRepeatZgList.size() > 0) {
				nwRepeatZgList.addAll(noRepeatZgList);
			}
			// 热门港口的数据需要在处理重复数据完成后就翻译
			return nwRepeatZgList;
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage(), e);
			throw new Exception(e);
		}
	}

	private int getHotListMaxSize(int newYork, int felixstowe, int hamburg, int losAngeles, int rotterdam) {

		int maxSize = newYork;
		if (maxSize < felixstowe) {
			maxSize = felixstowe;
		}
		if (maxSize < hamburg) {
			maxSize = hamburg;
		}
		if (maxSize < losAngeles) {
			maxSize = losAngeles;
		}
		if (maxSize < rotterdam) {
			maxSize = rotterdam;
		}
		return maxSize;
	}

}
