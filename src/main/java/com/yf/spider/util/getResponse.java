package com.yf.spider.util;

import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.Connection.Response;
import org.jsoup.nodes.Document;

public class getResponse {

	// 发送请求，获取页面。
	public static Document getDocFromResponse(String url) {
		Document doc = null;

		for (int i = 0; i < 3; i++) {
			int statusCode = 0;
			String host = "";
			int port = 0;

			try {
				System.out.println("\n当前的代理IP：" + host + ":" + port);
				System.out.println("requesting url:" + url);
				Response response = null;
				if (i == 0) {
					// 默认第一次用本机IP发送请求。
					response = Jsoup.connect(url)
							.userAgent(
									"Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36")
							.timeout(30000).method(Connection.Method.GET).execute();
				} else {
					// 从第二次开始，使用代理IP发送请求。
					response = Jsoup.connect(url)
							.userAgent(
									"Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36")
							.timeout(30000).method(Connection.Method.GET).proxy(host, port).execute();
				}
				doc = response.parse();
				statusCode = response.statusCode();

				System.out.println("requests done,Status_code:" + statusCode);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				// e.printStackTrace();
			}
			if (statusCode == 200) {
				return doc;
			} else {
				// 获取一个随机的代理IP，暂停5秒，准备尝试再次连接。
				String[] proxyStrings = getProxies.getRandomProxyString().split(":");
				host = proxyStrings[0];
				port = Integer.parseInt(proxyStrings[1]);
				try {
					int delayTime = 3;
					System.out.println("暂停时间" + Integer.toString(delayTime) + "秒\n");
					Thread.sleep(delayTime * 1000);
				} catch (InterruptedException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}

		return doc;
	}
}
