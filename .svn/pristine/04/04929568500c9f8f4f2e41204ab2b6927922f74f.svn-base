package com.yf.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 获取当前时间
 * 
 * @since 2013-12-03
 */
public class DateFormat {

	/**
	 * 
	 * @param source
	 * @return
	 */
	public static String format()
	{
		long time = System.currentTimeMillis();
	  	Date date = new Date(time);    	
	  	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	  	String currentTime = sdf.format(date);
		
		
		return currentTime;
	}
	public static String formatDate1(String date) throws ParseException
	{
//		long time = System.currentTimeMillis();
//		Date date = new Date(time);    	
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date time = sdf.parse(date); 
		String currentTime = sdf.format(time);
		
		
		return currentTime;
	}


	public static String formatDate2(String date) throws ParseException
	{
//		long time = System.currentTimeMillis();
//		Date date = new Date(time);    	
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date time = sdf.parse(date); 
		String currentTime = sdf.format(time);
		
		
		return currentTime;
	}

	
	
}

