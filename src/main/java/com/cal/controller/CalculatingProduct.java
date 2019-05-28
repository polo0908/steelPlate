package com.cal.controller;

import java.io.Serializable;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.text.DecimalFormat;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.log4j.Logger;

import com.cal.bean.OrderDetails;
import com.cal.util.SerializeUtil;


public class CalculatingProduct implements Serializable {
     
    /**
	 * 各种类型材料计算方法
	 */
	private static final long serialVersionUID = 1L;
	private static final double PAI = 3.14;
	
	
	public static OrderDetails calculate(String parameterMm,String parameterInch,Integer priceUnit,
			Integer goodsTypeId,Integer set,Double density){
		  OrderDetails orderDetails = new OrderDetails();   	   	
		  
		   Map<Object, Object> map = SerializeUtil.JsonToMap(parameterMm);		   
		   Map<Object, Object> map1 = SerializeUtil.JsonToMap(parameterInch);		   
		   DecimalFormat df = new DecimalFormat("0.0000000");//格式化小数，不足的补0
		   DecimalFormat df1 = new DecimalFormat("0.00");
		   //单个重量
		   Double weight = 0.0;
		   orderDetails.setWeightUnit("ton");
		   //单个面积
		   Double superficialArea = 0.0;
		   orderDetails.setSuperficialAreaUnit("m^2");
		   //单个体积
		   Double space = 0.0;
		   orderDetails.setSpaceUnit("m^3");
		   //单个材料价格
		   Double price = 0.0;
		   
//	   System.out.println(map);
		   if(goodsTypeId == 0){    		   
		
			   if(map.get("Width") != null && !"".equals(map.get("Width"))  && 
				  map.get("Thickness") != null && !"".equals(map.get("Thickness")) && 
				  map.get("Length") != null && !"".equals(map.get("Length"))){
				   Double w = Double.valueOf(map.get("Width").toString());
				   Double t = Double.valueOf(map.get("Thickness").toString());
				   Double l = Double.valueOf(map.get("Length").toString());
				   Double w1 = Double.valueOf(map1.get("Width").toString());
				   w1 = new BigDecimal(w1).setScale(2, RoundingMode.HALF_UP).doubleValue();
				   Double t1 = Double.valueOf(map1.get("Thickness").toString());
				   t1 = new BigDecimal(t1).setScale(2, RoundingMode.HALF_UP).doubleValue();
				   Double l1 = Double.valueOf(map1.get("Length").toString());
				   l1 = new BigDecimal(l1).setScale(2, RoundingMode.HALF_UP).doubleValue();
				   space =  (w*t*l)/1000000000;    		   
				   superficialArea = l*w*0.000001;
				   weight = space * density;
				   orderDetails.setSpace(Double.parseDouble(df.format(space)));
				   orderDetails.setWeight(Double.parseDouble(df.format(weight)));
				   orderDetails.setSuperficialArea(Double.parseDouble(df.format(superficialArea)));	
				   orderDetails.setProductSize(w+"*"+t+"*"+l+" mm");
				   orderDetails.setProductSizeInch(w1+"*"+t1+"*"+l1+" inch");
				   price = priceUnit * weight;
				   
//			   //查询利润率
//			   ProfitManagment p1 = profitManagmentService.queryById(1);
//			   ProfitManagment p2 = profitManagmentService.queryById(2);
//			   if(price > p1.getPrice()){
//				   orderDetails.setProfitRate(p1.getProfitRate()); 
//				   orderDetails.setProfitManagment(0.0);
//			   }else{
//				   orderDetails.setProfitRate(p2.getProfitRate());
//			   }
				   orderDetails.setUnitPrice(Double.parseDouble(df1.format(price)));
//			   orderDetails.setTax(0.0);
				   
				   orderDetails.setPrice(Double.parseDouble(df1.format(price)));

			   }    		   
		   }
		   if(goodsTypeId == 1){
			   if(map.get("Outer Dia.") != null && map.get("Outer Dia.") != "" && 
		    	  map.get("Thickness") != null && map.get("Thickness") != "" && 
		    	  map.get("Length") != null && map.get("Length") != ""){
				   Object object = map.get("Outer Dia.");
				   Object object1 = map.get("Outer Dia.");
				   Double d = Double.valueOf(object.toString());
				   Double d1 = Double.valueOf(object1.toString());
				   d1 = new BigDecimal(d1).setScale(2, RoundingMode.HALF_UP).doubleValue();
				   
				   d = d/1000;
				   Double t = Double.valueOf(map.get("Thickness").toString());
				   Double t1 = Double.valueOf(map1.get("Thickness").toString());
				   t1 = new BigDecimal(t1).setScale(2, RoundingMode.HALF_UP).doubleValue();
				   t = t/1000;
				   Double l = Double.valueOf(map.get("Length").toString()); 
				   Double l1 = Double.valueOf(map1.get("Length").toString()); 
				   l1 = new BigDecimal(l1).setScale(2, RoundingMode.HALF_UP).doubleValue();
				   l = l/1000;
			       space = (PAI*((d/2)*(d/2)-(d/2-t)*(d/2-t))*l);

			       superficialArea = PAI*d*l;
		       
			       weight = space * density;
			       orderDetails.setSpace(Double.parseDouble(df.format(space)));
				   orderDetails.setWeight(Double.parseDouble(df.format(weight)));
				   orderDetails.setSuperficialArea(Double.parseDouble(df.format(superficialArea)));	
				   orderDetails.setProductSize(d*1000+"*"+t*1000+"*"+l*1000+" mm");
				   orderDetails.setProductSizeInch(d1+"*"+t1+"*"+l1+" inch");
				   price = priceUnit * weight;  			    
				   orderDetails.setUnitPrice(Double.parseDouble(df1.format(price)));
				   
				   orderDetails.setPrice(Double.parseDouble(df1.format(price)));
		           
			   }
		   }
		   if(goodsTypeId == 2){
			   if(map.get("Width A") != null && map.get("Width A") != "" && 
				  map.get("Width B") != null && map.get("Width B") != "" && 
				  map.get("Length") != null && map.get("Length") != "" && 
				  map.get("Thickness") != null && map.get("Thickness") != "" ){
				   Double a = Double.valueOf(map.get("Width A").toString());
				   Double b = Double.valueOf(map.get("Width B").toString());
				   Double l = Double.valueOf(map.get("Length").toString());
				   Double t = Double.valueOf(map.get("Thickness").toString());  
				   Double a1 = Double.valueOf(map1.get("Width A").toString());
				   a1 = new BigDecimal(a1).setScale(2, RoundingMode.HALF_UP).doubleValue();
				   Double b1 = Double.valueOf(map1.get("Width B").toString());
				   b1 = new BigDecimal(b1).setScale(2, RoundingMode.HALF_UP).doubleValue();
				   Double l1 = Double.valueOf(map1.get("Length").toString());
				   l1 = new BigDecimal(l1).setScale(2, RoundingMode.HALF_UP).doubleValue();
				   Double t1 = Double.valueOf(map1.get("Thickness").toString());  
				   t1 = new BigDecimal(t1).setScale(2, RoundingMode.HALF_UP).doubleValue();

				   space = (a*b+(a-2*t)*(b-2*t))*l/1000000000;
				   superficialArea = (a+b+a+b)*l/1000000;
				   weight = space * density;
				   orderDetails.setSpace(Double.parseDouble(df.format(space)));
				   orderDetails.setWeight(Double.parseDouble(df.format(weight)));
				   orderDetails.setSuperficialArea(Double.parseDouble(df.format(superficialArea)));	
				   orderDetails.setProductSize(a+"*"+b+"*"+t+"*"+l+" mm");
				   orderDetails.setProductSizeInch(a1+"*"+b1+"*"+t1+"*"+l1+" inch");
				   price = priceUnit * weight;
				   
				   orderDetails.setUnitPrice(Double.parseDouble(df1.format(price)));
				   
				   orderDetails.setPrice(Double.parseDouble(df1.format(price)));

			   }
		   }
		   if(goodsTypeId == 3){
			   if(map.get("Diameter") != null && map.get("Diameter") != "" && 
					   map.get("Length") != null && map.get("Length") != "" ){
				   Double d = Double.valueOf(map.get("Diameter").toString());
				   Double l = Double.valueOf(map.get("Length").toString());   
				   Double d1 = Double.valueOf(map1.get("Diameter").toString());
				   d1 = new BigDecimal(d1).setScale(2, RoundingMode.HALF_UP).doubleValue();
				   Double l1 = Double.valueOf(map1.get("Length").toString());   
				   l1 = new BigDecimal(l1).setScale(2, RoundingMode.HALF_UP).doubleValue();
				   
				   space = (d*d*PAI/4*l)/1000000000;
				   superficialArea = PAI*d*l/1000000;
				   weight = space * density;
				   orderDetails.setSpace(Double.parseDouble(df.format(space)));
				   orderDetails.setWeight(Double.parseDouble(df.format(weight)));
				   orderDetails.setSuperficialArea(Double.parseDouble(df.format(superficialArea)));	
				   orderDetails.setProductSize(d+"*"+l+" mm");
				   orderDetails.setProductSizeInch(d1+"*"+l1+" inch");
				   price = priceUnit * weight;
				   
				   orderDetails.setUnitPrice(Double.parseDouble(df1.format(price)));
				   orderDetails.setPrice(Double.parseDouble(df1.format(price)));
			   }
		   }
		   if(goodsTypeId == 4){
			   if(map.get("Width") != null && map.get("Width") != "" && 
			      map.get("Height") != null && map.get("Height") != "" && 
			      map.get("Thickness t") != null && map.get("Thickness t") != "" && 
			      map.get("Thickness d") != null && map.get("Thickness d") != "" &&
			      map.get("Length") != null && map.get("Length") != "" ){
				   Double w = Double.valueOf(map.get("Width").toString());
				   Double h = Double.valueOf(map.get("Height").toString());   
				   Double t = Double.valueOf(map.get("Thickness t").toString()); 
				   Double d = Double.valueOf(map.get("Thickness d").toString());   
				   Double l = Double.valueOf(map.get("Length").toString());     
				   Double w1 = Double.valueOf(map1.get("Width").toString());
				   w1 = new BigDecimal(w1).setScale(2, RoundingMode.HALF_UP).doubleValue();
				   Double h1 = Double.valueOf(map1.get("Height").toString()); 
				   h1 = new BigDecimal(h1).setScale(2, RoundingMode.HALF_UP).doubleValue();
				   Double t1 = Double.valueOf(map1.get("Thickness t").toString()); 
				   t1 = new BigDecimal(t1).setScale(2, RoundingMode.HALF_UP).doubleValue();
				   Double d1 = Double.valueOf(map1.get("Thickness d").toString());  
				   d1 = new BigDecimal(d1).setScale(2, RoundingMode.HALF_UP).doubleValue();
				   Double l1 = Double.valueOf(map1.get("Length").toString());  
				   l1 = new BigDecimal(l1).setScale(2, RoundingMode.HALF_UP).doubleValue();

				   space = (w*d*2+(h-2d)*t)*l/1000000000;
				   superficialArea = (w*4+h*2)*l/1000000;
				   weight = space * density;
				   orderDetails.setSpace(Double.parseDouble(df.format(space)));
				   orderDetails.setWeight(Double.parseDouble(df.format(weight)));
				   orderDetails.setSuperficialArea(Double.parseDouble(df.format(superficialArea)));	
				   orderDetails.setProductSize(w+"*"+h+"*"+t+"*"+d+"*"+l+" mm");
				   orderDetails.setProductSizeInch(w1+"*"+h1+"*"+t1+"*"+d1+"*"+l1+" inch");
				   price = priceUnit * weight;
				   
				   orderDetails.setUnitPrice(Double.parseDouble(df1.format(price)));
				   orderDetails.setPrice(Double.parseDouble(df1.format(price)));
			   }
		   }
		   
		   if(goodsTypeId == 5){
			   if(map.get("Width a") != null && map.get("Width a") != "" && 
				   map.get("Width b") != null && map.get("Width b") != "" && 
				   map.get("Thickness") != null && map.get("Thickness") != "" && 
				   map.get("Length") != null && map.get("Length") != "" ){
				   Double a = Double.valueOf(map.get("Width a").toString()); 
				   Double b = Double.valueOf(map.get("Width b").toString());   
				   Double t = Double.valueOf(map.get("Thickness").toString());  
				   Double l = Double.valueOf(map.get("Length").toString());   
				   
				   Double a1 = Double.valueOf(map1.get("Width a").toString()); 
				   a1 = new BigDecimal(a1).setScale(2, RoundingMode.HALF_UP).doubleValue();
				   Double b1 = Double.valueOf(map1.get("Width b").toString()); 
				   b1 = new BigDecimal(b1).setScale(2, RoundingMode.HALF_UP).doubleValue();
				   Double t1 = Double.valueOf(map1.get("Thickness").toString()); 
				   t1 = new BigDecimal(t1).setScale(2, RoundingMode.HALF_UP).doubleValue();
				   Double l1 = Double.valueOf(map1.get("Length").toString());   
				   l1 = new BigDecimal(l1).setScale(2, RoundingMode.HALF_UP).doubleValue();
				   
				   space = (a+b-t)*t*l/1000000000;
				   superficialArea = (a+b)*2*l/1000000;
				   weight = space * density;
				   orderDetails.setSpace(Double.parseDouble(df.format(space)));
				   orderDetails.setWeight(Double.parseDouble(df.format(weight)));
				   orderDetails.setSuperficialArea(Double.parseDouble(df.format(superficialArea)));	
				   orderDetails.setProductSize(a+"*"+b+"*"+t+"*"+l+" mm");
				   orderDetails.setProductSizeInch(a1+"*"+b1+"*"+t1+"*"+l1+" inch");
				   price = priceUnit * weight;
				   
				   orderDetails.setUnitPrice(Double.parseDouble(df1.format(price)));
				   orderDetails.setPrice(Double.parseDouble(df1.format(price)));

			   }
		   }
		   if(goodsTypeId == 6){
			   if(map.get("Width") != null && map.get("Width") != "" &&     				  
				  map.get("Thickness") != null && map.get("Thickness") != "" && 
				  map.get("Length") != null && map.get("Length") != "" ){
				   Double w = Double.valueOf(map.get("Width").toString());  
				   Double t = Double.valueOf(map.get("Thickness").toString());  
				   Double l = Double.valueOf(map.get("Length").toString());    
				   Double w1 = Double.valueOf(map1.get("Width").toString());  
				   w1 = new BigDecimal(w1).setScale(2, RoundingMode.HALF_UP).doubleValue();
				   Double t1 = Double.valueOf(map1.get("Thickness").toString());  
				   t1 = new BigDecimal(t1).setScale(2, RoundingMode.HALF_UP).doubleValue();
				   Double l1 = Double.valueOf(map1.get("Length").toString()); 
				   l1 = new BigDecimal(l1).setScale(2, RoundingMode.HALF_UP).doubleValue();
				   
				   space = w*t*l/1000000000;
				   superficialArea = (w+t)*2*l/1000000;
				   weight = space * density;
				   orderDetails.setSpace(Double.parseDouble(df.format(space)));
				   orderDetails.setWeight(Double.parseDouble(df.format(weight)));
				   orderDetails.setSuperficialArea(Double.parseDouble(df.format(superficialArea)));	
				   orderDetails.setProductSize(w+"*"+t+"*"+l+" mm");
				   orderDetails.setProductSizeInch(w1+"*"+t1+"*"+l1+" inch");
				   price = priceUnit * weight ;
				   
				   orderDetails.setUnitPrice(Double.parseDouble(df1.format(price)));
				   orderDetails.setPrice(Double.parseDouble(df1.format(price)));

			   }
		   }
		   if(goodsTypeId == 7){
			   if(map.get("Width") != null && map.get("Width") != "" &&     				  
					   map.get("Height") != null && map.get("Height") != "" && 
					   map.get("Length") != null && map.get("Length") != "" ){
				   Double w = Double.valueOf(map.get("Width").toString());  
				   Double h = Double.valueOf(map.get("Height").toString());   
				   Double l = Double.valueOf(map.get("Length").toString());   
				   
				   Double w1 = Double.valueOf(map1.get("Width").toString());  
				   w1 = new BigDecimal(w1).setScale(2, RoundingMode.HALF_UP).doubleValue();
				   Double h1 = Double.valueOf(map1.get("Height").toString());   
				   h1 = new BigDecimal(h1).setScale(2, RoundingMode.HALF_UP).doubleValue();
				   Double l1 = Double.valueOf(map1.get("Length").toString());   
				   l1 = new BigDecimal(l1).setScale(2, RoundingMode.HALF_UP).doubleValue();
				   
				   space = w*h*l/1000000000;
				   superficialArea = (w+h)*2*l/1000000;
				   weight = space * density;
				   orderDetails.setSpace(Double.parseDouble(df.format(space)));
				   orderDetails.setWeight(Double.parseDouble(df.format(weight)));
				   orderDetails.setSuperficialArea(Double.parseDouble(df.format(superficialArea)));	
				   orderDetails.setProductSize(w+"*"+h+"*"+l+" mm");
				   orderDetails.setProductSizeInch(w1+"*"+h1+"*"+l1+" inch");
				   price = priceUnit * weight;
				   orderDetails.setUnitPrice(Double.parseDouble(df1.format(price)));
				   orderDetails.setPrice(Double.parseDouble(df1.format(price)));

			   }
		   }
		   if(goodsTypeId == 8){
			   if(map.get("Height") != null && map.get("Height") != "" && 
					   map.get("Thickness d") != null && map.get("Thickness d") != "" &&
					   map.get("Avg thk") != null && map.get("Avg thk") != "" &&
					   map.get("Width") != null && map.get("Width") != "" && 
					   map.get("Length") != null && map.get("Length") != "" ){
				   Double h = Double.valueOf(map.get("Height").toString());   
				   Double d = Double.valueOf(map.get("Thickness d").toString());   
				   Double avg = Double.valueOf(map.get("Avg thk").toString());    
				   Double w = Double.valueOf(map.get("Width").toString());   
				   Double l = Double.valueOf(map.get("Length").toString());   
				   
				   Double h1 = Double.valueOf(map1.get("Height").toString());   
				   h1 = new BigDecimal(h1).setScale(2, RoundingMode.HALF_UP).doubleValue();
				   Double d1 = Double.valueOf(map1.get("Thickness d").toString());  
				   d1 = new BigDecimal(d1).setScale(2, RoundingMode.HALF_UP).doubleValue();
				   Double avg1 = Double.valueOf(map1.get("Avg thk").toString());    
				   avg1 = new BigDecimal(avg1).setScale(2, RoundingMode.HALF_UP).doubleValue();
				   Double w1 = Double.valueOf(map1.get("Width").toString());   
				   w1 = new BigDecimal(w1).setScale(2, RoundingMode.HALF_UP).doubleValue();
				   Double l1 = Double.valueOf(map1.get("Length").toString());   
				   l1 = new BigDecimal(l1).setScale(2, RoundingMode.HALF_UP).doubleValue();
				   
				   space = ((w+w)*avg+h*d-avg*d*2)*l/1000000000;
				   superficialArea = (h+w*2)*l*2/1000000;
				   weight = space * density;
				   orderDetails.setSpace(Double.parseDouble(df.format(space)));
				   orderDetails.setWeight(Double.parseDouble(df.format(weight)));
				   orderDetails.setSuperficialArea(Double.parseDouble(df.format(superficialArea)));	
				   orderDetails.setProductSize(h+"*"+d+"*"+avg+"*"+w+"*"+l+" mm");
				   orderDetails.setProductSizeInch(h1+"*"+d1+"*"+avg1+"*"+w1+"*"+l1+" inch");
				   price = priceUnit * weight;
				   
				   orderDetails.setUnitPrice(Double.parseDouble(df1.format(price)));
				   
				   orderDetails.setPrice(Double.parseDouble(df1.format(price)));

			   }
		   }
		
		
		
		
		
		
		
		
		
		
		
		return orderDetails;
	}
	
	
}
