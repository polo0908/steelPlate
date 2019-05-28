package com.yf.spider.util;

import com.yf.spider.dataDeal.KongyunDataDeal;
import com.yf.spider.dataDeal.PinxiangDataDeal;
import com.yf.spider.dataDeal.ZhengguiDataDeal;

public class FreightSpiderDataDealUtil {

	public static void dealZhengguiData(String chinaPortEnName, String foreignPortEnName) {
		ZhengguiDataDeal zTdel = new ZhengguiDataDeal();
		zTdel.deleteOverdue(chinaPortEnName, foreignPortEnName);
		System.out.println("删除yf_zhengguitable表有效期小于当前时间的数据成功");
		zTdel.deleteShippingCompany(chinaPortEnName, foreignPortEnName);
		System.out.println("清理yf_zhengguitable表船公司不合理的数据成功");
		zTdel.deleteRepeat(chinaPortEnName, foreignPortEnName);
		System.out.println("删除yf_zhengguitable表完全重复的数据，调用mysql存储过程deal_yf_zhengguiData_repeat成功");
		zTdel.deleteUnreasonable(chinaPortEnName, foreignPortEnName);
		System.out.println("删除yf_zhengguitable表不合理数据成功");
		zTdel.takeOutUsd(chinaPortEnName, foreignPortEnName);
		System.out.println("去掉yf_zhengguitable表所有含有美元货币数据的货币单位成功");
		zTdel.changeToDollar(chinaPortEnName, foreignPortEnName);
		System.out.println("转换yf_zhengguitable表其他货币到美元成功");
		zTdel.clearComma(chinaPortEnName, foreignPortEnName);
		System.out.println("清除yf_zhengguitable表带有,的价格数据成功");
		zTdel.clearInterval(chinaPortEnName, foreignPortEnName);
		System.out.println("清除yf_zhengguitable表价格数据区间的数据成功");
		zTdel.deleteLess(chinaPortEnName, foreignPortEnName);
		System.out.println("删除yf_zhengguitable表可能存在是负数和0,1的数据成功");
		System.out.println("....yf_zhengguitable表执行完成!....\n");

	}

	public static void dealPinxiangData(String chinaPortEnName, String foreignPortEnName) {
		PinxiangDataDeal pxTbDel = new PinxiangDataDeal();
		pxTbDel.deleteOverdue(chinaPortEnName, foreignPortEnName);
		System.out.println("删除yf_pinxiangtable表有效期小于当前时间的数据成功");
		pxTbDel.deleteShippingCompany(chinaPortEnName, foreignPortEnName);
		System.out.println("清理yf_pinxiangtable表船公司不合理的数据成功");
		pxTbDel.deleteRepeat(chinaPortEnName, foreignPortEnName);
		System.out.println("删除yf_pinxiangtable表完全重复的数据，调用mysql存储过程deal_yf_pinxiangDate_repeat成功");
		pxTbDel.deleteUnreasonable(chinaPortEnName, foreignPortEnName);
		System.out.println("删除yf_pinxiangtable表不合理数据成功");
		pxTbDel.clearDataUnit(chinaPortEnName, foreignPortEnName);
		System.out.println("去掉yf_pinxiangtable表带有↓,↑,USD,/RT,/TON,/CBM,$,/KG,/方,cbm,()的价格数据成功");
		pxTbDel.changeToDollar(chinaPortEnName, foreignPortEnName);
		System.out.println("转换yf_pinxiangtable表其他货币单位到美元货币数据,欧,RMB成功");
		pxTbDel.clearComma(chinaPortEnName, foreignPortEnName);
		System.out.println("去掉yf_pinxiangtable表带有,的价格数据成功");
		pxTbDel.clearInterval(chinaPortEnName, foreignPortEnName);
		System.out.println("清除yf_pinxiangtable表价格数据区间的数据成功");
		pxTbDel.deleteLess(chinaPortEnName, foreignPortEnName);
		System.out.println("删除yf_pinxiangtable表可能存在是负数和0,1的数据成功");
		System.out.println("....yf_pinxiangtable表执行完成!....\n");
	}

	public static void dealKongyunData(String chinaPortEnName, String foreignPortEnName) {
		KongyunDataDeal kyTDel = new KongyunDataDeal();
		kyTDel.deleteOverdue(chinaPortEnName, foreignPortEnName);
		System.out.println("删除yf_kongyuntable表有效期小于当前时间的数据成功");
		kyTDel.deleteRepeat(chinaPortEnName, foreignPortEnName);
		System.out.println("删除yf_kongyuntable表完全重复的数据，调用mysql存储过程deal_yf_kongyunData_repeat成功");
		kyTDel.deleteUnreasonable(chinaPortEnName, foreignPortEnName);
		System.out.println("删除yf_kongyuntable表不合理数据成功");
		kyTDel.clearDataUnit(chinaPortEnName, foreignPortEnName);
		System.out.println("去掉yf_kongyuntable表带有/KG,KG,/K的价格数据成功");
		kyTDel.changeToDollar(chinaPortEnName, foreignPortEnName);
		System.out.println("转换yf_kongyuntable表其他货币单位到美元货币数据,元,RMB成功");
		kyTDel.clearInterval(chinaPortEnName, foreignPortEnName);
		System.out.println("清除yf_kongyuntable表价格数据区间的数据成功");
		kyTDel.deleteLess(chinaPortEnName, foreignPortEnName);
		System.out.println("删除yf_kongyuntable表可能存在是负数和0,1的数据成功");
		System.out.println("....yf_kongyuntable表执行完成!....\n");
	}

}
