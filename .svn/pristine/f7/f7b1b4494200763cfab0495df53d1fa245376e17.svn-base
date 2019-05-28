//<script type="text/javascript" src="${path}/js/warehousejs/orderfeepage.js"></script>
//根据orderid查询订单详情
//$(function(){ 加载之前
$(document).ready(function(){  //加载完成
	//alert($("#order_no0").html());
	

	//所有订单
	getOrderFee(1,'');
	
	
	//订单数量
	getOutCount();
	//加载国家
	getFpxCountryCode();
	//4px运输方式
	getFpxProductCode();
	//其他出货方式
	getCodemaster();
	
	//
	//getNotMoneyOrderinfo(); 
	
	//input 
	$("input[type='text']").width("110px");
	
})
//$(function() { 
//	//第一个订单信息
//	if($("#order_no0").size() !=1){
//		return;
//	}
//	var order_no = $("#order_no0").html();
//	var userid = $("#userid0").html();
//	alert(order_no);
//	getOrderInfo(order_no,userid);
//});

//可出库数量，欠费数量
function getOutCount(){
//	alert("123");
	$.ajax({
		type:"post", 
		url:"getOutCount.do",
		dataType:"text",
		success : function(data){  //返回受影响的行数
			var objlist = eval("("+data+")");
			var ckCount = 0;
			var qfCount = 0;
			for(var i=0; i<objlist.length; i++){
				
				if(objlist[i].outType==0){
					qfCount += Number(objlist[i].outCount);
					
				}
				if(objlist[i].outType==1 || objlist[i].outType==4){
					ckCount += Number(objlist[i].outCount);
				}
			}
			$("#s_auditOrder").html(ckCount);  
			$("#s_arrears").html(qfCount);
		}
	});
}
//国家
function getFpxCountryCode(){
//	alert($("#fpxCountryCode option").size());
	var fpxCountryCode = $("#fpxCountryCode");
	if($("#fpxCountryCode option").size()>1){
		return;
	}
	$.ajax({
		type:"post", 
		url:"getFpxCountryCode.do",
		dataType:"text",
		success : function(data){  //返回受影响的行数
			var objlist = eval("("+data+")");
			for(var i=0; i<objlist.length; i++){
			
				fpxCountryCode.append("<option value='"+objlist[i].country_code+"'>"+objlist[i].chinese_name+"</option>");
			
			}
		
		}
	});
}

//根据id和订单查询
function getOrderInfoByUseridAndOrderid(){
//	<tr><td colspan='2'>userid<input id='t_userid' type='text' /></br>orderno<input id='t_orderno' type='text' /></td></tr>";
	var useridAndorderno = $("#t_useridAndorderno").val();
//	var orderno = $("#t_orderno").val();
	var typeOrder = $("input[name='typeOrder']:checked").val();
	getOrderFee(typeOrder,useridAndorderno);
}


//所有订单
function getOrderFee(typeOrder,useridAndorderno){
//typeOrder
	//alert(typeOrder,userid,orderno);
	$.ajax({
		type:"post", 
		url:"getOrderFee.do",
		data:{typeOrder:typeOrder,useridAndorderno:useridAndorderno}, //,orderno:orderno
		dataType:"text",
		success : function(data){  //返回受影响的行数 onpropertychange=''
			var t= false;
			var objlist = eval("("+data+")");
		//	$('#t_order tr').empty();
			$("#t_order  tr:gt(0)").html("");
//			var newRow ="<tr><td colspan='2'>userid<input oninput='getOrderInfoByUseridAndOrderid()'  id='t_userid' type='text' /></br>" +
//										   "orderno<input oninput='getOrderInfoByUseridAndOrderid()' id='t_orderno' type='text' /></td></tr>";
//			
//			$('#t_order').append(newRow);  	
//			var newRow ="<tr><td>userid<input type='hidden' id='h_userid'/></td><td>orderno<input type='hidden' id='h_orderid'/></td></tr>";
//				
//			$('#t_order').append(newRow); 
//			
			//查询等待付款订单，但是已经还清的订单
			if(typeOrder == "2"){
				getNotMoneyOrderinfo();  
			}
			for(var i=0; i<objlist.length; i++){
				
			//	fpxCountryCode.append("<option value='"+objlist[i].country_code+"'>"+objlist[i].chinese_name+"</option>");
//				<c:forEach items="${oflist }" var="orderFeePojo" varStatus="s">
//				<tr>
//				<td id="userid${s.index }">${orderFeePojo.userid }</td>
//				<td >
//				<a id="order_no${s.index }" href='javascript:void(0);' onclick="getOrderInfo('${orderFeePojo.orderno }','${orderFeePojo.userid }')" >${orderFeePojo.orderno }</a>
//				</td>  
//			</tr>
//			</c:forEach>  "+objlist[i].orderno+"
				
				if(typeOrder == "2"){
				//	alert(objlist[i].orderno+"-----------"+objlist[i].isBadMoney);
					if(objlist[i].isBadMoney =='1'){
						
						newRow = "<tr style='background-color : #C0FFD0;'> "+
						"<td id='userid"+i+"'>"+objlist[i].userid+"</td>"+
						"<td >"+
						"<a id='order_no"+i+"' href='javascript:void(0);' onclick=\"getOrderInfo('"+objlist[i].orderno+"','"+objlist[i].userid+"')\" >"+objlist[i].orderno+"</a>"+
						"</td>  "+
						"</tr>";
					}else{
						newRow = "<tr> "+
						"<td id='userid"+i+"'>"+objlist[i].userid+"</td>"+
						"<td >"+
						"<a id='order_no"+i+"' href='javascript:void(0);' onclick=\"getOrderInfo('"+objlist[i].orderno+"','"+objlist[i].userid+"')\" >"+objlist[i].orderno+"</a>"+
						"</td>  "+
						"</tr>";
					}
					
				}else{
					newRow = "<tr> "+
					"<td id='userid"+i+"'>"+objlist[i].userid+"</td>"+
					"<td >"+
					"<a id='order_no"+i+"' href='javascript:void(0);' onclick=\"getOrderInfo('"+objlist[i].orderno+"','"+objlist[i].userid+"')\" >"+objlist[i].orderno+"</a>"+
					"</td>  "+
					"</tr>";
					
				}
				$('#t_order').append(newRow); 
				 t = true;
			}
			//有值 查询第一个
			if(t){
				//改为先不查询了，让自己点击
			//	getOrderInfo(objlist[0].orderno,objlist[0].userid);
			}
			         
		
		}
	});
}
//oninput='getOrderInfoByUseridAndOrderid()'  id='t_useridAndorderno'
function setCurSelValue(obj){
	if(obj.value !="选择可出库订单"){
		$("#t_useridAndorderno").val(obj.value);
		getOrderInfoByUseridAndOrderid();    
	}
}

//查询等待付款订单中 哪些定点已经把钱付清了
function getNotMoneyOrderinfo(){
	$.ajax({
		type:"post", 
		url:"getNotMoneyOrderinfo.do",
		dataType:"text",
		success : function(data){  //返回受影响的行数
			var objlist = eval("("+data+")");
			$("#notMoneyOrderinfo").empty();
			$("#notMoneyOrderinfo").append("<option>选择可出库订单</option>");   
			for(var i=0; i<objlist.length; i++){
				$("#notMoneyOrderinfo").val(objlist.length);
				$("#notMoneyOrderinfo").append("<option value='"+objlist[i].order_no+"'>"+objlist[i].order_no+"</option>");
			
			}
			
		}
	});
}

//其他出货方式
function getCodemaster(){
//	alert($("#fpxCountryCode option").size());
	var logisticsName = $("#logisticsName");
	if($("#logisticsName option").size()>1){
		return;
	}
//	$.ajax({
//		type:"post", 
//		url:"getCodemaster.do",
//		dataType:"text",
//		success : function(data){  //返回受影响的行数
//			var objlist = eval("("+data+")");
//			
//			for(var i=0; i<objlist.length; i++){
//		                              
//				if(objlist[i].code_name == 'EMS国际'){
//					alert(objlist[i].code_name);                    
//					logisticsName.append("<option  selected='selected' value='"+objlist[i].code_id+"'>"+objlist[i].code_name+"</option>");
//				}else{
//				//	logisticsName.append("<option value='"+objlist[i].code_id+"'>"+objlist[i].code_name+"</option>");
//				}
//				         
//			
//			}
//			
//		}
//	});
}

//4px运输方式
function getFpxProductCode(){
//	alert($("#fpxCountryCode option").size());
	var fpxProductCode = $("#fpxProductCode");
	if($("#fpxCountryCode option").size()>1){
		return;
	}
	$.ajax({
		type:"post", 
		url:"getFpxProductCode.do",
		dataType:"text",
		success : function(data){  //返回受影响的行数
			var objlist = eval("("+data+")");
			for(var i=0; i<objlist.length; i++){
			
				fpxProductCode.append("<option value='"+objlist[i].productcode+"'>"+objlist[i].chinesename+"</option>");
			
			}
			
		}
	});
}

////计算运费
//function calculateFreight(){
//	var type = $("input[name='ysfs']:checked").val();  //出货方式  4px  佳成  原飞航
//	if(type){ 
//		
//	}
//}

//检查体积国家是否已经输入
function checkTextIsNull(){

	var weight = $.trim($("#weight").val());  //重量
	if(weight.length<1){
		showMsg("<h1 style='color: red;'>请输入重量</h1>");
		return false;
	}
	var volumelwh = $.trim($("#volumelwh").val()); //体积
	var zz = /^[\d]+[\*][\d]+[\*][\d]+$/;
	
	if(volumelwh.length<1){
		showMsg("<h1 style='color: red;'>请输入体积</h1>");
		return false;
	}
	
	if(!zz.test(volumelwh)){
		showMsg("<h1 style='color: red;'>体积格式输入有误</h1>");
		return false;
	}
	
	var type = $("input[name='ysfs']:checked").val();
	if(Number(type) != 2 ){
		var fpxCountryCode = $.trim($("#fpxCountryCode").val()); //国家
		if(fpxCountryCode == '运输国家' || fpxCountryCode ==''){
			showMsg("<h1 style='color: red;'>请输入国家</h1>");
			return false;
		}
	}
//	if(fpxCountryCode != '运输国家' && fpxCountryCode !=''){
//		if(Number(type) == 4){
//			var logisticsName = $.trim($("#logisticsName").val()); 
//			if(logisticsName == '物流公司名称' || logisticsName ==''){
//				showMsg("<h1 style='color: red;'>请输入物流公司名称</h1>");
//				return false;
//			}
//		}
//	}
	
	return true;
	
}
//提示
function showMsg(msg){
	$("#msgid").html(msg).show(1500).delay(1000).hide(300); 
}
//获得运费
function getFreight(){
	var type = $("input[name='ysfs']:checked").val();  //出货方式  4px  佳成  原飞航
	var trans = $("#trans").val(); //区域
	var weight = $("#weight").val();  			//重量
	var volumelwh = $("#volumelwh").val(); 		//体积
	var fpxCountryCode = $("#fpxCountryCode").val(); //国家
	var currency = $("#h_currency").val();		//货币单位
	var fpxProductCode = $("#fpxProductCode").val();//运输方式
	//如果选择了区域  设置原飞航出货类型被选中
//	alert(trans);
	if(trans != '区域'){
	//	$("#r_yfh").attr("checked","true");
	}else{
		return;
	}
	
	if(checkTextIsNull() == false){
	//	$("#fpxCountryCode").find("option[text='运输国家']").attr("selected",true);
		$("#fpxProductCode").val('运输方式');
		return ;
	}
	
	//

	$.ajax({
		type:"post", 
		url:"getFreight.do",
		dataType:"text",
		data:{type:type,weight:weight,volumelwh:volumelwh,
			  fpxCountryCode:fpxCountryCode,currency:currency,
			  fpxProductCode:fpxProductCode,trans:trans},
		success : function(data){  //
			if(data == '500'){
				showMsg("<h1 style='color: red;'>查询不到运费</h1>");
			}else{
			//	alert(data);
				setFreight(Number(data));
			}
			
		}
	});
	
	
}

//设置运费
function setFreight(freight){
	$("#actualFreight").val(freight);//实际运费
	
//	var pay_price_tow = Number($("#s_pay_price_tow").html());  //已支付运费
	var pay_price_tow = Number($("#s_payment_amount").html()) - Number($("#s_product_cost").html());  //已支付运费

	var s = freight-pay_price_tow;   
	$("#unpaidFreight").val(s.toFixed(2));  //计算
	
	$("#h_unpaidFreight").val(s.toFixed(2)); //保存隐藏的运费 用来计算 翻倍
	
}
//包装费
function packingCharge(){
//	var zz = /^[\d]+[]$/;
//	
//	if(!zz.test(obj.value)){
//		showMsg("<h1 style='color: red;'>包装费输入有误,包含非数字</h1>");
//		return false;
//	}
//	$("#h_unpaidFreight").val($("#unpaidFreight").val());
	//alert(obj);
	var objvalue = 0
	if($("#packingCharge").val() != ''){
		objvalue = Math.abs(Number($("#packingCharge").val()));					   //包装费
	}
	
	var jg = 0;
//	var pay_price_tow = Number($("#s_pay_price_tow").html());  //已支付运费  
	var pay_price_tow = Number($("#s_payment_amount").html()) - Number($("#s_product_cost").html()) - Number($("#s_discount_amount").html());  //已支付产品金额
	
	var order_ac = Number($("#s_order_ac").html()); 	       //抵扣运费
	var actualFreight = Number($("#actualFreight").val());    //实际运费
	
	
	if($("#subFreightid").prop("checked") != true){
		order_ac = 0;
	}
//	alert(order_ac);
	
	var s = actualFreight-pay_price_tow-order_ac+objvalue;   
	$("#unpaidFreight").val(s.toFixed(2));
	
	$("#h_unpaidFreight").val(s.toFixed(2));//保存隐藏运费 计算翻倍
}
//删除申报
function removeSbDiv(sbdivid){
	
	$("#addsbdiv").height($("#addsbdiv").height()-46);
	$("#outddinfodiv").height($("#outddinfodiv").height()-46);
	$("#"+sbdivid).remove();
}
function test(){
	
	/*
	 *  var map = {}; // Map map = new HashMap();
		map[key] = value; // map.put(key, value);
		var value = map[key]; // Object value = map.get(key);
		var has = key in map; // boolean has = map.containsKey(key);
		delete map[key]; // map.remove(key);
	 * */
	var listmap= new Array();
	var i=0;
	$('#sbdiv').children().each(function(){
		
		var map = {}; 
		$(this).children().each(function(){
			if( typeof($(this).attr('name')) != "undefined"){  
				map[$(this).attr('name')+i] = $(this).val();
			}
		});
		
		listmap[i] = map;
		
		i++;
	});
	
	//console.log(listmap);

	//data: {"idList":idList,"isBatch":isBatch},  
	//data:JSON.stringify(listmap),
	var mainMap={};
	mainMap['listmap']=listmap;
	mainMap['id']='123';
	$.ajax({
		type:"post", 
		url:"getTest.do",
		dataType:"json",  
	    contentType : 'application/json;charset=utf-8', //设置请求头信息  
	    data:JSON.stringify(mainMap),
		success : function(data){  //
		//	alert(data);
			
		}
	});
	
	
}
//添加申报
function addSb(){
	$("#addsbdiv").height($("#addsbdiv").height()+46);

	$("#outddinfodiv").height($("#outddinfodiv").height()+46);
	var subdivid = ($("#sbdiv").children().length+1)
	var adddiv = "<div id='subsbdiv"+subdivid+"'>"+
						"&nbsp;中文品名：<input width='114px' type='text' name='sbzwpm'/>"+
						"&nbsp;英文品名：<input width='114px' type='text' name='sbywpm'/>"+
						"&nbsp;配货备注：<input width='114px' type='text' name='sbphbz'/><br/>"+
						"&nbsp;数        量：<input width='114px' type='text' name='sbsl'/>"+
						"&nbsp;价        格：<input width='114px' type='text' name='sbjg'/>"+
						"&nbsp;单        位：<input width='114px' type='text' name='sbdw'/>"+
						"<input type='button' value='删除申报' onclick=\"removeSbDiv('subsbdiv"+subdivid+"')\"/>"+
				"</div>";
	
	
	$("#sbdiv").append(adddiv);
	
}
//抵扣赠送运费
function subFreight(obj){
	//获得赠送运费
	/**/
	var order_ac = $("#s_order_ac").html();
	var unpaidFreight = $("#unpaidFreight").val();
	
	var jg;
	if($(obj).prop("checked") == true){
		jg = Number(unpaidFreight)-Number(order_ac);
		$("#unpaidFreight").val(jg.toFixed(2));
	}else{
		jg = Number(unpaidFreight)+Number(order_ac);
		$("#unpaidFreight").val(jg.toFixed(2));
	}
	
	
}
//出货
function shipment(){
	if(checkTextIsNull() == false){
		//	showMsg("<h1 style='color: red;'>请输入物流公司名称</h1>");
			return;
	}
	var type = $("input[name='ysfs']:checked").val();  //出货方式  4px  佳成  原飞航
	if(Number(type) == 4){
		var logisticsName = $.trim($("#logisticsName").val()); 
		if(logisticsName == '物流公司名称' || logisticsName ==''){
			showMsg("<h1 style='color: red;'>请输入物流公司名称</h1>");
			return;
		}
	}
	
	
	$("#inshipment").val("正在操作，清稍候...");

	$('#inshipment').attr('disabled',"true");
	
	
	//申报信息
	var listmap= new Array();
	var i=0;
	$('#sbdiv').children().each(function(){
		
		var map = {}; 
		$(this).children().each(function(){
			if( typeof($(this).attr('name')) != "undefined"){  
				map[$(this).attr('name')] = $(this).val();
			}
		});
		
		listmap[i] = map;
		
		i++;
	});
	
	var type = Number($("input[name='ysfs']:checked").val());  //出货方式  4px  佳成  原飞航
	var temp ="";
	if(type == 1){
		temp = "4PX运输";
	}else if(type == 2){
		temp = "原飞航运输";
	}else if(type == 3){
		temp = "佳成运输";
	}else if(type == 4){
		temp = "其他运输";
	}
//	alert($("#h_orderid").val());
	var mainMap={};  //主
	mainMap['listmap']=listmap;  							//申报信息
	mainMap['orderid']=$("#h_orderid").val(); 				//orderid
	mainMap['userid']=$("#h_userid").val();					//userid
	mainMap['courierNumber']=$("#courierNumber").val(); 	//快递单号
	mainMap['fpxCountryCode']=$("#fpxCountryCode").val(); 	//国家
	
	if(Number($("#unpaidFreight").val()) >0){
		if(Number($("#unpaidFreight").val()) < Number($("#foreign_freight").html())){
			//alert($("#foreign_freight").html());
			mainMap['unpaidFreight']=$("#foreign_freight").html(); 	//未支付费用
		}else{
			//alert($("#unpaidFreight").val());
			mainMap['unpaidFreight']=$("#unpaidFreight").val(); 	//未支付费用
		}
	}else{
		mainMap['unpaidFreight']=$("#unpaidFreight").val(); 	//未支付费用
	}
//	alert(mainMap['unpaidFreight']);
//	return;
	//fpxCountryCode             
	mainMap['trans_method'] = type;  //temp					//出货方式
	mainMap['fpxProductCode']=$("#fpxProductCode").val(); 	//运输方式详细
	mainMap['packingCharge']=$("#packingCharge").val(); 	//包装费
	mainMap['actualFreight']=$("#actualFreight").val(); 	//实际运费
	mainMap['volumelwh']=$("#volumelwh").val(); 			//产品体积
	mainMap['weight']=$("#weight").val(); 					// 整体重量
	mainMap['trans']=$("#trans").val(); 					// 区域
	mainMap['logistics_name']=$("#logisticsName").val(); 	// 物流公司名字
	
	//抵扣赠送余额这里先不做，保留
	if($("#subFreightid").prop("checked") ==  true){
		mainMap['subFreightid']="1"; 	// 是否抵扣余额
		mainMap['s_order_ac']=$("#s_order_ac").html(); 	// 赠送的余额
	}else{
		mainMap['subFreightid']="0"; 	// 是否抵扣余额
	}
	
	
	          
	 
//shipment127
//	alert($("#packingCharge").val());
	$.ajax({
		type:"post", 
		url:"shipment.do",
		dataType:"json",  
	    contentType : 'application/json;charset=utf-8', 
	    data:JSON.stringify(mainMap),
		success : function(data){  //
			$("#inshipment").val("出货");
			$('#inshipment').removeAttr("disabled"); 
		//	alert(data);
			if(data == "1000"){
				if(type == 2 ){//|| type == 3
					showMsg("<h1 style='color: red;'>出货成功开始打印</h1>");
					
					setTimeout(function () { 
						printFaceSheet(type);   //打印面单
					 }, 1500);
				}else{
					showMsg("<h1 style='color: red;'>出货成功</h1>");
				}
				
				sendFahuoEmail();
				
			}else if(data == "1001"){
				showMsg("<h1 style='color: red;'>数据保存失败，导致出货不成功</h1>");
			}else if(data == "1002"){
				showMsg("<h1 style='color: red;'>保存成功，但出货失败</h1>");
			}else if(data == "1003"){
				sendMail();//差钱发送邮件
				showMsg("<h1 style='color: red;'>保存成功，但是差钱不能出货</h1>");
			}else if(data == "1004"){
				showMsg("<h1 style='color: red;'>出货失败，检查申报信息是否输入有误</h1>");
			}
			
			
				pageCle();//清空 
				getOutCount();//更新数量
				//获得现在选择的 是查询的那种订单 是已审核通过，还是差钱的
			//	alert($("input[name='typeOrder']:checked").val());
				getOrderFee($("input[name='typeOrder']:checked").val(),'');//更新订单
		   
			
			
		}
	});
}

//发送邮件
function sendMail(){
	var userid = $("#s_userid").html();  //用户id
	var toEmail = $("#s_useremail").html();  //用户邮箱
	var sbBuffer = $("#sbBuffer").html();  //发送内容
	var orderNo = $("#h_orderid").val();  //订单号
	var orderarrs = $("#h_mergeorders").val();  //所有订单号
	var path = $("#h_path").val();
	var currency = $("#h_currency").val(); //货币单位
	
	//具体费用
	var fee ="0";
	if(Number($("#unpaidFreight").val())>0){
		if(Number($("#unpaidFreight").val()) < Number($("#foreign_freight").html())){
			//alert($("#foreign_freight").html());
			fee=$("#foreign_freight").html(); 	//未支付费用
		}else{
			//alert($("#unpaidFreight").val());
			fee=$("#unpaidFreight").val(); 	//未支付费用
		}
	}
	         
	fee += " "+currency+"";
	//添加付费页面
	var feeHere = "<a target='_blank' href='"+path+"/processesServlet?action=individualOrderdetail&className="+orderNo+"'>here.</a>";  //<a href="#">fee here.</a>
	//点击订单能跳到订单详情
	
	var tempStr = "";
	if(orderarrs.indexOf(',') != -1){
		var arr = orderarrs.split(',');
		for(var i=0; i<arr.length; i++){
			tempStr += "<a target='_blank' href='"+path+"/processesServlet?action=getCtpoOrders&className=OrderInfo&orderNo="+arr[i]+"'>"+arr[i]+"</a>,"
		}
		tempStr = tempStr.substring(0,tempStr.length-1);
	}else{
		tempStr += "<a target='_blank' href='"+path+"/processesServlet?action=getCtpoOrders&className=OrderInfo&orderNo="+orderarrs+"'>"+orderarrs+"</a>"
	}
	
	var orders = tempStr;
	sbBuffer +="<table>";

	sbBuffer +="<tr><td>"; //图片
	sbBuffer +="<img src='"+path+"/img/importexpress.png'/>";
	sbBuffer +="</td></tr>";
	
	sbBuffer +="<tr><td>"; //用户邮箱
	sbBuffer += "Dear "+toEmail;
	sbBuffer +="</td></tr>";
	
	sbBuffer +="<tr><td>"; //用户邮箱
	sbBuffer +="Your ImportExpress order is arrived at our warehouse and ready to deliver out, please complete <br/>the delivery fee "+feeHere;
	sbBuffer +="</td></tr>";
	
	sbBuffer +="<tr><td height='10px'></td></tr>";
	
	sbBuffer +="<tr><td>"; //用户邮箱
	sbBuffer +="Total delivery fee:"+fee;
	sbBuffer +="</td></tr>";
	
	sbBuffer +="<tr><td height='10px'></td></tr>";
	
	sbBuffer +="<tr><td>"; //用户邮箱
	sbBuffer +="After we receive the above delivery fee, we will ship out your order ("+orders+")";
	sbBuffer +="</td></tr>";
	
	sbBuffer +="<tr><td height='10px'></td></tr>";
	
	sbBuffer +="<tr><td>"; //用户邮箱
	sbBuffer +="Best regards,";
	sbBuffer +="</td></tr>";
	
	sbBuffer +="<tr><td>"; //用户邮箱
	sbBuffer +="Import-Express.com";
	sbBuffer +="</td></tr>";   
	
	sbBuffer +="<tr><td height='10px'></td></tr>";
	
	sbBuffer +="<tr><td><div style='background-color : #999999;border-width : 1px;border-color : #01000C;border-style : double;'>"; //用户邮箱
	sbBuffer +="PLEASE NOTE:<br/>"+
"This email message was sent from a notification-only address that cannot accept incoming email. <br/>"+
"PLEASE DO NOT REPLY to this message. If you have any questions or concerns, Access your account ";
	
	sbBuffer += "<a target='_blank' href='http://www.import-express.com/processesServlet?action=getCenter&className=IndividualServlet'>here.</a>";
			
	sbBuffer +="</div></td></tr>";
	
	sbBuffer +="</table>";
	
	$("#sbBuffer").html(sbBuffer);  //发送内容
	//	return;
	$.ajax({
		type:"post", 
		url:"sendMail.do",
		dataType:"text",
		data:{userid:userid,toEmail:toEmail,sbBuffer:sbBuffer,orderNo:orderNo},
		success : function(data){  
			if(data=="1"){
				//alert("发送成功");
			}
		}
	});
}

function testPrint(){
}

//根据不同的运输方式显示不同的选择界面
function showByType(type){
//	<input onclick="showByType(1)" value="1" checked="checked" type="radio" name="ysfs"/>4PX运输&nbsp;&nbsp;&nbsp;&nbsp;
//	<input onclick="showByType(1)" value="2" id="r_yfh"type="radio" name="ysfs"/>原飞航运输&nbsp;&nbsp;&nbsp;&nbsp;
//	<input onclick="showByType(1)" value="3" type="radio" name="ysfs"/>佳成运输&nbsp;&nbsp;&nbsp;&nbsp;
//	<input onclick="showByType(1)" value="4" type="radio" name="ysfs"/>其他运输&nbsp;&nbsp;&nbsp;&nbsp;
//	&nbsp;快递单号：<input id="courierNumber" type="text"/>

	if(type == 1){  //4px
		$("#d_fpxCountryCode").show(); //国家
		$("#d_fpxProductCode").show(); //运输方式
		$("#d_trans").hide();			 //区域
		$("#d_logisticsName").hide();  //物流公司名字
		$("#d_courierNumber").hide();  //快递单号
		
	}else if(type == 2){ //原飞航运输
		$("#d_fpxCountryCode").hide(); //国家
		$("#d_fpxProductCode").hide(); //运输方式
		$("#d_trans").show();			 //区域
		$("#d_logisticsName").hide();  //物流公司名字
		$("#d_courierNumber").show();  //快递单号
	}else if(type == 3){ //佳成运输
		$("#d_fpxCountryCode").show(); //国家
		$("#d_fpxProductCode").show(); //运输方式
		$("#d_trans").hide();			 //区域
		$("#d_logisticsName").hide();  //物流公司名字
		$("#d_courierNumber").hide();  //快递单号
	}else if(type == 4){ //其他运输
		$("#d_fpxCountryCode").show(); //国家
		$("#d_fpxProductCode").show(); //运输方式
		$("#d_trans").hide();			 //区域
		$("#d_logisticsName").show();  //物流公司名字
		$("#d_courierNumber").show();  //快递单号
		
		
		//其他方式
		getQtFs();
	}
//	<br/>
//	&nbsp;运输国家：
//	<select id="fpxCountryCode" onchange="getJcYsfs()">
//		<option value="运输国家">运输国家</option>
//	</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
//	&nbsp;运输方式：
//	<select id="fpxProductCode" onchange="getFreight()">
//		<option value="运输方式">运输方式</option>
//	</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
//	&nbsp;区域：
//	<select id="trans" onchange="getFreight()">
//		<option value="">区域</option>
//		<option value="美/加/墨">美/加/墨</option>
//		<option value="南非">南非</option>
//		<option value="澳洲">澳洲</option>
//		<option value="西欧">西欧</option>
//		<option value="东欧">东欧</option>
//	</select>
//	&nbsp;物流公司名称：
//	<select id="logisticsName" onchange="getCodemaster()">
//		<option value="物流公司名称" selected="selected">物流公司名称</option>
//	</select>
}


//获取其他运输方式
function getQtFs(){
	var fpxProductCode = $("#fpxProductCode");
	$.ajax({
		type:"post", 
		url:"getQtFs.do",
		dataType:"text",
		success : function(data){  //
			var objlist = eval("("+data+")");
			$(fpxProductCode).empty(); 
			fpxProductCode.append("<option value='运输方式'>运输方式</option>");
			for(var i=0; i<objlist.length; i++){
				fpxProductCode.append("<option value='"+objlist[i]+"'>"+objlist[i]+"</option>");
			}
		}
	});
}


//打印面单
function printFaceSheet(type){

	//alert("打印");
	if(type == 1){
		temp = "4PX运输";
	}else if(type == 2){
//		var newWindow=window.open("打印窗口","_blank");
//	    var docStr = $("#printFyh").html();
//		newWindow.document.write(docStr);
//	    newWindow.document.close();
//	    newWindow.print();
//	    newWindow.close();
//	    
	    window.open("/cbtconsole/website/testprintinfoyfh.jsp"); //"原飞航运输";
	}else if(type == 3){
		window.open("/cbtconsole/website/testprintinfo.jsp"); //"佳成运输";
	}else if(type == 4){
		temp = "其他运输";
	}
	
//	$("#fjrxx").val($("#fjrxx").val());
//	var newWindow=window.open("打印窗口","_blank");
//    var docStr = $("#jcexprintinfoid").html();
//	newWindow.document.write(docStr);
//    newWindow.document.close();
//    newWindow.print();
//    newWindow.close();
}


function getYsfs(){
	if(checkTextIsNull() == false){
		//	$("#fpxCountryCode").find("option[text='运输国家']").attr("selected",true);
			$("#fpxCountryCode").val('运输国家');
			return ;
	}
	var type = $("input[name='ysfs']:checked").val();  //出货方式  4px  佳成  原飞航
	if(Number(type) == 1){
		get4pxTransportationTime();
	}else if(Number(type) == 3){
		getJcYsfs();
	}
}
//获取国家对应的运输方式的运输时间
function get4pxTransportationTime(){
	$("#msgid").html("<h1 style='color: red;'>正在查询4px运输方式，请不要做其他操作！</h1>").show(); 
	
	var weight = $("#weight").val();  			//重量
	var volumelwh = $("#volumelwh").val(); 		//体积
	var fpxCountryCode = $("#fpxCountryCode").val(); //国家
	var currency = $("#h_currency").val();		//货币单位
	var fpxProductCode = $("#fpxProductCode");
	$.ajax({
		type:"post", 
		url:"get4pxTransportationTime.do",
		dataType:"text",
		data:{weight:weight,volumelwh:volumelwh,
			  fpxCountryCode:fpxCountryCode,currency:currency},
		success : function(data){  //
			
			if("500" == data || "600" == data){
				$("#msgid").html("<h1 style='color: red;'>4px查询异常</h1>").show(1500).delay(1000).hide(300); 
			}else{
				var objlist = eval("("+data+")");
				objlist.sort();
				$(fpxProductCode).empty(); 
				fpxProductCode.append("<option value='运输方式'>运输方式</option>");
				for(var i=0; i<objlist.length; i++){
				
					if(objlist[i].chinesename.indexOf("(天)") != -1){
						fpxProductCode.append("<option value='"+objlist[i].productcode+"'>"+objlist[i].chinesename+"</option>");
					}
					
				
				}
				$("#msgid").html("<h1 style='color: red;'>4px运输方式查询完成</h1>").show(1500).delay(1000).hide(300); 
			}
		}
	});
	
	
}

//嘉城运输方式
function getJcYsfs(){

	
	var radio = $("input[name='ysfs']:checked").val();

	
	if(Number(radio) == 3){
		
		var weight = $("#weight").val(); // 重量
		var volumelwh = $("#volumelwh").val(); // 体积
		var fpxCountryCode = $("#fpxCountryCode").val(); // 国家
		
		$.ajax({
			type:"post", 
			url:"getJcYsfs.do",
			dataType:"text",
			data:{weight : weight,volumelwh : volumelwh,fpxCountryCode : fpxCountryCode},
			success : function(data){  //返回受影响的行数
			
				if(data != '500' && data != '600'){
					var list = eval("("+data+")");
					$("#fpxProductCode").html("");
		 			$("#fpxProductCode").append("<option selected=\"selected\">运输方式</option>"); 
		 			for(i=0; i<list.length; i++){
		 				$("#fpxProductCode").append("<option value='"+list[i].WLMX+"'>"+list[i].WLMX+"</option>"); 
		 			}
		 	//		$('#idjcysfs').change();
		 	//		$("#idjcysfs option:selected").text("运-输-方-式");
				}else{
					showMsg("<h1 style='color: red;'>佳成运输方式查询失败！</h1>");
				}
			}
		});
	}
	//
		
	
	
}
//清空
function pageCle(){
	$('#d_right span').html("");
	$('#outddinfodiv input[type=text]').val("");
}
//订单金额 已支付金额  已支付运费
function getPaymentFy(user_id,order_no){
	$.ajax({
		type:"post", 
		url:"getPaymentFy.do",
		dataType:"text",
		data:{user_id : user_id,order_no : order_no},
		success : function(data){  //返回受影响的行数
	//	alert(data);
			if(data != '0'){
				var obj = eval("("+data+")");
//				&nbsp;用户余额:<span id="s_available_m">2222</span>(<span id="u_available_m"></span>)
//				&nbsp;赠送金额:<span id="s_order_ac">2222</span>  (<span id="u_order_ac"></span>)
//				
//				&nbsp;产品总金额:<span id="s_product_cost">2222</span>  (<span id="u_product_cost"></span>)
//				&nbsp;已支付产品总金额:<span id="s_payment_amount">2222</span>(<span id="u_payment_amount"></span>)  
//				&nbsp;已支付运费:<span id="s_pay_price_tow">2222</span>(<span id="u_pay_price_tow"></span>) 
//				
//				private String sumProduct_cost; //产品总金额
//				private String sumPay_price_tow; // 已支付运费金额
//				private String sumPayment_amount; // 已支付产品费用
		//		alert(obj.sumProduct_cost+"-"+obj.sumPay_price_tow+"-"+obj.sumPayment_amount);
				$("#s_product_cost").html(obj.sumProduct_cost);  //
				$("#s_payment_amount").html(obj.sumPayment_amount);  //
				$("#s_pay_price_tow").html(obj.sumPay_price_tow);  //
				$("#s_sumOrder_ac").html(obj.sumOrder_ac);  // 赠送的总费用
				$("#foreign_freight").html(obj.sumForeign_freight);  // 预估费用
				$("#s_discount_amount").html(obj.sumDiscount_amount);  // 预估费用
				
			//	alert(obj.sumForeign_freight);   
				  
		//		$("#s_pay_price_tow").html("3.00");
			//	list[i]
			}else{
				showMsg("<h1 style='color: red;'>1</h1>");
			}
		}
	});
}
function test5(str){
	alert("123".indexOf("2"));
	var index = str.indexOf(",");
	var len  = str.length;
	if(len > 3 && index >0){
		if(charAt(index-1) != "\"" && charAt(index+1) != "\""){
			var c = str.substring(0,str.lastIndexOf(',')); 
			var b = str.substring(index+1);  
			alert(c+b);
		}
	}
	
}
//单个订单信息
function getOrderInfo(order_no,userid){
	$("input[name='ysfs']:eq(0)").attr("checked",'checked'); 		
	//alert(order_no,userid);
	pageCle();//清空
	$("#h_userid").val(userid);
	$("#h_orderid").val(order_no);
	$.ajax({
		type:"get", 
		url:"getOutOrderInfo.do",
		dataType:"text",
		data:{order_no : order_no},
		success : function(data){  //返回受影响的行数
			//alert("123".indexOf("2"));
			//$("#testdiv").html(data);
			if(data != '0'){                     
			//	alert(data);
				//	var obj = eval("("+data+")"); //这是该数组形式
				
				var obj = eval(data);
		//		alert(obj[0].user_id);
				var orderarrs ;
			  try{
				  $("#s_userid").html(obj[0].user_id);  //userid
				  orderarrs = obj[0].orderarrs;
			  }
			  catch (err) {                        
					// TODO: handle exception
				  }
			  
				
		//		$("#s_mergeorders").html(obj[0].mergeorders);  //userid
				
				$("#h_mergeorders").val(orderarrs);
				var tempStr = "";
				if(orderarrs.indexOf(',') != -1){
					var arr = orderarrs.split(',');
					
					
					for(var i=0; i<arr.length; i++){
						tempStr += "<a target='_blank' href='../WebsiteServlet?action=getOrderDetail&className=OrderwsServlet&orderNo="+arr[i]+"'>"+arr[i]+"</a>&nbsp;"
					}
					//$("#s_mergeorders").html(obj[0].orderarrs); 
					
				}else{
					tempStr += "<a target='_blank' href='../WebsiteServlet?action=getOrderDetail&className=OrderwsServlet&orderNo="+orderarrs+"'>"+orderarrs+"</a>&nbsp;"
				}
				
				$("#s_mergeorders").html(tempStr); 
				//收货地址
			//	alert(obj[0].zip_code+'--'+obj[0].phone_number);
				
				$("#s_country").html(obj[0].country);  //
				$("#s_statename").html(obj[0].statename);  //
				$("#s_address2").html(obj[0].address2);  //
				$("#s_street").html(obj[0].street);  //
				$("#s_address").html(obj[0].address);  //
				$("#s_zipcode").html(obj[0].zip_code);  // 邮编
				$("#s_phoneNumber").html(obj[0].phone_number);  //
				$("#s_useremail").html(obj[0].useremail);  //
				var currency = obj[0].currency;

				                
				try{
					var ipnaddress = eval("("+obj[0].ipnaddress+")");   //Pypal地址
					
					if( typeof(ipnaddress) != "undefined"){  
						$("#s_residence_country").html(ipnaddress[0].residence_country);  //
						$("#s_receiverEmail").html(ipnaddress[0].receiverEmail);  //
						$("#s_address_name").html(ipnaddress[0].address_name);  //
						$("#s_address_country_code").html(ipnaddress[0].address_country_code);  //
						$("#s_address_country").html(ipnaddress[0].address_country);  //
						$("#s_address_city").html(ipnaddress[0].address_city);  //
						$("#s_address_state").html(ipnaddress[0].address_state);  //
						$("#s_address_status").html(ipnaddress[0].address_status);  //
						$("#s_address_street").html(ipnaddress[0].address_street);  //
						$("#fpxCountryCode  option[value='"+ipnaddress[0].address_country_code+"'] ").attr("selected",true);    
						$("#fpxCountryCode").val(ipnaddress[0].address_country_code);
					}
				}
				catch(err){
				     
				}     
				
				
				//用户余额
				
				$("#s_available_m").html(obj[0].available_m);  //用户余额
				$("#s_applicable_credit").html(obj[0].applicable_credit);  //赠送金额
		//		$("#s_order_ac").html("5.00");
				
				
				getPaymentFy(userid,order_no);
				
				$("span[id='u_currency']").html(currency);  //所有的货币单位
				$("#h_currency").val(currency); //计算运费的
				
//				$("#u_payment_amount").html(currency);  // 订单总金额:
//				$("#u_applicable_credit").html(currency);  //
//				$("#u_available_m").html(currency);  //
//				$("#u_product_cost").html(currency);
				
			
			//	debugger;
			//	alert(obj[0].country_code+"---"+obj[0].order_area);
				//查出保存的信息
				$("#courierNumber").val(obj[0].yfhNum); 	//快递单号
				                
			//	$("#fpxCountryCode").val(obj[0].country);
				    
				//设置国家默认为收货地址的国家  
//				if(obj[0].zip_code != ''){
//					$("#fpxCountryCode").val(obj[0].zip_code); 	//国家
//				}
				
				if(obj[0].country_code != ''){
				//	alert("------"+obj[0].country_code);
					$("#fpxCountryCode").val(obj[0].country_code); 	//国家
				}
				
			//	$("#unpaidFreight").val(obj[0].unpay); 	//未支付费用
				$("#unpaidFreight").val(obj[0].remaining_price);//未支付费用
				
				
			//	alert(obj[0].trans_method-1);
			//	alert(obj[0].trans_method);
				if(Number(obj[0].trans_method) > 0){
					$("input[name='ysfs']:eq("+Number(obj[0].trans_method-1)+")").attr("checked",'checked'); 					//出货方式
					showByType(Number(obj[0].trans_method));// 显示不同界面
				}
				if(obj[0].trans_details != ''){
					$("#fpxProductCode").val(obj[0].trans_details); 	//运输方式详细
				}
				//$("#fpxProductCode").val(obj[0].trans_details); 	//运输方式详细
				$("#packingCharge").val(obj[0].package_fee); 	//包装费  trans_method
				$("#actualFreight").val(obj[0].acture_fee); 	//实际运费
				$("#volumelwh").val(obj[0].volume_lwh); 			//产品体积
				$("#weight").val(obj[0].weight); 					// 整体重量
				$("#trans").val(obj[0].order_area); 					// 整体重量
			//	$("#logisticsName").val(obj[0].logistics_name); 		// 物流公司名字
				  
				//分割出来时间
				var tempTime = obj[0].mode_transport;
			//	alert(tempTime);
				tempTime = tempTime.substring(tempTime.indexOf('@')+1,tempTime.length);
			//	alert(tempTime);
				tempTime = tempTime.substring(0,tempTime.indexOf('@'));
			//	alert(tempTime);
				$("#s_mode_transport").html(tempTime+"天");//用户选择的运输时间
			//	alert(obj[0].mode_transport);
				
				//是否免邮 r_freeShipping  lastIndexOf
//				var tempFreeShipping = obj[0].mode_transport;
			//	alert(tempTime);
			//	tempFreeShipping = tempFreeShipping.substring(tempFreeShipping.indexOf('@')+1,tempFreeShipping.length);
			//	tempFreeShipping = tempFreeShipping.substring(tempFreeShipping.indexOf('@')+1,tempFreeShipping.length);
			//	tempFreeShipping = tempFreeShipping.substring(tempFreeShipping.indexOf('@')+1,tempFreeShipping.length);
				
			      
			     
			//	alert(tempFreeShipping);
//				if(tempFreeShipping.indexOf("@0.0@all") !=-1){
//					$("#s_freeShipping").html("免邮");//用户选择的运输时间
//				}else{
//					$("#s_freeShipping").html("不免邮");//用户选择的运输时间
//				}
				
			//	alert(tempFreeShipping);
				
			//	alert(obj[0].mode_transport);
				
			
				
			}else{
				$.messager.show(0, '失败',1800);
			}
		}
	});
}
//计算价格
function getCalculatedPrice(price){
	//未支付费用
	var unpaidFreight = parseFloat($("#h_unpaidFreight").val());
	$("#unpaidFreight").val((unpaidFreight*parseFloat(price)).toFixed(2));
	
	
}
function sendFahuoEmail(){
	var userid = $("#s_userid").html();  //用户id
	var toEmail = $("#s_useremail").html();  //用户邮箱
	var orderNo = $("#h_orderid").val();  //订单号
	var orderarrs = $("#h_mergeorders").val();  //所有订单号
	var path = $("#h_path").val();
	var expetTime = $("#s_mode_transport").text();
	var currency = $("#h_currency").val(); //货币单位
	if(expetTime==""){
		expetTime = "5-7天";
	}
	
	$.ajax({
		type:"post", 
		url:"sendFahuoEmail.do",
		dataType:"text",
		data:{userid:userid,toEmail:toEmail,expetTime:expetTime,orderNo:orderNo},
		success : function(data){  
			if(data=="1"){
				alert("我们已经给用户发出邮件告知发货成功！");
			}else{
				alert("不知道哪里出了问题");
			}
		}
	});
}