package com.yf.spider.util;

import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import com.yf.spider.bean.KongyunItem;
import com.yf.spider.bean.PinxiangItem;
import com.yf.spider.bean.ZhengguiItem;
import com.yf.spider.dao.KongyunDao;
import com.yf.spider.dao.PinxiangDao;
import com.yf.spider.dao.ZhengguiDao;

public class FreightSpiderUtil {

	// 获取整箱的html并解析
	public static int getZhengguiInfoByPort(String chinaPortEnName, String foreignPortEnName) {
		String line = "对不起，该页面有错误、被更名，被删除或不存在！";
		int sum = 0;
		for (int i = 1; i <= 5; i++) {
			waitFunc(i);
			String url = "http://www.100allin.com/fcl/list-" + chinaPortEnName + "-" + foreignPortEnName
					+ "--0-0-0-----" + i + ".html";
			Document html = getResponse.getDocFromResponse(url);

			if (html == null) {
				System.out.println("获取网页为空,停止循环当前网页爬取!");
				break;
			}
			if (html.toString().contains(line)) {
				System.out.println("获取网页错误、被更名，被删除或不存在,停止循环当前网页爬取!");
				break;
			}
			int flagTotal = parseZhengguiPage(html, chinaPortEnName, foreignPortEnName);
			if (flagTotal == 0) {
				System.out.println("解析网页失败,停止循环当前网页爬取!");
				break;
			} else {
				sum += flagTotal;
			}
			int pageTotal = getPageTotal(html);
			if (pageTotal <= i) {
				System.out.println("获取总页数：" + pageTotal + ",小于等于循环页数:" + i + ",停止循环当前网页爬取!");
				break;
			}
		}
		return sum;
	}

	// 获取拼箱的html并解析
	public static int getPinXiangInfoByPort(String chinaPortEnName, String foreignPortEnName) {
		String line = "对不起，该页面有错误、被更名，被删除或不存在！";
		int sum = 0;
		for (int i = 1; i <= 5; i++) {
			waitFunc(i);
			String url = "http://www.100allin.com/lcl/list-" + chinaPortEnName + "-" + foreignPortEnName
					+ "--0-0-0-----" + i + ".html";
			Document html = getResponse.getDocFromResponse(url);

			if (html == null) {
				System.out.println("获取网页为空,停止循环当前网页爬取!");
				break;
			}
			if (html.toString().contains(line)) {
				System.out.println("获取网页错误、被更名，被删除或不存在,停止循环当前网页爬取!");
				break;
			}
			int flagTotal = parsePinxiangPage(html, chinaPortEnName, foreignPortEnName);
			if (flagTotal == 0) {
				System.out.println("解析网页失败,停止循环当前网页爬取!");
				break;
			} else {
				sum += flagTotal;
			}
			int pageTotal = getPageTotal(html);
			if (pageTotal <= i) {
				System.out.println("获取总页数：" + pageTotal + ",小于等于循环页数:" + i + ",停止循环当前网页爬取!");
				break;
			}
		}
		return sum;
	}

	// 获取空运的html并解析
	public static int getKongyunInfoByPort(String chinaPortEnName, String foreignPortEnName) {
		String line = "对不起，该页面有错误、被更名，被删除或不存在！";
		int sum = 0;
		for (int i = 1; i <= 3; i++) {
			waitFunc(i);
			String url = "http://www.100allin.com/air/list-" + chinaPortEnName + "-" + foreignPortEnName
					+ "--0-0-0-----" + i + ".html";
			Document html = getResponse.getDocFromResponse(url);
			if (html == null) {
				System.out.println("获取网页为空,停止循环当前网页爬取!");
				break;
			}
			if (html.toString().contains(line)) {

				System.out.println("获取网页错误、被更名，被删除或不存在,停止循环当前网页爬取!");
				break;
			}
			int flagToal = parseKongYunPage(html, i, chinaPortEnName, foreignPortEnName);
			if (flagToal == 0) {
				System.out.println("解析网页失败,停止循环当前网页爬取!");
				break;
			} else {
				sum += flagToal;
			}
			int pageTotal = getPageTotal(html);
			if (pageTotal <= i) {
				System.out.println("获取总页数：" + pageTotal + ",小于等于循环页数:" + i + ",停止循环当前网页爬取!");
				break;
			}
		}
		return sum;

	}

	// 解析整箱的html数据
	private static int parseZhengguiPage(Document doc, String chinaPortEnName, String foreignPortEnName) {
		int total = 0;
		Elements lis = doc.getElementsByTag("form").first().getElementsByAttributeValueContaining("class", "result")
				.first().getElementsByClass("result-left").first().getElementsByClass("box-bd").first()
				.getElementsByTag("ul").first().getElementsByClass("freight-row");
		for (Element li : lis) {
			String youXiaoQi = li.select("div.valid").first().text().replace("有效期至 ", "");
			String huoDaiCompany = li.select("div.company").first().select("a").first().text();
			String chuanCompany = li.select("div.carrier").first().text().trim();
			String title = li.select("div.title>h3>a").first().text();

			Elements ports = li.select("div.port").first().getElementsByTag("div");
			String qiDianPort = ports.eq(1).text();
			String zhongDianPort = ports.last().text();

			Elements freightDls = li.select("div.freight").first().getElementsByTag("dl");
			String gP20 = freightDls.first().select("dd").first().text();
			String gP40 = freightDls.eq(1).select("dd").first().text();
			String hQ20 = freightDls.last().select("dd").first().text();

			ZhengguiItem zgi = new ZhengguiItem(youXiaoQi.trim(), huoDaiCompany.trim(), chuanCompany.trim(),
					qiDianPort.trim(), zhongDianPort.trim(), chinaPortEnName, foreignPortEnName, gP20.trim(),
					gP40.trim(), hQ20.trim(), title.trim());
			System.out.println(zgi);
			ZhengguiDao zgd = new ZhengguiDao();
			zgd.addZhenggui(zgi);
			total++;
		}
		return total;
	}

	// 解析拼箱html数据
	private static int parsePinxiangPage(Document doc, String chinaPortEnName, String foreignPortEnName) {
		int total = 0;
		Elements lis = doc.getElementsByTag("form").first()
				.getElementsByAttributeValueContaining("class", "container result").first()
				.getElementsByClass("result-left").first().getElementsByClass("box-bd").first().getElementsByTag("ul")
				.first().getElementsByClass("freight-row");
		for (Element li : lis) {
			String youXiaoQi = li.select("div.valid").first().text().replace("有效期至 ", "");
			String huoDaiCompany = li.select("div.company").first().select("a").first().text();
			String chuanCompany = li.select("div.carrier").first().text().trim();
			String title = li.select("div.title>h3>a").first().text();

			Elements ports = li.select("div.port").first().getElementsByTag("div");
			String qiDianPort = ports.eq(1).text();
			String zhongDianPort = ports.last().text();

			Elements freightDls = li.select("div.freight").first().getElementsByTag("dl");
			String KGS = freightDls.first().select("dd").first().text();
			String CBM = freightDls.eq(1).select("dd").first().text();

			PinxiangItem pxi = new PinxiangItem(youXiaoQi.trim(), huoDaiCompany.trim(), chuanCompany.trim(),
					qiDianPort.trim(), zhongDianPort.trim(), chinaPortEnName, foreignPortEnName, KGS.trim(), CBM.trim(),
					title.trim());
			System.out.println(pxi);
			PinxiangDao pxd = new PinxiangDao();
			pxd.addPinxiang(pxi);
			total++;
		}
		return total;
	}

	// 解析空运html数据
	private static int parseKongYunPage(Document doc, int i, String chinaPortEnName, String foreignPortEnName) {
		int total = 0;
		Elements lis = doc.getElementsByTag("form").first().getElementsByAttributeValueContaining("class", "result")
				.first().getElementsByClass("result-left").first().getElementsByClass("box-bd").first()
				.getElementsByTag("ul").first().getElementsByClass("freight-row");

		for (Element li : lis) {
			Element elFlag = li.select("div.order-desc>a").first();
			// 针对特殊的置顶条目，从第二页开始不再载入数据库。
			if (elFlag != null && i > 1)
				continue;
			String youXiaoQi = li.select("div.valid").first().text().replace("有效期至 ", "");
			String huoDaiCompany = li.select("div.company").first().select("a").first().text();
			String title = li.select("div.title>h3>a").first().text();

			Elements ports = li.select("div.port").first().getElementsByTag("div");
			String qiDianPort = ports.eq(1).text();
			String zhongDianPort = ports.last().text();

			Elements freightDls = li.select("div.freight.freight-air").first().getElementsByTag("dl");
			String plus45 = freightDls.eq(0).select("dd").first().text();
			String plus100 = freightDls.eq(1).select("dd").first().text();
			String plus300 = freightDls.eq(2).select("dd").first().text();
			String plus500 = freightDls.eq(3).select("dd").first().text();
			String plus1000 = freightDls.eq(4).select("dd").first().text();

			KongyunItem kyi = new KongyunItem(youXiaoQi.trim(), huoDaiCompany.trim(), qiDianPort.trim(),
					zhongDianPort.trim(), chinaPortEnName, foreignPortEnName, plus45.trim(), plus100.trim(),
					plus300.trim(), plus500.trim(), plus1000.trim(), title.trim());
			System.out.println(kyi);
			KongyunDao kyd = new KongyunDao();
			kyd.addKongyun(kyi);
			total++;
		}
		return total;
	}

	// 针对有起点和终点地区港口的数据，可以获取最终的页数，每次循环后此数据会变化的，一直到获取完全的数据
	private static int getPageTotal(Document html) {
		int pageTotal = 0;
		Elements divPager = html.getElementsByTag("form").first()
				.getElementsByAttributeValueContaining("class", "result").first().getElementsByClass("result-left")
				.first().getElementsByClass("box-bd").first().getElementsByClass("pager");
		int spanNum = divPager.first().getElementsByTag("span").size();
		String numStr = divPager.first().getElementsByTag("span").get(spanNum - 3).html();
		if (numStr != null && !"".equals(numStr)) {
			pageTotal = Integer.valueOf(numStr);
		}
		return pageTotal;
	}

	// 设置每抓取3页或者5页一个长一点的暂停。
	public static void waitFunc(int i) {
		try {
			System.out.println();
			if (i % 3 == 0 || i % 5 == 0) {
				System.out.println("暂停时间3秒");
				Thread.sleep(3000);
			} else {
				System.out.println("暂停时间2秒");
				Thread.sleep(2000);
			}
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
	}

}
