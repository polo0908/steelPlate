package com.cal.controller;

import java.io.FileNotFoundException;
import java.io.IOException;
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

import org.apache.commons.lang.StringUtils;
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
import com.cal.bean.QuotationVO;
import com.cal.print.ContractPrintTemplate;
import com.cal.service.AmountUnitService;
import com.cal.service.ClientOrderService;
import com.cal.service.GoodsTypeInfoService;
import com.cal.service.MaterialInfoService;
import com.cal.service.OrderDetailsService;
import com.cal.service.ProcessDetailsService;
import com.cal.service.ProcessInfoService;
import com.cal.util.DateFormat;
import com.yf.bean.HaiYunPort;
import com.yf.bean.PinXiang;
import com.yf.service.HaiYunPortService;
import com.yf.service.PinXiangService;
import com.yf.service.ZhengGuiService;


@Controller
@RequestMapping("/calculator")
public class GoodsResultController {

	public static Logger logger = Logger.getLogger(GoodsResultController.class);
	
	
	  @Resource
	    private OrderDetailsService orderDetailsService;
	    @Resource
	    private ClientOrderService clientOrderService;
	    @Resource
	    private GoodsTypeInfoService goodsTypeInfoService;
        @Resource
        private MaterialInfoService materialInfoService;
        @Resource
        private ProcessDetailsService processDetailsService;
        @Resource
        private ProcessInfoService processInfoService;
        @Resource
        private HaiYunPortService haiYunPortService;
        @Resource
        private AmountUnitService amountUnitService;
        @Resource
        private PinXiangService pinXiangService;
        @Resource
        private ZhengGuiService zhengGuiService;
        
        private static final int CONTAINER_WEIGHT = 18;               //20尺柜集装箱可以运18ton货物
        
        @ResponseBody
        @RequestMapping("/updateClientOrder.do")
	    public String updateClientOrder(HttpServletRequest request, HttpServletResponse response){
        	
        	String quoteId = request.getParameter("quoteId");	    	
	    	if(quoteId == null || "".equals(quoteId)){
	    		throw new RuntimeException("QuoteId can not empty");
	    	}  
			    Integer totalSet = 1;
			    if(!(request.getParameter("qty") == null || "".equals(request.getParameter("qty")))){
			    	totalSet = Integer.parseInt(request.getParameter("qty"));
			    }
	    	    ClientOrder clientOrder = clientOrderService.queryByQuoteId(quoteId);
	    		List<OrderDetails> orderDetails = orderDetailsService.queryByQuoteId(quoteId);
	    		
	    		 /**
				   * 计算工艺价格，并且计算利润费管理费、税费     MIN(10%,0.000001*price+0.02)
				   */	

				   try {
					   Double ws = 0.0;
					   Double prs = 0.0;
					   Double sps = 0.0;
					   Double totalProcess = 0.0;
					   if(orderDetails.size() != 0){
						   for (OrderDetails orderDetails2 : orderDetails) {
							       
							 ws +=new BigDecimal(orderDetails2.getGoodsSet()).multiply(new BigDecimal(orderDetails2.getWeight())).setScale(7, BigDecimal.ROUND_HALF_UP).doubleValue(); 
							 prs +=orderDetails2.getUnitPrice() * orderDetails2.getGoodsSet();
							 logger.info("=================单个产品价格=====："+prs);
							 sps +=orderDetails2.getSpace() * orderDetails2.getGoodsSet();
							 totalProcess +=orderDetails2.getProductProcessPrice() * orderDetails2.getGoodsSet();
						  }
						   clientOrder.setTotalWeight(totalSet * ws);
						   clientOrder.setTotalSpace(totalSet * sps);
						  Double price = new BigDecimal(totalSet).multiply(new BigDecimal(prs)).doubleValue();					  
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
								  profitRate = new BigDecimal(profitRate).subtract(new BigDecimal(offer)).setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
								  clientOrder.setProfitRate(profitRate); 
								  profitManagment = new BigDecimal(totalProcess).multiply(new BigDecimal(profitRate)).setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
								  discount = new BigDecimal(totalProcess).multiply(new BigDecimal(totalSet)).multiply(new BigDecimal(offer)).setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
								  tax = (new BigDecimal(totalProcess).add(new BigDecimal(profitManagment))).multiply(new BigDecimal(profitRate)).multiply(new BigDecimal(0.17)).setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
								  clientOrder.setProfitManagment(profitManagment);
								  clientOrder.setTax(tax);
								  clientOrder.setDiscount(discount);
							  }else{
								  profitRate = new BigDecimal(profitRate).subtract(new BigDecimal(0.10)).setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
								  clientOrder.setProfitRate(profitRate); 
								  profitManagment = new BigDecimal(totalProcess).multiply(new BigDecimal(profitRate)).setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
								  discount = new BigDecimal(totalProcess).multiply(new BigDecimal(totalSet)).multiply(new BigDecimal(0.10)).setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
								  tax = (new BigDecimal(totalProcess).add(new BigDecimal(profitManagment))).multiply(new BigDecimal(profitRate)).multiply(new BigDecimal(0.17)).setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
								  clientOrder.setProfitManagment(profitManagment);
								  clientOrder.setTax(tax);
								  clientOrder.setDiscount(discount);
							  }
							  						  						  
						  }else{
							  clientOrder.setProfitRate(profitRate);
							  profitManagment = new BigDecimal(totalProcess).multiply(new BigDecimal(profitRate)).setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
							  tax = (new BigDecimal(totalProcess).add(new BigDecimal(profitManagment))).multiply(new BigDecimal(profitRate)).multiply(new BigDecimal(0.17)).setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
							  clientOrder.setProfitManagment(profitManagment);
							  clientOrder.setTax(tax);
							  clientOrder.setDiscount(0.0);
						  }
						  clientOrder.setTotalSets(totalSet);
						  Double finalPrice = new BigDecimal(prs).add(new BigDecimal(profitManagment)).add(new BigDecimal(tax)).setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
						  clientOrder.setTotalPrice(new BigDecimal(totalSet).multiply(new BigDecimal(finalPrice)).setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue());
						  clientOrder.setFinallyPrice(finalPrice);
					   }   
				 //计算FOB价格			   
				 //计算当前产品需要多少柜运输
				 Integer weightTon = new BigDecimal(clientOrder.getTotalWeight()).setScale(0, BigDecimal.ROUND_UP).intValue();	   
				 Integer quantity = new BigDecimal(weightTon).divide(new BigDecimal(CONTAINER_WEIGHT),0,BigDecimal.ROUND_UP).intValue();
			     BigDecimal b1 = new BigDecimal(clientOrder.getTotalPrice());  			        
				 Double fobPrice = new BigDecimal(quantity).multiply(new BigDecimal(200)).add(b1).setScale(0, BigDecimal.ROUND_HALF_UP).doubleValue();
				 clientOrder.setFobPrice(fobPrice);	 
				 clientOrder.setInlandShippingCost(new BigDecimal(quantity).multiply(new BigDecimal(200)).setScale(0, BigDecimal.ROUND_HALF_UP).doubleValue());
				 
                 clientOrderService.updateClientOrder(clientOrder);
                 
                 return clientOrder.getOrderPlan();
				} catch (Exception e) {
					logger.info(e.getMessage(), e);
					e.printStackTrace();
				}	    		       	
        	
        	return "calculator4.jsp";
        }
        
        
        /**
         * 查看结果
         * @author polo
         * 2017年5月10日
         *
         */
	    @RequestMapping("/queryResult.do")
	    public String queryResult(HttpServletRequest request, HttpServletResponse response){

	    	try {
				String quoteId = request.getParameter("quoteId");	   
				if(quoteId == null || "".equals(quoteId)){
					throw new RuntimeException("quoteId can not empty");
				}  
				ClientOrder clientOrder = clientOrderService.queryByQuoteId(quoteId);
				List<OrderDetails> orderDetails = orderDetailsService.queryByQuoteId(quoteId);
					String type = null;
					Double unitPrice = 0.0;
					Integer profitRate = new BigDecimal(clientOrder.getProfitRate()).multiply(new BigDecimal(100)).setScale(2, BigDecimal.ROUND_HALF_UP).intValue();
					
					List<String> types = new ArrayList<String>();
					List<Double> s = new ArrayList<Double>();	
					List<Double> totalMaterialPrice = new ArrayList<Double>();
					List<Double> totalProcessPrice = new ArrayList<Double>();
					for (OrderDetails o : orderDetails) {	    
						String goodsType = goodsTypeInfoService.queryById(o.getGoodsTypeId()).getGoodsType();
						String materialType = materialInfoService.queryById(o.getMaterialId()).getMaterialType();
						type = goodsType+"/"+materialType;    		
						types.add(type);
						Double materialPrice = new BigDecimal(o.getPrice()).multiply(new BigDecimal(o.getGoodsSet())).setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
						Double processPrice = new BigDecimal(o.getProductProcessPrice()).multiply(new BigDecimal(o.getGoodsSet())).setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
						totalMaterialPrice.add(materialPrice);
						totalProcessPrice.add(processPrice);		    		
						unitPrice +=(new BigDecimal(o.getProductProcessPrice()).add(new BigDecimal(o.getPrice()))).multiply(new BigDecimal(o.getGoodsSet())).setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();	
						
					}
					//根据国家获取汇率
				AmountUnit amountUnit = new AmountUnit();	
				if(!(clientOrder.getAmountUnit() == null || "".equals(clientOrder.getAmountUnit()))){
					amountUnit = amountUnitService.queryById(clientOrder.getAmountUnit());
					amountUnit.setUpdateDate(DateFormat.formatDate3(amountUnit.getUpdateDate()));
				}	
				unitPrice = new BigDecimal(unitPrice).setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
				
				AmountUnit amountUnit1 = amountUnitService.queryByCurrencyShorthand("CNY");
				
				//选择货币单元的总价
				Double selectUnitPrice = new BigDecimal(clientOrder.getTotalPrice()).multiply(new BigDecimal(amountUnit.getExchangeRate())).setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
				
				
				
				//获取客户邮箱,订单计划
				String email = request.getParameter("email");
				String orderPlan = request.getParameter("orderPlan");
				if(StringUtils.isNotBlank(email)){
					clientOrder.setEmail(email);	
				}
				if(StringUtils.isNotBlank(orderPlan)){
					clientOrder.setOrderPlan(orderPlan);
					clientOrderService.updateClientOrder(clientOrder);
				}
				
				
				request.setAttribute("exchangeRate", amountUnit1.getExchangeRate());   
				request.setAttribute("amountUnit", amountUnit);   
				request.setAttribute("s", s);	
				request.setAttribute("types", types);	
				request.setAttribute("orderDetails", orderDetails);	
				request.setAttribute("unitPrice", unitPrice);	
				request.setAttribute("profitRate", profitRate);	
				

				//查询国家对应港口城市	    	
				request.setAttribute("clientOrder", clientOrder);
				request.setAttribute("selectUnitPrice", selectUnitPrice);
				request.setAttribute("totalMaterialPrice", totalMaterialPrice);
				request.setAttribute("totalProcessPrice", totalProcessPrice);
			} catch (Exception e) {
				logger.info(e.getMessage(), e);
				e.printStackTrace();
			}
	    	
	    	return "calculator4.jsp";
	    }
	    
	    
	    
	    
	    
	    /**
	     * 查询运输选择
	     * @author polo
	     * 2017年5月10日
	     * @throws Exception 
	     *
	     */
	    @RequestMapping("/queryShippingCost.do")
	    public String queryShippingCost(HttpServletRequest request, HttpServletResponse response) throws Exception{
	    	
	    	try {
				String quoteId = request.getParameter("quoteId");	    	
				StringUtils.isBlank(quoteId);
				List<PinXiang> destinationPort = new ArrayList<PinXiang>();
				ClientOrder clientOrder = clientOrderService.queryByQuoteId(quoteId);
				if(!(clientOrder.getCountry() == null || "".equals(clientOrder.getCountry()))){
					destinationPort = pinXiangService.queryLclDestinationPortByCountry(clientOrder.getCountry());
				}
				List<HaiYunPort> list = haiYunPortService.queryLclCountry();
				/*
				 * 获取拼箱运输国家(按常用排序)
				 * 
				 */
				List<HaiYunPort> shippings = new ArrayList<HaiYunPort>();
				for (HaiYunPort haiYunPort : list) {
					String country = haiYunPort.getEnguoname();
				    if("AUSTRALIA".equalsIgnoreCase(country)){
				    	shippings.add(0,haiYunPort);
				    }else if("UNITED STATES".equalsIgnoreCase(country)){
				    	shippings.add(0,haiYunPort);
				    }else if("UNITED KINGDOM".equalsIgnoreCase(country)){
				    	shippings.add(0,haiYunPort);
				    }else if("GERMANY".equalsIgnoreCase(country)){
				    	shippings.add(0,haiYunPort);	
				    }else if("Russia".equalsIgnoreCase(country)){
				    	shippings.add(0,haiYunPort);
				    }else if("CANADA".equalsIgnoreCase(country)){
					    shippings.add(0,haiYunPort);
				    }else if("SPAIN".equalsIgnoreCase(country)){
					    shippings.add(0,haiYunPort);
				    }else if("ITALY".equalsIgnoreCase(country)){
					    shippings.add(0,haiYunPort);
				    }else if("SWEDEN".equalsIgnoreCase(country)){
				    	shippings.add(0,haiYunPort);
				    }else{
				    	shippings.add(haiYunPort);
				    }			    
				}  
				
				request.setAttribute("clientOrder", clientOrder); 
				request.setAttribute("shippings", shippings);
				request.setAttribute("destinationPort", destinationPort);
			} catch (Exception e) {
				logger.info(e.getMessage(), e);
				e.printStackTrace();
			} 
	    	
	    	return "calculator5.jsp";
	    }
	    
	    
	    
	    
	    
	    
	    /**
	     * 根据国家查询目的城市
	     * @param request
	     * @param response
	     * @return
	     */
	    @ResponseBody
	    @RequestMapping("/queryLclDestinationPort.do")
	    public JsonResult<List<PinXiang>> queryLclDestinationPort(HttpServletRequest request, HttpServletResponse response){
	    	
	    	List<PinXiang> destinationPort = null;
			try {
				String country = request.getParameter("country");	    	
				destinationPort = pinXiangService.queryLclDestinationPortByCountry(country);
			} catch (Exception e) {
				logger.info(e.getMessage(), e);
				e.printStackTrace();
			} 
	    	return new JsonResult<List<PinXiang>>(destinationPort);
	    }
	    
	    /**
	     * 计算拼箱运费（默认按照拼箱计算）
	     * 计算整柜运费 （20尺柜来计算）
	     * @param request
	     * @param response
	     * @return
	     */
	    @ResponseBody
	    @RequestMapping("/queryCalculatePrice.do")
	    public JsonResult<ClientOrder> calculatePrice(HttpServletRequest request, HttpServletResponse response){
	        ClientOrder clientOrder = null;
			try {
				String quoteId = request.getParameter("quoteId");
				clientOrder = clientOrderService.queryByQuoteId(quoteId);
				Double weight = 0.0;
				Integer weightKilogram = 0;
				Integer weightTon = 0;
				if(!(request.getParameter("totalWeight") == null || "".equals(request.getParameter("totalWeight")))){
					weight = clientOrder.getTotalWeight();
					//获取物品千克数（不满1Kg，按照1Kg计算）
					weightKilogram = new BigDecimal(weight).multiply(new BigDecimal(1000)).setScale(0, BigDecimal.ROUND_UP).intValue();
					weightTon = new BigDecimal(weight).setScale(0, BigDecimal.ROUND_UP).intValue();
				}
				Double space = 0.0;
				if(!(request.getParameter("totalSpace") == null || "".equals(request.getParameter("totalSpace")))){
					space = clientOrder.getTotalSpace();
//	        	Integer totalSpace = new BigDecimal(space).setScale(0, BigDecimal.ROUND_UP).intValue();
				}
				String country = request.getParameter("country");
				if(StringUtils.isBlank(country)){
					logger.info("未获取到国家");
				}
				String destinationPort = request.getParameter("destinationPort");
				if(StringUtils.isBlank(destinationPort)){
					logger.info("未获取到城市");
				}
				String modeOfTransport = request.getParameter("modeOfTransport");	
				StringUtils.isBlank(modeOfTransport);
				//重量转体积（1CBM=363kg）
				Double shippingFee = 0.0;
				Double kgs = new BigDecimal(weightKilogram).divide(new BigDecimal(363),4,RoundingMode.UP).doubleValue();
				Double shippingFeeByKGS = pinXiangService.calculatePriceByKGS(country, destinationPort);
				Double shippingFeeByCBM = pinXiangService.calculatePriceByCBM(country, destinationPort);

				if(kgs > space){	        
					shippingFee =  new BigDecimal(shippingFeeByKGS).multiply(new BigDecimal(kgs)).setScale(0, BigDecimal.ROUND_HALF_UP).doubleValue();	
				}
				if(kgs < space){	        	
					shippingFee =  new BigDecimal(shippingFeeByCBM).multiply(new BigDecimal(space)).setScale(0, BigDecimal.ROUND_HALF_UP).doubleValue();
				}
				if(kgs == space){
					Double f1 = pinXiangService.calculatePriceByKGS(country, destinationPort) * kgs;
					Double f2 = pinXiangService.calculatePriceByCBM(country, destinationPort) * space;
				    shippingFee = f1 > f2 ? f2 : f1;
				}
				//服务费是350USD
				Double packing = 350.0;
				if(!(request.getParameter("packing") == null || "".equals(request.getParameter("packing")))){
					packing = Double.parseDouble(request.getParameter("packing"));
				}
				//计算当前产品需要多少柜运输
				Integer quantity = new BigDecimal(weightTon).divide(new BigDecimal(CONTAINER_WEIGHT),0,BigDecimal.ROUND_UP).intValue();
				
				
				BigDecimal b1 = new BigDecimal(clientOrder.getTotalPrice());  			        
				BigDecimal b2 = new BigDecimal(packing);  
				BigDecimal b3 = new BigDecimal(shippingFee);  	        
				Double fobPrice = new BigDecimal(quantity).multiply(new BigDecimal(200)).add(b1).setScale(0, BigDecimal.ROUND_HALF_UP).doubleValue();
				Double cifPrice = new BigDecimal(fobPrice).add(b2).add(b3).setScale(0, BigDecimal.ROUND_HALF_UP).doubleValue();  
//				Double totalPrice = (new BigDecimal(clientOrder.getFinallyPrice()).multiply(new BigDecimal(clientOrder.getTotalSets()))).add(new BigDecimal(packing)).add(new BigDecimal(shippingFee)).setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
				clientOrder.setFobPrice(fobPrice);
				clientOrder.setCifPrice(cifPrice);
				clientOrder.setCity(destinationPort);
				clientOrder.setCountry(country);
				clientOrder.setModeOfTransport(modeOfTransport);
				clientOrder.setShippingFeeLcl(shippingFee);           
				clientOrder.setShippingFee(shippingFee);
//				clientOrder.setTotalPrice(totalPrice);
				clientOrder.setPacking(packing);
				
				//计算20尺柜平均价格
				Double price = zhengGuiService.calculateGP20AveragePrice(destinationPort);

				
				logger.info("拼箱:"+shippingFee);
				//计算整箱运输价格
				if(price == null || "".equals(price)){
					price = 0.0;
				}
				Double fclPrice = new BigDecimal(price).multiply(new BigDecimal(quantity)).setScale(0, BigDecimal.ROUND_HALF_UP).doubleValue();
				logger.info("整柜:"+price);
				
				clientOrder.setShippingFeeFcl(fclPrice);
				clientOrderService.updateClientOrder(clientOrder);
			} catch (NumberFormatException e) {
				logger.info(e.getMessage(), e);
				e.printStackTrace();
			}
            return new JsonResult<ClientOrder>(clientOrder);
	    }
	    
	    /**
	     * 确认运费选择
	     * @param request
	     * @param response
	     */
	    @RequestMapping("/confirmShippingFee.do")
	    public void confirmShippingFee(HttpServletRequest request, HttpServletResponse response){
	    	try {
				Double shippingFee = 0.0;
				if(!(request.getParameter("shippingFee") == null || "".equals(request.getParameter("shippingFee")))){
					shippingFee = Double.parseDouble(request.getParameter("shippingFee"));
				}
				String quoteId = request.getParameter("quoteId");
				if(quoteId == null || "".equals(quoteId)){
					throw new RuntimeException("quoteId can not empty!");
				}	
				ClientOrder clientOrder = clientOrderService.queryByQuoteId(quoteId);
				
				   //服务费是350USD
	            Double packing = 350.0;
	            if(!(request.getParameter("packing") == null || "".equals(request.getParameter("packing")))){
	            	packing = Double.parseDouble(request.getParameter("packing"));
	            }
	            
	            Double weight = 0.0;
				Integer weightTon = 0;
				if(!(request.getParameter("totalWeight") == null || "".equals(request.getParameter("totalWeight")))){
					weight = clientOrder.getTotalWeight();
					weightTon = new BigDecimal(weight).setScale(0, BigDecimal.ROUND_UP).intValue();
				}
	            
	            //计算当前产品需要多少柜运输
				Integer quantity = new BigDecimal(weightTon).divide(new BigDecimal(CONTAINER_WEIGHT),0,BigDecimal.ROUND_UP).intValue();
	            	            
			    String modeOfTransport = request.getParameter("modeOfTransport");              
				
		        BigDecimal b1 = new BigDecimal(clientOrder.getTotalPrice());  			        
		        BigDecimal b2 = new BigDecimal(packing);  
		        BigDecimal b3 = new BigDecimal(shippingFee);  	        
	            Double fobPrice = new BigDecimal(quantity).multiply(new BigDecimal(200)).add(b1).setScale(0, BigDecimal.ROUND_HALF_UP).doubleValue();
	            Double cifPrice = new BigDecimal(fobPrice).add(b2).add(b3).setScale(0, BigDecimal.ROUND_HALF_UP).doubleValue();  
				
	            clientOrder.setPacking(packing);
	            clientOrder.setFobPrice(fobPrice);
	            clientOrder.setCifPrice(cifPrice);
				clientOrder.setShippingFee(shippingFee);
				clientOrder.setModeOfTransport(modeOfTransport);
				
				clientOrderService.updateClientOrder(clientOrder);
				
				
			} catch (Exception e) {
				logger.info(e.getMessage(), e);
				e.printStackTrace();
			}
	    	
	    }
	    
	    
	    
	    
	    
	    /**
	     * 查询订单详情
	     * @author polo
	     * 2017年5月12日
	     *
	     */
	    @ResponseBody
	    @RequestMapping("/queryOrderDetailsById.do")
	    public JsonResult<Map<String,Object>> queryOrderDetailsById(HttpServletRequest request, HttpServletResponse response){
	    	
	     try {
			Integer orderDetailsId = null;	
			 if(!(request.getParameter("orderDetailsId") == null || "".equals(request.getParameter("orderDetailsId")))){
				 orderDetailsId = Integer.parseInt(request.getParameter("orderDetailsId"));
			  }
			 List<ProcessDetails> processDetails = processDetailsService.queryByOrderDetailsId(orderDetailsId); 
			 List<ProcessInfo> processInfos = new ArrayList<ProcessInfo>();
			 for (ProcessDetails processDetails2 : processDetails) {
				 ProcessInfo processInfo = processInfoService.queryById(processDetails2.getGoodsProcessId());
				 processInfos.add(processInfo);
			 }
			 AmountUnit a = amountUnitService.queryByCurrencyShorthand("CNY");
			 Map<String,Object> map = new HashMap<String,Object>();
			 map.put("processDetails", processDetails);
			 map.put("processInfos", processInfos);
			 map.put("exchangeRate", a.getExchangeRate());
			 
			 return new JsonResult<Map<String,Object>>(map);
		} catch (NumberFormatException e) {
            logger.info("========queryOrderDetailsById========"+e.getMessage());
			e.printStackTrace();
			return new JsonResult<Map<String,Object>>(1,"Query failed");
		}
         
         
	   }
	    

	    
	    
	    
	    
	    
	    
	    /**
	     * 打印excel结果
	     * @param request
	     * @param response
	     */
	    @RequestMapping("/printResult.do")
	    public void print(HttpServletRequest request, HttpServletResponse response){
	    	String quoteId = request.getParameter("quoteId");
	    	if(quoteId == null || "".equals(quoteId)){
	    		throw new RuntimeException("quoteId can not empty!");
	    	}
	    	QuotationVO quotation = new QuotationVO();
	    	ClientOrder clientOrder = clientOrderService.queryByQuoteId(quoteId);
            try {
				clientOrder.setCreateTime(DateFormat.formatDate1(clientOrder.getCreateTime()));
			} catch (ParseException e1) {
				e1.printStackTrace();
			}
	    	
	    	List<OrderDetails> list = orderDetailsService.queryByQuoteId(quoteId);
	    	List<String> ms = new ArrayList<String>();
	    	List<String> gs = new ArrayList<String>();
	    	for (OrderDetails orderDetails : list) {
				List<ProcessDetails> p = processDetailsService.queryByOrderDetailsId(orderDetails.getId());
				orderDetails.setProcessDetails(p);
				MaterialInfo m = materialInfoService.queryById(orderDetails.getMaterialId());
				GoodsTypeInfo g = goodsTypeInfoService.queryById(orderDetails.getGoodsTypeId());
				ms.add(m.getMaterialType());
				gs.add(g.getGoodsType());
			}

	    	
	    	
	    	quotation.setClientOrder(clientOrder);
	    	quotation.setOrderDetails(list);
	    	ContractPrintTemplate cp = new ContractPrintTemplate();
	    	
	    	try {
				cp.print(quotation, request.getSession().getServletContext().getRealPath("/"), response,request,ms,gs);
			} catch (FileNotFoundException e) {
				logger.info(e.getMessage(), e);
				e.printStackTrace();
			} catch (ParseException e) {
				logger.info(e.getMessage(), e);
				e.printStackTrace();
			} catch (IOException e) {
				logger.info(e.getMessage(), e);
				e.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace();
			}
	    }
	    

	    
	    
	    
	    
	    
	    
}
