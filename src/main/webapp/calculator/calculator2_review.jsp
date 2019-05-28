<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page import="java.util.List"%>
<%@page import="com.cal.bean.OrderDetails"%>
<%@page import="com.cal.bean.ProcessDetails"%>
<%@page import="com.cal.bean.ProcessInfo"%>
<%@page import="com.cal.bean.MaterialInfo"%>
<%@page import="com.cal.bean.GoodsTypeInfo"%>
<%
	 OrderDetails orderDetails = (OrderDetails) request.getAttribute("orderDetails");

     List<ProcessDetails> processDetails = (List<ProcessDetails>) request.getAttribute("processDetails");
	 
	 List<List<ProcessInfo>> processInfos = (List<List<ProcessInfo>>) request.getAttribute("list2");
	 
	 List<ProcessInfo> list = (List<ProcessInfo>) request.getAttribute("processInfos");
	 
	 List<ProcessInfo> list2 = (List<ProcessInfo>) request.getAttribute("processInfo");
 
    List<GoodsTypeInfo> goodsTypeInfos = (List<GoodsTypeInfo>) request.getAttribute("goodsTypeInfos");
    List<MaterialInfo> materialInfos = (List<MaterialInfo>) request.getAttribute("materialInfos");
    GoodsTypeInfo goodsTypeInfo = (GoodsTypeInfo)request.getAttribute("goodsTypeInfo");
    MaterialInfo materialInfo = (MaterialInfo)request.getAttribute("materialInfo");
    String goodsType = (String)request.getAttribute("goodsType");
    
    String parameterMm = orderDetails.getParameterMm();
	parameterMm = parameterMm.replace("{", "");
	parameterMm = parameterMm.replace("}", "");
	parameterMm = parameterMm.replace("\"", "");
	String[] parameters = parameterMm.split(",");
%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Calculator</title>
 <link rel="shortcut icon" href="images/favicon1.ico">
<link rel="stylesheet" href="css/calculator.css" />
 <link rel="stylesheet" href="css/easydialog.css" />
  <link href="css/font-awesome.css" rel="stylesheet"/>
	 	


 <!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-300197-18"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-300197-18');
</script>





<style>

a:hover{cursor:pointer;}
.w-big-box{margin: 0 auto;
		  width: 1139px;
		  font-style: normal;}
   #DataTables_Table_0_wrapper ul:last-child li{border-bottom:1px solid #CDCDCD;}
   #DataTables_Table_0_wrapper li{width:30%; height:30px; float:left;white-space:nowrap;border-top: 1px solid #CDCDCD;border-left: 1px solid #CDCDCD;
   text-align: center;
  	line-height: 30px;} 
  	.w-text{padding:10px;}
      #DataTables_Table_0_wrapper ul:nth-of-type(2) li{background: #efefef;} 
 

/* .wrapper{ display: block !important; } */
.process_list li:first-child{
display:block;
}
/* .process_list li:first-child  .fa-minus{ */
/* display:none; */
/* } */
.process_list li:first-child .tips{
visibility:visible;
}
.process_list li .tips{
visibility:hidden;
}
.process_list li:first-child .add1{
display:inline-block;
}

.process_list li .add1{
display:none;
}
.process_list li{
display:block;
}
.process_list .fa-minus{
float:left;
 margin-top: 4px;
margin-left:-18px;
}
.process_list li {
    width: 966px;
}
.outside{display:none;}
.w-table{width:100%;}
.w-table .w-th{text-align:left;color:#07a6e9;width:100px;}
.w-table .w-td{font-size:14px;}
.process{border: solid 1px #cdcdcd;}
.process .tips{font-weight: bold;}
.w-btn-danger {
    color: #fff;
    text-shadow: 0 -1px 0 rgba(0,0,0,0.25);
    background-color: #da4f49;
    background-repeat: repeat-x;
    border-color: rgba(0,0,0,0.1) rgba(0,0,0,0.1) rgba(0,0,0,0.25);
}
.w-btn {
    display: inline-block;
    padding: 4px 12px;
    margin-bottom: 0;
    font-size: 14px;
    line-height: 20px;
    text-align: center;
    vertical-align: middle;
    cursor: pointer;
    border: 1px solid #ccc;
    border-color: #e6e6e6 #e6e6e6 #bfbfbf;
    border-color: rgba(0,0,0,0.1) rgba(0,0,0,0.1) rgba(0,0,0,0.25);
    border-bottom-color: #b3b3b3;
    -webkit-border-radius: 4px;
    -moz-border-radius: 4px;
    border-radius: 4px;
    filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffffffff', endColorstr='#ffe6e6e6', GradientType=0);
    filter: progid:DXImageTransform.Microsoft.gradient(enabled=false);
    -webkit-box-shadow: inset 0 1px 0 rgba(255,255,255,0.2), 0 1px 2px rgba(0,0,0,0.05);
    -moz-box-shadow: inset 0 1px 0 rgba(255,255,255,0.2), 0 1px 2px rgba(0,0,0,0.05);
    box-shadow: inset 0 1px 0 rgba(255,255,255,0.2), 0 1px 2px rgba(0,0,0,0.05);
}
.w-btn-danger:hover{
    color: #fff;
    background-color: #bd362f;
}
.process_list li{position: relative;width: 891px;}
.process_list li .group_box .w-btn-delete{right: 10px;position: absolute;top: 0px;}

.w-wrapper2{width: 1139px;}
.w-item_box2{overflow-x: hidden;width:400px;}

.sub_item li{width:100%;}
.sub_item li span{width:100%;display:inline-block; white-space: nowrap; word-break: break-all;}
.w_add{cursor: pointer;}

 #show_orderDetails,#back_bom a {
    padding: 8px 20px 8px 10px;
    display: inline-block;
    background-position: center right;
    background-repeat: no-repeat;
    font-size: 14px;
    color: #00a2e9;
	}
	#show_orderDetails,#back_bom a i {
	    margin-right: 5px;
	    opacity: .6;
	}
	#show_orderDetails,#back_bom a:hover{
	   color:#000;
	}   
</style>
</head>
<body>
<div class="navbar nav-bground" role="navigation">
	<div class="header_content">
    	<a href="#"><img src="images/navtop/logo.png" class="logo-img" alt=""></a>
    	<div class="w-email"> Email us : <a class="o-email" href="mailto:rfq@csmfg.com?subject=Steel Fabrication RFQ&body=%0d%0d%0a Note:We will reply you within 24 hours." onclick="gtag_report_conversion('http://calculator.metal-work.com/steelPlate/calculator/queryAll.do')">RFQ@csmfg.com</a></div>
	</div>
</div>

<!-- 	<div class="wrapper w-wrapper2 location z-location" id="back_bom"> -->
<!-- 			<a onclick="history.back()"><img src="images/back.jpg">Back</a> -->
<!--     </div>   -->

<!--     <div class="wrapper w-wrapper2 location z-location" style="display: none;" id="show_orderDetails"> -->
<!-- 			<a onclick="show_orderDetails()"><img src="images/back.jpg">Back</a> -->
<!--     </div>   -->
     <div style="margin: 0 auto;width: 1139px;display: none;" id="show_orderDetails">
		 <a onclick="show_orderDetails()" class="tip-bottom" style="padding-left:0;color: #00a2e9;"><i class="icon-chevron-left"></i>Back</a>
	</div>  

    <input type="hidden" value="${orderDetails.goodsTypeId}" id="good_type_id">
    <div class="wrapper w-wrapper2" style="font-style: initial;margin-top:35px;">
    <!-- <div class="w-email"> Email us : <a href="mailto:rfq@csmfg.com?subject=Steel Fabrication RFQ&body=%0d%0d%0a Note:We will reply you within 24 hours." onclick="gtag_report_conversion('http://calculator.metal-work.com/steelPlate/calculator/queryAll.do')">RFQ@csmfg.com</a></div> -->
    	<div id="back_bom" style="margin: 0 auto;width: 1139px;">
			<a href="#" onclick="history.back()" class="tip-bottom" style="padding-left:0;"><i class="icon-chevron-left"></i>Back</a>
	</div>  
<input id="superficialArea" value="${orderDetails.superficialArea}" type="hidden">
<input id="quoteId" value="${orderDetails.quoteId}" type="hidden">
<input id="order_weight" value="${orderDetails.weight}" type="hidden">
<input id="parameter" value='${orderDetails.parameterMm}' type="hidden">
<input id="oneside_state" value='${orderDetails.insideOutsideState}' type="hidden">
</div>

	<div class="wrapper w-wrapper2" style="display: block;position: relative;">
		
		<input value="${orderDetails.id}" type="hidden" id="orderDetailsId">
		<input value="${goodsTypeInfo.parameter}" type="hidden" id="parameter1">
				<h2 class="title_h2">Choose the material</h2>
				<div class="choose_box">
						<div class="item_box">
								<h3 class="title_h3"></h3>
								<ul class="item_list father_product">
								<%
								for (int i = 0; i < goodsTypeInfos.size(); i++) {
									  if(goodsTypeInfos.get(i).getGoodsType().equals(goodsTypeInfo.getGoodsType())){
								%>
								<li class="active"><span><%=goodsTypeInfos.get(i).getGoodsType()%></span><input value="<%=goodsTypeInfos.get(i).getParameter()%>" type="hidden"><em class="fa fa-fw"></em></li>								
							         <%  
								     }else{
								     %>
                                     <li><span><%=goodsTypeInfos.get(i).getGoodsType()%></span><input value="<%=goodsTypeInfos.get(i).getParameter()%>" type="hidden"><em class="fa fa-fw"></em></li>								
								     <%	 
								     }
								}
								%>
								</ul>
						</div>
						<div class="item_box w-item_box2">
								<h3 class="title_h3"></h3>
								<ul class="item_list sub_item">
								<%
								for (int i = 0; i < materialInfos.size(); i++) {
									  if(materialInfos.get(i).getMaterialType().equals(materialInfo.getMaterialType())){
								%>
                                <li class="active"><span><%=materialInfos.get(i).getMaterialType()%></span></li>     
                                     <%
									  }else{
									 %>	 
									  <li>
									  <span><%=materialInfos.get(i).getMaterialType()%></span>								 						  
									  </li> 
									  <% 
								     }
								}
								%>
								</ul>
						</div>
						<div class="item_box" style="margin-top: 83px;">
					           <div class="unit z-unit">
										Unit <select name="select" class="form_select" id="select_unit">
												<option value="mm">mm</option>
												<option value="inch">inch</option>
										</select>
								</div>
<!-- 								<div class="z-unit"> -->
<!-- 										Standard:<br> -->
<!-- 										<a style="color: #08c; text-decoration: underline;" onclick="query_standard()">view the regular sizes</a> -->
<!-- 								</div> -->
								<h3 class="title_h3 z-title-h3" >Dimensions:</h3>
								<ul class="item_list dimensions"> 
								<% 
								for (int m = 0; m < parameters.length; m++) {
						            String[] split2 = parameters[m].split(":");
						        %>
                                   <li class="txt_li"><span><%=split2[0]%></span>
								    <div class="input-group"> 
									  <input class="form-control" onblur='change_parameter(this)' type="text" value="<%=split2[1]%>"> 
									  <span class="input-group-btn"> mm</span>
									  <input type="hidden" value="<%=split2[1]%>">
								   </div> 
								  </li>
								<%
								}
								%>  
								</ul>
								<div class="z-unit">
										Standard:<br>
										<a style="color: #08c; text-decoration: underline;" onclick="query_standard()">》Regular Sizes in China</a>
								</div>
						</div>
						<div class="item_box_img" style="margin-top: 84px;">
								<img src="${goodsTypeInfo.goodsImage}" /> <a href="#">View th material
										detail</a>					
								<p>
										<span>Part Name:</span> <input type="text" id="partName"  value="${orderDetails.partName}"
												placeholder="can be left blank" />
								</p>
								<p>
										<span>Qty per set:</span> <input type="text" id="quantity" placeholder="" class="form-control" value="${orderDetails.goodsSet}" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"/>
								</p>
						</div>
				</div>
				<div class="plate" style="position: absolute; top: 54px;right: 1px;width: 483px;">
						<strong style="font-size:14px;padding-left: 18px;">What you have chosen is:</strong><em style="width:100%;"><i>${goodsTypeInfo.goodsType}</i>/<i>${materialInfo.materialType}</i></em>
<%-- 						<em><span>${price}</span> <span class="input-group-btn"> USD/Ton</span></em> --%>
							<em><i class="form-control-price" style="font-size: 20px;">${price}</i>&nbsp;&nbsp;	
							<select id="select_currency">
							  <c:forEach var="obj" items="${amountUnits}" varStatus="i">							    
							    <option value="${obj.currencyShorthand}" <c:if test="${clientOrder.amountUnit == obj.id}">selected</c:if>>${obj.currencyShorthand}/TON</option>							    
							  </c:forEach>
							</select>
							</em>
							<em><i>Updated On：</i><i>${materialInfos.get(0).updateDate}</i></em>
				</div>
				<div class="btn_box" style="float:right;">
						<input type="submit" value="update the material" id="sub1"
								class="btn btn-primary" />
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
<script type="text/javascript" src="js/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="js/calculator.js"></script>
<script type="text/javascript" src="js/easydialog.min.js"></script> 	
<script type="text/javascript" src="js/process_info.js"></script> 
<script type="text/javascript" src="js/cookie_util.js"></script> 
<script>

var processSize = "<%=processDetails.size()%>";

$(function(){
	
         //==============修改材料信息JS======================
		 var p = "<%=goodsTypeInfo.getGoodsType()%>";
		
		 if(p == 'Plates' || p == 'Round Rod (Round Stick)' || p == 'Flat Bar' ||  p == 'Square Bar'){
		    	$(".dimensions").next().hide();
		     }else{
		    	$(".dimensions").next().show();
		     }
		 
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
								+ " <div class=\"input-group\"> <input onblur='change_parameter(this)' class=\"form-control\" type=\"text\"> <span class=\"input-group-btn\"> mm</span></div><input type=\"hidden\"></li>"															
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
				 			    		    content : 'Query error,please try again'
				 			    		  },
				 			    		  autoClose : 1000
				 			    		}); 
				 				  }
								  
				 			  });
		});
		
	
		$("body").on("click",".sub_item li",function(){
			$(this).addClass("active").siblings().removeClass("active");
			$(".plate i:eq(1)").html($(this).find("span").text());
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
			    		  autoClose : 2000
			    		}); 
				}
	    	})
			
			 
		})
// 		$(".father_product li:first").click();
		

		$("#sub1").click(function() {
			if($(".sub_item li.active").length==0){
				easyDialog.open({
		    		  container : {
		    		    header : 'Prompt message',
		    		    content : 'Please select material'
		    		  },
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
			
			
			$(".dimensions li").each(function(index, element) {
				if(index==$(".dimensions li").length-1){
					if($(".unit .form_select").val() == 'mm'){
						parameterMm +="\""+$(this).find("span").html()+"\""+":"+"\""+$(this).find("input").eq(1).val()+"\"";
						mm = $(this).find("input").eq(1).val();
						inch = mm/conversion;
						inch = Number(inch).toFixed(2);
						parameterInch +="\""+$(this).find("span").html()+"\""+":"+"\""+inch+"\"";
					}
					if($(".unit .form_select").val() == 'inch'){
						parameterInch +="\""+$(this).find("span").html()+"\""+":"+"\""+$(this).find("input").eq(1).val()+"\"";
						inch = $(this).find("input").eq(1).val();
						mm = Number(parseFloat(inch)).mul(conversion).toFixed(2);
						parameterMm +="\""+$(this).find("span").html()+"\""+":"+"\""+mm+"\"";
					}
					
				}else{
					if($(".unit .form_select").val() == 'mm'){
						parameterMm +="\""+$(this).find("span").html()+"\""+":"+"\""+$(this).find("input").eq(1).val()+"\",";
						mm = $(this).find("input").eq(1).val();
						inch = mm/conversion;
						inch = Number(inch).toFixed(2);
						parameterInch +="\""+$(this).find("span").html()+"\""+":"+"\""+inch+"\",";
					}
					if($(".unit .form_select").val() == 'inch'){
						parameterInch +="\""+$(this).find("span").html()+"\""+":"+"\""+$(this).find("input").eq(1).val()+"\",";
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
            var orderDetailsId = $('#orderDetailsId').val();
		   $.post(
					"/steelPlate/calculator/updateOrderDetails.do",
					{"goodsType":goodsType,
	        		    "materialType" : materialType,
	        		    "partName" : partName,
	        		    "quantity" : quantity,
	        		    "price"    : price,
	        		    "parameterMm" : parameterMm,
	        		    "parameterInch" : parameterInch,
	        		    "orderDetailsId" : orderDetailsId,
	        		    "currencyShorthand" : $('#select_currency').val()
	        	       },
			function(result){   
	        	
	        $('#sub1').css({"background-color":"#5d9cec"}).removeAttr("disabled");  		    	   
	        	    	   
				  if(result.state == 0){	
					  var quoteId = $('#quoteId').val();
					  window.location.href = "/steelPlate/calculator/queryBom.do?quoteId="+quoteId;
		           
				  }else{
					  easyDialog.open({
			    		  container : {
			    		    header : 'Prompt message',
			    		    content : 'Update failed'
			    		  },
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
						var n1= parseFloat(inch).mul(25.4).toFixed(2);
						if($(".plate i:eq(0)").text() == 'Plates' && (unit == 'Length' || unit == 'Width')){
							n1=Number(parseFloat(inch)).mul(25.4).toFixed(0);
						}
						$(this).find("input").eq(0).val(n1);
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
						$(this).find("input").eq(0).val(n2);
						$(this).find("input").eq(1).val(Number(parseFloat(mm)).div(25.4));
					}
					
				}				
			
		  });

		})	   

		
		//页面加载
		var unit = getCookie("unit");
		$("#select_unit").find("option[value='"+unit+"']").attr("selected",true); 
		if(unit == "inch"){
			$("#select_unit").change();
		}
		

		
		
		/**
		 *获取汇率事件
	     */
		$('#select_currency').change(function(){
			var goodsType = $(".plate i:eq(0)").html();
			var materialType = $(".plate i:eq(1)").html();
			$(".plate .form-control-price").text("");	
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
		


	

	//======================处理工艺=============		
		
		
		
	$("body").on("click",".add1",function(){
		if($(".process_list li").length>5){
			easyDialog.open({
	    		  container : {
	    		    header : 'Prompt message',
	    		    content : 'Can only add six processes'
	    		  },
	    		  overlay : false,
	    		  autoClose : 1000
	    		}); 
			return;
		}
		//添加工艺图片
       var This = $(".process_list li:eq(0)").find('.select_process');
       var index = This.prop('selectedIndex');
       var imgPath = getProcessImg(index);
       var tl = 0;
       if($(".process_list li:eq(0)").css("visibility") == "hidden"){
    	   tl = 0; 
       }else{
    	   tl = $(".process_list li").length;
       }
       $('.img-list').append('<div class="w-30" style="float: left;width: 33.333333%;margin-bottom:19px;"><div class="btn-control-div" style="border: solid 2px #ff7f27;display:inline-block;width: 18px;height: 18px;border-radius: 50%;">'+
    										     '<span class="btn-control-num" style="height: 18px;line-height: 18px;display:block;color: #ff7f27;text-align:center;">'+(tl+1)+'</span>'+
    										'</div><img style="margin-left:10%;width: 200px;" src='+imgPath+'></div>');
       
       
	    if($(".process_list li:eq(0)").css("visibility") == "hidden"){
	       $(".process_list li:eq(0)").css({"visibility":"visible"});
	       $('.w_add_1').hide();
	       $('.w_add_2').show();
	       $('.img-list').show();
	       return false;
	    }
		$(".process_list").append(	$(".process_list li:eq(0)").clone());
		var v1=	$(".process_list li:eq(0)").find("select:eq(0)").val();
		var v2=	$(".process_list li:eq(0)").find("select:eq(1)").val();
		$(".process_list li:last").find("select:eq(0)").val(v1);
		$(".process_list li:last").find("select:eq(1)").val(v2);
		
		var tl = $('.process_list').find("li").length;
		for(var i=0;i<tl;i++){

			 $(".process_list li:eq("+i+")").find("span:last").parent().show().css("display","inline-block");
			 
			 $(".process_list li:eq("+i+")").find("span:last").text(i+1);
			
		}
		
		return false;
	})
	
	$("body").on("click","a.w-btn-delete",function(){
		var tl = $('.process_list').find("li").length;
		if(tl == 1){
			$(this).parents("li").css({"visibility":"hidden"});
			  $('.w_add_2').hide();
			  $('.w_add_1').show();
			  $('.img-list').empty().hide();
			 return false;
		}else{
			var tl = $(".process_list li").length;	
			var process_index = $(this).parents('li').index();
			$('.img-list').find('.w-30').eq(process_index).remove();
			$(this).parents("li").remove();
			for(var i=0;i<tl;i++){
				$(".process_list li:eq("+i+")").find(".btn-control-num").text(i+1);
				$('.img-list').find('.w-30').eq(i).find('.btn-control-num').text(i+1);
			}
			 return false;	
		}
		  
	})
	
	$(document).on("click",".fa-check",function(){
		var onesideState = $('#oneside_state').val();
		if(onesideState == 0){
			return false;
		}
// 		var state = $(this).parents('.input-group').siblings(".input-group").find('input').eq(1).val();
// 		if($(this).prev().val()==1 && state == 0){
// 			return false;
// 		}
		
		$(this).toggleClass("cur");
		var superficialArea = parseFloat($('#superficialArea').val());
		if($(this).prev().val()==0){
			$(this).prev().val(1);
			var s1 = parseFloat($(this).parent().parent().prev().children("input").val());
			$(this).parent().parent().prev().children("input").val(superficialArea + s1);
		}else{
			$(this).prev().val(0);
			var s1 = parseFloat($(this).parent().parent().prev().children("input").val());
			$(this).parent().parent().prev().children("input").val(s1 - superficialArea);
		}
	})
	
	
	
	//工艺选择事件
  	$("body").on("change",".select_process",function(){
  	    var level1 = $(this).val();
  	    $(this).next().find('.select_parameter').empty();
	    $(this).next().find('.select_parameter_span').text('');
	    $(this).siblings(".group_box").find(".input-group-btn").prev().val('');
	    $(this).next().css({"display":"inline-block"});
	    var This=$(this);
	    var onesideState = $('#oneside_state').val();
		$.post("queryByProcess.do",
		       {"level1":level1},
	   function(result){
		    	   var txt_lis = "";
					  if(result.state == 0){
						  
						   var level3_parameter = This.siblings(".group_box").find(".input-group-btn").prev().val();						   						   
						   var level2Parameter = This.parent().parent().find("input:eq(0)").val();
						   var level3Parameter = 1;
						   
						   
						   var index = This.prop('selectedIndex');
					       var parameter = $('#parameter').val();
					       var json = eval('(' + parameter + ')');
					       var thick = parseInt(json.Thickness);	
					       var superficialArea = parseFloat($('#superficialArea').val());
					       
					       var level2 = getLevel2(index);
					       var level3 = getLevel3(index);
					       var superficialState = getSuperficialState(index);
					       var level2Explain = getLevel2Explain(index);
					       var imgPath = getProcessImg(index);
                           var process_index = This.parents('li').index();
                           
                           
					       var tl = 1;
					       if(level2.length == 0){
					    	   tl =1;
					       }else{
					    	   tl = level2.length;
					       }
						   
						   
						  //改变工艺图片
						  if(!(imgPath == '' || imgPath == null || imgPath == undefined)){
							  $('.img-list').find('img').eq(process_index).attr('src',imgPath);						
						  }
						  
						   
						   
						  for(var i = 0; i < tl; i++){
							var p = level2[i];
							if(superficialState=="1"){
								This.next().find(".outside").css({"display":"inline-block"});
								This.siblings(".group_box").find(".input-group").hide();
								This.siblings(".model_label").find(".select_parameter").hide();								
								var s_out_class = This.next().find("input.outside").next().attr('class');
								var s_in_class = This.next().find("input.inside").next().attr('class');		

							if(s_out_class == "fa fa-check" && s_out_class == 'fa fa-check'){
								This.next().find("input.outside").next().toggleClass("cur");
								This.next().find("input.outside").val(1);
							}	
								
                             if(s_out_class == 'fa fa-check cur' && s_in_class == 'fa fa-check cur'){	 
                             This.next().find(".outside").find(".number_txt").find("input").val(superficialArea*2);	
                             This.next().find("input.outside").val(1);
                             This.next().find("input.inside").val(1);
                             }		
                             if(onesideState == 0){
                            	 This.next().find('.input-group').eq(1).hide();
                            	 This.next().find('.input-group').eq(0).find("input:first").val('All surface');
							 }
                             
							}else{								
								This.next().find(".outside").css({"display":"none"});
								This.siblings(".group_box").find(".input-group").show();
								This.siblings(".model_label").find(".select_parameter").show();
						        This.next().find("input.outside").val(0);
		                        This.next().find("input.inside").val(0);
							}
							
						    if(p=="" || p == undefined){
						    	 This.next().find('.select_parameter').css({"display":"none"});
						    	 This.siblings(".group_box").find(".input-group-btn").prev().val(level3Parameter);
						     }else{
						    	 This.next().find('.select_parameter').css({"display":"inline-block"});
						    	 This.siblings(".group_box").find(".input-group-btn").prev().val(level3Parameter);
						     }
						    
						     if(level2Explain==""){
						    	 This.next().find('.select_parameter_span').css({"display":"none"});
						    	 This.siblings(".group_box").find(".input-group-btn").prev().val(level3Parameter);
						     }else{
						    	 This.next().find('.select_parameter_span').css({"display":"inline-block"});
						    	 This.siblings(".group_box").find(".input-group-btn").prev().val(level3Parameter);
						     }
						       
						    if(p == level2Parameter){
						    This.next().find('.select_parameter').append("<option value='"+p+"' selected='selected'>"+p+"</option>");							    
						    }else{
						    This.next().find('.select_parameter').append("<option value='"+p+"'>"+p+"</option>");	
						    }
						    
							This.next().find('.select_parameter_span').text(level2Explain+":");
							This.siblings(".group_box").find(".input-group-btn").text(level3);	
						    This.siblings(".group_box").find(".input-group-btn").prev().val(level3Parameter);
							if(level3 == "kg"){
								var weight = $('#order_weight').val();
								This.siblings(".group_box").find(".input-group-btn").prev().val(Number(weight * 1000).toFixed(2));	
							}				 
							
                           }			
						  if(This.next().find('.select_parameter_span').text() == "Thickness:"){
							  if(thick < 5){
								  This.next().find(".select_parameter option[value='<5mm']").attr("selected",true);
			                       }  
							  if(thick >= 5 && thick < 10){
								  This.next().find(".select_parameter option[value='5-10mm']").attr("selected",true);
							       }
							  if(thick >= 10){
								   This.next().find(".select_parameter option[value='10-20mm']").attr("selected",true);
							       }
							  This.next().find('.select_parameter').attr("disabled","disabled");
							  This.siblings(".group_box").find(".input-group-btn").prev().val(level3Parameter);
						  }	else{
							  This.next().find('.select_parameter').attr("disabled",false);
						  }
						  
						  
						  //只有板和扁钢可以折弯，3mm以上 建议100T
						  if(level1 == 'Bending'){
							  var thickness = $('#select_thickness').val();
							  if(thickness > 3){
								  This.next().find(".select_parameter option[value='100T']").attr("selected",true);  
							  }
						  }
						  
						  
						  
						  //如果是galvanizing，则给予提示
						  if(level1 == 'Hot dip galvanizing' || level1 == 'Cold galvanizing'){
							  This.next().next().find('.btn-control-div').prev().show();
						  }else{
							  This.next().next().find('.btn-control-div').prev().hide();
						  }
						  
						  
						  
				       
					  }else{
						  alert(result.message);
					  }
				  
				});
	  		
  	});
	
// 	$(".select_process").change();
// 	show_process();
})    

//==============//处理工艺第一次显示================================================

// 	  function show_process(){
// 		$(".select_process").each(function(index, element){
			
// 			var level1 = $(this).val();
// 			$(this).next().find('.select_parameter').empty();
// 			$(this).next().find('.select_parameter_span').text('');
// 			$(this).siblings(".group_box").find(".input-group-btn").prev().val('');
// 			$(this).next().css({"display":"inline-block"});
// 			var This=$(this);
// 			var onesideState = $('#oneside_state').val();
// 			$.post("queryByProcess.do",
// 			       {"level1":level1},
// 		   function(result){
// 			    	   var txt_lis = "";
// 						  if(result.state == 0){
// 							  var list = result.data;
// 						       var parameter = $('#parameter').val();
// 						       var json = eval('(' + parameter + ')');
// 						       var thick = parseInt(json.Thickness);
// 							   var level3_parameter = This.siblings(".group_box").find(".input-group-btn").prev().val();
// 							   var superficialArea = parseFloat($('#superficialArea').val());						   						   
// 							   var level2Parameter = This.parent().parent().find("input:eq(0)").val();
// 							   var level3Parameter = This.parent().parent().find("input:eq(1)").val();
							   
							   
// // 							   var index = This.prop('selectedIndex');						      
// // 						       var imgPath = getProcessImg(index);
// // 	                           var process_index = This.parents('li').index();
							   
	                           
// 	                           //改变工艺图片
// // 	 						  if(!(imgPath == '' || imgPath == null || imgPath == undefined)){
// // 	 							 if($(".process_list li:eq(0)").css("visibility") != "hidden"){
// // 	 							 $('.img-list').append('<div class="w-30" style="float: left;width: 33.333333%;margin-bottom:19px;"><div class="btn-control-div" style="border: solid 2px #ff7f27;display:inline-block;width: 18px;height: 18px;border-radius: 50%;">'+
// // 	 									     '<span class="btn-control-num" style="height: 18px;line-height: 18px;display:block;color: #ff7f27;text-align:center;">'+(process_index+1)+'</span>'+
// // 	 									'</div><img style="margin-left:10%;width: 200px;" src='+imgPath+'></div>');
// // 	 							 $('.img-list').show();
// // 	 							 }
// // 	 						  }
							   
// 							  for(var i = 0; i < list.length; i++){
// 								var p = list[i].level2;
// 								if(list[i].superficialState=="1"){
// 									This.next().find(".outside").css({"display":"inline-block"});
// 									This.siblings(".group_box").find(".input-group").hide();
// 									This.siblings(".model_label").find(".select_parameter").hide();								
// 									var s_out_class = This.next().find("input.outside").next().attr('class');
// 									var s_in_class = This.next().find("input.inside").next().attr('class');		
									
// 	                             if(s_out_class == 'fa fa-check cur' && s_in_class == 'fa fa-check cur'){	 
// 	                             This.next().find(".outside").find(".number_txt").find("input").val(superficialArea*2);	
// 	                             This.next().find("input.outside").val(1);
// 	                             This.next().find("input.inside").val(1);
// 	                             }	
// 	                             if(onesideState == 0){
// 	                            	 This.next().find('.input-group').eq(1).hide();
// 	                            	 This.next().find('.input-group').eq(0).find("input:first").val('All surface');
// 								 }
	                             
									
// 								}else{								
// 									This.next().find(".outside").css({"display":"none"});
// 									This.siblings(".group_box").find(".input-group").show();
// 									This.siblings(".model_label").find(".select_parameter").show();
// 							        This.next().find("input.outside").val(0);
// 			                        This.next().find("input.inside").val(0);
// 								}
								
// 							    if(p==""){
// 							    	 This.next().find('.select_parameter').css({"display":"none"});
// 							    	 This.siblings(".group_box").find(".input-group-btn").prev().val(level3Parameter);
// 							     }else{
// 							    	 This.next().find('.select_parameter').css({"display":"inline-block"});
// 							    	 This.siblings(".group_box").find(".input-group-btn").prev().val(level3Parameter);
// 							     }
							    
// 							     if(list[i].level2Explain==""){
// 							    	 This.next().find('.select_parameter_span').css({"display":"none"});
// 							    	 This.siblings(".group_box").find(".input-group-btn").prev().val(level3Parameter);
// 							     }else{
// 							    	 This.next().find('.select_parameter_span').css({"display":"inline-block"});
// 							    	 This.siblings(".group_box").find(".input-group-btn").prev().val(level3Parameter);
// 							     }
							       
// 							    if(p == level2Parameter){
// 							    This.next().find('.select_parameter').append("<option value='"+p+"' selected='selected'>"+p+"</option>");							    
// 							    }else{
// 							    This.next().find('.select_parameter').append("<option value='"+p+"'>"+p+"</option>");	
// 							    }
							    
// 								This.next().find('.select_parameter_span').text(list[i].level2Explain+":");
// 								This.siblings(".group_box").find(".input-group-btn").text(list[i].level3);	
// 							    This.siblings(".group_box").find(".input-group-btn").prev().val(level3Parameter);
// 								if(list[i].level3 == "kg"){
// 									var weight = $('#order_weight').val();
// // 									This.siblings(".group_box").find(".input-group-btn").prev().val(Number(weight * 1000).toFixed(2));	
// 								}				 
								
// 	                           }			
// 							  if(This.next().find('.select_parameter_span').text() == "Thickness:"){
// 								  if(thick < 5){
// 									  This.next().find(".select_parameter option[value='<5mm']").attr("selected",true);
// 				                       }  
// 								  if(thick >= 5 && thick < 10){
// 									  This.next().find(".select_parameter option[value='5-10mm']").attr("selected",true);
// 								       }
// 								  if(thick >= 10){
// 									   This.next().find(".select_parameter option[value='10-20mm']").attr("selected",true);
// 								       }
// 								  This.next().find('.select_parameter').attr("disabled","disabled");
// 								  This.siblings(".group_box").find(".input-group-btn").prev().val(level3Parameter);
// 							  }	
							  
// 							  if(processSize == 0){
// 								  This.siblings(".group_box").find(".input-group-btn").prev().val(1);
// 							  }
							  
							  
// 							  //只有板和扁钢可以折弯，3mm以上 建议100T
// 							  if(level1 == 'Bending'){
// 								  var thickness = $('#select_thickness').val();
// 								  if(thickness > 3){
// 									  This.next().find(".select_parameter option[value='100T']").attr("selected",true);  
// 								  }
// 							  }
							  
// 							  //如果是galvanizing，则给予提示
// 							  if(level1 == 'Hot dip galvanizing' || level1 == 'Cold galvanizing'){
// 								  This.next().next().find('.btn-control-div').prev().show();
// 							  }else{
// 								  This.next().next().find('.btn-control-div').prev().hide();
// 							  }
							  
					       
// 						  }else{
// 							  easyDialog.open({
// 					    		  container : {
// 					    		    header : 'Prompt message',
// 					    		    content : 'Query failed'
// 					    		  },
// 					    		  overlay : false,
// 					    		  autoClose : 1000
// 					    		}); 
// 						  }
					  
// 					});
// 		})
		
		
		   
// 		   $('.process_list').find('.select_process').each(function(){
// 			   var index = $(this).prop('selectedIndex'); 
// 			   var imgPath = getProcessImg(index);
// 	           var process_index = $(this).parents('li').index();	
	           
// 	           //改变工艺图片
// 	 		  if(!(imgPath == '' || imgPath == null || imgPath == undefined)){
// 	 			 if($(".process_list li:eq(0)").css("visibility") != "hidden"){
// 	 			 $('.img-list').append('<div class="w-30" style="float: left;width: 33.333333%;margin-bottom:19px;"><div class="btn-control-div" style="border: solid 2px #ff7f27;display:inline-block;width: 18px;height: 18px;border-radius: 50%;">'+
// 	 					     '<span class="btn-control-num" style="height: 18px;line-height: 18px;display:block;color: #ff7f27;text-align:center;">'+(process_index+1)+'</span>'+
// 	 					'</div><img style="margin-left:10%;width: 200px;" src='+imgPath+'></div>');
// 	 			 $('.img-list').show();
// 	 			 }
// 	 		  }
// 		   })         		
  	    
	  		
//   	}






 //添加到BOM界面
 function add_BOM(orderDetailsId){
  
	//防止重复点击
	$('#add_BOM').css({"background-color":"#666"}).attr("disabled","true");
	 
	 
    var quoteId = $('#quoteId').val();	
	var tl = $('.process_list').find("li").length;
	var process = "";
	for(var i=0;i<tl;i++){
	  var level1 = $(".process_list li:eq("+i+")").find("select:eq(0)").val();	
	  var level2 = $(".process_list li:eq("+i+")").find("select:eq(1)").val();	
	  if($(".process_list li:eq("+i+")").find("div.model_label").css("display") == "none"){
		  level2 = "";
	  }	  

	  var level3Parameter = $(".process_list li:eq("+i+")").find("input:last").val();
 	  var outsideSurface =$(".process_list li:eq("+i+")").find("input.outside").val();
 	  var insideSurface = $(".process_list li:eq("+i+")").find("input.inside").val();
 	  if(outsideSurface == 1 || insideSurface == 1){
 		 level3Parameter = $('div.outside').find("input:first").val();
 	  }
	  if(level2 == "undefined"){
			 level2 = "";
	    }
	  process += "-" + level1+"%"+ "-" + level2+"%"+ "-" + level3Parameter+"%"+ "-" + outsideSurface+"%"+ "-" + insideSurface+",";
	}
	if($(".process_list li:eq(0)").css("visibility") == "hidden" && tl == 1){
  	  process = "";	
  	}
 	  	
	
	 $.ajax({
        	url:'saveProcessDetails.do',
        	method:'post',
        	data : {"process":process,
        		    "orderDetailsId" : orderDetailsId
        	       },
			success : function(data) {
				
				$('#add_BOM').css({"background-color":"#5d9cec"}).removeAttr("disabled");   
				
				window.location.href = "/steelPlate/calculator/queryBom.do?quoteId="+quoteId;	
			
			},error:function(msg){
				
				$('#add_BOM').css({"background-color":"#5d9cec"}).removeAttr("disabled");   
				easyDialog.open({
		    		  container : {
		    		    header : 'Prompt message',
		    		    content : 'Save falied,please try again'
		    		  },
		    		  overlay : false,
		    		  autoClose : 1000
		    		}); 
			}
			
        });
	 
   }
   
   
   //编辑材料
   function edit_goodsType(id){

	window.location.href = "/steelPlate/calculator/toUpdateOrderDetails.do?orderDetailsId="+id;	
	    	 
   }
   
   
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
					    	 $('#back_bom').hide();
					    	 $('#show_orderDetails').css({"display":"block"});
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
	   $('#show_orderDetails').hide();
 	   $('.w-big-box').hide();
	   $.post(
				 "/steelPlate/calculator/queryByStandardId.do",
					{
					 "standardId" : standardId				    	       
					},
			function(result){	
				    if(result.state == 0){
				       $('#back_bom').show();
				 	   $('.wrapper').show();
				    	var parameter = result.data.parameterNormal;				    	
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
			                 if(type == 'Length'){
				            	   $(this).find("input").focus(); 
				               }  
			 			})
			 			//单位确认
 						if($("#select_unit").val() == "inch"){
	 						$("#select_unit").change();
 						} 
			 			 $('#show_orderDetails').hide();
				    	
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
    	 $('#back_bom').show();
    	 $('#show_orderDetails').hide();
    	 $('.w-big-box').hide();
	}
   
	//input框输入的时候保证参数相同 
    function change_parameter(obj){   
	$(obj).parents('li').find('input:last').val($(obj).val());
    }
   
     
</script>









		
		
<script async src="https://www.googletagmanager.com/gtag/js?id=AW-1072713230"></script>
<script type="text/javascript" src="js/getKey.js"></script> 
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());
  gtag('config', 'AW-1072713230');
</script>
<script>
function gtag_report_conversion(url) {
  var callback = function () {
    if (typeof(url) != 'undefined') {
      url = "http://calculator.metal-work.com/steelPlate/calculator/queryAll.do?type="+Math.random();		
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
