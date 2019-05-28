package com.yf.util;

import java.text.DecimalFormat;

public class NumberFormat {
  
	
	public static String number(String num){
		
		DecimalFormat df=new DecimalFormat("0000000");
		
		return df.format(num);
	}
}
