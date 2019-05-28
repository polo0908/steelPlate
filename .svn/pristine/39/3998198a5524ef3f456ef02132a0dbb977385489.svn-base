   
package com.cbt.controller;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cal.util.SerializeUtil;
import com.cbt.service.SteelPateService;
import com.cbt.service.SteelSortDetailsService;
import com.cbt.util.SplitPage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cbt.model.SteelPateCategory;
import com.cbt.model.SteelPlate;
import com.cbt.model.SteelPlateOrder;
import com.cbt.model.SteelSortDetails;
@Controller
@RequestMapping("/SteelPlate")
public class SteelPlateController {
	
	@Autowired
	private SteelPateService steelPateService;
	@Resource
	private SteelSortDetailsService steelSortDetailsService;
	
	private SteelPlate steelPlate1;
	/**
	 * 进入首页
	* @Title: query 
	* @param @param request
	* @param @return    返回页面HomePlate.jsp
	* @return ModelAndView    返回类型 
	* @throws
	 */
	@RequestMapping("/home")
	public String home(HttpServletRequest request, HttpServletResponse response){
		
		List<SteelSortDetails> list1 = steelSortDetailsService.queryBySteelType("板材");
		List<SteelSortDetails> list2 = steelSortDetailsService.queryBySteelType("型材");
		request.setAttribute("list1", list1);
		request.setAttribute("list2", list2);
		return "/website/HomePage.jsp";		
	}
	
	

    @ResponseBody
	@RequestMapping("/getCategoryInfo")
	public Map<String,Object> getCategoryInfo(HttpServletRequest request, HttpServletResponse response){
    	response.setCharacterEncoding("UTF-8");
    	SteelPlate steelPlate = new SteelPlate();
		String str1 = request.getParameter("page");
 	    String str2 = request.getParameter("pageSize");	    
 	    if(!(request.getParameter("category") == null || "".equals(request.getParameter("category")))){
 	    	steelPlate.setZhonglei(request.getParameter("category"));
 	    }
		if(!(request.getParameter("commodity") == null || "".equals(request.getParameter("commodity")))){
			steelPlate.setPinming(request.getParameter("commodity"));
		}
		if(!(request.getParameter("material") == null || "".equals(request.getParameter("material")))){
			steelPlate.setCaizhi(request.getParameter("material"));
		}
		if(!(request.getParameter("parameter") == null || "".equals(request.getParameter("parameter")))){
			steelPlate.setHigh(request.getParameter("parameter"));
		}
		if(!(request.getParameter("width2") == null || "".equals(request.getParameter("width2")))){
			steelPlate.setWidth2(request.getParameter("width2")); 
		}
		if(!(request.getParameter("width1") == null || "".equals(request.getParameter("width1")))){
			steelPlate.setWidth1(request.getParameter("width1"));
		}
		if(!(request.getParameter("length1") == null || "".equals(request.getParameter("length1")))){
			steelPlate.setLength1(request.getParameter("length1"));
		}
		if(!(request.getParameter("length2") == null || "".equals(request.getParameter("length2")))){
			steelPlate.setLength2(request.getParameter("length2"));
		}
		steelPlate1 = steelPlate;
	    int page = 1;
		if(str1 != null) {
			page = Integer.parseInt(str1);
		}
		int pageSize = 20;		
		if(str2 != null) {
			pageSize = Integer.parseInt(str2);
		}
		int start = (page-1) * pageSize;
		steelPlate.setStart(start);
		steelPlate.setPageSize(pageSize);
		int total = steelPateService.queryTotal(steelPlate);
	    List<SteelPlate> list = steelPateService.queryByKey(steelPlate);
        String pager = SplitPage.buildPager(request, total, pageSize, page);
        Map<String,Object> map = new HashMap<String, Object>();
        map.put("list", list);
        map.put("pager", pager);
//        String obj = SerializeUtil.ObjToJson(map);
//        System.out.println(obj);
		return map;
	}
    
    /**
     * 处理分页查询
     * @param request
     * @param response
     * @return
     */
    @ResponseBody
	@RequestMapping("/getCategoryInfoByPage")
	public Map<String,Object> getCategoryInfoByPage(HttpServletRequest request, HttpServletResponse response){
    	response.setCharacterEncoding("UTF-8");
    	String str1 = request.getParameter("page");
 	    String str2 = request.getParameter("pageSize");	   
 	    int page = 1;
		if(str1 != null) {
			page = Integer.parseInt(str1);
		}
		int pageSize = 20;		
		if(str2 != null) {
			pageSize = Integer.parseInt(str2);
		}
		int start = (page-1) * pageSize;
		steelPlate1.setStart(start);
		steelPlate1.setPageSize(pageSize);
		int total = steelPateService.queryTotal(steelPlate1);
	    List<SteelPlate> list = steelPateService.queryByKey(steelPlate1);
	    String pager = SplitPage.buildPager(request, total, pageSize, page);
        Map<String,Object> map = new HashMap<String, Object>();
        map.put("list", list);
        map.put("pager", pager);
	    
    	return map;
    }
    
    
	@RequestMapping("/getCategoryInfoByPage1")
	public String getCategoryInfoByPage1(HttpServletRequest request, HttpServletResponse response){
		response.setCharacterEncoding("UTF-8");
		List<SteelPlate> list = null;
		if(!(steelPlate1 == null || "".equals(steelPlate1))){
			Integer start = steelPlate1.getStart();
			Integer pageSize = steelPlate1.getPageSize();
			Integer page = start / pageSize + 1 ;
		
		int total = steelPateService.queryTotal(steelPlate1);
	    list = steelPateService.queryByKey(steelPlate1);
	    SplitPage.buildPager(request, total, pageSize, page);
		}
		request.setAttribute("list", list);
    	return "/website/HomePage.jsp";
    }
	
	/**
	 * 按pinming查询
	* @Title: query 
	* @param @param request
	* @param @return    返回页面Category.jsp
	* @return ModelAndView    返回类型 
	* @throws
	 */
	@RequestMapping("/queryByCategory")
	public String queryByCategory(HttpServletRequest request, HttpServletResponse response,Model model){
		response.setCharacterEncoding("UTF-8");
		String pinming = request.getParameter("pinming");
		//查询steel_sort_details表中品名对应多类型
		String[] sorts = {};
		try {
			sorts = steelSortDetailsService.querySortByBelongType(pinming);
		} catch (Exception e) {
			e.printStackTrace();
		}
		List<SteelPlate>  list = null;
		SteelSortDetails steelSortDetails = null;
		if(sorts.length != 0){
	     	list = steelPateService.queryByPinMing(sorts);
	     	steelSortDetails = steelSortDetailsService.queryByBelongType(pinming);
		}
//		List<SteelPlate> list = steelPateService.queryPinMing(pinming);
		//根据多个品名查询产品	    	
		 request.setAttribute("list",list);
		 request.setAttribute("steelSortDetails",steelSortDetails);
		return "/website/Category1.jsp";
  }
	/**
	 * ajax调用
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/queryByCategory1")
	public Map<String,Object> queryByCategory1(HttpServletRequest request, HttpServletResponse response){	
		response.setCharacterEncoding("UTF-8");
		String pinming = request.getParameter("pinming");
		//查询steel_sort_details表中品名对应多类型
		String[] sorts = {};
		try {
			sorts = steelSortDetailsService.querySortByBelongType(pinming);
		} catch (Exception e) {
			e.printStackTrace();
		}
		List<SteelPlate>  list = null;
		SteelSortDetails steelSortDetails = null;
		if(sorts.length != 0){
	     	list = steelPateService.queryByPinMing(sorts);
	     	steelSortDetails = steelSortDetailsService.queryByBelongType(pinming);
		}
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("steelPlate", list);
		map.put("steelSortDetails", steelSortDetails);
		return map;
	}
	/**
	 * 进入计算界面
	* @Title: query 
	* @param @param request
	* @param @return    返回页面Custom.jsp
	* @return ModelAndView    返回类型 
	* @throws
	 */
	@RequestMapping("custom")
	public String findById(){
		
		return "/website/Custom.jsp";  
		
	}
	/**
	 * 进入客户信息
	* @Title: query 
	* @param @param request
	* @param @return    返回页面CustomerInfo.jsp
	* @return ModelAndView    返回类型 
	* @throws
	 */
	@RequestMapping("/customerInfo")
	public ModelAndView  customerInfo(HttpServletRequest request, HttpServletResponse response,Model model,@RequestParam(value="id")Integer id,
			@RequestParam(value="pinming",required=false)String pinming,@RequestParam(value="zhonglei",required=false)String zhonglei,
			@RequestParam(value="caizhi",required=false)String caizhi,@RequestParam(value="width")Integer width,
			@RequestParam(value="length",required=false) Integer length,@RequestParam(value="high") String high,
			@RequestParam(value="weight",required=false)  String weight,@RequestParam(value="uprice",required=false) String uprice,
			@RequestParam(value="guige",required=false) String guige,@RequestParam(value="jiage",required=false) String jiage,
			@RequestParam(value="PMethod",required=false) String PMethod,@RequestParam(value="Margin",required=false) Double Margin
			){
		
	    model.addAttribute("steelPlateId", id);
		model.addAttribute("sname", pinming);
		model.addAttribute("scategory", zhonglei);
		model.addAttribute("smaterial", caizhi);
		model.addAttribute("width", width);
		model.addAttribute("length", length);
		model.addAttribute("high", high);
		model.addAttribute("weight",weight);
		model.addAttribute("smodel", guige);
		model.addAttribute("sprice", jiage);
		model.addAttribute("uprice", uprice);
		model.addAttribute("PMethod", PMethod);
		ModelAndView mav = new ModelAndView("/website/CustomerInfo.jsp");
		mav.addObject("margin", Margin);
		return mav;
		
	}
	/**
	 * 进入支付界面
	* @Title: query 
	* @param @param request
	* @param @return    返回页面PayMent.jsp
	* @return ModelAndView    返回类型 
	* @throws
	 */
	@RequestMapping("palMent")
	public String palMent(){
		
		return "/website/PayMent.jsp";  
}			
	/**
	 * 进入种类
	* @Title: query 
	* @param @param request
	* @param @return    返回页面Category.jsp
	* @return ModelAndView    返回类型 
	* @throws
	 */
	@RequestMapping("category")
	public String category(){
		
		return "/website/Category.jsp";  
}	
	/**
	 * 进入详情
	* @Title: query 
	* @param @param request
	* @param @return    返回页面SteelPlateInfo.jsp
	* @return ModelAndView    返回类型 
	* @throws
	 */
	@RequestMapping("steelPlateInfo")
	public String steelPlateInfo(){
		
		return "/website/SteelPlateInfo.jsp";  
}
	/**
	 * 按材质分 然后按厚度
	* @Title: query 
	* @param @param request
	* @param @return    返回页面Category2.jsp
	* @return ModelAndView    返回类型 
	* @throws
	 */
//	@RequestMapping("/category2")
	
//	public String category2(HttpServletRequest request, HttpServletResponse response,Model model,@RequestParam(value="zhongelei",required=false)String zhongelei,
//				@RequestParam(value="pinming",required=false)String pinming, @RequestParam(value="caizhi",required=false)String caizhi, 
//				@RequestParam(value="guige",required=false)String guige,@RequestParam(value="staWeidth",required=false)Integer staWeidth,
//				@RequestParam(value="endWeidth",required=false)Integer endWeidth,@RequestParam(value="staSize",required=false)Integer staSize,
//				@RequestParam(value="endSize",required=false)Integer endSize, @RequestParam(value="guapaishangjia",required=false)String guapaishangjia,
//				@RequestParam(value="changjia",required=false)String changjia,@RequestParam(value="cunhuodi",required=false)String cunhuodi, 
//				@RequestParam(value="staJiage",required=false)Integer staJiage,@RequestParam(value="endJiage",required=false)Integer endJiage,@RequestParam(value="high",required=false)Integer high){	
//			List<SteelPlate>  list = steelPateService.querySteelPateinfo1(  zhongelei,
//					 pinming,  caizhi,  guige,high, staWeidth, endWeidth, staSize, endSize,  guapaishangjia, changjia,
//					 cunhuodi,  staJiage, endJiage);
//			 model.addAttribute("pinming", pinming);
//			 model.addAttribute("zhonglei",zhongelei);
//			 model.addAttribute("caizhi", caizhi);
//			 model.addAttribute("guapaishangjia", guapaishangjia);
//			 model.addAttribute("changjia", changjia);
//			 model.addAttribute("cunhuodi", cunhuodi);
//			 model.addAttribute("staJiage",staJiage);
//			 model.addAttribute("endJiage",endJiage);
//			 model.addAttribute("staWidth",staWeidth);
//			 model.addAttribute("endWidth",endWeidth);
//			 model.addAttribute("staSize",staSize);
//			 model.addAttribute("endSize",endSize);
//			 model.addAttribute("staJiage",staJiage);
//			 model.addAttribute("endJiage",endJiage);
//			 model.addAttribute("list",list);
//
//		return "/website/Category2.jsp";  
//}
//	/**
//	 * 客户自定义
//	* @Title: query 
//	* @param @param request
//	* @param @return    返回页面Specifications2.jsp
//	* @return ModelAndView    返回类型 
//	* @throws
//	 */
//	@RequestMapping("/specifications2")
//	public String specifications2(){
//		return "/website/Specifications2";  
//}	
//	@RequestMapping("/ccategory")
//	public String ccategory(HttpServletRequest request, HttpServletResponse response,Model model,@RequestParam(value="id")Integer id,
//			@RequestParam(value="pid")Integer pid,@RequestParam(value="path")String path,@RequestParam(value="category")String category){	
//		SteelPateCategory steelPateCategory = new SteelPateCategory();	
//		steelPateCategory.setId(id);
//		steelPateCategory.setPath(path);
//		steelPateCategory.setCategory(category);
//		steelPateCategory.setPid(pid);
//		List<SteelPateCategory>  list = steelPateService.ccategory(steelPateCategory);
//			 model.addAttribute("id", id);
//			 model.addAttribute("pid",pid);
//			 model.addAttribute("path", path);
//			 model.addAttribute("category", category);
//			 model.addAttribute("list",list);
//		return "/website/Category4.jsp";
//	}
	/**
	 * 通过产品Id获取产品列表
	* @Title: query 
	* @param @param request
	* @param @return    返回页面Custom.jsp
	* @return ModelAndView    返回类型 
	* @throws
	 */
	@RequestMapping("/findById1")
	//查询所有的
	public String findById1(HttpServletRequest request, HttpServletResponse response,Model model){
		int id = Integer.parseInt(request.getParameter("productId"));
		SteelPlate steelPlate = steelPateService.findById1(id);
		model.addAttribute("list",steelPlate);
//		System.out.println("查询出来的数据:"+list.toString()+"-----------------------------");
		return "/website/Custom.jsp";
	}
	
	@ResponseBody
	@RequestMapping("/saveOrder")
	public String saveProductInfo(HttpServletRequest request,HttpServletResponse response){
		//当前的时间毫秒数加两位随机数，最为订单id
		 Date now = new Date();
		 String d = now.getTime()+"";
		 int random = new Random().nextInt(100);
		 String a=Integer.toString(random);
		 String itemid=d+a;
		 DateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		 String time=format.format(now);
		  
		 SteelPlateOrder order= new SteelPlateOrder();
		 
		   if(!(request.getParameter("steelPlateId") == null || "".equals(request.getParameter("steelPlateId")))){
			   order.setSteelplateId(Integer.parseInt(request.getParameter("steelPlateId"))); 
		   }
		   if(!(request.getParameter("scategory") == null || "".equals(request.getParameter("scategory")))){
			   order.setScategory(request.getParameter("scategory")); 
		   }
		   if(!(request.getParameter("sname") == null || "".equals(request.getParameter("sname")))){
			   order.setSname(request.getParameter("sname")); 
		   }
		   if(!(request.getParameter("smaterial") == null || "".equals(request.getParameter("smaterial")))){
			   order.setSmaterial(request.getParameter("smaterial")); 
		   }
		   if(!(request.getParameter("length") == null || "".equals(request.getParameter("length")))){
			   order.setLength(Integer.parseInt(request.getParameter("length"))); 
		   }
		   if(!(request.getParameter("weight") == null || "".equals(request.getParameter("weight")))){
			   order.setWeight(Double.parseDouble(request.getParameter("weight"))); 
		   }
		   if(!(request.getParameter("smodel") == null || "".equals(request.getParameter("smodel")))){
			   order.setSmodel(request.getParameter("smodel")); 
		   }
		   if(!(request.getParameter("sprice") == null || "".equals(request.getParameter("sprice")))){
			   order.setSprice(Double.parseDouble(request.getParameter("sprice"))); 
		   }
		   if(!(request.getParameter("uprice") == null || "".equals(request.getParameter("uprice")))){
			   order.setUprice(Double.parseDouble(request.getParameter("uprice"))); 
		   }
		   if(!(request.getParameter("PMethod") == null || "".equals(request.getParameter("PMethod")))){
			   order.setPmethod(request.getParameter("PMethod")); 
		   }
		   if(!(request.getParameter("uCompany") == null || "".equals(request.getParameter("uCompany")))){
			   order.setUcompanyname(request.getParameter("uCompany")); 
		   }
		   if(!(request.getParameter("uEmail") == null || "".equals(request.getParameter("uEmail")))){
			   order.setUemail(request.getParameter("uEmail")); 
		   }
		   if(!(request.getParameter("uPhoneNumber") == null || "".equals(request.getParameter("uPhoneNumber")))){
			   order.setUphonenumber(request.getParameter("uPhoneNumber")); 
		   }
		   if(!(request.getParameter("uEmail") == null || "".equals(request.getParameter("uEmail")))){
			   order.setUemail(request.getParameter("uEmail")); 
		   }
		   if(!(request.getParameter("incoTerm") == null || "".equals(request.getParameter("incoTerm")))){
			   order.setIncoTerm(request.getParameter("incoTerm")); 
		   }
		   if(!(request.getParameter("confirm") == null || "".equals(request.getParameter("confirm")))){
			   order.setConfirm(request.getParameter("confirm"));
		   }
		   if(!(request.getParameter("confirmInfo") == null || "".equals(request.getParameter("confirmInfo")))){
			   order.setConfirminfo(request.getParameter("confirmInfo")); 
		   }
		   if(!(request.getParameter("custom") == null || "".equals(request.getParameter("custom")))){
			   order.setCustom(request.getParameter("custom")); 
		   }
		   if(!(request.getParameter("customInfo") == null || "".equals(request.getParameter("customInfo")))){
			   order.setCustominfo(request.getParameter("customInfo")); 
		   }
		   if(!(request.getParameter("margin") == null || "".equals(request.getParameter("margin")))){
			   order.setMargin(Double.parseDouble(request.getParameter("margin"))); 
		   }
			   order.setItemid(itemid);				

				Date time1 = null;
				try {
					time1 = format.parse(time);
				} catch (ParseException e) {
					e.printStackTrace();
				}
				order.setTime(time1);
		order.setOrderStatus(0);		
	    steelPateService.saveGoods(order); 
		 
		 
		return order.getItemid();	
	 }

	@RequestMapping("/queryByItemId")
	public ModelAndView queryByItemId(HttpServletRequest request, HttpServletResponse response,Model model){
		ModelAndView mav = new ModelAndView("/website/PayMent.jsp");
		String itemId = request.getParameter("itemId");
		SteelPlateOrder order = steelPateService.selectByPrimaryKey(itemId);
		 request.setAttribute("order", order);
		 mav.addObject("itemId",order.getItemid());
		 mav.addObject("sCategory", order.getScategory());
		 mav.addObject("sname",order.getSname());
		 mav.addObject("sMaterial", order.getSmaterial());
		 mav.addObject("length", order.getLength());
		 mav.addObject("weight", order.getWeight());
		 mav.addObject("sprince", order.getSprice());
		 mav.addObject("uprice", order.getUprice());
		 mav.addObject("margin", order.getMargin());
		 mav.addObject("uCompany", order.getUcompanyname());
		 mav.addObject("uEmail", order.getUemail());
		 mav.addObject("uPhoneNumber", order.getUphonenumber());
		 mav.addObject("incoTerm", order.getIncoTerm());
		 mav.addObject("confirm", order.getConfirm());
		 mav.addObject("time", order.getTime());
		return mav;
	}
		
	//根据订单号查询订单
	@RequestMapping("/findOrderByItemId")
	public String findOrderByItemId(HttpServletRequest request, HttpServletResponse response,Model model){
		String itemId = request.getParameter("itemId");
		SteelPlateOrder order = steelPateService.selectByPrimaryKey(itemId);
		model.addAttribute("order",order);
		System.out.println("查询出来的订单:"+order.toString()+"-----------------------------");
		return "/website/PaymentFailed.jsp";
	}

	}
















































