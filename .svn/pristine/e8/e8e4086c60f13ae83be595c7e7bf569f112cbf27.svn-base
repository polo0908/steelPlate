
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>钢板详情查询</title>
<script type="text/javascript"
	src="<%=request.getContextPath() %>/js/jquery-1.10.2-website.js"></script>

<script type="text/javascript"
	src="<%=request.getContextPath() %>/js/jquery_last.js"></script>
<script language="javascript" type="text/javascript"
	src="<%=request.getContextPath() %>/js/jquery.inputmask.js"></script>


<script type="text/javascript"
	src="<%=request.getContextPath() %>/js/jquery-1.8.0.min.js"></script>

<script type="text/javascript"
	src="<%=request.getContextPath() %>/js/jsAddress.js">

<script type="text/javascript" src="${path}/js/warehousejs/jquery.messager.js"></script>



<style type="text/css">
table {
	table-layout: fixed;
	word-break: break-all;
	word-wrap: break-word;
}
/* 表格样式 */
table.altrowstable {
	font-family: verdana, arial, sans-serif;
	font-size: 11px;
	color: #333333;
	border-width: 1px;
	border-color: #a9c6c9;
	border-collapse: collapse;
}

table.altrowstable th {
	border-width: 1px;
	padding: 8px;
	border-style: solid;
	border-color: #a9c6c9;
}

table.altrowstable td {
	border-width: 1px;
	padding: 8px;
	border-style: solid;
	border-color: #a9c6c9;
}

.oddrowcolor {
	background-color: #F4FFF4;
}

.evenrowcolor {
	background-color: #F4FFF4;
}

/* 字体样式 */
body {
	font-family: arial, "Hiragino Sans GB", "Microsoft Yahei", sans-serif;
}

p.thicker {
	font-weight: 900
}

/* button样式 */
.className {
	line-height: 30px;
	height: 30px;
	width: 88px;
	color: #ffffff;
	background-color: #7fa7e8;
	font-size: 16px;
	font-weight: normal;
	font-family: Arial;
	border: 0px solid #dcdcdc;
	-webkit-border-top-left-radius: 3px;
	-moz-border-radius-topleft: 3px;
	border-top-left-radius: 3px;
	-webkit-border-top-right-radius: 3px;
	-moz-border-radius-topright: 3px;
	border-top-right-radius: 3px;
	-webkit-border-bottom-left-radius: 3px;
	-moz-border-radius-bottomleft: 3px;
	border-bottom-left-radius: 3px;
	-webkit-border-bottom-right-radius: 3px;
	-moz-border-radius-bottomright: 3px;
	border-bottom-right-radius: 3px;
	-moz-box-shadow: inset 0px 0px 0px 0px #ffffff;
	-webkit-box-shadow: inset 0px 0px 0px 0px #ffffff;
	box-shadow: inset 0px 0px 0px 0px #ffffff;
	text-align: center;
	display: inline-block;
	text-decoration: none;
}

.className:hover {
	background-color: #4a8cf7;
}

}

/* 查询条件文本框 */
.querycss {
	color: #00B026;
	font-size: 12pt;
	border-width: 1px;
	border-color: #AFFFA0;
	border-style: solid;
	height: 23px;
	width: 120px;
}

/* 一页显示select */
.classSelect {
	line-height: 30px;
	height: 30px;
	width: 157px;
	color: #ffffff;
	background-color: #7fa7e8;
	font-size: 16px;
	font-weight: normal;
	font-family: Arial;
	border: 0px solid #dcdcdc;
	-webkit-border-top-left-radius: 3px;
	-moz-border-radius-topleft: 3px;
	border-top-left-radius: 3px;
	-webkit-border-top-right-radius: 3px;
	-moz-border-radius-topright: 3px;
	border-top-right-radius: 3px;
	-webkit-border-bottom-left-radius: 3px;
	-moz-border-radius-bottomleft: 3px;
	border-bottom-left-radius: 3px;
	-webkit-border-bottom-right-radius: 3px;
	-moz-border-radius-bottomright: 3px;
	border-bottom-right-radius: 3px;
	-moz-box-shadow: inset 0px 0px 0px 0px #ffffff;
	-webkit-box-shadow: inset 0px 0px 0px 0px #ffffff;
	box-shadow: inset 0px 0px 0px 0px #ffffff;
	text-align: center;
	display: inline-block;
	text-decoration: none;
}

.classSelect:hover {
	background-color: #4a8cf7;
}
</style>
<!--  -->

<script type="text/javascript">
//
//加载完成之后
$(document).ready(function(){
	
	$("input[id^='inputPrintid']").prop("checked","true");
	$("#allSelcheckid").prop("checked","true");
	
	
}) 
window.onload=function(){
	var ordersLength = document.getElementById("ordersLength").value;
	for(var i=0; i<ordersLength; i++){
		altRows('alternatecolor'+(i+1));
	}
	
}
function scrollImg(){
    var posX,posY;
    if (window.innerHeight) {
        posX = window.pageXOffset;
        posY = window.pageYOffset;
    }
    else if (document.documentElement && document.documentElement.scrollTop) {
        posX = document.documentElement.scrollLeft;
        posY = document.documentElement.scrollTop;
    }
    else if (document.body) {
        posX = document.body.scrollLeft;
        posY = document.body.scrollTop;
    }
 
    var ad=document.getElementById("gdwzdiv");
    ad.style.top=(posY+100)+"px";
    ad.style.left=(posX+50)+"px";
    setTimeout("scrollImg()",100);
}
function setBntJy(obj){
	//alert("123");
	$(obj).attr("disabled", true);  
	
	 setTimeout(function () { 
	       
	    }, 2000);
	//alert("456");
}
//查询 提交
function aSubmit(){
	document.getElementById("idForm").submit();
}
//跳转抓取数量
function toAli1688quantity(){
	window.location="${path}/statistics/ali1688info/queryForAli1688Quantity";
}

//清空查询条件
function cleText(){
//	document.getElementById("idname").value="";
	$('input[type=text]').val("");
	window.location="${path}/querySteelPate/querySteelPate/getList";
}
//回车事件
$(document).keydown(function(event){ 
	if(event.keyCode == 13){ //绑定回车 
		aSubmit();
	} 
});


</script>

<style>
.list-name-input {
	color: #333;
	font-family: tahoma, 'Microsoft YaHei', 'Segoe UI', Arial,
		'Microsoft Yahei', Simsun, sans-serif;
	font-size: 15px;
	font-weight: bold;
	height: 50px;
	margin: 0px;
	padding: 0px;
	position: relative;
	width: 300px;
}

.list-name-for-select {
	border: 0;
	color: #555;
	height: 20px;
	lighting-color: rgb(255, 255, 255);
	line-height: 20px;
	margin: 0 0 10px 0;
	outline-color: #555;
	outline-offset: 0px;
	outline-style: none;
	outline-width: 0px;
	padding: 4px 6px;
	position: absolute;
	top: 1px;
	left: 3px;
	vertical-align: middle;
	width: 100px;
}

.list-name-input-for-select:focus {
	border: 0;
	border-radius: 0;
}

.list-select {
	background-color: #FFF;
	border: 1px #ccc solid;
	border-radius: 4px;
	color: #555;
	cursor: pointer;
	height: 30px;
	left: 0px;
	margin: 0 0 10px 0;
	padding: 4px 6px;
	position: absolute;
	top: 0px;
	vertical-align: middle;
	white-space: pre;
	width: 300px;
}
</style>

</head>
<body style="background-color: #F4FFF4;">

	<div align="center">

		<div>
			<H1>钢板详情查询</H1>

		</div>

		<div id="gdwzdiv">
			<form id="idForm" action="${path}/SteelPlate/getCategoryInfo.do"
				method="POST">
				<table>
					<tr>
						<td>
							<table>
								<tr>
									<td>种类:</td>
									<td>

										<div id="list-name-first" class="list-name-input">
											<select class="list-select" id="area">
											</select> <input type="text"
												class="name item-width list-name-for-select" id="first">
										</div>
									</td>
									<td>品名:</td>
									<td>
										<div id="list-name-second" class="list-name-input">
											<select class="list-select" id="cmbProvince">
											</select> <input type="text"
												class="name item-width list-name-for-select" id="second">
										</div>
									</td>
									<td>材质:</td>
									<td>
										<div id="list-name-third" class="list-name-input">
											<select class="list-select" id="cmbCity">
											</select> <input type="text"
												class="name item-width list-name-for-select" id="third">
										</div>
									</td>
									<td>规格:</td>
									<td>
										<div id="list-name-forth" class="list-name-input">
											<select class="list-select" id="cmbArea">
											</select> <input type="text"
												class="name item-width list-name-for-select" id="forth">
										</div>
									</td>
								</tr>
							</table> 宽度：<input class="querycss" style="width: 100px;" id="staWeidth"
							name="staWeidth" value="${staWeidth}" type="text" />~ <input
							class="querycss" style="width: 100px;" id="endWeidth"
							name="endWeidth" value="${endWidth}" type="text" />
						</td>
					</tr>
					<tr>
						<td>长度:<input class="querycss" style="width: 100px;"
							id="staSize" name="staSize" value="${staSize}" type="text" />~ <input
							class="querycss" style="width: 100px;" id="endSize"
							name="endSize" value="${endSize}" type="text" /> <%-- 发布单位:<input class="querycss" style="width : 100px;" id="guapaishangjia" name="guapaishangjia" value="${guapaishangjia}" type="text"/>		
				厂家:<input class="querycss" style="width : 100px;" id="chagnjia" name="chagnjia" value="${chagnjia}" type="text"/>		
				库存地:<input class="querycss" style="width : 100px;" id="cunhuodi" name="cunhuodi" value="${cunhuodi}" type="text"/>	 --%>
							价格:<input class="querycss" style="width: 100px;" id="staJiage"
							name="staJiage" value="${staJiage}" type="text" />~ <input
							class="querycss" style="width: 100px;" id="endJiage"
							name="endJiage" value="${endJiage}" type="text" />
						</td>
					</tr>
				</table>
				<a href='javascript:void(0);' onclick="aSubmit()" class='className'>搜现货</a>
				<a href='javascript:void(0);' onclick="cleText()" class='className'>重置</a>
			</form>
		</div>

		<div>
			<h3>产品详细信息</h3>
		</div>
		<div>
			<div>

				<div>
					<table class="altrowstable" id="alternatecolor${status.count}"
						style="width: 100%; text-align: center; /* COLOR: #0076C8; */ BACKGROUND-COLOR: #F4FAFF; font-weight: bold">

						<tr id="tr2${strOrder }" style="background-color: #F5F5F5;">

							<td><font style="font-size: 15px;">商品的Id</font></td>

							<td><font style="font-size: 15px;">公司名称</font></td>
							<td><font style="font-size: 15px;">类别</font></td>
							<td><font style="font-size: 15px;">品名</font></td>
							<td><font style="font-size: 15px;">材质</font></td>
							<td><font style="font-size: 15px;">规格</font></td>
							<td><font style="font-size: 15px;">钢厂</font></td>
							<td><font style="font-size: 15px;">仓库</font></td>
							<td><font style="font-size: 15px;">重量(吨)</font></td>
							<td><font style="font-size: 15px;">单价 (元/吨)</font></td>
							<td><font style="font-size: 15px;">长度</font></td>
							<td><font style="font-size: 15px;">宽度</font></td>
						</tr>
						<c:if test="${list != null && fn:length(list) > 0 }">
							<c:forEach items="${list}" var="list" varStatus="st">
								<tr index="${st.index}">
									<td style="width: 5%;">${list.itemid }</td>
									<td style="width: 10%;">${list.guapaishangjia }</td>
									<td style="width: 10%;">${list.zhonglei }</td>
									<td style="width: 10%;">${list.pinming }</td>
									<td style="width: 10%;">${list.caizhi }</td>
									<td style="width: 10%;">${list.guige }</td>
									<td style="width: 15%;">${list.changjia }</td>
									<td style="width: 15%;">${list.cunhuodi }</td>
									<td style="width: 10%;">${list.zhongliang }</td>
									<td style="width: 10%;">${list.jiage }</td>
									<td style="width: 10%;">${list.length }</td>
									<td style="width: 10%;">${list.width}</td>
								</tr>
							</c:forEach>
						</c:if>
					</table>
				</div>
			</div>
		</div>
		<!-- 用来空行 -->
		<div>
			<h3></h3>
		</div>
		<div>
			<select class='classSelect' onchange="window.location=this.value">
				<option selected="selected"
					value='getOrderInfoInspection.do?day=${oip.day}&orderid=${oip.orderid}&userid=${oip.userid }&orderstruts=${oip.orderstruts }&pageNum=${oip.previousPage }&pageSize=${oip.pageSize}'>每页显示${oip.pageSize}条</option>

				<c:forEach begin="1" end="3" var="i">
					<c:if test="${i*50 != oip.pageSize}">
						<option
							value='getOrderInfoInspection.do?day=${oip.day}&orderid=${oip.orderid}&userid=${oip.userid }&orderstruts=${oip.orderstruts }&pageNum=${oip.previousPage }&pageSize=${i*50 }'>
							每页显示${i*50}条</option>
					</c:if>
				</c:forEach>

			</select> <a
				href='getOrderInfoInspection.do?day=${oip.day}&orderid=${oip.orderid}&userid=${oip.userid }&orderstruts=${oip.orderstruts }&pageNum=1&pageSize=${oip.pageSize }'
				class='className'>第一页</a> <a
				href='getOrderInfoInspection.do?day=${oip.day}&orderid=${oip.orderid}&userid=${oip.userid }&orderstruts=${oip.orderstruts }&pageNum=${oip.previousPage }&pageSize=${oip.pageSize }'
				class='className'>上一页</a> <a
				href='getOrderInfoInspection.do?day=${oip.day}&orderid=${oip.orderid}&userid=${oip.userid }&orderstruts=${oip.orderstruts }&pageNum=${oip.nextPage }&pageSize=${oip.pageSize }'
				class='className'>下一页</a> <a
				href='getOrderInfoInspection.do?day=${oip.day}&orderid=${oip.orderid}&userid=${oip.userid }&orderstruts=${oip.orderstruts }&pageNum=${oip.pageCount }&pageSize=${oip.pageSize }'
				class='className'>最后一页</a>
		</div>
		<div>
			<h4>当前第${oip.pageNum}页 &nbsp;&nbsp;
				共${oip.pageCount}页&nbsp;&nbsp; 共${oip.pageSum }记录</h4>

		</div>
</body>

</html>