package com.yf.controller;

import java.io.IOException;
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

import com.yf.bean.HaiYunPort;
import com.yf.bean.QueryPortInfo;
import com.yf.bean.ZhengGui;
import com.yf.service.HaiYunPortService;
import com.yf.service.ZhengGuiService;
import com.yf.spider.thread.ZhengguiSpiderThread;
import com.yf.util.CityTranslateUtil;
import com.yf.util.DateFormatUtil;
import com.yf.util.ResponseUtil;
import com.yf.util.StringHelp;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
@RequestMapping("/freight")
public class ZhengGuiController {

	public static Logger logger = Logger.getLogger(ZhengGuiController.class);

	@Resource
	private ZhengGuiService zhengGuiService;

	@Resource
	private HaiYunPortService haiYunPortService;

	/**
	 * 通过页面url得到数据进行查找
	 * 
	 * @param request
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("/getAllZhengGui")
	public void getAll(HttpServletRequest request, Model model, HttpServletResponse response) throws Exception {

		try {
			long queryBegin = System.currentTimeMillis();
			logger.info("queryBegin:" + DateFormatUtil.getWithMicroseconds(new Date(queryBegin)));

			QueryPortInfo portInfo = getQueryPortInfo(request);
			// 记录起始和终点港口的英文名称
			String depaPortEnName = portInfo.getDepaPortEnName();
			String destPortEnName = portInfo.getDestPortEnName();
			// 获取匹配后的有重复的数据
			List<ZhengGui> repeatZgList = zhengGuiService.getHasRepeatList(portInfo);
			// 处理重复的数据，显示每个重复数据的合理一条数据
			List<ZhengGui> nwRepeatZgList = getDealZgList(repeatZgList);
			// 获取没有重复的数据
			List<ZhengGui> noRepeatZgList = zhengGuiService.getNoRepeatList(portInfo);
			// 合并重复处理好的数据和没有重复的数据
			List<ZhengGui> showZgList = new ArrayList<ZhengGui>();
			if (nwRepeatZgList.size() > 0) {
				for (ZhengGui zGui : nwRepeatZgList) {
					showZgList.add(zGui);
				}
			}
			if (noRepeatZgList.size() > 0) {
				for (ZhengGui noZGui : noRepeatZgList) {
					showZgList.add(noZGui);
				}
			}
			if (showZgList.size() == 0) {
				showZgList = getAllChZxlist(portInfo);
				// 如果查询结果为0，则进行异步的线程直接抓取
				doAsynchronousThreadFetching(depaPortEnName, destPortEnName);
			}
			JSONObject result = new JSONObject();
			int begin = portInfo.getPageNo();
			int end = begin + 6;
			JSONArray jsonArray = null;
			// 设置分页显示效果的数据
			List<ZhengGui> nwList = new ArrayList<>();
			// 防止在异步抓取数据时显示不正常，默认显示第一页数据
			if (showZgList.size() <= begin) {
				result.put("pageNo", 0);
				begin = 0;
				end = 6;
			} else {
				result.put("pageNo", begin);
			}
			if (begin <= showZgList.size() && showZgList.size() <= end) {
				for (int m = begin; m < showZgList.size(); m++) {
					nwList.add(showZgList.get(m));
				}
			} else if (end <= showZgList.size()) {
				for (int n = begin; n < end; n++) {
					nwList.add(showZgList.get(n));
				}
			}
			// 翻译起始港口的中文数据
			List<ZhengGui> resaultLst = translateQidianportChNameToEnName(nwList);
			jsonArray = JSONArray.fromObject(resaultLst);
			result.put("result", jsonArray);
			result.put("total", showZgList.size());

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

	/**
	 * 直接获取热门港口的数据
	 * 
	 * @param request
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("/getZxHotPortList")
	public void getZxHotPortList(HttpServletRequest request, Model model, HttpServletResponse response)
			throws Exception {
		
		long loadBegin = System.currentTimeMillis();
		logger.info("loadBegin:" + DateFormatUtil.getWithMicroseconds(new Date(loadBegin)));
		
		// 分别查询热门终点港口数据，根据热门终点港口数据排列，每个港口按照顺序各自显示一条数据，依次排列
		QueryPortInfo newYorkPortInfo = new QueryPortInfo("NEW YORK", "纽约");
		QueryPortInfo losAngelesPortInfo = new QueryPortInfo("LOS ANGELES", "洛杉矶");
		QueryPortInfo felixstowePortInfo = new QueryPortInfo("FELIXSTOWE", "费力克斯托");
		QueryPortInfo hamburgPortInfo = new QueryPortInfo("HAMBURG", "汉堡");
		QueryPortInfo rotterdamPortInfo = new QueryPortInfo("ROTTERDAM", "鹿特丹");

		try {
			List<ZhengGui> newYorkList = getHotPortDealList(newYorkPortInfo);
			List<ZhengGui> losAngelesList = getHotPortDealList(losAngelesPortInfo);
			List<ZhengGui> felixstoweList = getHotPortDealList(felixstowePortInfo);
			List<ZhengGui> hamburgList = getHotPortDealList(hamburgPortInfo);
			List<ZhengGui> rotterdamList = getHotPortDealList(rotterdamPortInfo);

			// 获取五个列表的最大值
			int newYorkSize = newYorkList.size();
			int losAngelesSize = losAngelesList.size();
			int felixstoweSize = felixstoweList.size();
			int hamburgSize = hamburgList.size();
			int rotterdamSize = rotterdamList.size();
			int maxSize = getHotListMaxSize(newYorkSize, losAngelesSize, felixstoweSize, hamburgSize, rotterdamSize);

			// 循环获取每个列表的数据
			List<ZhengGui> showHotList = new ArrayList<ZhengGui>();
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
			List<ZhengGui> nwList = new ArrayList<>();
			if (begin <= total && total <= end) {
				for (int m = begin; m < total; m++) {
					nwList.add(showHotList.get(m));
				}
			} else if (end <= total) {
				for (int n = begin; n < end; n++) {
					nwList.add(showHotList.get(n));
				}
			}

			jsonArray = JSONArray.fromObject(nwList);

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

	private List<ZhengGui> getHotPortDealList(QueryPortInfo portInfo) throws Exception {

		try {
			// 获取匹配后的有重复的数据
			List<ZhengGui> repeatZgList = zhengGuiService.getHasRepeatList(portInfo);
			// 处理重复的数据，显示每个重复数据的合理一条数据
			List<ZhengGui> nwRepeatZgList = getDealZgList(repeatZgList);
			// 获取没有重复的数据
			List<ZhengGui> noRepeatZgList = zhengGuiService.getNoRepeatList(portInfo);
			// 合并重复处理好的数据和没有重复的数据
			if (noRepeatZgList.size() > 0) {
				nwRepeatZgList.addAll(noRepeatZgList);
			}
			// 热门港口的数据需要在处理重复数据完成后就翻译
			return translateQidianportChNameToEnName(nwRepeatZgList);
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

	private List<ZhengGui> getDealZgList(List<ZhengGui> repeatZgList) throws Exception {
		List<ZhengGui> nwDealZgList = new ArrayList<>();

		try {
			for (ZhengGui rpZGui : repeatZgList) {
				List<ZhengGui> singleRepeatLst = zhengGuiService.getMatchList(rpZGui);
				// 新建一个存放重复数据的list，过滤特殊格式的数据
				List<ZhengGui> nwSingleRepeatLst = new ArrayList<>();
				// 新建一个存放合理数据的list
				List<ZhengGui> nwNotRepeatLst = new ArrayList<>();
				// 判断HQ40无数据的直接跳出循环
				if (rpZGui.getHq40() != null && !"".equals(rpZGui.getHq40())) {
					// 按照整箱要求的HQ40进行数据的计算
					for (ZhengGui singZGui : singleRepeatLst) {
						String hq40 = singZGui.getHq40();
						// 如果当前hq40是含有小数点的数字字符串，则满足条件
						if (StringHelp.isNumberString(hq40)) {
							nwSingleRepeatLst.add(singZGui);
						} else {// 如果没有符合条件的数据，首先选择数据为数字和以+-结尾或+结尾的数据
								// 过滤特殊格式的数据：不接,/,NIL,stop,N/M,X,N/A,900alin,9.1号,NA目前有的格式
							boolean isNum = hq40.indexOf("不接") == -1 && hq40.indexOf("/") == -1
									&& (hq40.indexOf("nil") == -1 || hq40.indexOf("NIL") == -1)
									&& (hq40.indexOf("stop") == -1 || hq40.indexOf("STOP") == -1)
									&& (hq40.indexOf("n/m") == -1 || hq40.indexOf("N/M") == -1)
									&& (hq40.indexOf("x") == -1 || hq40.indexOf("X") == -1)
									&& (hq40.indexOf("na") == -1 || hq40.indexOf("NA") == -1)
									&& hq40.indexOf("900alin") == -1 && hq40.indexOf("9.1号") == -1;
							if (isNum) {
								// 匹配以+结尾的数据
								if (hq40.endsWith("+")) {
									// 截取前面的数据，判断是否符合价格的数据
									if (StringHelp.isNumberString(hq40.substring(0, hq40.length() - 1))) {
										nwSingleRepeatLst.add(singZGui);
									}
								} else if (hq40.endsWith("+-")) {// 匹配以+-结尾的数据
									// 截取前面的数据，判断是否符合价格的数据
									if (StringHelp.isNumberString(hq40.substring(0, hq40.length() - 2))) {
										nwSingleRepeatLst.add(singZGui);
									}
								}
							}
						}
					}

					// 如果还是没有符合条件的数据，选择数据为全英文的第一个数据,再没有数据则不选择此重复的数据
					if (nwSingleRepeatLst.size() == 0) {
						for (ZhengGui singZGui : singleRepeatLst) {
							if (StringHelp.isEnglishString(singZGui.getHq40())) {
								nwSingleRepeatLst.add(singZGui);
								break;
							}
						}
					}
					int mtTotal = nwSingleRepeatLst.size();
					// 大于3个的要使用正态分布算法
					if (mtTotal > 3) {
						// 计算平均数和标准差
						float sum = 0;
						for (ZhengGui nwZGui : nwSingleRepeatLst) {
							String hq40Str = nwZGui.getHq40();
							// 可用的数据的特殊格式有：1000+,1000+-
							if (hq40Str.endsWith("+")) {
								sum += Float.valueOf(hq40Str.substring(0, hq40Str.length() - 1));
							} else if (hq40Str.endsWith("+-")) {
								sum += Float.valueOf(hq40Str.substring(0, hq40Str.length() - 1));
							} else {
								sum += Float.valueOf(hq40Str);
							}
						}
						// 判断sum值是否合理，不合理就跳出计算,选取第一条数据
						if (sum > 0) {
							// 平均数
							float average = sum / mtTotal;
							float variance = 0;
							for (ZhengGui nwZGui : nwSingleRepeatLst) {
								variance += Math.pow(Float.valueOf(nwZGui.getHq40()) - average, 2);
							}
							// 标准差
							float deviation = (float) Math.sqrt(variance / mtTotal);
							for (ZhengGui nwZGui : nwSingleRepeatLst) {
								float hq40V = Float.valueOf(nwZGui.getHq40());
								// 在1σ内的数据就获取
								if (average - deviation <= hq40V && hq40V <= average + deviation) {
									nwNotRepeatLst.add(nwZGui);
									break;
								} else if (average - deviation * 2 <= hq40V && hq40V <= average) {// 在2σ小数据部分的数据就获取
									nwNotRepeatLst.add(nwZGui);
									break;
								} else if (average - deviation * 3 <= hq40V && hq40V <= average) {// 在3σ小数据部分的数据就获取
									nwNotRepeatLst.add(nwZGui);
									break;
								}
							}
						} else {
							nwNotRepeatLst.add(nwSingleRepeatLst.get(0));
						}

						//
					} else if (mtTotal == 3) {
						// 含有3个数据的选择中间的那个
						float oneV = Float.valueOf(nwSingleRepeatLst.get(0).getHq40());
						float twoV = Float.valueOf(nwSingleRepeatLst.get(1).getHq40());
						float threeV = Float.valueOf(nwSingleRepeatLst.get(2).getHq40());
						if ((twoV <= oneV && oneV <= threeV) || (threeV <= oneV && oneV <= twoV)) {
							nwNotRepeatLst.add(nwSingleRepeatLst.get(0));
						} else if ((oneV <= twoV && twoV <= threeV) || (threeV <= twoV && twoV <= oneV)) {
							nwNotRepeatLst.add(nwSingleRepeatLst.get(1));
						} else if ((oneV <= threeV && threeV <= twoV) || (twoV <= threeV && threeV <= oneV)) {
							nwNotRepeatLst.add(nwSingleRepeatLst.get(2));
						}
					} else if (mtTotal == 2) {
						// 含有两个数据的选择大的那个
						float oneV = Float.valueOf(nwSingleRepeatLst.get(0).getHq40());
						float twoV = Float.valueOf(nwSingleRepeatLst.get(1).getHq40());
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
						nwDealZgList.add(nwNotRepeatLst.get(0));
					}
				} else {
					// 选取当前数据后退出循环
					nwDealZgList.add(rpZGui);
					break;
				}
			}
			return nwDealZgList;
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

	private List<ZhengGui> getAllChZxlist(QueryPortInfo portInfo) throws Exception {
		try {
			// 去掉起点港口的数据
			portInfo.setDepaPortChName(null);
			portInfo.setDepaPortEnName(null);
			// 获取匹配后的有重复的数据
			List<ZhengGui> repeatZgList = zhengGuiService.getHasRepeatList(portInfo);
			// 处理重复的数据，显示每个重复数据的合理一条数据
			List<ZhengGui> nwRepeatZgList = getDealZgList(repeatZgList);

			// 获取没有重复的数据
			List<ZhengGui> noRepeatZgList = zhengGuiService.getNoRepeatList(portInfo);

			// 合并重复处理好的数据和没有重复的数据
			List<ZhengGui> showList = new ArrayList<ZhengGui>();
			if (nwRepeatZgList.size() > 0) {
				for (ZhengGui zGui : nwRepeatZgList) {
					showList.add(zGui);
				}
			}
			if (noRepeatZgList.size() > 0) {
				for (ZhengGui noZgui : noRepeatZgList) {
					showList.add(noZgui);
				}
			}
			return showList;
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage(), e);
			throw new Exception(e);
		}
	}

	// 异步线程抓取数据
	private void doAsynchronousThreadFetching(String depaPortEnName, String destPortEnName) {
		ZhengguiSpiderThread zgSpider = new ZhengguiSpiderThread(depaPortEnName, destPortEnName);
		Thread spiderTh = new Thread(zgSpider);
		spiderTh.start();
	}

	// 翻译起始港口中文到英文
	private List<ZhengGui> translateQidianportChNameToEnName(List<ZhengGui> nwList) {
		List<ZhengGui> resaultLst = new ArrayList<ZhengGui>();
		for (ZhengGui zGui : nwList) {
			String qidianPort = zGui.getQidianport();// 起始港口
			String zhongdianport = zGui.getZhongdianport();// 终点港口
			List<String> chinesePortLst = getChinesePort(qidianPort);
			for (String chinesePort : chinesePortLst) {
				String nwChinesePort = CityTranslateUtil.toEnglishName(chinesePort);
				qidianPort = qidianPort.replace(chinesePort, nwChinesePort + " ");
			}
			// 判断起始港口数据是否没有翻译成功，未成功的，放入地区数据
			if (qidianPort == null || "".equals(qidianPort.trim())) {
				zGui.setQidianport(zGui.getQiDianRegion());
			} else {
				zGui.setQidianport(qidianPort);
			}
			// 判断终点港口数据是否含有中文，含有的，放入地区数据
			if (StringHelp.isHasChinese(zhongdianport)) {
				zGui.setZhongdianport(zGui.getZhongDianRegion());
			}
			resaultLst.add(zGui);
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
