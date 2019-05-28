package com.cal.util;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class WebCookie {
	public static String cookie(HttpServletRequest request, String cookiev) {
		Cookie[] cookie = request.getCookies();
		if (cookie != null) {
			for (Cookie cookie2 : cookie) {
				if (cookie2.getName().equals(cookiev)) {
					return cookie2.getValue();
				}
			}
		}
		return null;
	}
	
	public static String cookieValue(HttpServletRequest request, String cookiev) {
		Cookie[] cookie = request.getCookies();
		if (cookie != null) {
			for (Cookie cookie2 : cookie) {
				// LOG.warn("cookie:"+cookie2.getName()+","+cookie2.getValue());
				if (cookie2.getName().equals(cookiev)) {
					return cookie2.getValue();
				}
			}
		}
		return null;
	}

	/**
	 * 根据名字获取cookie
	 * 
	 * @param request
	 * @param name
	 *            cookie名字
	 * @return
	 */
	public static Cookie getCookieByName(HttpServletRequest request, String name) {
		Map<String, Cookie> cookieMap = ReadCookieMap(request);
		if (cookieMap.containsKey(name)) {
			Cookie cookie = cookieMap.get(name);
			return cookie;
		} else {
			return null;
		}
	}

	/**
	 *  * 将cookie封装到Map里面  * @param request  * @return  
	 */
	private static Map<String, Cookie> ReadCookieMap(HttpServletRequest request) {
		Map<String, Cookie> cookieMap = new HashMap<String, Cookie>();
		Cookie[] cookies = request.getCookies();
		if (null != cookies) {
			for (Cookie cookie : cookies) {
				cookieMap.put(cookie.getName(), cookie);
			}
		}
		return cookieMap;
	}

	/**
	 * 获取订单号
	 */
	public static String getQuote(HttpServletRequest request) {
		String quote = WebCookie.cookie(request, "quote");	
		if (quote != null) {
			try {
				quote = SecurityHelper.decrypt("quoteId", quote);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return quote;
		
	}
	
	
}
