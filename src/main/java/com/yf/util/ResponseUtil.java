package com.yf.util;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

public class ResponseUtil {
	
	public static void write(HttpServletResponse response,Object object)throws Exception{
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json; charset=UTF-8");
		PrintWriter out=response.getWriter();
		out.println(object);
		out.flush();
		out.close();
	}
}
