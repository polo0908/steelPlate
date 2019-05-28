package com.yf.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yf.bean.KongYun;
import com.yf.bean.QueryPortInfo;
import com.yf.dao.KongYunMapper;
import com.yf.dao.KongYunPortMapper;
import com.yf.service.KongYunService;

@Service
public class KongYunServiceImpl implements KongYunService {
	@Resource
	private KongYunMapper kongYunMapper;
	@Resource
	private KongYunPortMapper kongYunPortMapper;

	@Override
	public List<KongYun> getAllKongYun(QueryPortInfo portInfo) {
		// String qiDianPort = request.getParameter("qidian");
		// String zhongDianPort = request.getParameter("zhongdian");
		// String cbm = request.getParameter("cbm");// 立方米
		// String cubicFoot = request.getParameter("cubicfoot");// 立方尺
		// String kgs = request.getParameter("kgs");// kg
		// String lb = request.getParameter("lb");// 磅
		// String page = request.getParameter("pageno");
		// String regex = "[0-9]+";
		// double convertkg = 0.45359237;// lb转换为kg的
		// double convertcbm = 1;// 这个是接收的立方尺转换的为立方米
		// int pageNo = 1;// 当前页面
		//
		// if (page != null && page != "") {
		// if (StringHelp.isNum(page, regex)) {
		// pageNo = Integer.valueOf(page);
		// }
		// }
		//
		// if (pageNo <= 0) {
		// pageNo = 1;
		// }
		// if (lb != null && lb != "") {
		// if (StringHelp.isNum(lb, regex)) {
		// convertkg = new BigDecimal(Integer.valueOf(lb) *
		// 0.45359237).setScale(2, BigDecimal.ROUND_HALF_UP)
		// .doubleValue();
		// }
		// }
		// if (kgs != null && kgs != "") {
		// if (StringHelp.isNum(kgs, regex)) {
		// convertkg = Integer.valueOf(kgs);
		// }
		// }
		// if (cubicFoot != null && cubicFoot != "") {
		// if (StringHelp.isNum(cubicFoot, regex)) {
		// convertcbm = new BigDecimal(Integer.valueOf(cubicFoot) *
		// 0.028316846592)
		// .setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
		// }
		// }
		// if (cbm != null && cbm != "") {
		// if (StringHelp.isNum(cbm, regex)) {
		// convertcbm = Integer.valueOf(cbm);
		// }
		// }
		// model.addAttribute("convertkg", convertkg);
		// model.addAttribute("convertcbm", convertcbm);
		// model.addAttribute("qiDianPort", qiDianPort);
		// model.addAttribute("zhongDianPort", zhongDianPort);
		return kongYunMapper.getAllKongYun(portInfo);
	}

	@Override
	public Long getAllCount(QueryPortInfo portInfo) {
		return kongYunMapper.getAllCount(portInfo);
	}

	@Override
	public List<KongYun> getHotKongYun() {
		// TODO Auto-generated method stub
		return kongYunMapper.getHotKongYun();
	}

}
