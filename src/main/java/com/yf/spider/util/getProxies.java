package com.yf.spider.util;

import java.util.Random;

public class getProxies {
	// public static Map<String,ArrayList> mapProxies = new HashMap<>();

	// 返回一个包含host和port的代理IP字符串供程序使用。
	public static String getRandomProxyString() {
		String proxies = "122.195.181.46:8888,121.12.149.18:2226,111.13.136.36:80,110.181.36.78:8888,"
				+ "117.36.197.152:3128,222.133.31.130:2226,211.143.155.228:80,123.57.190.51:7777,112.255.179.92:8888,"
				+ "211.138.156.209:80,112.228.87.46:8888,183.61.71.112:8888,112.226.254.225:8888,103.27.24.237:843";
		String[] proxiesList = proxies.split(",");
		Random rand = new Random();
		int i = rand.nextInt(proxiesList.length);
		return proxiesList[i];

	}

	public static void main(String[] args) {
		for (int i = 0; i < 100; i++) {
			System.out.println(getProxies.getRandomProxyString());
		}
	}
}
