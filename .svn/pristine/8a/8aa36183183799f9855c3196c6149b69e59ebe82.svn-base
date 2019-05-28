package com.cal.controller;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cal.bean.AmountUnit;
import com.cal.bean.ClientOrder;
import com.cal.bean.GoodsTypeInfo;
import com.cal.bean.MaterialInfo;
import com.cal.bean.OrderDetails;
import com.cal.bean.ProcessDetails;
import com.cal.bean.ProcessInfo;
import com.cal.service.AmountUnitService;
import com.cal.service.ClientOrderService;
import com.cal.service.GoodsTypeInfoService;
import com.cal.service.MaterialInfoService;
import com.cal.service.OrderDetailsService;
import com.cal.service.ProcessDetailsService;
import com.cal.service.ProcessInfoService;
import com.cal.service.ProfitManagmentService;
import com.cal.util.DateFormat;
import com.cal.util.SerializeUtil;

@Controller
@RequestMapping("/calculator")
public class ProcessInfoController {
	
	public static Logger logger = Logger.getLogger(ProcessInfoController.class);
	
	
    @Resource
    private OrderDetailsService orderDetailsService;
    @Resource
    private ClientOrderService clientOrderService;
    @Resource
    private ProcessInfoService processInfoService;
    @Resource
    private ProcessDetailsService processDetailsService;
    @Resource
    private AmountUnitService amountUnitService;
    @Resource
    private ProfitManagmentService profitManagmentService;
    @Resource
    private GoodsTypeInfoService goodsTypeInfoService;
    @Resource
    private MaterialInfoService materialInfoService;
    
    /**
     * 查询所有工艺
     * @param request
     * @param response
     * @return
     */
    @RequestMapping("/queryAllProcess.do")
    public String queryAllProcess(HttpServletRequest request, HttpServletResponse response){
    	try {
    		Integer orderDetailsId = null;
			 if(request.getParameter("orderDetailsId") == null || "".equals(request.getParameter("orderDetailsId"))){
				throw new RuntimeException("orderDetailsId can not empty");
			 }else{
			 orderDetailsId = Integer.parseInt(request.getParameter("orderDetailsId"));
			 }
			 OrderDetails orderDetails = orderDetailsService.queryById(orderDetailsId);	     
			 List<ProcessDetails> processDetails = processDetailsService.queryByOrderDetailsId(orderDetailsId);	 
			 List<List<ProcessInfo>> list2 = new ArrayList<List<ProcessInfo>>();
			 List<ProcessInfo> list = new ArrayList<ProcessInfo>();
			 List<ProcessInfo> processInfo = new ArrayList<ProcessInfo>();
			 for (ProcessDetails processDetails2 : processDetails) {
				 list = processInfoService.queryByLevel1(processDetails2.getLevel1Parameter());
				 ProcessInfo p = processInfoService.queryById(processDetails2.getGoodsProcessId());
				 list2.add(list);
				 processInfo.add(p);
			}
			
			 GoodsTypeInfo goodsTypeInfo = goodsTypeInfoService.queryById(orderDetails.getGoodsTypeId());
			 MaterialInfo materialInfo = materialInfoService.queryById(orderDetails.getMaterialId());
			 List<ProcessInfo> processInfos = processInfoService.queryAll();
			
			 request.setAttribute("goodsType", goodsTypeInfo.getGoodsType());
			 request.setAttribute("materialType", materialInfo.getMaterialType());	     
			 request.setAttribute("list2", list2);
			 request.setAttribute("processInfos", processInfos);
			 request.setAttribute("orderDetails", orderDetails);
			 request.setAttribute("processDetails", processDetails);
			 request.setAttribute("processInfo", processInfo);
			 request.setAttribute("type", request.getParameter("type"));
			 request.setAttribute("detailCode", request.getParameter("detailCode"));
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			e.printStackTrace();
		}

    	return "calculator2.jsp";
    }
    
    /**
     * 根据选择的工艺查询参数
     * @param request
     * @param response
     * @return
     */
    @ResponseBody
    @RequestMapping("/queryByProcess.do")
    public JsonResult<List<ProcessInfo>> queryByProcess(HttpServletRequest request, HttpServletResponse response){
    	List<ProcessInfo> processInfos = null;
		try {
			String level1 = request.getParameter("level1");
			processInfos = processInfoService.queryByLevel1(level1);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			e.printStackTrace();
		}
    	return new JsonResult<List<ProcessInfo>>(processInfos);
    }
     
    /**
     * 保存工艺信息
     * @param request
     * @param response
     * @return
     */
    @RequestMapping("/saveProcessDetails.do")
    public String saveProcessDetails(HttpServletRequest request, HttpServletResponse response){
    	 try {
			Integer orderDetailsId = null;
			 if(request.getParameter("orderDetailsId") == null || "".equals(request.getParameter("orderDetailsId"))){
				throw new RuntimeException("orderDetailsId can not empty");
			 }else{
			 orderDetailsId = Integer.parseInt(request.getParameter("orderDetailsId"));
			 }
			//判断产品是否存在工艺，如果存在，进行删除处理
			List<ProcessDetails> processDetails = processDetailsService.queryByOrderDetailsId(orderDetailsId);   	
			if(processDetails.size() != 0){
				processDetailsService.deleteByOrderDetailsId(orderDetailsId);
			}
			
			OrderDetails o = orderDetailsService.queryById(orderDetailsId);   	
			ClientOrder c = clientOrderService.queryByQuoteId(o.getQuoteId());
			Integer totalSets = c.getTotalSets(); 
			  String process = request.getParameter("process");
			  //产品工艺价格（单个零件价）
			  Double productProcessPrice = 0.0;
   
			  ArrayList<Map<Object, Object>> list = new ArrayList<Map<Object,Object>>();   
			  
			  if(!(process == null || "".equals(process))){  
				        
				 if(process.endsWith(",")){
					process = process.substring(0,process.length()-1);
					}
                     
				 	String[] split = process.split(",");
//				 	System.out.println(split);
					for (int i = 0; i < split.length; i++) {
						ProcessInfo processInfo = new ProcessInfo();
						String[] split2 = split[i].split("%");
						Map<Object,Object> map= new HashMap<Object,Object>();
						String level1 = null;
						if(!( split2[0].replaceFirst(".", "") == null || "".equals(split2[0].replaceFirst(".", "")))){
							level1 = split2[0].replaceFirst(".", "");
						}
						String level2 = "";
						if(!( split2[1].replaceFirst(".", "") == null || "".equals(split2[1].replaceFirst(".", "")))){
							level2 = split2[1].replaceFirst(".", "");
						}
						
						Double level3Parameter = 0.0;
						if(!( split2[2].replaceFirst(".", "") == null || "".equals(split2[2].replaceFirst(".", "")))){
							level3Parameter = Double.parseDouble(split2[2].replaceFirst(".", ""));
						}
						Integer outsideSurface = 0;   			
						if(!( split2[3].replaceFirst(".", "") == null || "".equals(split2[3].replaceFirst(".", "")))){
							outsideSurface = Integer.parseInt(split2[3].replaceFirst(".", ""));
						}
						Integer insideSurface = 0;
						if(!( split2[4].replaceFirst(".", "") == null || "".equals(split2[4].replaceFirst(".", "")))){
							insideSurface = Integer.parseInt(split2[4].replaceFirst(".", ""));
						}
						processInfo = processInfoService.queryByProcess(level1, level2);
						Double unitPrice = 0.0;
						if(!(processInfo.getUnitPrice() == null || "".equals(processInfo.getUnitPrice()))){
							unitPrice = processInfo.getUnitPrice();							
						}
						Double processPrice = 0.0;
						//根据国家获取汇率
				    	AmountUnit amountUnit = amountUnitService.queryByCurrency("人民币");
				    	Double exchangeRate = amountUnit.getExchangeRate();
				    	
				    	//判断是否是表面积处理
				    	//当outsideSurface、insideSurface不为0，代表进行表面积处理
				    	if(!(outsideSurface == 0 || insideSurface == 0)){
				    		if(!(outsideSurface == null || "".equals(outsideSurface))){
								  if(outsideSurface == 1){
									  productProcessPrice += level3Parameter * unitPrice /exchangeRate; 
									  processPrice += unitPrice * level3Parameter/exchangeRate;
								  }						 						  
							     
							  }
							  if(!(insideSurface == null || "".equals(insideSurface))){
								   if(insideSurface == 1){
									   productProcessPrice += unitPrice * level3Parameter /exchangeRate;  
									   processPrice += unitPrice * level3Parameter/exchangeRate;
								    }			
							  }	   
				    	}else{
				    		processPrice = unitPrice * level3Parameter/exchangeRate;
				    		
				    		//热镀锌、冷镀锌根据重量计算
				    		if("Hot dip galvanizing".equals(processInfo.getLevel1())){
				    		  Map<Object, Object> map1 = SerializeUtil.JsonToMap(o.getParameterMm());
				    		    if(map1.get("Thickness") != null && !"".equals(map1.get("Thickness"))){		
				    			Double thick = Double.parseDouble(map1.get("Thickness").toString()); 
				    			//热镀锌算法
	                            processPrice = 12.674*Math.pow(thick,4)-226.4*Math.pow(thick,3) + 1858.2*Math.pow(thick,2) - 7397.8*thick + 14017 - 0.2412 * Math.pow(thick,5);
								processPrice = processPrice * 0.75 * o.getWeight();
				    		    }else{
								processPrice = 	o.getWeight() * 1000 * 5 * 0.75;
								}
				    		}else if("Cold galvanizing".equals(processInfo.getLevel1())){
				    			//冷镀锌算法
				    			processPrice = 	o.getWeight() * 1000 * 2.5 * 0.75;
				    		}
					    	//当价格小于0.01，按照0.01收费
					    	if(processPrice < 0.01){
					    		processPrice = 0.01;
					    	}
				    		 productProcessPrice += processPrice;
				    		
				    	}	
				    	
				    	
				    	
				    	map.put("orderDetailsId", orderDetailsId);
				    	map.put("goodsProcessId", processInfo.getId());
						map.put("level1Parameter", level1);
						map.put("level2Parameter", level2);
						map.put("level3Parameter", level3Parameter);				
						map.put("unitPrice", processInfo.getUnitPrice());
						map.put("unit", processInfo.getUnit());
						map.put("outsideSurface", outsideSurface);
						map.put("insideSurface", insideSurface);
						map.put("processPrice", processPrice );
			          
						list.add(map);
						
					}		  
			  }
			 
	   
			     /**
				   * 计算工艺价格，并且计算利润费管理费、税费     MIN(10%,0.000001*price+0.02)
				   */	
				   o.setProductProcessPrice(productProcessPrice);
				   Double u_price = new BigDecimal(productProcessPrice).add(new BigDecimal(o.getPrice())).doubleValue();
				   o.setUnitPrice(u_price);
			  	   orderDetailsService.updateOrderDetails(o); 
				   List<OrderDetails> list1 = orderDetailsService.queryByQuoteId(o.getQuoteId());
				   Double ws = 0.0;
				   Double prs = 0.0;
				   Double sps = 0.0;
				   Double totalProcess = 0.0;
				   if(list1.size() != 0){
					   for (OrderDetails orderDetails2 : list1) {
						 ws +=orderDetails2.getGoodsSet()*orderDetails2.getWeight();  
						 prs +=orderDetails2.getUnitPrice() * orderDetails2.getGoodsSet();
						 sps +=orderDetails2.getSpace() * orderDetails2.getGoodsSet();
						 totalProcess +=orderDetails2.getProductProcessPrice() * orderDetails2.getGoodsSet();
					  }
					  c.setTotalSets(totalSets);
					  c.setTotalWeight(totalSets*ws);
					  c.setTotalSpace(totalSets*sps);
					  Double price = new BigDecimal(totalSets).multiply(new BigDecimal(prs)).doubleValue();					  
					  /*
					   * 计算给予客户的优惠(10000USD开始给优惠)
					   * MAX(10%,0.000001*price+0.02)
					   * 最大给予10%工艺优惠
					   * 
					   */
					  Double profitRate = 0.15;
					  Double offer = 0.0;
					  Double profitManagment = 0.0;
					  Double discount = 0.0;
					  Double tax = 0.0;
					  if(price >= 10000){
						  offer = 0.000001 * price + 0.02;
						  if(offer <= 0.10){
							  profitRate = new BigDecimal(profitRate).subtract(new BigDecimal(offer)).setScale(6, BigDecimal.ROUND_HALF_UP).doubleValue();
							  c.setProfitRate(profitRate); 
							  profitManagment = new BigDecimal(totalProcess).multiply(new BigDecimal(profitRate)).setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
							  discount = new BigDecimal(totalProcess).multiply(new BigDecimal(totalSets)).multiply(new BigDecimal(offer)).setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
							  tax = (new BigDecimal(totalProcess).add(new BigDecimal(profitManagment))).multiply(new BigDecimal(0.17)).doubleValue();
							  c.setProfitManagment(profitManagment);
							  c.setTax(tax);
							  c.setDiscount(discount);
						  }else{
							  profitRate = new BigDecimal(profitRate).subtract(new BigDecimal(0.10)).setScale(6, BigDecimal.ROUND_HALF_UP).doubleValue();
							  c.setProfitRate(profitRate); 
							  profitManagment = new BigDecimal(totalProcess).multiply(new BigDecimal(profitRate)).setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
							  discount = new BigDecimal(totalProcess).multiply(new BigDecimal(totalSets)).multiply(new BigDecimal(0.10)).setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
							  tax = (new BigDecimal(totalProcess).add(new BigDecimal(profitManagment))).multiply(new BigDecimal(0.17)).doubleValue();
							  c.setProfitManagment(profitManagment);
							  c.setTax(tax);
							  c.setDiscount(discount);
						  }
						  						  						  
					  }else{
						  c.setProfitRate(profitRate);
						  profitManagment = new BigDecimal(totalProcess).multiply(new BigDecimal(profitRate)).setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
						  tax = (new BigDecimal(totalProcess).add(new BigDecimal(profitManagment))).multiply(new BigDecimal(0.17)).doubleValue();
						  c.setProfitManagment(profitManagment);
						  c.setTax(tax);
						  c.setDiscount(0.0);
					  }
					  Double finalPrice = new BigDecimal(prs).add(new BigDecimal(profitManagment)).add(new BigDecimal(tax)).setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
					  c.setTotalPrice(new BigDecimal(totalSets).multiply(new BigDecimal(finalPrice)).setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue());
					  c.setFinallyPrice(finalPrice);
				   }
			   logger.info("clientOrder:"+c);			  
			   processDetailsService.insertProcessDetails(list, c);
			   
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			e.printStackTrace();
			
		}
    	   
    	   
    	return "calculator3.jsp";
    }
    
    
    /**
     * 跳转物料清单界面
     * @param request
     * @param response
     * @return
     */
    @RequestMapping("/queryBom.do")
    public String queryBom(HttpServletRequest request, HttpServletResponse response){
    	try {
			List<AmountUnit> amountUnits = amountUnitService.queryAll();
			String quoteId = null;
			if(!(request.getParameter("quoteId") == null || "".equals(request.getParameter("quoteId")))){
				quoteId = request.getParameter("quoteId");
			}      
			List<OrderDetails> orderDetails = orderDetailsService.queryByQuoteId(quoteId);
			ClientOrder clientOrder = clientOrderService.queryByQuoteId(quoteId);
			
			List<GoodsTypeInfo> list1 = new ArrayList<GoodsTypeInfo>();
			List<MaterialInfo> list3 = new ArrayList<MaterialInfo>();
			List<List<ProcessDetails>> processDetails = new ArrayList<List<ProcessDetails>>();
			String type = "";
			List<String> types = new ArrayList<String>();
			List<Double> totalMaterialPrice = new ArrayList<Double>();
			List<Double> totalProcessPrice = new ArrayList<Double>();
			List<Map<Object, Object>> unitMaterialPrice = new ArrayList<Map<Object, Object>>();
			
			//获取订单汇率
			AmountUnit amountUnit = amountUnitService.queryById(clientOrder.getAmountUnit());
			
			for (OrderDetails orderDetails2 : orderDetails) {  
				String goodsType = goodsTypeInfoService.queryById(orderDetails2.getGoodsTypeId()).getGoodsType();
				String materialType = materialInfoService.queryById(orderDetails2.getMaterialId()).getMaterialType();
				Double materialPrice = new BigDecimal(orderDetails2.getPrice()).multiply(new BigDecimal(orderDetails2.getGoodsSet())).setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
				Double processPrice = new BigDecimal(orderDetails2.getProductProcessPrice()).multiply(new BigDecimal(orderDetails2.getGoodsSet())).setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
				type = goodsType+"/"+materialType;			    	  
				types.add(type);
				totalMaterialPrice.add(materialPrice);
				totalProcessPrice.add(processPrice);
				
				//查询工艺详情
				List<ProcessDetails> p = processDetailsService.queryByOrderDetailsId(orderDetails2.getId());
				processDetails.add(p);
				
				//保存产品价格
				Map<Object, Object> calculateUnitPrice = calculateUnitPrice(materialType, goodsType, amountUnit.getExchangeRate());
				unitMaterialPrice.add(calculateUnitPrice);
			}   	
 
			List<GoodsTypeInfo> goodsTypeInfos = goodsTypeInfoService.queryAll();
			GoodsTypeInfo goodsTypeInfo = goodsTypeInfoService.queryById(0);
			List<MaterialInfo> materialInfos = materialInfoService.queryByGoodsType("Plates");
			List<ProcessInfo> processInfos = processInfoService.queryAll();
			List<ProcessInfo> list4 = processInfoService.queryByLevel1("punching");
			AmountUnit unitCNY = amountUnitService.queryByCurrencyShorthand("CNY");
			
			request.setAttribute("amountUnits", amountUnits);
			request.setAttribute("amountUnit", amountUnit);
			request.setAttribute("unitCNY", unitCNY);
			request.setAttribute("orderDetails", orderDetails);
			request.setAttribute("processInfos", processInfos);
			request.setAttribute("goodsTypeInfo", goodsTypeInfo);
			request.setAttribute("goodsTypeInfos", goodsTypeInfos);
			request.setAttribute("materialInfos", materialInfos);
			request.setAttribute("list3", list3); 
			request.setAttribute("list1", list1);
			request.setAttribute("clientOrder", clientOrder);
			request.setAttribute("list4", list4);
			request.setAttribute("types", types);
			request.setAttribute("totalMaterialPrice", totalMaterialPrice);
			request.setAttribute("totalProcessPrice", totalProcessPrice);
			request.setAttribute("processDetails", processDetails);
			request.setAttribute("unitMaterialPrice", unitMaterialPrice);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			e.printStackTrace();
		}
    	return "calculator3.jsp";
    }

    
  /**
  * 更新单个产品详情
  * @param request
  * @param response
  * @return
  */
 @RequestMapping("/toUpdateProcess.do")
 public String updateProcess(HttpServletRequest request, HttpServletResponse response){
         try {
			Integer orderDetailsId = null;
			 if(request.getParameter("orderDetailsId") == null || "".equals(request.getParameter("orderDetailsId"))){
				throw new RuntimeException("orderDetailsId can not empty");
			 }else{
			 orderDetailsId = Integer.parseInt(request.getParameter("orderDetailsId"));
			 }
			 OrderDetails orderDetails = orderDetailsService.queryById(orderDetailsId);	     
			 List<ProcessDetails> processDetails = processDetailsService.queryByOrderDetailsId(orderDetailsId);	 
			 List<List<ProcessInfo>> list2 = new ArrayList<List<ProcessInfo>>();
			 List<ProcessInfo> list = new ArrayList<ProcessInfo>();
			 List<ProcessInfo> processInfo = new ArrayList<ProcessInfo>();
			 for (ProcessDetails processDetails2 : processDetails) {
				 list = processInfoService.queryByLevel1(processDetails2.getLevel1Parameter());
				 ProcessInfo p = processInfoService.queryById(processDetails2.getGoodsProcessId());
				 list2.add(list);
				 processInfo.add(p);
			}
			GoodsTypeInfo goodsTypeInfo = goodsTypeInfoService.queryById(orderDetails.getGoodsTypeId());
			MaterialInfo materialInfo = materialInfoService.queryById(orderDetails.getMaterialId());
			List<ProcessInfo> processInfos = processInfoService.queryAll();
			
			 request.setAttribute("goodsType", goodsTypeInfo.getGoodsType());
			 request.setAttribute("materialType", materialInfo.getMaterialType());	     
			 request.setAttribute("list2", list2);
			 request.setAttribute("processInfos", processInfos);
			 request.setAttribute("orderDetails", orderDetails);
			 request.setAttribute("processDetails", processDetails);
			 request.setAttribute("processInfo", processInfo);
		} catch (NumberFormatException e) {
			logger.error(e.getMessage(), e);
			e.printStackTrace();
		}
	     
 	    return "calculator2_review.jsp";
 }
   
    
    
    
    /**
     * 保存订单信息(未使用)
     * @param request
     * @param response
     * @return
     */
    @RequestMapping("/saveOrderDetails.do")
    public String saveOrderDetails(HttpServletRequest request, HttpServletResponse response){
    	
    	
    	ClientOrder clientOrder = null; 
	    ArrayList<Map<Object, Object>> list2 = new ArrayList<Map<Object,Object>>();
		try {
			String quoteId = request.getParameter("quoteId");
			if(quoteId == null || "".equals(quoteId)){
				throw new RuntimeException("quoteId can not empty!");
			}
			clientOrder = clientOrderService.queryByQuoteId(quoteId);
			Integer totalSets = 1;
			if(!(request.getParameter("totalSets") == null || "".equals(request.getParameter("totalSets")))){
				totalSets = Integer.parseInt(request.getParameter("totalSets"));
				clientOrder.setTotalSets(totalSets);
			}else{
				clientOrder.setTotalSets(totalSets);
			}
			String orderDetails = request.getParameter("orderDetails");
    
			 if(orderDetails.endsWith(",")){
				 orderDetails = orderDetails.substring(0,orderDetails.length()-1);
				}
			 String[] split = orderDetails.split(";");
			 
		 	//判断订单是否存在工艺，如果存在，先删除，再写入
			 List<OrderDetails> ods = orderDetailsService.queryByQuoteId(quoteId);	  
			 	  if(ods.size() != 0){         		  
			 		 //删除订单工艺 
			 		for (OrderDetails orderDetails2 : ods) {
					   List<ProcessDetails> p = processDetailsService.queryByOrderDetailsId(orderDetails2.getId());	
					   if(p.size() != 0){
						  processDetailsService.deleteByOrderDetailsId(orderDetails2.getId());
					   }    			         			   
			   	    }         		  
			 	  }
			 	  
			 	   //根据国家获取汇率
			 	   AmountUnit amountUnit = amountUnitService.queryByCurrency("人民币");
			 	   Double exchangeRate = amountUnit.getExchangeRate();
			 	  
			 for (int i = 0; i < split.length; i++) {				 				       				   
					String[] split2 = split[i].split("&");
					  OrderDetails o = null;
				  	  Integer orderDetailsId = null;	
					  if(!(split2[7].replaceFirst(".", "") == null || "".equals(split2[7].replaceFirst(".", "")))){
					 		 orderDetailsId = Integer.parseInt(split2[7].replaceFirst(".", ""));
					 		 o = orderDetailsService.queryById(orderDetailsId);
					 	  }else{
					 		 o = new OrderDetails();  
					 	  }
				        o.setQuoteId(quoteId);
				        
					String goodsType = "";
					if(!( split2[0].replaceFirst(".", "") == null || "".equals(split2[0].replaceFirst(".", "")))){
						goodsType = split2[0].replaceFirst(".", "");
					}
					String materialType = "";
					if(!( split2[1].replaceFirst(".", "") == null || "".equals(split2[1].replaceFirst(".", "")))){
						materialType = split2[1].replaceFirst(".", "");
					}
					Integer goodsSet = 1;
					if(!( split2[2].replaceFirst(".", "") == null || "".equals(split2[2].replaceFirst(".", "")))){
						goodsSet = Integer.parseInt(split2[2].replaceFirst(".", ""));
					}

					String parameterMm = "";
					if(!( split2[3].replaceFirst(".", "") == null || "".equals(split2[3].replaceFirst(".", "")))){
						parameterMm = split2[3].replaceFirst(".", "");
					}
			        o.setParameterMm(parameterMm);
			        
					String parameterInch = "";
					if(!( split2[4].replaceFirst(".", "") == null || "".equals(split2[4].replaceFirst(".", "")))){
						parameterInch = split2[4].replaceFirst(".", "");
					}
					o.setParameterInch(parameterInch);
					
					String process = "";
					if(!( split2[5].replaceFirst(".", "") == null || "".equals(split2[5].replaceFirst(".", "")))){
						process = split2[5].replaceFirst(".", "");
					}
			        
					String partName = "";
					if(!( split2[6].replaceFirst(".", "") == null || "".equals(split2[6].replaceFirst(".", "")))){
						partName = split2[6].replaceFirst(".", "");
					}
					   o.setPartName(partName);  
					
			        Integer goodsTypeId = 0;
			     	   GoodsTypeInfo goodsTypeInfo = goodsTypeInfoService.queryByGoodsType(goodsType); 
			     	   goodsTypeId = goodsTypeInfo.getId();
			     	   o.setGoodsTypeId(goodsTypeId);
			 	   	   
			 	   Double density = 0.0;
			 	   Integer priceUnit = 0;
			 	   if(!(materialType == null || "".equals(materialType))){
			 		   MaterialInfo materialInfo = materialInfoService.queryByType(materialType,goodsType);
			 		   o.setMaterialId(materialInfo.getId());
			 		   density = materialInfo.getDensity();
			 		   if(materialInfo.getUnitPrice() != null && !"".equals(materialInfo.getUnitPrice())){		         
					      priceUnit = new BigDecimal(materialInfo.getUnitPrice()).divide(new BigDecimal(exchangeRate),0,RoundingMode.UP).intValue();
			 		   }
			 		  
			 	   }		 	   
			 	       o.setGoodsSet(goodsSet);
			 	           
			 	   OrderDetails os = CalculatingProduct.calculate(parameterMm,parameterInch, priceUnit, goodsTypeId, goodsSet, density);
			 	   o.setPrice(os.getPrice());
			 	   o.setProductSize(os.getProductSize());
			 	   o.setSpace(os.getSpace());
			 	   o.setSpaceUnit(os.getSpaceUnit());
			 	   o.setWeight(os.getWeight());
			 	   o.setWeightUnit(os.getWeightUnit());
			 	   o.setSuperficialArea(os.getSuperficialArea());
			 	   o.setSuperficialAreaUnit(os.getSuperficialAreaUnit());
			 	   
			 	  if(!(orderDetailsId == null || "".equals(orderDetailsId))){
				 		 orderDetailsService.updateOrderDetails(o);
				    }else{
				 		orderDetailsService.insertOrderDetails(o); 
				 	 }
		   
			 	   
			      Double productProcessPrice = 0.0; 
			      Map<Object, Object> map1 = SerializeUtil.JsonToMap(process);
			      String str = map1.get("process").toString();
			      

				 	String[] split3 = str.split(",");
				 	Integer tl = split3.length;
				 	
				 	
				      //处理工艺，写入数据   	
					for (int j = 0; j < tl; j++) {
						ProcessInfo processInfo = new ProcessInfo();
						String[] split4 = split3[j].split("%");
						Map<Object,Object> map = new HashMap<Object,Object>();
						String level1 = null;
						if(!( split4[0].replaceFirst(".", "") == null || "".equals(split4[0].replaceFirst(".", "")))){
							level1 = split4[0].replaceFirst(".", "");
						}
						String level2 = null;
						if(!( split4[1].replaceFirst(".", "") == null || "".equals(split4[1].replaceFirst(".", "")))){
							level2 = split4[1].replaceFirst(".", "");
						}
						
						Double level3Parameter = 0.0;
						if(!( split4[2].replaceFirst(".", "") == null || "".equals(split4[2].replaceFirst(".", "")))){
							level3Parameter = Double.parseDouble(split4[2].replaceFirst(".", ""));
						}
						Integer outsideSurface = 0;
						if(!( split4[3].replaceFirst(".", "") == null || "".equals(split4[3].replaceFirst(".", "")))){
							outsideSurface = Integer.parseInt(split4[3].replaceFirst(".", ""));
						}
						Integer insideSurface = 0;
						if(!( split4[4].replaceFirst(".", "") == null || "".equals(split4[4].replaceFirst(".", "")))){
							insideSurface = Integer.parseInt(split4[4].replaceFirst(".", ""));
						}
						processInfo = processInfoService.queryByProcess(level1, level2);
						Double unitPrice1 = processInfo.getUnitPrice();
						Double processPrice = 0.0;
				    	
				    	//判断是否是表面积处理
				    	if(!(outsideSurface == 0 || insideSurface == 0)){
				    		if(!(outsideSurface == null || "".equals(outsideSurface))){
								  if(outsideSurface == 1){
									  productProcessPrice += level3Parameter * unitPrice1/exchangeRate; 
									  processPrice += unitPrice1*level3Parameter/exchangeRate;
								  }						 						  
							     
							  }
							  if(!(insideSurface == null || "".equals(insideSurface))){
								   if(insideSurface == 1){
									   productProcessPrice += unitPrice1*level3Parameter/exchangeRate;  
									   processPrice += unitPrice1*level3Parameter/exchangeRate;
								    }			
							  }	   
				    	}else{
				    		 productProcessPrice += unitPrice1*level3Parameter/exchangeRate;
				    		 processPrice = unitPrice1*level3Parameter/exchangeRate;
				    	}	
				    	
				    	
				    	map.put("orderDetailsId", o.getId());
				    	map.put("goodsProcessId", processInfo.getId());
						map.put("level1Parameter", level1);
						map.put("level2Parameter", level2);
						map.put("level3Parameter", level3Parameter);				
						map.put("unitPrice", processInfo.getUnitPrice());
						map.put("unit", processInfo.getUnit());
						map.put("outsideSurface", outsideSurface);
						map.put("insideSurface", insideSurface);
						map.put("processPrice", processPrice );
			          
						list2.add(map);
						
					}					  

				  
				  
				  /**
				   * 计算工艺价格，并且计算利润费管理费、税费     MIN(10%,0.000001*price+0.02)
				   */	
				   o.setProductProcessPrice(productProcessPrice);
				   Double unitPrice = new BigDecimal(productProcessPrice).add(new BigDecimal(o.getPrice())).doubleValue();
				   o.setUnitPrice(unitPrice);
			  	   orderDetailsService.updateOrderDetails(o); 
				   List<OrderDetails> list1 = orderDetailsService.queryByQuoteId(quoteId);
				   Double ws = 0.0;
				   Double prs = 0.0;
				   Double sps = 0.0;
				   Double totalProcess = 0.0;
				   if(list1.size() != 0){
					   for (OrderDetails orderDetails2 : list1) {
						 ws +=orderDetails2.getGoodsSet()*orderDetails2.getWeight();  
						 prs +=orderDetails2.getUnitPrice() * orderDetails2.getGoodsSet();
						 sps +=orderDetails2.getSpace() * orderDetails2.getGoodsSet();
						 totalProcess +=orderDetails2.getProductProcessPrice();
					  }
					  clientOrder.setTotalSets(totalSets);
					  clientOrder.setTotalWeight(totalSets*ws);
					  clientOrder.setTotalSpace(totalSets*sps);
					  Double price = new BigDecimal(totalSets).multiply(new BigDecimal(prs)).doubleValue();					  
					  /*
					   * 计算给予客户的优惠(10000USD开始给优惠)
					   * MIN(10%,0.000001*price+0.02)
					   */
					  Double profitRate = 0.15;
					  Double offer = 0.0;
					  Double profitManagment = 0.0;
					  Double discount = 0.0;
					  Double tax = 0.0;
					  if(price >= 10000){
						  offer = 0.000001 * price + 0.02;
						  if(offer <= 0.10){
							  profitRate = new BigDecimal(profitRate).subtract(new BigDecimal(offer)).setScale(6, BigDecimal.ROUND_HALF_UP).doubleValue();
							  clientOrder.setProfitRate(profitRate); 
							  profitManagment = new BigDecimal(totalProcess).multiply(new BigDecimal(profitRate)).setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
							  discount = new BigDecimal(totalProcess).multiply(new BigDecimal(offer)).setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
							  tax = new BigDecimal(totalProcess).multiply(new BigDecimal(profitRate)).multiply(new BigDecimal(0.17)).doubleValue();
							  clientOrder.setProfitManagment(profitManagment);
							  clientOrder.setTax(tax);
							  clientOrder.setDiscount(discount);
						  }else{
							  profitRate = new BigDecimal(profitRate).subtract(new BigDecimal(0.10)).setScale(6, BigDecimal.ROUND_HALF_UP).doubleValue();
							  clientOrder.setProfitRate(profitRate); 
							  profitManagment = new BigDecimal(totalProcess).multiply(new BigDecimal(profitRate)).setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
							  discount = new BigDecimal(totalProcess).multiply(new BigDecimal(0.10)).setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
							  tax = new BigDecimal(totalProcess).multiply(new BigDecimal(profitRate)).multiply(new BigDecimal(0.17)).doubleValue();
							  clientOrder.setProfitManagment(profitManagment);
							  clientOrder.setTax(tax);
							  clientOrder.setDiscount(discount);
						  }
						  						  						  
					  }else{
						  clientOrder.setProfitRate(profitRate);
						  profitManagment = new BigDecimal(totalProcess).multiply(new BigDecimal(profitRate)).setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
						  tax = new BigDecimal(totalProcess).multiply(new BigDecimal(profitRate)).multiply(new BigDecimal(0.17)).doubleValue();
						  clientOrder.setProfitManagment(profitManagment);
						  clientOrder.setTax(tax);
						  clientOrder.setDiscount(0.0);
					  }
				 clientOrder.setTotalPrice(new BigDecimal(totalSets).multiply(new BigDecimal(prs).add(new BigDecimal(profitManagment)).add(new BigDecimal(tax))).doubleValue());
					
				   }
				  clientOrder.setCreateTime(DateFormat.format());
                  
			 } 	
                 
			    processDetailsService.insertProcessDetails(list2, clientOrder);
		} catch (Exception e) {
	
			e.printStackTrace();
		}
            
         
    	return "calculator4.jsp";
    }
    
    
    
    
    
    
    
	/**
	 * 将物品、材料转化为美元计算
	 */
   public Map<Object,Object> calculateUnitPrice(String materialType,String goodsType,Double rate){
	   
	   Map<Object, Object> map = new HashMap<Object, Object>();
	try {
		MaterialInfo materialInfo = materialInfoService.queryByType(materialType,goodsType);	
		   String updateDate = null;
		   if(!(materialInfo.getUpdateDate() == null || "".equals(materialInfo.getUpdateDate()))){
			   updateDate = DateFormat.formatDate3(materialInfo.getUpdateDate());
		   }
		   AmountUnit a = amountUnitService.queryByCurrency("人民币");
		   Double unitPrice = 0.0;
		   if(materialInfo.getUnitPrice() != null && !"".equals(materialInfo.getUnitPrice())){		                
		    unitPrice = new BigDecimal(materialInfo.getUnitPrice()).divide(new BigDecimal(a.getExchangeRate()),0,RoundingMode.UP).multiply(new BigDecimal(1.03)).doubleValue();    
		   }
		   Integer price = 0;
		   BigDecimal b1 = new BigDecimal(unitPrice);  			                
		   price = b1.multiply( new BigDecimal(rate)).setScale(0, BigDecimal.ROUND_UP).intValue();   
		   map.put("updateDate", updateDate);
		   map.put("price",price);
		   
	} catch (ParseException e) {
		logger.info(e.getMessage(), e);
		e.printStackTrace();		
	}
	   
	   return map;
} 
    
    
    
    
}
