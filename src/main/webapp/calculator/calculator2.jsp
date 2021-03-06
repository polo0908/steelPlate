<%@page import="java.math.BigDecimal"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page import="java.util.List"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="java.math.RoundingMode"%>
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

String detailCode = (String)request.getAttribute("detailCode");
%>


<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="pragram" content="no-cache">
<meta http-equiv="cache-control" content="no-cache, must-revalidate">
<meta http-equiv="expires" content="0">
<title>Calculator</title>
<link rel="shortcut icon" href="images/favicon1.ico">
<link rel="stylesheet" href="css/calculator.css" />
<link rel="stylesheet" href="css/easydialog.css" />
<link href="css/font-awesome.css" rel="stylesheet" />
<script type="text/javascript" src="js/jquery-1.8.2.min.js"></script>



<!-- Global site tag (gtag.js) - Google Analytics -->
<script async
	src="https://www.googletagmanager.com/gtag/js?id=UA-300197-18"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-300197-18');
</script>





<style>
/* .wrapper{ display: block !important; } */
.process_list li:first-child {
	display: block;
}
/* .process_list li:first-child  .fa-minus{ */
/* display:none; */
/* } */
.process_list li:first-child .tips {
	visibility: visible;
}

.process_list li .tips {
	visibility: hidden;
}

.process_list li:first-child .add1 {
	display: inline-block;
}

.process_list li .add1 {
	display: none;
}

.process_list li {
	display: block;
}

.process_list .fa-minus {
	float: left;
	margin-top: 4px;
	margin-left: -18px;
}

.process_list li {
	width: 966px;
}

.outside {
	display: none;
}

.w-table {
	width: 100%;
}

.w-table .w-th {
	text-align: left;
	color: #07a6e9;
	width: 100px;
}

.w-table .w-td {
	font-size: 14px;
}

.process {
	border: solid 1px #cdcdcd;
}

.process .tips {
	font-weight: bold;
}

.w-btn-danger {
	color: #fff;
	text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.25);
	background-color: #da4f49;
	background-repeat: repeat-x;
	border-color: rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);
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
	border-color: rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);
	border-bottom-color: #b3b3b3;
	-webkit-border-radius: 4px;
	-moz-border-radius: 4px;
	border-radius: 4px;
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffffffff',
		endColorstr='#ffe6e6e6', GradientType=0);
	filter: progid:DXImageTransform.Microsoft.gradient(enabled=false);
	-webkit-box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px
		rgba(0, 0, 0, 0.05);
	-moz-box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px
		rgba(0, 0, 0, 0.05);
	box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px
		rgba(0, 0, 0, 0.05);
}

.w-btn-danger:hover {
	color: #fff;
	background-color: #bd362f;
}

.process_list li {
	position: relative;
	width: 891px;
}

.process_list li .group_box .w-btn-delete {
	right: 10px;
	position: absolute;
	top: 0px;
}

.w_add {
	cursor: pointer;
}

#breadcrumb a {
	padding: 8px 20px 8px 10px;
	display: inline-block;
	background-position: center right;
	background-repeat: no-repeat;
	font-size: 14px;
	color: #00a2e9;
}

#breadcrumb a i {
	margin-right: 5px;
	opacity: .6;
}

#breadcrumb a:hover {
	color: #000;
}

.imgs {
	width: 200px;
	text-align: center;
	display: inline-block;
	border: 1px solid #e8e8e8;
	margin-left: 10px;
	padding-bottom: 10px;
}

.jump {
	width: 531px;
	margin: 0 auto;
	
}

.jump p {
	color: #29b6fe;
	text-align: center;
	font-size: 30px;
	font-weight: 700;
	margin-bottom: 10px;
}

.line {
	width: 531px;
	height: 3px;
	background: url("images/test2.jpg") no-repeat;
	position: relative;
}

.line img {
	position: absolute;
	left: 0;
	top: -6px;
	animation: move 5s infinite;
	-webkit-animation: move 5s infinite;
}

@
keyframes move {
	form {left: 0;
}

to {
	left: 470px;
}

}
@
-webkit-keyframes move {
	form {left: 0;
}

to {
	left: 470px;
}
}
.div_transparent{
	width:100%;
	height:100%;
	position:fixed;
	left:0;
	top:0;
	z-index:10;
	background-color:#fff;
	
}
</style>
</head>
<body>
<div class="div_transparent">
	<div class="jump" style="padding-top: 50px;">
		<p>Loading</p>
		<div class="line">
			<img src="images/test1.jpg" alt="">
		</div>
	</div>
</div>
	<div class="navbar nav-bground" role="navigation">
		<div class="header_content">
			<a href="#"><img src="images/navtop/logo.png" class="logo-img"
				alt=""></a>
			<div class="w-email">
				Email us : <a class="o-email"
					href="mailto:rfq@csmfg.com?subject=Steel Fabrication RFQ&body=%0d%0d%0a Note:We will reply you within 24 hours."
					onclick="gtag_report_conversion('http://calculator.metal-work.com/steelPlate/calculator/queryAll.do')">RFQ@csmfg.com</a>
			</div>
		</div>
	</div>

	<div class="wrapper">
		<!-- <div class="w-email" > Email us : <a href="mailto:rfq@csmfg.com?subject=Steel Fabrication RFQ&body=%0d%0d%0a Note:We will reply you within 24 hours." onclick="gtag_report_conversion('http://calculator.metal-work.com/steelPlate/calculator/queryAll.do')">RFQ@csmfg.com</a></div> -->
		<input id="superficialArea" value="${orderDetails.superficialArea}"
			type="hidden"> <input id="quoteId"
			value="${orderDetails.quoteId}" type="hidden"> <input
			id="order_weight" value="${orderDetails.weight}" type="hidden">
		<input id="parameter" value='${orderDetails.parameterMm}'
			type="hidden"> <input id="oneside_state"
			value='${orderDetails.insideOutsideState}' type="hidden"> <input
			id="exchangeRate" type="hidden">
		<c:if test="${processDetails.size() == 0}">

			<div class="step_list" style="margin-top: 40px;">
				<span style="color: #fff;">Choose Material</span> <span
					style="background: url(images/navtop/step_2_1.png) top no-repeat; color: #fff;">Choose
					Fabrication Method</span> <span>Add to BOM and Calculate</span>
			</div>
			<h2 class="title_h2">Step 2: Select the manufacturing processes
				to be done on the material</h2>
		</c:if>
		<c:if test="${processDetails.size() != 0}">
			<h2 class="title_h2">Select the process</h2>
		</c:if>
		<c:if test="${type == null || type == ''}">
			<div id="breadcrumb">
				<a onclick="queryAll()" class="tip-bottom" style="padding-left: 0;"><i
					class="icon-chevron-left"></i>Back</a>
			</div>
		</c:if>
		<c:if test="${type != null && type != ''}">
			<div id="breadcrumb">
				<a onclick="window.history.go(-1)" class="tip-bottom"
					style="padding-left: 0;"><i class="icon-chevron-left"></i>Back</a>
			</div>
		</c:if>
		<div class="process">
			<div class="est_box">
				<div>
					<table class="w-table">
						<tbody>
							<%
							String parameterMm = orderDetails.getParameterMm();
							String parameter = orderDetails.getParameterMm();
                            if("inch".equals(orderDetails.getSelectUnit())){
                               parameter = orderDetails.getParameterInch();
                            }
								parameter = parameter.replace("{", "");
								parameter = parameter.replace("}", "");
								parameter = parameter.replace("\"", "");
								parameterMm = parameterMm.replace("{", "");
								parameterMm = parameterMm.replace("}", "");
								parameterMm = parameterMm.replace("\"", "");
								String[] parameters = parameter.split(",");
								String[] parameterMms = parameterMm.split(",");
	
					%>
							<tr>
								<th class="w-th">Material:</th>
								<!--                         <td class="w-td">Q235 Plate,&nbsp;&nbsp;&nbsp;width 1111 nm,&nbsp;&nbsp;&nbsp;thickness 2 mm</td> -->
								<td class="w-td">${goodsType}&nbsp;${materialType}, <%
                        for (int m = 0; m < parameters.length; m++) {
							String[] split2 = parameters[m].split(":");	
							String[] split3 = parameterMms[m].split(":");	
							if(m < parameters.length-1){
						%> &nbsp;&nbsp;&nbsp;<%=split2[0]%>&nbsp;<%=new BigDecimal(split2[1]).setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue()%>
									<%=orderDetails.getSelectUnit()%>, <%			
							}else{
						%> &nbsp;&nbsp;&nbsp;<%=split2[0]%>&nbsp;<%=new BigDecimal(split2[1]).setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue()%>
									<%=orderDetails.getSelectUnit()%> <%				
						  }
							if(split3[0].equals("thickness")){
						%> <input type="hidden" id="select_thickness"
									value="<%=split3[1]%>"> <%	
						   }
						}	
                        %>
							</tr>
							<tr>
								<th class="w-th">Weight:</th>
								<td class="w-td"><fmt:formatNumber type="number"
										value="${orderDetails.weight * 1000}" maxFractionDigits="2" />KG</td>
							</tr>
							<tr>
								<th class="w-th">Part Name:</th>
								<td class="w-td">${orderDetails.partName}</td>
							</tr>
						</tbody>
					</table>

				</div>
			</div>
			<span class="tips">Process:</span>
			<c:if test="${processDetails.size() == 0}">
				<div class="w_add w_add_1">
					<a class="btn btn-primary add1 add_1">add</a><span class="add1">Add
						Processing</span>
				</div>
			</c:if>
			<c:if test="${processDetails.size() != 0}">
				<div class="w_add w_add_1" style="display: none;">
					<a class="btn btn-primary add1 add_1">add</a><span class="add1">Add
						Processing</span>
				</div>
			</c:if>
			<ul class="process_list">
				<%      
       for (int i = 0; i < processDetails.size(); i++) {
	   %>
				<li style="display: inline-block; top: -18px;"><input
					type="hidden"
					value="<%=processDetails.get(i).getLevel2Parameter()%>" /> <input
					type="hidden"
					value="<%=processDetails.get(i).getLevel3Parameter()%>" /> <input
					type="hidden" class="unit-process-price"
					value="<%=processDetails.get(i).getUnitPrice()%>" />
					<div class="check_cont" style="display: block;">
						<select name="select" class="form_select select_process"
							autocomplete="off">
							<%
			                 List<ProcessInfo> processInfo = processInfos.get(i);
                               for (int j = 0; j < list.size(); j++) {
                                    if (processDetails.get(i).getLevel1Parameter().equals(list.get(j).getLevel1())) {	 
                                      
                               %>
							<option value="<%=list.get(j).getLevel1()%>" selected="selected"><%=list.get(j).getLevel1()%></option>
							<%
									}else if(list.get(j).getLevel1().equals("---Surface Treatment---")){
							    %>
							<option value="<%=list.get(j).getLevel1()%>" disabled="disabled"><%=list.get(j).getLevel1()%></option>
							<%		
									}else if(list.get(j).getLevel1().equals("Plate bending") && !(goodsType.equals("Plates"))){
							    %>
							<option value="<%=list.get(j).getLevel1()%>"
								style="display: none;"><%=list.get(j).getLevel1()%></option>
							<%		
								    }else {
								%>
							<option value="<%=list.get(j).getLevel1()%>"><%=list.get(j).getLevel1()%></option>
							<%
							    	}
								 }
								%>
						</select>
						<div class="model_label">
							<span class="select_parameter_span"><%=list2.get(i).getLevel2Explain()%>:</span>
							<div class="outside">
								<div class="number_txt">
									<%
										if (processDetails.get(i).getLevel3Parameter() != null && !"".equals(processDetails.get(i).getLevel3Parameter())) {
									%>
									<input class="" value="<%=orderDetails.getSuperficialArea()%>"
										type="text" disabled="true"> <span>m^2</span>

									<%
								       }else{
								    %>
									<input class="" value="<%=orderDetails.getSuperficialArea()%>"
										type="text"> <span>m^2</span>
									<%	   
								       }
								    %>
								</div>
								<div class="group_box">
									<div class="input-group">
										<input class="form-control" value="one side"
											disabled="disabled" type="text" />
										<%
												if (processDetails.get(i).getOutsideSurface() == 1) {
											%>
										<input type="hidden" class="outside" value="1" /> <span
											class="fa fa-check cur"></span>
										<%
										     }else{
										    	 
										   %>
										<input type="hidden" class="outside" value="0" /> <span
											class="fa fa-check"></span>
										<%  	 
										     }
									       %>
									</div>
									<div class="input-group">
										<input class="form-control" value="another side"
											disabled="disabled" type="text" />
										<%
											if (processDetails.get(i).getInsideSurface() == 1) {
										%>
										<input type="hidden" class="inside" value="1" /> <span
											class="fa fa-check cur"></span>
										<%
										 } else {
									    %>
										<input type="hidden" class="inside" value="0" /> <span
											class="fa fa-check"></span>
										<%
								       }
								      %>
									</div>
								</div>
							</div>


							<%
                             if(!(processDetails.get(i).getLevel2Parameter() == null || "".equals(processDetails.get(i).getLevel2Parameter()))){                           
                            %>
							<select name="select" class="form_select select_parameter"
								onchange="update_unit_price(this)" autocomplete="off">
								<%
                               for (int n = 0; n < processInfo.size(); n++) {
                                     if (processDetails.get(i).getLevel2Parameter().equals(processInfo.get(n).getLevel2())) {	 
                                      
                               %>
								<option value="<%=processDetails.get(i).getLevel2Parameter()%>"
									selected="selected"><%=processDetails.get(i).getLevel2Parameter()%></option>
								<%
									} else {
								%>
								<option value="<%=processInfo.get(n).getLevel2()%>"><%=processInfo.get(n).getLevel2()%></option>
								<%		
									}
                                  }   	 
							   %>
							</select>
							<%	                              
                             }else{                          	 
                           	%>
							<select name="select" class="form_select select_parameter"
								style="display: none" autocomplete="off"></select>
							<% 
                             }
                            %>

						</div>
						<div class="group_box">

							<div class="input-group">
								<input class="qty form-control" oninput="calTotalProcessPrice()"
									type="text"
									value="<%=processDetails.get(i).getLevel3Parameter()%>">
								<span class="input-group-btn"><%=processInfo.get(0).getLevel3()%></span>
							</div>
							<span style="display: none; color: red;">(Cost is
								correlated to weight)</span> &#12288;
							<div class="btn-control-div"
								style="border: solid 2px #ff7f27; display: inline-block; width: 18px; height: 18px; border-radius: 50%; top: 5px; right: 100px; position: absolute;">
								<span class="btn-control-num"
									style="height: 18px; line-height: 18px; display: block; color: #ff7f27; text-align: center;"><%=i+1%></span>
							</div>
							<a href="#" class="w-btn-delete"><button
									class="w-btn w-btn-danger" style="margin-left: 10px;">Delete</button></a>
						</div>
					</div></li>
				<%
	   } 
       if(processDetails.size() == 0){    	   
	 %>

				<li style="visibility: hidden; top: -18px;"><input
					type="hidden" value='' /> <input type="hidden" value='' /> <input
					type="hidden" class="unit-process-price"
					value="<%=list.get(0).getUnitPrice()%>" />
					<div class="check_cont" style="display: block;">
						<select name="select" class="form_select select_process"
							autocomplete="off">
							<c:forEach var="obj" items="${processInfos}" varStatus="i">
								<option value="${obj.level1}"
									<c:if test="${obj.level1 eq '---Surface Treatment---'}"> disabled="disabled"</c:if>
									<c:if test="${ obj.level1 == 'Plate bending'&& (goodsType != 'Plates')}">style="display:none;"</c:if>>
									${obj.level1}</option>
							</c:forEach>
						</select>
						<div class="model_label" style="display: none;">
							<span class="select_parameter_span">Machine tonnage:</span>

							<div class="outside">
								<div class="number_txt">
									<input class="" value="${orderDetails.superficialArea}"
										type="text" disabled="true"> <span>m^2</span>
								</div>
								<div class="group_box">
									<div class="input-group">
										<input class="form-control" value="one side"
											disabled="disabled" type="text" /> <input type="hidden"
											class="outside" value="0" /> <span class="fa fa-check"></span>
									</div>
									<div class="input-group">
										<input class="form-control" value="another side"
											disabled="disabled" type="text" /> <input type="hidden"
											class="inside" value="0" /> <span class="fa fa-check"></span>
									</div>
								</div>
							</div>

							<select name="select" class="form_select select_parameter"
								autocomplete="off">
								<c:forEach var="obj" items="${list}" varStatus="i">
									<option value="${obj.level2 }">${obj.level2 }</option>
								</c:forEach>
							</select>
						</div>
						<div class="group_box">
							<div class="input-group">
								<input class="form-control" type="text" value="1"> <span
									class="input-group-btn">times</span>
							</div>
							<span style="display: none; color: red;">(Cost is
								correlated to weight)</span> &#12288;
							<div class="btn-control-div"
								style="border: solid 2px #ff7f27; display: inline-block; width: 18px; height: 18px; border-radius: 50%; top: 5px; right: 100px; position: absolute;">
								<span class="btn-control-num"
									style="height: 18px; line-height: 18px; display: block; color: #ff7f27; text-align: center;">1</span>
							</div>
							<a href="#" class="w-btn-delete"><button
									class="w-btn w-btn-danger" style="margin-left: 10px;">Delete</button></a>
						</div>
					</div></li>
				<%
       }
	%>
			</ul>
			<c:if test="${processDetails.size() == 0}">
				<div class="w_add w_add_2"
					style="left: 80px; top: -15px; display: none;">
					<a class="btn btn-primary add1 add_1">add</a><span class="add1">Add
						Processing</span>
				</div>
			</c:if>
			<c:if test="${processDetails.size() != 0}">
				<div class="w_add w_add_2" style="left: 80px; top: -15px;">
					<a class="btn btn-primary add1 add_1">add</a><span class="add1">Add
						Processing</span>
				</div>
			</c:if>
		</div>
		<c:if test="${processDetails.size() == 0}">
			<a class="btn btn-primary" style="float: right; margin-top: 30px;"
				id="add_BOM" onclick="add_BOM('${orderDetails.id}')" href="#">Add
				to BOM</a>
		</c:if>
		<c:if test="${processDetails.size() != 0}">
			<a class="btn btn-primary" style="float: right; margin-top: 30px;"
				id="add_BOM" onclick="add_BOM('${orderDetails.id}')" href="#">update
				process to BOM</a>
		</c:if>




	</div>

	<div class="wrapper img-list" style="overflow: hidden;"></div>


	<div class="wrapper" id="details"
		style="display: none; padding-top: 30px; padding-bottom: 200px;">
		<div class="gs" style="text-align: center;">
			<span onclick="close_datails()"></span> <em
				style="font-style: normal; color: #07a6e9; font-weight: bold;">Unit
				process price * Qty + Unit process price * Qty ... ≈ Total process
				price</em>
			<div style="font-weight: bold;" class="d1"></div>
		</div>
	</div>

	<script type="text/javascript" src="js/calculator.js"></script>
	<script type="text/javascript" src="js/easydialog.min.js"></script>
	<script type="text/javascript" src="js/cookie_util.js"></script>
	<script type="text/javascript" src="js/process_info.js"></script>
	<script>


var processSize = "<%=processDetails.size()%>";
$(function(){

		
	   //如果是Boom页面查询详情访问，显示价格详情
		var detailCode = <%=detailCode%>;
		if(detailCode == "2"){
			queryDetails('<%=orderDetails.getId()%>','<%=orderDetails.getProductProcessPrice()%>');
		}
	
		
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
	       var processName = process_arr[index];
	       
	       var tl = 0;
	       if($(".process_list li:eq(0)").css("visibility") == "hidden"){
	    	   tl = 0; 
	       }else{
	    	   tl = $(".process_list li").length;
	       }
	       $('.img-list').append('<div class="w-30" style="float: left;width: 33.333333%;margin-bottom:19px;"><div class="btn-control-div" style="border: solid 2px #ff7f27;display:inline-block;width: 18px;height: 18px;border-radius: 50%;">'+
	    										     '<span class="btn-control-num" style="height: 18px;line-height: 18px;display:block;color: #ff7f27;text-align:center;">'+(tl+1)+'</span>'+
	    										'</div><div class="imgs"><img style="width: 200px;" src='+imgPath+'><span>'+processName+'</span></div></div>');

		    if($(".process_list li:eq(0)").css("visibility") == "hidden"){
		       $(".process_list li:eq(0)").css({"visibility":"visible"});
		       $('.w_add_1').hide();
		       $('.w_add_2').show();
		       $('.img-list').show();
				//重新计算工艺详情
			   calTotalProcessPrice();
		       return false;
		    }
			
		    
		    
			$(".process_list").append($(".process_list li:eq(0)").clone());
			var v1=	$(".process_list li:eq(0)").find("select:eq(0)").val();
			var v2=	$(".process_list li:eq(0)").find("select:eq(1)").val();
			$(".process_list li:last").find("select:eq(0)").val(v1);
			$(".process_list li:last").find("select:eq(1)").val(v2);
			
			var tl = $('.process_list').find("li").length;
			for(var i=0;i<tl;i++){

				 $(".process_list li:eq("+i+")").find("span:last").parent().show().css("display","inline-block");
				 
				 $(".process_list li:eq("+i+")").find("span:last").text(i+1);
				
			}
			
			//重新计算工艺详情
			calTotalProcessPrice();
			return false;
		})
		
		$("body").on("click","a.w-btn-delete",function(){
			var tl = $('.process_list').find("li").length;
			if(tl == 1){
				$(this).parent().parent().parents("li").css({"visibility":"hidden"});
			     $('.w_add_2').hide();
				 $('.w_add_1').show();
				 $('.img-list').empty().hide();
				 //重新计算工艺详情
				 calTotalProcessPrice();
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
				//重新计算工艺详情
				calTotalProcessPrice();
				 return false;	
			}
			  
		})
		
		$(document).on("click",".fa-check",function(){
			
			var onesideState = $('#oneside_state').val();
			var process = $(this).parents('li').find('.select_process').val();
			if(onesideState == 0 || process == 'Electrophoretic painting'){
				return false;
			}
// 			var state = $(this).parents('.input-group').siblings(".input-group").find('input').eq(1).val();
// 			if($(this).prev().val()==1 && state == 0){
// 				return false;
// 			}
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
			//重新计算工艺详情
			calTotalProcessPrice();
		})
		
		
	  	$("body").on("change",".select_process",function(){
	  	    var level1 = $(this).val();
	  	    $(this).next().find('.select_parameter').empty();
		    $(this).next().find('.select_parameter_span').text('');
		    $(this).siblings(".group_box").find(".input-group-btn").prev().val('');
	  		$(this).next().css({"display":"inline-block"});
		    var This=$(this);
		    var onesideState = $('#oneside_state').val();
			This.next().find("input.inside").next().removeClass("cur");
			This.next().find("input.inside").val(0);
			This.next().find("input.outside").next().removeClass("cur");
			This.next().find("input.outside").val(0);
// 			$.post("queryByProcess.do",
// 			       {"level1":level1},
// 		   function(result){
// 				  var txt_lis = "";
// 					  if(result.state == 0){
// 						   var list = result.data;
                           //获取选择的工艺索引
                           var index = This.prop('selectedIndex');
					       var parameter = $('#parameter').val();
					       var json = eval('(' + parameter + ')');
					       var thick = parseInt(json.Thickness);	
					       var superficialArea = parseFloat($('#superficialArea').val());
					       
					       //根据工艺索引获取详细信息
					       var level2 = getLevel2(index);
					       var level3 = getLevel3(index);
					       var superficialState = getSuperficialState(index);
					       var level2Explain = getLevel2Explain(index);
					       var imgPath = getProcessImg(index);
					       //获取初始价格
					       var unitProcessPrice = getPrice(index, 0);
                           This.parents('li').find('.unit-process-price').val(unitProcessPrice);                          
                           var process_index = This.parents('li').index();	
                           
					       var tl = 1;
					       if(level2.length == 0){
					    	   tl =1;
					       }else{
					    	   tl = level2.length;
					       }
					       
						  for(var i = 0; i < tl; i++){
							var p = level2[i];
							if(superficialState == "1"){
								This.next().find(".outside").css({"display":"inline-block"});
								This.siblings(".group_box").find(".input-group").hide();
								This.siblings(".model_label").find(".select_parameter").hide();
								
								var superficialClass = This.next().find("input.outside").next().attr('class');
								if(superficialClass == "fa fa-check"){
									This.next().find("input.outside").next().toggleClass("cur");
								}								
								This.next().find("input.outside").val(1);
								This.next().find(".outside").find(".number_txt").find("input").val(superficialArea);
								
								if(level1 == 'Electrophoretic painting'){
									This.next().find("input.inside").next().toggleClass("cur");
									This.next().find("input.inside").val(1);
									This.next().find('div.outside').find('input:first').val(superficialArea + superficialArea);
								}
								
								if(onesideState == 0){
									$('.input-group').eq(1).hide();
									$('.input-group').eq(0).find("input:first").val('All surface');
								}
								
							}else{								
								This.next().find(".outside").css({"display":"none"});
								This.siblings(".group_box").find(".input-group").show();
								This.siblings(".model_label").find(".select_parameter").show();
								This.next().find("input.outside").val(0);
							}
							
						    if(p=="" || p == undefined){
						    	 This.next().find('.select_parameter').css({"display":"none"});
						     }else{
						    	 This.next().find('.select_parameter').css({"display":"inline-block"});
						     }
						    
						     if(level2Explain==""){
						    	 This.next().find('.select_parameter_span').css({"display":"none"});
						     }else{
						    	 This.next().find('.select_parameter_span').css({"display":"inline-block"});
						     }
						     
						     
							This.next().find('.select_parameter').append("<option value='"+p+"'>"+p+"</option>");
							This.next().find('.select_parameter_span').text(level2Explain+":");
							This.siblings(".group_box").find(".input-group-btn").text(level3);
							This.siblings(".group_box").find(".input-group-btn").prev().val(1);
							if(level3 == "kg"){
								var weight = $('#order_weight').val();
								This.siblings(".group_box").find(".input-group-btn").prev().val((weight * 1000).toFixed(2));	
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
							  This.next().find('.group_box').hide();
						  }else{
							  This.next().find('.group_box').show();
						  }
						  
						  
						  //改变工艺图片
						  if(!(imgPath == '' || imgPath == null || imgPath == undefined)){
							  $('.img-list').find('img').eq(process_index).attr('src',imgPath);	
							  $('.img-list').find('img').eq(process_index).next().text(level1);								  
						  }
						  
				       
// 					  }else{
// 						  easyDialog.open({
// 				    		  container : {
// 				    		    header : 'Prompt message',
// 				    		    content : 'Query falied'
// 				    		  },
// 				    		  overlay : false,
// 				    		  autoClose : 1000
// 				    		}); 
// 					  }
				  
// 				});
				//重新计算工艺详情
				calTotalProcessPrice();
	  	});
		show_process();
		
})    

//==============//处理工艺第一次显示================================================

	  function show_process(){
		$(".select_process").each(function(index, element){
			
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
							   var list = result.data;
						       var parameter = $('#parameter').val();
						       var json = eval('(' + parameter + ')');
						       var thick = parseInt(json.Thickness);
							   var level3_parameter = This.siblings(".group_box").find(".input-group-btn").prev().val();
							   var superficialArea = parseFloat($('#superficialArea').val());						   						   
							   var level2Parameter = This.parent().parent().find("input:eq(0)").val();
							   var level3Parameter = This.parent().parent().find("input:eq(1)").val();
							   
					
// 							   var index = This.prop('selectedIndex');						      
// 						       var imgPath = getProcessImg(index);
// 	                           var process_index = This.parents('li').index();
							   
							   
// 	                           //改变工艺图片
// 	 						  if(!(imgPath == '' || imgPath == null || imgPath == undefined)){
// 	 							 if($(".process_list li:eq(0)").css("visibility") != "hidden"){
// 	 							 $('.img-list').append('<div class="w-30" style="float: left;width: 33.333333%;margin-bottom:19px;"><div class="btn-control-div" style="border: solid 2px #ff7f27;display:inline-block;width: 18px;height: 18px;border-radius: 50%;">'+
// 	 									     '<span class="btn-control-num" style="height: 18px;line-height: 18px;display:block;color: #ff7f27;text-align:center;">'+(process_index+1)+'</span>'+
// 	 									'</div><img style="margin-left:10%;width: 200px;" src='+imgPath+'></div>');
// 	 							 $('.img-list').show();
// 	 							 }
// 	 						  }
							   
							   
							   
							   
							  for(var i = 0; i < list.length; i++){
								var p = list[i].level2;
				
								if(list[i].superficialState=="1"){
									This.next().find(".outside").css({"display":"inline-block"});
									This.siblings(".group_box").find(".input-group").hide();
									This.siblings(".model_label").find(".select_parameter").hide();								
									var s_out_class = This.next().find("input.outside").next().attr('class');
									var s_in_class = This.next().find("input.inside").next().attr('class');		
									
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
								
							    if(p==""){
							    	 This.next().find('.select_parameter').css({"display":"none"});
							    	 This.siblings(".group_box").find(".input-group-btn").prev().val(level3Parameter);
							     }else{
							    	 This.next().find('.select_parameter').css({"display":"inline-block"});
							    	 This.siblings(".group_box").find(".input-group-btn").prev().val(level3Parameter);
							     }
							    
							     if(list[i].level2Explain==""){
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
							    
								This.next().find('.select_parameter_span').text(list[i].level2Explain+":");
								This.siblings(".group_box").find(".input-group-btn").text(list[i].level3);	
							    This.siblings(".group_box").find(".input-group-btn").prev().val(level3Parameter);
								if(list[i].level3 == "kg"){
									var weight = $('#order_weight').val();
// 									This.siblings(".group_box").find(".input-group-btn").prev().val(Number(weight * 1000).toFixed(2));	
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
							  }	
							  
							  if(processSize == 0){
								  This.siblings(".group_box").find(".input-group-btn").prev().val(1);
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
								  This.next().find('.group_box').hide();
							  }else{
								  This.next().find('.group_box').show();
							  }
							  
							  
							  
							  //工艺加载完loading...隐藏
							  window.setTimeout("removeLoading()",1000); 
					       
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
		})
		
		
		//处理工艺图片显示
		$('.process_list').find('.select_process').each(function(){
			   var index = $(this).prop('selectedIndex'); 
			   var imgPath = getProcessImg(index);
			   var processName = process_arr[index];
	           var process_index = $(this).parents('li').index();	
	           
	           //改变工艺图片
	 		  if(!(imgPath == '' || imgPath == null || imgPath == undefined)){
	 			 if($(".process_list li:eq(0)").css("visibility") != "hidden"){
	 			 $('.img-list').append('<div class="w-30" style="float: left;width: 33.333333%;margin-bottom:19px;"><div class="btn-control-div" style="border: solid 2px #ff7f27;display:inline-block;width: 18px;height: 18px;border-radius: 50%;">'+
	 					     '<span class="btn-control-num" style="height: 18px;line-height: 18px;display:block;color: #ff7f27;text-align:center;">'+(process_index+1)+'</span>'+
	 					'</div><div class="imgs"><img style="width: 200px;" src='+imgPath+'><span>'+processName+'</span></div></div>');
	 			 $('.img-list').show();
	 			 }
	 		  }
		   })         		
  	    	  		
  	}





  
     //添加到BOM界面
     function add_BOM(orderDetailsId){
	
	
	    var quoteId = $('#quoteId').val();	
    	var tl = $('.process_list').find("li").length;
    	var process = "";
    	for(var i=0;i<tl;i++){
    	  var level1 = $(".process_list li:eq("+i+")").find("select:eq(0)").val();
    	  var level2 = $(".process_list li:eq("+i+")").find("select:eq(1)").val();
    	  if($(".process_list li:eq("+i+")").find("div.model_label").css("display") == "none"){
    		  level2 = "";
    	  }else{
         	  var outsideSurface1 =$(".process_list li:eq("+i+")").find("input.outside").val();
         	  var insideSurface1 = $(".process_list li:eq("+i+")").find("input.inside").val();
    		  
    	  }    	  	
     	  var outsideSurface =$(".process_list li:eq("+i+")").find("input.outside").val();
     	  var insideSurface = $(".process_list li:eq("+i+")").find("input.inside").val();
    	  var level3Parameter = $(".process_list li:eq("+i+")").find("input:last").val();
    	  if(insideSurface == 1 || outsideSurface == 1){
    		  level3Parameter = $(".process_list li:eq("+i+")").find(".number_txt").find("input:first").val();   		  
    	  }else{
        	  //控制不为0
        	  if(level3Parameter == 0){
        		  easyDialog.open({
		    		  container : {
		    		    header : 'Prompt message',
		    		    content : 'The parameter can not be zero'
		    		  },
		    		  overlay : false,
		    		  autoClose : 1000
		    		}); 
            	  $(".process_list li:eq("+i+")").find("input:last").focus();
            	  return false;
        	  }   
    	  }
		  if(level2 == "undefined"){
			 level2 = "";
		   }
    	  process += "-" + level1 +"%"+ "-" + level2 +"%"+ "-" + level3Parameter+"%"+ "-" + outsideSurface+"%"+ "-" + insideSurface+",";  	  
    	}
    	if($(".process_list li:eq(0)").css("visibility") == "hidden" && tl == 1){
    	  process = "";	
    	}
		//防止重复点击
		$('#add_BOM').css({"background-color":"#666"}).attr("disabled","true");  
    	
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
       //返回首页
       function queryAll(){
      	 window.location = "/steelPlate/calculator/queryAll.do?type="+Math.random();
       }
     
       
       
       
       //查询工艺详情
       function queryDetails(orderDetailsId,processPrice){
      	 $.ajax({
    	      	url:"/steelPlate/calculator/queryOrderDetailsById.do",
    	      	method:'post',
    	      	data : {
    					 "orderDetailsId" : orderDetailsId
    					},
    				success : function(result) {
    					var tl = result.data.processDetails.length;
  					var processDetails = result.data.processDetails;
  					var processInfos = result.data.processInfos;
  					var exchangeRate = result.data.exchangeRate;
  					$('#exchangeRate').val(exchangeRate);
  					$('.gs').children('div').empty();
  					var process = '';
  					var totalProcess = 0;
  					for(var i=0;i<tl;i++){    
  						if(i == tl-1){
  							if(processDetails[i].level1Parameter == 'Hot dip galvanizing' || processDetails[i].level1Parameter == 'Cold galvanizing'){
  								process += Number(processPrice/processDetails[i].level3Parameter).toFixed(5) +'*'+ processDetails[i].level3Parameter;
  								totalProcess += Number(processPrice/processDetails[i].level3Parameter).toFixed(5) * processDetails[i].level3Parameter;	
  							}else{
  								process += Number(processDetails[i].unitPrice/exchangeRate).toFixed(5) +'*'+ processDetails[i].level3Parameter;	
  								totalProcess += Number(processDetails[i].unitPrice/exchangeRate).toFixed(5) * processDetails[i].level3Parameter;	
  							}
  						}else{
  							if(processDetails[i].level1Parameter == 'Hot dip galvanizing' || processDetails[i].level1Parameter == 'Cold galvanizing'){
  								process += Number(processPrice/processDetails[i].level3Parameter).toFixed(5) +'*'+ processDetails[i].level3Parameter+"+";
  								totalProcess += Number(processPrice/processDetails[i].level3Parameter).toFixed(5) * processDetails[i].level3Parameter;	
  							}else{
  								process += Number(processDetails[i].unitPrice/exchangeRate).toFixed(5) +'*'+ processDetails[i].level3Parameter+"+";	
  								totalProcess += Number(processDetails[i].unitPrice/exchangeRate).toFixed(5) * processDetails[i].level3Parameter;
  							}
  						}                                 	                                         	
                       }
  					totalProcess = Number(totalProcess).toFixed(2);
  					process = process + "≈" + totalProcess  + ' USD';	
  					$('.gs').children('div').append(process);
                        //计算工艺价格
//                         calTotalProcessPrice();
    					$('#details').show();
    					
    				},error:function(msg){
    					
    					
    				}
    				
    	      });
       }
       
    
     //计算数量变化后价格
     function calTotalProcessPrice(){
    	 
    	 var tl =  $('.process_list').find('li').length;
    	 if($(".process_list li:eq(0)").css("visibility") == "hidden" && tl == 1){
    		 $('.gs').children('div').html('');
    		 return false;
         }
    	 
    	 var unitProcessPrice = 0;  	 
    	 var level3Parameter = 0;
    	 var exchangeRate = $('#exchangeRate').val();
    	 if(exchangeRate == null || exchangeRate == ''){
    		 exchangeRate = 1;
    	 }
    	 var process = '';	
    	 var totalProcess = 0;
    	 $('.process_list').find('li').each(function(i){
    		 
    		
    		 if($(this).find('.outside').eq(0).css('display') != 'none'){
    			 unitProcessPrice = $(this).find('.unit-process-price').val();
        		 level3Parameter = $(this).find('.outside').find('input:first').val();
        		 process += Number(unitProcessPrice/exchangeRate).toFixed(5) +'*'+ level3Parameter+"+";	
        		 totalProcess += Number(unitProcessPrice/exchangeRate).toFixed(5) * Number(level3Parameter);	
    		 }else{
        		 unitProcessPrice = $(this).find('.unit-process-price').val();
        		 level3Parameter = $(this).find('input').eq(8).val();
        		 process += Number(unitProcessPrice/exchangeRate).toFixed(5) +'*'+ level3Parameter+"+";	
        		 totalProcess += Number(unitProcessPrice/exchangeRate).toFixed(5) * Number(level3Parameter);	
    		 }
    	 })
    	 if(process.length > 0){
    		 process = process.substring(0,process.length - 1);
    	 }
    	 totalProcess = Number(totalProcess).toFixed(2);
    	 process = process + "≈" + totalProcess + ' USD';		
    	 $('.gs').children('div').html(process);
     }  
       
     
     //改变level2选择框后单位价格变化
     function update_unit_price(obj){
    	 var process_index = $(obj).parents('li').find('.select_process').prop('selectedIndex');	
    	 var num = $(obj).prop('selectedIndex');    	    	 
    	 var unitProcessPrice = getPrice(process_index, num);
    	 $(obj).parents('li').find('.unit-process-price').val(unitProcessPrice);
    	 calTotalProcessPrice();
     }
     
     
</script>







	<script async
		src="https://www.googletagmanager.com/gtag/js?id=AW-1072713230"></script>
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


<!-- 头部加载中js -->
<script>
var css = {left:'480px'};  
$('.line img').animate(css,2000,rowBack);  
function rowBack(){  
   $('.line img').css('left',0);  
   $('.line img').animate(css,2000,rowBack); 
}  				

function removeLoading(){
   $('.div_transparent').hide();
}

</script>
</body>
</html>
