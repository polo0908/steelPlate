<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html class="no-js" lang="">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>MotoShop | Home Version 1</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="${ctx}/css/index-6.css"
	rel="stylesheet">
<style type="text/css">
table.gridtable {
	margin-top: 20px;
	font-family: verdana, arial, sans-serif;
	font-size: 11px;
	color: #333333;
	border-width: 1px;
	border-color: #666666;
	border-collapse: collapse;
	display: inline-block;
}

table.gridtable th {
	width: 120px;
	border-width: 1px;
	padding: 8px 12px;
	border-style: solid;
	border-color: #dedede;
	background-color: #f2f2f2;
}

table.gridtable td {
	text-align: center;
	border-width: 1px;
	padding: 8px;
	border-style: solid;
	border-color: #dedede;
	background-color: #ffffff;
}
</style>
<script type=text/javascript
	src="${ctx}/js/newbase.js"></script>
</head>
<body>
	<form action="https://www.paypal.com/cgi-bin/webscr" method="post"
		target="_blank" class="payifcondiv" id="payForm">
		<div class="all_box">
			<div class="fanhui">
				<a href="index-4.html" class="fanhui_a"></a>
			</div>
			<div class="wenzimokuai">
				<h2 class="wenzi_h2">Thanks for your tender</h2>
				<div class="dt_dd">
					<div class="kuang">
						<div class="name">In order for the Seller to seriously
							consider your offer please pay a deposit Deposit amount = $50 +
							Price Difference = $50 +($1900-$1700)*10%*5 = $150 USD</div>
					</div>
					<div class="kuang" style="margin-top: 10px;">
						<div class="xinxi">Deposit is 100% refundable and you can
							pay it by credit card.</div>
					</div>
				</div>
				<table class="gridtable">
					<tr>
						<th>订单号</th>
						<th>种类</th>
						<th>品名</th>
						<th>材质</th>
						<th>我要的长度</th>
						<th>我要的重量</th>
						<th>产品的单价RMb/T</th>
						<th>我出的价格RMb/T</th>
						<th>投标保证金RMB</th>
						<th>我公司名名字</th>
						<th>我的eMail</th>
						<th>我的联系电话</th>
						<th>选择的物流</th>
						<th style="width: 150px;">是否许需要二次确认</th>
						<th>订单生成时间</th>

					</tr>
					<c:if test="${order != null && fn:length(order) > 0 }">
							<tr>
								<td>${order.itemid}</td>
								<td>${order.scategory}</td>
								<td>${order.sname}</td>
								<td>${order.smaterial}</td>
								<td>${order.length}</td>
								<td>${order.weight }</td>
								<td>${order.sprince}</td>
								<td>${order.uprice}</td>
								<td>${order.margin}</td>
								<td>${order.ucompanyname}</td>
								<td>${order.uemail}</td>
								<td>${order.uphonenumber }</td>
								<td>${order.incoTerm }</td>
								<td>${order.confirm}</td>
								<td>${order.time}</td>
							</tr>
					</c:if>
				</table>

				<div class="dayin">
					<input type="button" class="button" value="Print">
				</div>
			</div>
			<p>
				<b> Margin Cost:</b><span><em
					style="font-size: 20px; margin-left: 5px; color: red;">${order.margin}
				</em>RMB</span>
			</p>
			<!-- <p><b>------付款失败，请继续付款--------------------</b><span><em style="font-size:20px;margin-left:5px;color:red;"> </em></span></p> -->
			<hr>
			<h3>------付款失败，请继续付款--------------------</h3>
			<input type="hidden" id="sampleCost" value="${sampleCost}"> <input
				type="hidden" id="purl" value="${purl}"> <input
				type="hidden" id="fprice" value="${fprice}"> <input
				type="hidden" id="comUserId" value="${comUserId}"> <input
				type="hidden" id="orderid" value="${orderid}"> <input
				type="hidden" id="indexid" value="${indexid}"> <input
				type="hidden" id="goodsPid" value="${goodsPid}"> <input
				type="hidden" name="cmd" value="_xclick"> <input
				type="hidden" name="business" value="584JZVFU6PPVU"> <input
				type="hidden" name="lc" value="US">
			<!-- <input id="item_name" type="hidden" name="item_name" value="Plastic Injection Mold"> -->
			<input id="item_name" type="hidden" name="item_name" value="">
			<input id="item_number" type="hidden" name="item_number"
				value="${orderid}+${comUserId}"> <input id="amount"
				type="hidden" name="amount" value="${list.margin}"> <input
				type="hidden" name="currency_code" value="RMB"> <input
				type="hidden" name="button_subtype" value="services"> <input
				type="hidden" name="no_note" value="3"> <input type="hidden"
				name="no_shipping" value="3"> <input type="hidden" name="rm"
				value="3"> <input type="hidden" name="return"
				value="http://116.228.150.218:8086/cbt/paysuccess.jsp"> <input
				id="cancel_return" type="hidden" name="cancel_return"
				value="${ctx}/SteelPlate/findOrderByItemId.do?itmeId=${itemId}">
			<input type="hidden" name="shipping" value="0.00"> <input
				type="hidden" name="bn"
				value="PP-BuyNowBF:btn_buynowCC_LG.gif:NonHosted">
			<!--    dibu-->
			<div style="clear: both;"></div>
			<div class="dibu">
				<img src="../images/button-1350.png" /> <a href="#"> <input
					type="submit" class="div_button01" value="Pay Deposit by Payple">
				</a> <a href="#"> <input type="submit" class="div_button02"
					value="Pay Deposit by Wire Transfer">
				</a> <a href="#"> <input type="submit" class="div_button03"
					value="Cancel">
				</a>
			</div>
		</div>
		<!-- <form action="https://www.paypal.com/cgi-bin/webscr" method="post" target="_blank" class="payifcondiv" id="payForm"> -->
		<%-- <p><b> Margin Cost:</b><span><em style="font-size:20px;margin-left:5px;color:red;">${margin} </em>RMB</span></p>
			<input type="hidden" id="sampleCost" value ="${sampleCost}">
        	<input type="hidden" id="purl" value ="${purl}">
        	<input type="hidden" id="fprice" value ="${fprice}">
        	<input type="hidden" id="comUserId" value ="${comUserId}">
        	<input type="hidden" id="orderid" value ="${orderid}">
        	<input type="hidden" id="indexid" value ="${indexid}">
        	<input type="hidden" id="goodsPid" value ="${goodsPid}">
			
			<input type="hidden" name="cmd" value="_xclick">
			<input type="hidden" name="business" value="584JZVFU6PPVU">
			<input type="hidden" name="lc" value="US">
			<!-- <input id="item_name" type="hidden" name="item_name" value="Plastic Injection Mold"> -->
			<input id="item_name" type="hidden" name="item_name" value="">
			<input id="item_number" type="hidden" name="item_number" value="${orderid}+${comUserId}">
			<input id="amount" type="hidden" name="amount" value="${margin}">
			<input type="hidden" name="currency_code" value="USD">
			<input type="hidden" name="button_subtype" value="services">
			<input type="hidden" name="no_note" value="3">
			<input type="hidden" name="no_shipping" value="3">
			<input type="hidden" name="rm" value="3">
			<input type="hidden" name="return" value="http://116.228.150.218:8086/cbt/paysuccess.jsp">
			<input id="cancel_return" type="hidden" name="cancel_return" value="http://116.228.150.218:8086/cbt/payfailed.jsp">
			<input type="hidden" name="shipping" value="0.00">
			<input type="hidden" name="bn" value="PP-BuyNowBF:btn_buynowCC_LG.gif:NonHosted">	 --%>

		<!-- <button class="text-sub" style="width:120px;margin-left:10px;height:30px;border-radius:5px;border: 1px solid rgb(249, 116, 64);" onclick="fnCustomOrder()">Pay Now</button> -->
		<%-- <input type="button" value="Pay Now" class="text-sub" style="width:120px;height:30px;border-radius:5px;border: 1px solid rgb(249, 116, 64);" onClick="fnCustomOrder('openNew','${orderid}+${comUserId}')">
			<a href="javascript:void(0)"  onclick="fnCustomOrder('openLocal','${orderid}+${comUserId}')" style="font-size: 14px;float: left;color: red;padding-left: 5px;margin-top: 3.5%">If you have trouble paying, click here。</a> --%>
	</form>
</body>

</html>