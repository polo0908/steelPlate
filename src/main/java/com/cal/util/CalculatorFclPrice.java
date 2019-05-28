package com.cal.util;

import java.math.BigDecimal;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 计算平均价格
 * 
 * @since 
 */
public class CalculatorFclPrice {
	
	
	public static final Double weight1 = 18.0;
	public static final Double space1 = 24.0;
	public static final Double weight2 = 22.0;
	public static final Double space2 = 54.0;
	public static final Double weight3 = 22.0; 
	public static final Double space3 = 68.0;

	
	
	/**
	 * 
	 * @param source
	 * @return
	 */
	public static Double calculatePrice(Double weight,Double space,Double gp20AvgPrice,Double gp40AvgPrice,Double hq40AvgPrice){
        
		//根据重量计算的柜数
		int quantity1 = new BigDecimal(weight).divide(new BigDecimal(weight1)).setScale(0, BigDecimal.ROUND_UP).intValue();
		//根据体积计算的柜数
		int quantity2 = new BigDecimal(space).divide(new BigDecimal(space1)).setScale(0, BigDecimal.ROUND_UP).intValue(); 
		int q = quantity1 > quantity2 ? quantity1 : quantity2;
		
		
		
		
		return 0.0;
	}

}

