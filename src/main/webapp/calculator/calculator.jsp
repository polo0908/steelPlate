<%@ page language="java" contentType="text/html; charset=utf-8"
		pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html>
<head>

<meta charset="utf-8">
<meta http-equiv="Expires" contect="Wed,18 Apr 2018 15:27:12 GMT"><meta http-equiv="Cache-Control" content="max-age=840000">
<title>Calculator</title>
 <!-- <link href="css/font-awesome.css" rel="stylesheet"/> -->
 <link rel="shortcut icon" href="images/favicon1.ico">
 
 
 <!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-300197-18"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-300197-18');
</script>

<link rel="stylesheet" href="<%=request.getContextPath()%>/calculator/css/calculator.css" />
<link rel="stylesheet" href="css/easydialog.css" />

<style>
.sub_item li{width:100%}.sub_item li span{width:100%;display:inline-block;white-space:nowrap;word-break:break-all}a:hover{cursor:pointer}.w-big-box{margin:0 auto;width:1139px}#DataTables_Table_0_wrapper ul:last-child li{border-bottom:1px solid #CDCDCD}#DataTables_Table_0_wrapper li{width:30%;height:30px;float:left;white-space:nowrap;border-top:1px solid #CDCDCD;border-left:1px solid #CDCDCD;text-align:center;line-height:30px}.w-text{padding:10px}#DataTables_Table_0_wrapper ul:nth-of-type(2) li{background:#efefef}.nav-bground{background:url(images/navtop/top_bg.png) top no-repeat;background-size:cover}.header_content{width:1139px;height:60px;margin:0 auto}.header_content a{display:inline-block}.header_content a img{max-width:100%;padding-top:7px}.w-email{text-align:right;margin-top:26px;font-size:16px;display:inline-block;float:right;color:#000}.w-email a{color:#000}.z-a-style:hover{color:#333333;cursor:pointer}.w-wrapper .w-text-h1{color:#00a2e9;text-align:center}.w-wrapper{margin-top:30px;width:1139px}.w-form-control{font-size:20px}.w-item_box{overflow-x:hidden;width:400px}
</style>
</head>
<body> 
         
<!-- 		<div class="wrapper w-wrapper location z-location" id="back_select" style="display: none;"> -->
<!-- 		  <a onclick="show_orderDetails()"><img src="images/back.jpg">Back</a> -->
<!--        </div>  -->
          <div id="back_select"  style="display:none;margin: 0 auto;width: 1139px;">
			<a href="#" onclick="show_orderDetails()" class="tip-bottom" style="padding-left:0;color: #00a2e9;"><i class="icon-chevron-left"></i>Back</a>
		 </div>
		 
		<div class="navbar nav-bground" role="navigation">
			<div class="header_content">
		    	<a href="#"><img src="images/navtop/logo.png" class="logo-img" alt=""></a>
		    	<div class="w-email"> Email us : <a href="mailto:rfq@csmfg.com?subject=Steel Fabrication RFQ&body=%0d%0d%0a Note:We will reply you within 24 hours."  class="o-email" onclick="gtag_report_conversion('http://calculator.metal-work.com/steelPlate/calculator/queryAll.do')">RFQ@csmfg.com</a></div>
			</div>
		</div>
		 
		<div class="wrapper w-wrapper" style="display: block;position: relative;">
			<!-- <div class="w-email"> Email us : <a href="mailto:rfq@csmfg.com?subject=Steel Fabrication RFQ&body=%0d%0d%0a Note:We will reply you within 24 hours." onclick="gtag_report_conversion('http://calculator.metal-work.com/steelPlate/calculator/queryAll.do')">RFQ@csmfg.com</a></div> -->
			<h1 class="w-text-h1">METAL FABRICATION PRICE CALCULATOR</h1>
			    <!-- <h2 style="text-align: center;">Choose Material => Choose Fabrication Method => Add to BOM and Calculate</h2> -->
			    
			    <div class="step_list">
					<span style="color: #fff;">Choose Material</span>
					<span>Choose Fabrication Method</span>
					<span>Add to BOM and Calculate</span>
				</div>
				<h2 class="title_h2">Step 1:Calculate the first part(you can add more parts later)</h2>
				<div class="choose_box">
						<div class="item_box">
								<h3 class="title_h3">Choose the Material</h3>
								<ul class="item_list father_product">
								<c:forEach var="obj" items="${goodsTypeInfos}" varStatus="i">   
								<li><span>${obj.goodsType}</span><input value="${obj.parameter}" type="hidden"><input value="${obj.id}" type="hidden"><em class="fa fa-fw"></em></li>								
								</c:forEach>
								</ul>
						</div>
						<div class="item_box w-item_box">
								<h3 class="title_h3">&nbsp;</h3>
								<ul class="item_list sub_item">
								<c:forEach var="obj" items="${materialInfos}" varStatus="i"> 
                                <li>${obj.materialType}</li>
                                </c:forEach>
								</ul>
						</div>
						<div class="item_box" style=" margin-top: 83px;">
								<div class="unit z-unit">
										Unit <select name="select" class="form_select" id="select_unit">
												<option value="mm">mm</option>
												<option value="inch">inch</option>
										</select>
								</div>
								<!-- <div class="z-unit">
										<a style="color: #08c; text-decoration: underline;" onclick="query_standard()">》Regular Sizes in China</a>
								</div> -->
								<h3 class="title_h3 z-title-h3">Dimensions:</h3>
								<ul class="item_list dimensions"> 
                                <li><em class="fa fa-fw"></em></li>
								</ul>
								<div class="z-unit">
										<a style="color: #08c; text-decoration: underline;" onclick="query_standard()">》Regular Sizes in China</a>
								</div>
						</div>
						<div class="item_box_img" style="margin-top: 84px;">
								<img src="${goodsTypeInfo.goodsImage}" /> <a href="#">View the material
										detail</a>					
								<p>
										<span>Part Name:</span> <input type="text" id="partName" 
												placeholder="can be left blank" />
								</p>
								<p>
										<span>Qty per set:</span> <input type="text" id="quantity" placeholder="" class="form-control" value="1"  onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"/>
								</p>
						</div>
				</div>
				<div class="plate" style="position: absolute; top: 173px;right: 1px;width: 483px;">
						<strong style="font-size:14px;padding-left: 18px;">What you have chosen is:</strong><em  style="width:100%;"><i>Plates</i>/<i>Q235</i></em>
							<em><i class="form-control-price w-form-control">${price}</i>&nbsp;&nbsp;
							<select id="select_currency">
							<c:forEach var="obj" items="${amountUnits}" varStatus="i">   
							    <option value="${obj.currencyShorthand}">${obj.currencyShorthand}/TON</option>							    
							</c:forEach>
							</select>
<!-- 						<span style="right: 10px;position: absolute; top: 6px;">	 -->
<%-- 						<strong>Exchange Rate:</strong><span class="red_txt">${amountUnit.exchangeRate}CNY/USD</span> --%>
<!-- 						</span> -->
							</em>
							<em><i>Updated On：</i> <i>${materialInfos.get(0).updateDate}</i></em>
				</div>
				<div class="btn_box">
						<input type="submit" value="Add" id="sub1"
								class="btn btn-primary z-add-font" style="float:right;margin-right: 12px;width: 95px;"/>
				</div>
	
				
				<input type="hidden" value="${amountUnit.exchangeRate}" id="rate_cny"/>
				<div style="margin-top: 67px;font-size: 19px;color: red;">
							Alternatively, you can just send us your drawing package and our engineers will quote for you.  We handle metal fabrication projects from simple to complex, from medium to high volume.
                    <br><br>
                   Email to <a href="mailto:rfq@csmfg.com?subject=Steel Fabrication RFQ&amp;body=%0d%0d%0a Note:We will reply you within 24 hours." class="o-email" onclick="gtag_report_conversion('http://calculator.metal-work.com/steelPlate/calculator/queryAll.do')">RFQ@csmfg.com</a>
               </div>
		</div>
		
		<div class="footer_links">
			<span>Reference: </span>
			<div class="foot_links_list">
				<a href="http://metal-work.com/" target="_blank">Metal-work</a>
				<a href="http://www.china-sourcing.com/" target="_blank">China-sourcing</a>
				<a href="http://www.chinasynergygroup.com/" target="_blank">Fabrication & Welding</a>
				<a href="http://www.chinasynergygroup.com/index_st.php" target="_blank">Metal Stamping</a>
				<a href="http://www.chinasynergygroup.com/machining.php" target="_blank">CNC Machining</a>
				<a href="http://www.surface-finishing-coating.com/" target="_blank">Surface Finishing</a>
			</div>
		</div>

<div class="w-big-box" style="display:none;">
    <div class="container-fluid">
       <div class="row-fluid">
            <div class="span12">
                <div class="w-widget-box">

                    <div class="w-widget-content nopadding">
                        <div id="DataTables_Table_0_wrapper" role="grid">
                                <ul>
                                <li></li>
                                </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</div>
</div>
<script type="text/javascript" src="<%=request.getContextPath()%>/calculator/js/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="js/easydialog.min.js"></script> 	
<script type="text/javascript" src="js/cookie_util.js"></script> 			
<script type="text/javascript" src="<%=request.getContextPath()%>/calculator/js/calculator.js"></script>
<script>
	$(function() {
		var p = "";
		$(".father_product li").click(
						function() {
							var q = $(this).find("span").html();
						    if(p == q){
						    	return false;
						    }else{
						       p = q;
						    }
							$(".dimensions").html("");
							$(this).addClass("active").siblings().removeClass("active");
							var parameter = $(this).find("input:eq(0)").val();
							var list = parameter.split("/");
							var txt_lis = "";						    
							for(var i = 0; i < list.length; i++){
								txt_lis += "<li class=\"txt_li\"><span>"+list[i]+"</span>"
								+ " <div class=\"input-group\"> <input onblur='change_parameter(this)' class=\"form-control\" type=\"text\"> <span class=\"input-group-btn\"> mm</span></div>"
								+"<input type=\"hidden\"></li>";															
							}
							
							$(".dimensions").append(txt_lis);
							
							//存储首页点击数据
							localStorage.sitename= $(this).index();
							var name = $(this).find("span").html();
							$(".plate i:eq(0)").html($(this).find("span").html());
							var goodsType = $(".plate i:eq(0)").html();
				 			$.post(
				 					"/steelPlate/calculator/queryByGoodsType.do",
				 					{
				 					 "goodsType":goodsType,
				 					 "currencyShorthand" : $('#select_currency').val()
				 				    },
				 				   function(result){
				     	            var txt_lis = "";
				 				    if(result.state == 0){
				 				    	
				 				    	//判断标准参数是否存在（不存在的 Plates,Round rod (round stick),Flat bar,Square bar）
				 				    	
				 				     if(goodsType == 'Plates' || goodsType == 'Round Rod (Round Stick)' || goodsType == 'Flat Bar' ||  goodsType == 'Square Bar'){
				 				    	$(".dimensions").next().hide();
				 				     }else{
				 				    	$(".dimensions").next().show();
				 				     }				 				    			 				    	
				 				    	
				 				      $(".sub_item").html("");
				 					  var list = result.data.materialInfos;
				 					  var unitPrice = result.data.unitPrice;
				 					  
				 						if(unitPrice == "null"){
				 							$(".plate .form-control-price").text(0);	
				 						}else{
				 							$(".plate .form-control-price").text(unitPrice);	
				 						}	
					 				 $(".plate i:eq(1)").html(list[0].materialType);	
				 						
				 					  for(var i = 0; i < list.length; i++){
				 						var materialType =  list[i].materialType;
				 						var din =  list[i].din;
				 						var astm =  list[i].astm;
				 						if(i == 0){
					 							txt_lis+="<li class='active'><span>"+materialType+"</span></li>"; 
					 							$('.plate').find('i:last').html(list[i].updateDate);	 					
				 						}else{				
					 							txt_lis+="<li><span>"+materialType+"</span></li>"; 	 	
				 						}
			 						
				 					  }
				 					  $(".sub_item").append(txt_lis);
				 					  
				 					
				 					$(".item_box_img img").attr("src",result.data.goodsImage);  
				 					  //初始参数赋值
				 					 var parameter = result.data.originalParameter;				    	
								    	var s = parameter.split(",");
							 			var tl = s.length;
							             if(tl == 0){
							             	return false;
							             }          
			 						$(".dimensions li").each(function(index, element) {
						 				var type = $(this).find("span").html();
						 				$(this).find("input").val();
						                 for(var i=0;i<tl;i++){
						                   var w = s[i].split(":");
						                   if(w[0] == type){
						                 	$(this).find("input").val(w[1]); 
						                   }
						               }						                 
			 						
			 						})				
				 					  
			 						
			 						//单位确认
			 						if($("#select_unit").val() == "inch"){
				 						$("#select_unit").change();
			 						} 
							           
				 				  }else{
				 					 easyDialog.open({
							    		  container : {
							    		    header : 'Prompt message',
							    		    content : 'Query failed'
							    		  },
							    		  overlay : false,
							    		  autoClose : 1000
							    		}); 
				 				  }
								  
				 			  });
		});
		
	
		$("body").on("click",".sub_item li",function(){
			$(this).addClass("active").siblings().removeClass("active");
			var materialType = $(this).find("span").text();
			var goodsType = $(".plate i:eq(0)").text();
			
			$.ajax({
	    		url : '/steelPlate/calculator/queryUnitPriceByMaterialInfo.do',
				method : 'post',
				data : {"goodsType":goodsType,
	        		    "materialType" : materialType,
	        		    "currencyShorthand" : $('#select_currency').val()
        	           },
				success : function(result) { 
					
				if(result.state == 0){
					   $(".plate i:eq(1)").html(materialType);
						if(result.data.price == "null"){
							$(".plate .form-control-price").text(0);	
						}else{
							$(".plate .form-control-price").text(result.data.price);
							$('.plate').find('i:last').html(result.data.updateDate);
						}
				    }	
				},
				error : function(msg) {
					easyDialog.open({
			    		  container : {
			    		    header : 'Prompt message',
			    		    content : 'No price has been found'
			    		  },
			    		  overlay : false,
			    		  autoClose : 1000
			    		}); 
				}
	    	})
			
			 
		})
		$(".father_product li:first").click();
		

		$("#sub1").click(function() {
			if($(".sub_item li.active").length==0){
				easyDialog.open({
		    		  container : {
		    		    header : 'Prompt message',
		    		    content : 'Please select material'
		    		  },
		    		  overlay : false,
		    		  autoClose : 1000
		    		}); 
				return;
			}
			var parameterMm = "";
			var parameterInch = "";
			var conversion = 25.4;
			var inch = 0;
			var mm = 0;
			var check_flag=false;
			$(".dimensions input[type='text']").each(function(index, element) {
			    if($(this).val()==""){
			    	 easyDialog.open({
			    		  container : {
			    		    header : 'Prompt message',
			    		    content : $(this).parent().prev().html() +' can not empty'
			    		  },
			    		  autoClose : 1000
			    		}); 			    	
			    	
			    	$(this).focus();
			    	check_flag=false;
			    	return false;
				}else{
					check_flag=true;
				}
			});
			if(!check_flag){
				return;
			}
			
			
			//控制数量不为空
			if($(".item_box_img input:eq(1)").val() == 0){
				 easyDialog.open({
		    		  container : {
		    		    header : 'Prompt message',
		    		    content :'Qty per set can not be zero'
		    		  },
		    		  autoClose : 1000
		    		}); 	
				 return false;
			}
			
			//防止重复点击
			$('#sub1').css({"background-color":"#666"}).attr("disabled","true");
			
			
			//获取产品数据的json串
			$(".dimensions li").each(function(index, element) {
				if(index==$(".dimensions li").length-1){
					if($(".unit .form_select").val() == 'mm'){
						parameterMm +="\""+$(this).find("span").html()+"\""+":"+"\""+Number($(this).find("input").eq(1).val()).toFixed(2)+"\"";
						mm = $(this).find("input").eq(1).val();
						inch = Number(mm/conversion).toFixed(2);
						parameterInch +="\""+$(this).find("span").html()+"\""+":"+"\""+inch+"\"";
					}
					if($(".unit .form_select").val() == 'inch'){
						parameterInch +="\""+$(this).find("span").html()+"\""+":"+"\""+ Number($(this).find("input").eq(1).val()).toFixed(2)+"\"";
						inch = $(this).find("input").eq(1).val();
						mm = Number(parseFloat(inch)).mul(conversion).toFixed(2);
						parameterMm +="\""+$(this).find("span").html()+"\""+":"+"\""+mm+"\"";
					}
					
				}else{
					if($(".unit .form_select").val() == 'mm'){
						parameterMm +="\""+$(this).find("span").html()+"\""+":"+"\""+Number($(this).find("input").eq(1).val()).toFixed(2)+"\",";
						mm = $(this).find("input").eq(1).val();
						inch = Number(mm/conversion).toFixed(2);
						parameterInch +="\""+$(this).find("span").html()+"\""+":"+"\""+inch+"\",";
					}
					if($(".unit .form_select").val() == 'inch'){
						parameterInch +="\""+$(this).find("span").html()+"\""+":"+"\""+Number($(this).find("input").eq(1).val()).toFixed(2)+"\",";
						inch = $(this).find("input").eq(1).val();
						mm = Number(parseFloat(inch)).mul(conversion).toFixed(2);
						parameterMm +="\""+$(this).find("span").html()+"\""+":"+"\""+mm+"\",";
					}
				}
			});

			parameterMm="{"+parameterMm.substring(0)+"}";
			parameterInch="{"+parameterInch.substring(0)+"}";

			var goodsType = $(".plate i:eq(0)").html();
			var materialType = $(".plate i:eq(1)").html();
			var partName = $(".item_box_img input:eq(0)").val();
			var quantity = $(".item_box_img input:eq(1)").val();
			var price = $(".plate .form-control-price").text();

		   $.post(
					"/steelPlate/calculator/saveClientOrder.do",
					{"goodsType":goodsType,
	        		    "materialType" : materialType,
	        		    "partName" : partName,
	        		    "quantity" : quantity,
	        		    "price"    : price,
	        		    "parameterMm" : parameterMm,
	        		    "parameterInch" : parameterInch,
	        		    "currencyShorthand" : $('#select_currency').val(),
	        		    "selectUnit" : $(".unit .form_select").val()
	        	       },
			function(result){  
	        	    	   
				 $('#sub1').css({"background-color":"#5d9cec"}).removeAttr("disabled");  	   
				  if(result.state == 0){
				    	var id = result.data.id;	
						window.location.href ="/steelPlate/calculator/queryAllProcess.do?orderDetailsId="+id;
		           
				  }else{
					  easyDialog.open({
			    		  container : {
			    		    header : 'Prompt message',
			    		    content : 'Failed to generate'
			    		  },
			    		  overlay : false,
			    		  autoClose : 1000
			    		}); 
				  }
			  
			  });
		});

		
		// 乘法
		Number.prototype.mul = function(arg) {
		    var m = 0, s1 = this.toString(), s2 = arg.toString();
		    try{m += s1.split(".")[1].length;}catch(e){}
		    try{m += s2.split(".")[1].length;} catch(e){}
		    return Number(s1.replace(".", "")) * Number(s2.replace(".", ""))/ Math.pow(10, m);
		};
		// 除法
		Number.prototype.div = function(arg) {
		    var t1 = 0, t2 = 0, r1, r2;
		    try {t1 = this.toString().split(".")[1].length;}catch(e){}
		    try {t2 = arg.toString().split(".")[1].length;}catch(e){}
		    with (Math) {
		        r1 = Number(this.toString().replace(".", ""));
		        r2 = Number(arg.toString().replace(".", ""));
		        return (r1 / r2) * pow(10, t2 - t1);
		    }
		};
		
		
		$("#select_unit").change(function(){
			$(".dimensions .input-group-btn").html($(this).val());
			$(".dimensions li").each(function(index, element) {
				if($(".unit .form_select").val() == 'mm'){
					var inch = $(this).find("input").eq(1).val();
					var unit = $(this).find("span").eq(0).text();
					if(inch!=""){						
						var n1=Number(parseFloat(inch)).mul(25.4).toFixed(2);
						if($(".plate i:eq(0)").text() == 'Plates' && (unit == 'Length' || unit == 'Width')){
							n1=Number(parseFloat(inch)).mul(25.4).toFixed(0);
						}
						$(this).find("input").eq(0).val(parseFloat(n1));
						$(this).find("input").eq(1).val(Number(parseFloat(inch)).mul(25.4));
					}
				}
				if($(".unit .form_select").val() == 'inch'){					
					var mm = $(this).find("input").eq(1).val();
					var unit = $(this).find("span").eq(0).text();
					if(mm!=""){
						var n2=Number(parseFloat(mm)).div(25.4).toFixed(2);
						if($(".plate i:eq(0)").text() == 'Plates' && (unit == 'Length' || unit == 'Width')){
							n2=Number(parseFloat(mm)).div(25.4).toFixed(0);
						}
						$(this).find("input").eq(0).val(parseFloat(n2));
						$(this).find("input").eq(1).val(Number(parseFloat(mm)).div(25.4));
					}
					
				}				
			
		  });

		})	   

		
		
		
		
		
		/**
		 *获取汇率事件
	     */
		$('#select_currency').change(function(){
			var goodsType = $(".plate i:eq(0)").html();
			var materialType = $(".plate i:eq(1)").html();
			$(".plate .form-control-price").text('');
			$.ajax({
	    		url : '/steelPlate/calculator/queryByCurrencyShorthand.do',
				method : 'post',
				data : {
					    "goodsType" : goodsType,
					    "materialType" : materialType,
	        		    "currencyShorthand" : $('#select_currency').val()
        	           },
				success : function(result) { 
					if(result.price == "null"){
						$(".plate .form-control-price").text(0);	
					}else{
						$(".plate .form-control-price").text(result.price);	
					}
					if($('#select_currency').val() == 'USD'){
						$('.red_txt').text($('#rate_cny').val()+"CNY/USD");	
					}else{
						$('.red_txt').text(result.exchangeRate+$('#select_currency').val()+"/USD");	
					}
					
				},
				error : function(msg) {
					easyDialog.open({
			    		  container : {
			    		    header : 'Prompt message',
			    		    content : 'No price has been found'
			    		  },
			    		  autoClose : 2000
			    		}); 
				}
	    	})	
						
					
		});		
		
		
		
		
}) 


    //根据材料类型查看标准参数
    
    function query_standard(){		
		var goodsType = $(".plate i:eq(0)").html();
		
		
		
		 $.post(
				 "/steelPlate/calculator/queryStandardByGoodsTypeId.do",
					{
					 "goodsType" : goodsType				    	       
					},
			function(result){	
				    if(result.state == 0){
				    	$('#DataTables_Table_0_wrapper').empty();
				    	var goodsTypeNormals = result.data.goodsTypeNormals;
				    	var list = result.data.list;
				    	var tl = goodsTypeNormals.length;
				    	var ul = "";
				    	var title = "";		    	
				    	
				    	for(var i=0;i<tl;i++){
				    		var li_tl = list[i].length;		
				    		var li = "";
				            var type = "";
				    		for(var j=0;j<li_tl;j++){
				    			var w = list[i][j].split(":");
				    			var type1 = '<li>'+w[0]+'(mm)</li>';
				    			var li1 = '<li>'+w[1]+'</li>';
				    			type +=type1;
				    			li +=li1;
				    		}
				    		
				    		title = '<ul><h3 class="w-text">Choose the standard you need</h3></ul>'+
				    		        '<ul>'+
				    		        '<li>Type</li>'+type+
				    		        '<li>Operation</li>'+
				    		        '</ul>';
				    		        
				    		ul = '<ul>'+
				    		     '<li>'+(goodsTypeNormals[i].parameterType == null ? '' : goodsTypeNormals[i].parameterType)+'</li>'+li+
				    		     '<li><button onclick="select_standard('+goodsTypeNormals[i].id+')">select</button></li>'+
				    		     '</ul>';	     
					    	$('#DataTables_Table_0_wrapper').append(ul);			 	   
				    	}
				    	 $('#DataTables_Table_0_wrapper').find('ul:first').before(title);

				    	 var s_tl = $('#DataTables_Table_0_wrapper').find('ul:eq(1)').find('li').length;
						 var width = Math.floor(98/s_tl);
						 $("#DataTables_Table_0_wrapper").find('li').css({"width":width + "%"});
				    	 $('.wrapper').hide();
				    	 $('#back_select').show();
				    	 $('.w-big-box').show();
				    	
				    	
				    }else{
				    	easyDialog.open({
				    		  container : {
				    		    header : 'Prompt message',
				    		    content : 'No data was found'
				    		  },
				    		  autoClose : 1000
				    		}); 
				    }
				    
			   })  
			
	}
	
	//选择标准参数
   function select_standard(standardId){
	   
  	   $('.w-big-box').hide();
  	   $('#back_select').hide();
	   $.post(
				 "/steelPlate/calculator/queryByStandardId.do",
					{
					 "standardId" : standardId				    	       
					},
			function(result){	
				    $('.wrapper').show();
				    if(result.state == 0){
				    	var parameter = result.data.parameterNormal;				    	
				    	var s = parameter.split(",");
			 			var tl = s.length;
			             if(tl == 0){
			             	return false;
			             }         
			 			$(".dimensions li").each(function(index, element) {
			 				var type = $(this).find("span").html();
			                 for(var i=0;i<tl;i++){
			                   var w = s[i].split(":");
			                   if(w[0] == type){
			                 	$(this).find("input").eq(0).val(w[1]); 
			                 	$(this).find("input").eq(1).val(w[1]); 
			                   }
			                }				
						   
			               if(type == 'Length'){
			            	   $(this).find("input").focus(); 
			               }  
			                 
			 			})
			 			//单位确认
 						if($("#select_unit").val() == "inch"){
	 						$("#select_unit").change();
 						} 
				    	
			 			 $('#back_select').hide();
				    }else{
				    	easyDialog.open({
				    		  container : {
				    		    header : 'Prompt message',
				    		    content : 'No data was found'
				    		  },
				    		  autoClose : 1000
				    		}); 
				    }
				  
			})		    
   }
     
	
	//处理显示
	function show_orderDetails(){
   	 $('.wrapper').show();
	 $('#back_select').hide();
	 $('.w-big-box').hide();
	}
	
	
	//input框输入的时候保证参数相同 
    function change_parameter(obj){   
	$(obj).parents('li').find('input:last').val($(obj).val());
    }
	
	
</script>











<script async src="https://www.googletagmanager.com/gtag/js?id=AW-1072713230"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());
  gtag('config', 'AW-1072713230');
</script>
<script>
var keyword = '<%=request.getParameter("keyword")%>';
if(keyword != null && keyword != '' &&  keyword != undefined && keyword != 'null'){
	setCookieByKeyWord("keyword",keyword);
}
var key = getCookie('keyword');
var a = 'mailto:rfq@csmfg.com?subject=Steel Fabrication RFQ&body=%0d%0d%0a Note:We will reply you within 24 hours.';
if(!(key == null || key == '' ||  key == undefined)){
	a = 'mailto:rfq@csmfg.com?subject='+key+'&body=%0d%0d%0a Note:We will reply you within 24 hours.%0d%0a%0d%0a%0d%0a%0d%0a%0d%0a:::'+key;
	$('.o-email').attr("href", a);
}




function gtag_report_conversion(url) {
  var callback = function () {
    if (typeof(url) != 'undefined') {
      window.location = url;
    }
  };
  gtag('event', 'conversion', {
      'send_to': 'AW-1072713230/JAZUCIKrPhCOnMH_Aw',
      'value': 1.0,
      'currency': 'USD',
      'event_callback': callback
  });
  return false;
}

</script>
</body>
</html>
