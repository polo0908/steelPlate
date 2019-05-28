package com.yf.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateFormatUtil {
	
	public static String getWithMicroseconds(Date date){
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss:SSS");
		return df.format(date);
	}

}
