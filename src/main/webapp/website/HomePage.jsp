<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@page import="java.util.List"%>
<%@page import="com.cbt.model.SteelPlate"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<%
List<SteelPlate> list = null;
if(!(request.getAttribute("list")==null || "".equals(request.getAttribute("list")))){
	list = (List<SteelPlate>) request.getAttribute("list");
}

%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>商城首页</title>
<meta name="description" content="">
<meta name="keywords" content="">
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
	width: 230px;
	margin-left: 10px;
}

.list-name-for-select {
	border: 0;
	color: #555;
	height: 28px;
	lighting-color: rgb(255, 255, 255);
	line-height: 28px;
	margin: 0 0 10px 0;
	outline-color: #555;
	outline-offset: 0px;
	outline-style: none;
	outline-width: 0px;
	padding: 0 0 0 5px;
	position: absolute;
	top: 1px;
	left: 3px;
	vertical-align: middle;
	width: 190px;
}

.list-name-input-for-select:focus {
	border: 0;
	border-radius: 0;
}

.list-select {
	background-color: #FFF;
	border: 1px #ccc solid;
	color: #555;
	cursor: pointer;
	height: 30px;
	left: 0px;
	margin: 0 0 10px 0;
	padding: 0 0 0 5px;
	position: absolute;
	top: 0px;
	vertical-align: middle;
	white-space: pre;
	width: 213px;
}
</style>

<link href="${ctx}/css/style.css" rel="stylesheet">
<link href="${ctx}/css/style-2.css" rel="stylesheet">
<script type="text/javascript" src="${ctx}/js/jquery-1.10.2.js"></script>
<script type="text/javascript" src="${ctx}/js/index.js"></script>
<script type="text/javascript" src="${ctx}/js/scripts.js"></script>
<script type="text/javascript" src="${ctx}/js/jquery.inputmask.js"></script>
<script type="text/javascript" src="${ctx}/js/jserach.js"></script>
<script type="text/javascript">

        $(function(){ 
        	
        	var list = "<%=list%>";
            if(!(list == null || list == "null")){
            	aSubmit_page(1);
            }
        })
		//查询提交
		function aSubmit(){

            var category = $('#select_category').val();
            var commodity = $('#select_commodity').val();
            var parameter = $('#select_parameter').val();
            var material = $('#select_material').val();
            var width1 = $('#staWeidth1').val();
            var width2 = $('#endWeidth1').val();
            var length1 = $('#staSize1').val();
            var length2 = $('#lastInput').val();
			$.ajax({
				url : '${ctx}/SteelPlate/getCategoryInfo.do',
				method : 'post',
				data : {
					"category" : category,
					"commodity" : commodity,
					"material" : material,
					"parameter" : parameter,
					"width1"  : width1,
					"width2"  : width2,
					"length1"  : length1,
					"length2"  : length2
				},
				success : function(result) {	

				$('#categoryInfo_tbody').empty();
				$('#DataTables_Table_0_paginate').empty();
				   var data = result.list;
				   var pager = result.pager;
				   for(var i = 0; i<data.length ;i++){					   
					   var tr =  '<tr>'+  
					    '<td style="width: 5%;">'+data[i].id+'</td>'+
						'<td style="width: 17%;">'+data[i].guapaishangjia+'</td>'+
						'<td style="width: 10%;">'+data[i].zhonglei+'</td>'+
						'<td style="width: 10%;">'+data[i].pinming+'</td>'+
						'<td style="width: 10%;">'+data[i].caizhi+'</td>'+
						'<td style="width: 10%;">'+data[i].guige+'</td>'+
						'<td style="width: 10%;">'+data[i].changjia+'</td>'+
						'<td style="width: 10%;">'+data[i].cunhuodi+'</td>'+
						'<td style="width: 10%;">'+data[i].zhongliang+'</td>'+
						'<td style="width: 10%;">'+data[i].jiage+'</td>'+
						'<td style="width: 10%;"><a href="${ctx}/SteelPlate/findById1.do?productId='+data[i].id+'">'+
						'Make an Offer</a></td>'+
				   '</tr>';
				   
		            $('#categoryInfo_tbody').append(tr);			            
					
				   }
				    $('#body2').show();
		            $('#body1').hide();				    
				    $('#DataTables_Table_0_paginate').html(pager);
				   
				},
				error : function(msg) {
				}

			});

		}
        
         //分页查询信息提交    (分页在后台拼接) 
		function aSubmit_page(page){
			$.ajax({
				url : '${ctx}/SteelPlate/getCategoryInfoByPage.do',
				method : 'post',
				data : {
					"page" : page
				},
				success : function(result) { 
				  $('#categoryInfo_tbody').empty();
				  $('#DataTables_Table_0_paginate').empty();
				   var data = result.list;
				   var pager = result.pager;
				   for(var i = 0; i<data.length ;i++){					   
					   var tr =  '<tr>'+  
					    '<td style="width: 5%;">'+data[i].id+'</td>'+
						'<td style="width: 17%;">'+data[i].guapaishangjia+'</td>'+
						'<td style="width: 10%;">'+data[i].zhonglei+'</td>'+
						'<td style="width: 10%;">'+data[i].pinming+'</td>'+
						'<td style="width: 10%;">'+data[i].caizhi+'</td>'+
						'<td style="width: 10%;">'+data[i].guige+'</td>'+
						'<td style="width: 10%;">'+data[i].changjia+'</td>'+
						'<td style="width: 10%;">'+data[i].cunhuodi+'</td>'+
						'<td style="width: 10%;">'+data[i].zhongliang+'</td>'+
						'<td style="width: 10%;">'+data[i].jiage+'</td>'+
						'<td style="width: 10%;"><a href="${ctx}/SteelPlate/findById1.do?productId='+data[i].id+'">'+
						'Make an Offer</a></td>'+
				   '</tr>';
				   
		            $('#categoryInfo_tbody').append(tr);	 
				   }
				   $('#body2').show();
		           $('#body1').hide();
				   $('#DataTables_Table_0_paginate').html(pager);
				   
				},
				error : function(msg) {
				}

			});
    	    	  
        }
        
        
		//清空查询，用的重新载入界面
		function cleText(){			
			 window.location="${ctx}/SteelPlate/home.do";
	}
</script>

</head>

<div class="top">
	<div class="topnav clear">
		<div class="user-entry">
			您好，欢迎来到 <b><a href="">板材网</a></b>&nbsp;&nbsp; [<a href="">登录</a>]&nbsp;&nbsp;
			[<a href="">注册</a>]
		</div>
		<ul class="quick-menu">
<!-- 			<li class="user-center"> -->
<!-- 				<div class="menu"> -->
<!-- 					<a href="">我的商城</a> <i class="arrow"></i> -->

<!-- 				</div><span class="hline"></span> -->
<!-- 				<div class="menu-bd menu-bdp"> -->
<!--   			       <ul> -->
<!-- 						<li><a href="">已买到的商品</a></li> -->
<!-- 						<li><a href="">个人主页</a></li> -->
<!-- 						<li><a href="">我的好友</a></li> -->
<!-- 					</ul> -->
<!-- 				</div> -->
<!-- 			</li> -->
<!-- 			<li class="user-center"> -->
<!-- 				<div class="menu"> -->
<!-- 					<a href="">卖家中心</a> <i class="arrow"></i> <span class="hline"></span> -->
<!-- 				</div> -->
<!-- 				<div class="menu-bd menu-bdp"> -->
<!-- 					<ul> -->
<!-- 						<li><a href="">已售出的商品</a></li> -->
<!-- 						<li><a href="">销售处的商品</a></li> -->
<!-- 					</ul> -->
<!-- 				</div> -->
<!-- 			</li> -->
<!-- 			<li class="user-center"> -->
<!-- 				<div class="menu"> -->
<!-- 					<a href="">我的订单</a> <span class="hline"></span> -->
<!-- 				</div> -->
<!-- 			</li> -->
<!-- 			<li class="user-center"> -->
<!-- 				<div class="menu"> -->
<!-- 					<a href="">我的收藏</a> <i class="arrow"></i> <span class="hline"></span> -->
<!-- 				</div> -->
<!-- 				<div class="menu-bd"> -->
<!-- 					<ul> -->
<!-- 						<li><a href="">收藏的商品</a></li> -->
<!-- 						<li><a href="">收藏的店铺</a></li> -->
<!-- 					</ul> -->
<!-- 				</div> -->
<!-- 			</li> -->
<!-- 			<li class="user-center"> -->
<!-- 				<div class="menu"> -->
<!-- 					<a href="">站内消息</a> <span class="hline"></span> -->
<!-- 				</div> -->
<!-- 			</li> -->
<!-- 			<li class="user-center"> -->
<!-- 				<div class="menu"> -->
<!-- 					<a href="">更多链接</a> <i class="arrow"></i> -->
<!-- 				</div> -->
<!-- 				<div class="menu-bd"> -->
<!-- 					<ul> -->
<!-- 						<li><a href="">商家入驻</a></li> -->
<!-- 						<li><a href="">商家帮助</a></li> -->
<!-- 					</ul> -->
<!-- 				</div> -->
<!-- 			</li> -->
		</ul>

	</div>
</div>
<div class="head">
	<div class="logo fl">
		<a href="home.do"><img src="../images/logo.png"></a>
	</div>
</div>
<div class="dtw">
	<div class="dtww clear">
		<div class="dt fl" style="background-color: white;">
			<a href="javascript:void(0)"
				style="color: #000; background-color: white; font-weight: bold;">全部商品分类</a>
		</div>
		<ul class="navbar fl">
			<li><a href="${ctx}/SteelPlate/home.do">首页</a></li>
		</ul>
	</div>
</div>

<div class="nav clear" style="margin-top: 10px;">
	<div id="tupian">


		<!-- 请置于所有广告位代码之前 -->




		<div class="mainbody" style="margin: 10px auto; margin-bottom: 0;">


			<!-- 点击搜索按钮显示body2 隐藏body1 -->
			<script type="text/javascript">
// 				$(function() {
// 					$('#click_event').click(function() {
// 						if ($('#body1').is(':hidden')) {
// 							$('#body1').show();
// 							$('#body2').hide();
// 						} 
// 					})
// 				})
			</script>

<style>
.mainbody {
	margin: 0 auto !important;
	background: #fff;
}

#you span, #you a {
	float: left;
	margin-top: 8px;
}

#you span {
	line-height: inherit;
}
</style>

			<!-- 搜索框 -->
			<div id="gdwzdiv">
<!-- 				<form id="idForm" -->
<%-- 					action="${ctx}/SteelPlate/getCategoryInfo.do" --%>
<!-- 					method="post"> -->
					<table class="xht_ss">
						<tr>
							<td>
								<table>
									<tr>
										<td class="td_01" style="padding-top: 5px;">种&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;类:</td>
										<td class="td_02">
											<!-- 	<div id="list-name-first" class="list-name-input">
												<select class="list-select" id="area" name="zhongelei">
												</select> 
												<input type="text"
													class="name item-width list-name-for-select" id="first" placeholder="--请输入汉字--">
											</div> -->

											<div class="sx">
												<em class="dsia zl"><font> <input
														class="inp_text" name="zhonglei" autocomplete="off"
														type="text" readonly="true" id="select_category">
												</font><i></i></em> <span class="span_ul span_ul2"
													style="height: 300px; width: 198px; overflow-y: scroll;"
													id="catcz"> </span>

											</div>




										</td>
										<td class="td_01">品&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名:</td>
										<td class="td_02">
											<!-- 	<div id="list-name-second" class="list-name-input">
												<select class="list-select" id="cmbProvince" name="pinming">
												</select> <input type="text"
													class="name item-width list-name-for-select" id="second">
											</div> -->




											<div class="sx">
												<em class="dsia pinming"><font> <input
														class="inp_text inp_text1" name="pinming"
														autocomplete="off" placeholder="简拼/全拼/汉字" type="text"
														readonly="true" id="select_commodity">
												</font><i></i></em>
												<ul class="span_ul ul2 catzl"
													style="width: 198px; display: none;" id="catzl"></ul>
												<div class="span_ul tips_ul" style="display: none;"></div>
											</div>
										</td>
										<td class="td_01">
											材&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;质:</td>
										<td class="td_02">
											<!-- <div id="list-name-third" class="list-name-input">
												<select class="list-select" id="cmbCity" name="caizhi">
												</select> <input type="text"
													class="name item-width list-name-for-select" id="third">
											</div> -->

											<div class="sx">
												<em class="dsiaa caizhi"><font> <input
														class="inp_text" name="caizhi" autocomplete="off"
														type="text" readonly="true" id="select_material">
												</font><i></i></em> <span class="span_ul span_ul2 catcz"
													style="width: 130px; min-height: auto; overflow-y: scroll;"
													id="span_ul2"></span>

											</div>





										</td>
										<td class="td_01">
											规&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;格:</td>
										<td class="td_02">
											<!-- 		<div id="list-name-forth" class="list-name-input">
												<select class="list-select" id="cmbArea" name="high">
												</select>
                                           <input type="text"class="name item-width list-name-for-select" id="forth">
											</div> -->

											<div class="sx">
												<em class="dsiaa guige"><font> <input
														class="inp_text" name="guige" autocomplete="off"
														type="text" readonly="true" id="select_parameter">
												</font><i></i></em> <span class="span_ul span_ul2 catgg"
													style="width: 130px; display: none; overflow-y: scroll;"
													id="catgg"></span>
											</div>

										</td>
									</tr>
								</table>


								<table>
									<tr>
										<td>宽&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;度:</td>
										<td>
											<div class="list-name-input">
												<select class="list-select" id="staWeidth"
													onchange="lastChange()" name="staWeidth">
													<option value="0"></option>
													<option>1000</option>
													<option>1250</option>
													<option>1500</option>
													<option>1800</option>
													<option>1900</option>
													<option>2000</option>
													<option>2100</option>
													<option>2200</option>
													<option>2300</option>
													<option>2400</option>
													<option>2500</option>
													<option>2600</option>
													<option>2700</option>
													<option>2800</option>
													<option>2900</option>
													<option>3000</option>
												</select> <input type="text" id="staWeidth1"
													class="name item-width list-name-for-select"
													placeholder="--请输入数字--">
											</div>
										</td>
										<td>--</td>

										<td>
											<div class="list-name-input">
												<select class="list-select" id="endWeidth"
													onchange="lastChange()" name="endWeidth">
													<option value="0"></option>
													<option>1000</option>
													<option>1250</option>
													<option>1500</option>
													<option>1800</option>
													<option>1900</option>
													<option>2000</option>
													<option>2100</option>
													<option>2200</option>
													<option>2300</option>
													<option>2400</option>
													<option>2500</option>
													<option>2600</option>
													<option>2700</option>
													<option>2800</option>
													<option>2900</option>
													<option>3000</option>
												</select> <input type="text" id="endWeidth1"
													class="name item-width list-name-for-select">
											</div>
										</td>
										<td>
											&nbsp;&nbsp;&nbsp;长&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;度:
										</td>
										<td>
											<div class="list-name-input">
												<select class="list-select" id="staSize"
													onchange="lastChange()" name="staSize">
													<option value="0"></option>
													<option>6000</option>
													<option>6500</option>
													<option>7000</option>
													<option>7500</option>
													<option>8000</option>
													<option>8500</option>
													<option>9000</option>
													<option>9500</option>
													<option>10000</option>
													<option>10500</option>
													<option>11000</option>
													<option>11500</option>
													<option>12000</option>
													<option>12500</option>
												</select> <input type="text" id="staSize1"
													class="name item-width list-name-for-select">
											</div>
										</td>
										<td>--</td>

										<td>
											<div class="list-name-input">
												<select class="list-select" id="last"
													onchange="lastChange()" name="endSize">
													<option value="0"></option>
													<option>6000</option>
													<option>6500</option>
													<option>7000</option>
													<option>7500</option>
													<option>8000</option>
													<option>8500</option>
													<option>9000</option>
													<option>9500</option>
													<option>10000</option>
													<option>10500</option>
													<option>11000</option>
													<option>11500</option>
													<option>12000</option>
													<option>12500</option>
												</select> <input type="text" id="lastInput"
													class="name item-width list-name-for-select">
											</div>
										</td>
									</tr>
								</table> <!--  <inputclass="querycss1" style="width: 93px;" id="staWeidth" name="staWeidth" type="text" /> -
    
    
     <input class="querycss" style="width: 93px;" id="endWeidth" name="endWeidth" type="text"/>
     
     
     
     
								&nbsp;&nbsp;&nbsp;长&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;度:<input
								class="querycss1" style="width: 93px;" id="staSize"
								name="staSize" type="text" /> - <input class="querycss"
								style="width: 93px;" id="endSize" name="endSize" type="text" />
								&nbsp;&nbsp;&nbsp;价&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;格:<input
								class="querycss1" style="width: 93px;" id="staJiage"
								name="staJiage" type="text" /> - <input class="querycss"
								style="width: 93px;" id="endJiage" name="endJiage" type="text" />
								&nbsp;&nbsp;&nbsp;&nbsp;发布单位:<input class="querycss1"
								style="width: 206px;" id="guapaishangjia" name="guapaishangjia"
								type="text" /> -->
							</td>
						</tr>
						<tr>
							<td>
<!-- 								<table> -->
<!-- 									<tr> -->
<!-- 										<td>发布单位:</td> -->
<!-- 										<td><input class="querycss1" style="width: 206px;" -->
<!-- 											id="guapaishangjia" name="guapaishangjia" type="text" /></td> -->
<!-- 										<td>厂&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;家:</td> -->
<!-- 										<td> -->
<!-- 											<div class="list-name-input"> -->
<!-- 												<select class="list-select" id="changjia" -->
<!-- 													onchange="lastChange()" name="changjia"> -->
<!-- 													<option></option> -->
<!-- 													<option>宝钢不锈钢</option> -->
<!-- 													<option>南钢</option> -->
<!-- 													<option>沙钢</option> -->
<!-- 													<option>永钢</option> -->
<!-- 													<option>淮钢</option> -->
<!-- 													<option>杭钢</option> -->
<!-- 													<option>马钢</option> -->
<!-- 													<option>济钢</option> -->
<!-- 													<option>莱钢</option> -->
<!-- 													<option>青钢</option> -->
<!-- 													<option>日照</option> -->
<!-- 													<option>福建三钢</option> -->
<!-- 													<option>新钢</option> -->
<!-- 													<option>萍钢</option> -->
<!-- 													<option>山东鲁丽</option> -->
<!-- 													<option>青山控股</option> -->
<!-- 													<option>久立</option> -->
<!-- 													<option>宝钢特殊钢</option> -->
<!-- 													<option>兴澄</option> -->
<!-- 													<option>兆顺</option> -->
<!-- 													<option>西城</option> -->
<!-- 													<option>宁波宝新</option> -->
<!-- 													<option>南昌</option> -->
<!-- 													<option>石横</option> -->
<!-- 													<option>春冶</option> -->
<!-- 													<option>飞达</option> -->
<!-- 													<option>长达</option> -->
<!-- 													<option>华伟</option> -->
<!-- 													<option>中天</option> -->
<!-- 													<option>福达</option> -->
<!-- 													<option>宁钢</option> -->
<!-- 													<option>山钢集团</option> -->
<!-- 													<option>首钢</option> -->
<!-- 													<option>唐钢</option> -->
<!-- 													<option>邯钢</option> -->
<!-- 													<option>包钢</option> -->
<!-- 													<option>宣钢</option> -->
<!-- 													<option>承钢</option> -->
<!-- 													<option>天钢</option> -->
<!-- 													<option>太钢</option> -->
<!-- 													<option>天铁</option> -->
<!-- 													<option>石钢</option> -->
<!-- 													<option>长钢</option> -->
<!-- 													<option>临钢</option> -->
<!-- 													<option>津西</option> -->
<!-- 													<option>河钢集团</option> -->
<!-- 													<option>邯郸永兴</option> -->
<!-- 													<option>邢钢</option> -->
<!-- 													<option>唐山建龙</option> -->
<!-- 													<option>德龙</option> -->
<!-- 													<option>文丰</option> -->
<!-- 													<option>纵横</option> -->
<!-- 													<option>普阳</option> -->
<!-- 													<option>海鑫</option> -->
<!-- 													<option>敬业</option> -->
<!-- 													<option>鞍钢</option> -->
<!-- 													<option>本钢</option> -->
<!-- 													<option>通钢</option> -->
<!-- 													<option>北台</option> -->
<!-- 													<option>凌钢</option> -->
<!-- 													<option>东北特钢</option> -->
<!-- 													<option>西钢</option> -->
<!-- 													<option>新抚钢</option> -->
<!-- 													<option>黑龙江建龙</option> -->
<!-- 													<option>营口</option> -->
<!-- 													<option>吉林建龙</option> -->
<!-- 													<option>武钢</option> -->
<!-- 													<option>鄂钢</option> -->
<!-- 													<option>柳钢</option> -->
<!-- 													<option>广钢</option> -->
<!-- 													<option>韶钢</option> -->
<!-- 													<option>安钢</option> -->
<!-- 													<option>济源</option> -->
<!-- 													<option>涟钢</option> -->
<!-- 													<option>湘钢</option> -->
<!-- 													<option>湖北新冶钢</option> -->
<!-- 													<option>珠钢</option> -->
<!-- 													<option>华美</option> -->
<!-- 													<option>信钢</option> -->
<!-- 													<option>衡阳钢管</option> -->
<!-- 													<option>广州联众</option> -->
<!-- 													<option>永通特钢</option> -->
<!-- 													<option>冷钢</option> -->
<!-- 													<option>汉冶</option> -->
<!-- 													<option>酒钢</option> -->
<!-- 													<option>八钢</option> -->
<!-- 													<option>龙钢</option> -->
<!-- 													<option>略钢</option> -->
<!-- 													<option>西宁特钢</option> -->
<!-- 													<option>汉中</option> -->
<!-- 													<option>宝鸡石油</option> -->
<!-- 													<option>攀钢</option> -->
<!-- 													<option>成钢</option> -->
<!-- 													<option>重钢</option> -->
<!-- 													<option>昆钢</option> -->
<!-- 													<option>威钢</option> -->
<!-- 													<option>达钢</option> -->
<!-- 													<option>水钢</option> -->
<!-- 													<option>德胜</option> -->
<!-- 													<option>长城特钢</option> -->
<!-- 													<option>贵钢</option> -->
<!-- 													<option>玉溪</option> -->
<!-- 													<option>西昌新钢业</option> -->
<!-- 													<option>舞钢</option> -->
<!-- 													<option>元宝山</option> -->
<!-- 													<option>中铁</option> -->
<!-- 													<option>邯宝</option> -->
<!-- 													<option>郑特钢</option> -->
<!-- 													<option>晋钢</option> -->
<!-- 													<option>宝钢</option> -->
<!-- 													<option>泰钢</option> -->
<!-- 													<option>梅钢</option> -->
<!-- 												</select> <input type="text" id="changjia1" -->
<!-- 													class="name item-width list-name-for-select"> -->
<!-- 											</div> -->
<!-- 										</td> -->
<!-- 										<td>&nbsp;&nbsp;库&nbsp;存&nbsp;地: -->
<!-- 											<div class="list-name-input input_fr"> -->
<!-- 												<select class="list-select" id="cunhuodi" -->
<!-- 													onchange="lastChange()" name="cunhuodi"> -->
<!-- 													<option></option> -->
<!-- 													<option>鞍山</option> -->
<!-- 													<option>安阳</option> -->
<!-- 													<option>宝鸡</option> -->
<!-- 													<option>包头</option> -->
<!-- 													<option>北京</option> -->
<!-- 													<option>本溪</option> -->
<!-- 													<option>博兴</option> -->
<!-- 													<option>沧州</option> -->
<!-- 													<option>长春</option> -->
<!-- 													<option>长沙</option> -->
<!-- 													<option>常州</option> -->
<!-- 													<option>成都</option> -->
<!-- 													<option>大连</option> -->
<!-- 													<option>大邱庄</option> -->
<!-- 													<option>大同</option> -->
<!-- 													<option>佛山</option> -->
<!-- 													<option>福州</option> -->
<!-- 													<option>广州</option> -->
<!-- 													<option>贵阳</option> -->
<!-- 													<option>哈尔滨</option> -->
<!-- 													<option>海口</option> -->
<!-- 													<option>邯郸</option> -->
<!-- 													<option>杭州</option> -->
<!-- 													<option>合肥</option> -->
<!-- 													<option>呼和浩特</option> -->
<!-- 													<option>江阴</option> -->
<!-- 													<option>嘉兴</option> -->
<!-- 													<option>嘉峪关</option> -->
<!-- 													<option>济南</option> -->
<!-- 													<option>金华</option> -->
<!-- 													<option>济宁</option> -->
<!-- 													<option>九江</option> -->
<!-- 													<option>昆明</option> -->
<!-- 													<option>莱芜</option> -->
<!-- 													<option>廊坊</option> -->
<!-- 													<option>兰州</option> -->
<!-- 													<option>乐从</option> -->
<!-- 													<option>连云港</option> -->
<!-- 													<option>聊城</option> -->
<!-- 													<option>临汾</option> -->
<!-- 													<option>临沂</option> -->
<!-- 													<option>柳州</option> -->
<!-- 													<option>娄底</option> -->
<!-- 													<option>洛阳</option> -->
<!-- 													<option>马鞍山</option> -->
<!-- 													<option>绵阳</option> -->
<!-- 													<option>南昌</option> -->
<!-- 													<option>南海</option> -->
<!-- 													<option>南京</option> -->
<!-- 													<option>南宁</option> -->
<!-- 													<option>南通</option> -->
<!-- 													<option>宁波</option> -->
<!-- 													<option>攀枝花</option> -->
<!-- 													<option>萍乡</option> -->
<!-- 													<option>青岛</option> -->
<!-- 													<option>秦皇岛</option> -->
<!-- 													<option>泉州</option> -->
<!-- 													<option>上海</option> -->
<!-- 													<option>汕头</option> -->
<!-- 													<option>深圳</option> -->
<!-- 													<option>胜芳</option> -->
<!-- 													<option>沈阳</option> -->
<!-- 													<option>石家庄</option> -->
<!-- 													<option>苏州</option> -->
<!-- 													<option>泰安</option> -->
<!-- 													<option>太原</option> -->
<!-- 													<option>台州</option> -->
<!-- 													<option>唐山</option> -->
<!-- 													<option>天津</option> -->
<!-- 													<option>天水</option> -->
<!-- 													<option>铜陵</option> -->
<!-- 													<option>潍坊</option> -->
<!-- 													<option>温州</option> -->
<!-- 													<option>舞钢</option> -->
<!-- 													<option>武汉</option> -->
<!-- 													<option>芜湖</option> -->
<!-- 													<option>乌鲁木齐</option> -->
<!-- 													<option>无锡</option> -->
<!-- 													<option>厦门</option> -->
<!-- 													<option>西安</option> -->
<!-- 													<option>邢台</option> -->
<!-- 													<option>西宁</option> -->
<!-- 													<option>新乡</option> -->
<!-- 													<option>新余</option> -->
<!-- 													<option>徐州</option> -->
<!-- 													<option>扬州</option> -->
<!-- 													<option>烟台</option> -->
<!-- 													<option>银川</option> -->
<!-- 													<option>湛江</option> -->
<!-- 													<option>郑州</option> -->
<!-- 													<option>镇江</option> -->
<!-- 													<option>重庆</option> -->
<!-- 													<option>株洲</option> -->
<!-- 													<option>淄博</option> -->
<!-- 												</select> <input type="text" id="cunhuodi1" -->
<!-- 													class="name item-width list-name-for-select"> -->
<!-- 											</div> -->
<!-- 										</td> -->
<!-- 								</table> -->
								<div class="anniu">
									<a href='javascript:void(0);' onclick="aSubmit()"
										class='className1' id="click_event">搜现货</a> <a
										href='javascript:void(0);' onClick="cleText()"
										class='className'>重置</a>
								</div>
							</td>
						</tr>
					</table>
<!-- 				</form> -->
			</div>
			<!--neirong-->
			<form action="">
				<div id="body1">
					<div class="one_1">
						<h2 style="font-weight: bold;">板材</h2>
						<div class="inconpro_n">
							<div class="inconpro_n1">
								<div class="inconpro_t1 inconpro_byd inconpro_byri"
									style="margin-top: 20px;">
									<!-- <a class="inconpro_da2" href="Category.jsp"> -->
									<a class="inconpro_da2"
										href="${ctx}/SteelPlate/queryByCategory.do?pinming=优碳钢板">
										<div class="inconpro_da2div">
											<div class="inconpro_timg1">
												<img src="../images/1-300.png" class="img" alt="" />
											</div>
											<p class="inconpro_p" name="pinming">优碳钢板</p>
										</div>
									</a>
								</div>
							</div>
							<div class="inconpro_n1dou">
								<div class="inconpro_t1 inconpro_byd inconpro_byrile"
									style="margin-top: 20px;">
									<a class="inconpro_da2"
										href="${ctx}/SteelPlate/queryByCategory.do?pinming=不锈钢板">
										<div class="inconpro_da2div">
											<div class="inconpro_timg1">
												<img src="../images/2-300.png" class="img" alt="" />
											</div>
											<p class="inconpro_p">不锈钢板</p>
										</div>
									</a>
								</div>
							</div>
							<div class="inconpro_n1dou" style="margin-left: 25px;">
								<div class="inconpro_t1 inconpro_byd inconpro_byrile"
									style="margin-top: 20px;">
									<a class="inconpro_da2" href="${ctx}/SteelPlate/queryByCategory.do?zhongelei=板材类&pinming=冲孔钢板">
										<div class="inconpro_da2div">
											<div class="inconpro_timg1">
												<img src="../images/3-300.png" class="img" alt="" />
											</div>
											<p class="inconpro_p">冲孔钢板</p>
										</div>
									</a>
								</div>
							</div>

						</div>
						<div class="inconpro_n">
							<div class="inconpro_n1" style="margin-top: 20px;">
								<div class="inconpro_t1 inconpro_byd inconpro_byri"
									style="margin-top: 0px;">
									<a class="inconpro_da2" href="${ctx}/SteelPlate/queryByCategory.do?pinming=铝板">
										<div class="inconpro_da2div">
											<div class="inconpro_timg1">
												<img src="../images/4-300.png" class="img" alt="" />
											</div>
											<p class="inconpro_p">铝板</p>
										</div>
									</a>
								</div>
							</div>
							<div class="inconpro_n1dou" style="padding-top: 20px;">
								<div class="inconpro_t1 inconpro_byd inconpro_byrile"
									style="margin-top: 0px;">
									<a class="inconpro_da2" href="${ctx}/SteelPlate/queryByCategory.do?pinming=花纹铝板">
										<div class="inconpro_da2div">
											<div class="inconpro_timg1">
												<img src="../images/5-300.png" class="img" alt="" />
											</div>
											<p class="inconpro_p">花纹铝板</p>
										</div>
									</a>
								</div>
							</div>
							<div class="inconpro_n1dou"
								style="margin-left: 25px; padding-top: 20px;">
								<div class="inconpro_t1 inconpro_byd inconpro_byrile"
									style="margin-top: 0px;">
									<a class="inconpro_da2" href="${ctx}/SteelPlate/queryByCategory.do?pinming=塑料板">
										<div class="inconpro_da2div">
											<div class="inconpro_timg1">
												<img src="../images/6-300.png" class="img" alt="" />
											</div>
											<p class="inconpro_p">塑料板</p>
										</div>
									</a>
								</div>
							</div>
						</div>
					</div>
					<div id="guige"
						style="width: 387px; height: 55px; border: 2px solid #dedede; clear: both; margin-left: 813px;">
						<a href="specifications.html"
							style="padding-left: 20px; line-height: 55px;">>> Request for
							special width & length</a>
					</div>
					<div class="two_2">
						<h2 style="font-weight: bold;">型材</h2>
						<div class="inconpro_n">
							<div class="inconpro_n1" style="margin-top: 20px;">
								<div class="inconpro_t1 inconpro_byd inconpro_byri"
									style="margin-top: 0px;">
									<a class="inconpro_da2" href="${ctx}/SteelPlate/queryByCategory.do?pinming=不锈钢管">
										<div class="inconpro_da2div">
											<div class="inconpro_timg1">
												<img src="../images/7-300.png" class="img" alt="" />
											</div>
											<p class="inconpro_p">不锈钢管</p>
										</div>
									</a>
								</div>
							</div>
							<div class="inconpro_n1dou" style="padding-top: 20px;">
								<div class="inconpro_t1 inconpro_byd inconpro_byrile"
									style="margin-top: 0px;">
									<a class="inconpro_da2" href="${ctx}/SteelPlate/queryByCategory.do?pinming=无缝管">
										<div class="inconpro_da2div">
											<div class="inconpro_timg1">
												<img src="../images/8-300.png" class="img" alt="" />
											</div>
											<p class="inconpro_p">碳钢圆管</p>
										</div>
									</a>
								</div>
							</div>
							<div class="inconpro_n1dou"
								style="margin-left: 25px; padding-top: 20px;">
								<div class="inconpro_t1 inconpro_byd inconpro_byrile"
									style="margin-top: 0px;">
									<a class="inconpro_da2" href="${ctx}/SteelPlate/queryByCategory.do?pinming=碳钢方管">
										<div class="inconpro_da2div">
											<div class="inconpro_timg1">
												<img src="../images/9-300.png" class="img" alt="" />
											</div>
											<p class="inconpro_p">碳钢方管</p>
										</div>
									</a>
								</div>
							</div>
						</div>
						<div class="inconpro_n">
							<div class="inconpro_n1" style="margin-top: 20px;">
								<div class="inconpro_t1 inconpro_byd inconpro_byri"
									style="margin-top: 0px;">
									<a class="inconpro_da2" href="${ctx}/SteelPlate/queryByCategory.do?pinming=挤塑型材">
										<div class="inconpro_da2div">
											<div class="inconpro_timg1">
												<img src="../images/10-300.png" class="img" alt="" />
											</div>
											<p class="inconpro_p">挤塑型材</p>
										</div>
									</a>
								</div>
							</div>
							<div class="inconpro_n1dou" style="padding-top: 20px;">
								<div class="inconpro_t1 inconpro_byd inconpro_byrile"
									style="margin-top: 0px;">
									<a class="inconpro_da2" href="${ctx}/SteelPlate/queryByCategory.do?pinming=碳钢型材">
										<div class="inconpro_da2div">
											<div class="inconpro_timg1">
												<img src="../images/11-300.png" class="img" alt="" />
											</div>
											<p class="inconpro_p">碳钢型材</p>
										</div>
									</a>
								</div>
							</div>
							<div class="inconpro_n1dou"
								style="margin-left: 25px; padding-top: 20px;">
								<div class="inconpro_t1 inconpro_byd inconpro_byrile"
									style="margin-top: 0px;">
									<a class="inconpro_da2" href="${ctx}/SteelPlate/queryByCategory.do?pinming=铝型材">
										<div class="inconpro_da2div">
											<div class="inconpro_timg1">
												<img src="../images/12-300.png" class="img" alt="" />
											</div>
											<p class="inconpro_p">铝型材</p>
										</div>
									</a>
								</div>
							</div>
						</div>
						<!--<div id="guige" style="width:1200px;height:90px;">
			<a href="specifications.html"><img src="../images/nav.png"></a>
		</div>!-->
					</div>
					<div id="guige2"
						style="width: 387px; height: 55px; border: 2px solid #dedede; clear: both; margin-left: 813px;">
						<a href="specifications.html"
							style="padding-left: 20px; line-height: 55px;">>> Request for
							special width & length</a>
					</div>
					<div class="_th3">
						<h2 style="font-weight: bold;">Related Custom Manufacturing
							Services:</h2>
						<div class="shebei_n">
							<div class="shebei_n1" style="margin-top: 20px;">
								<div class="shebei_t1" style="margin-top: 0px;">
									<a class="shebei_da2" href="#">
										<div class="shebei_da2div">
											<div class="shebei_timg1">
												<img src="../images/1-130.png" class="img" alt="" />
											</div>
											<p class="shebei_p">Roll Forming</p>
										</div>
									</a>
								</div>
							</div>
						</div>
						<div class="shebei_n1dou" style="margin-top: 20px;">
							<div class="shebei_t1" style="margin-top: 0px;">
								<a class="shebei_da2" href="#">
									<div class="shebei_da2div">
										<div class="shebei_timg1">
											<img src="../images/2-130.png" class="img" alt="" />
										</div>
										<p class="shebei_p">Laser Cutting</p>
									</div>
								</a>
							</div>
						</div>
						<div class="shebei_n1dou"
							style="margin-top: 20px; margin-left: 20px;">
							<div class="shebei_t1" style="margin-top: 0px;">
								<a class="shebei_da2" href="#">
									<div class="shebei_da2div">
										<div class="shebei_timg1">
											<img src="../images/3-130.png" class="img" alt="" />
										</div>
										<p class="shebei_p">Welding</p>
									</div>
								</a>
							</div>
						</div>
						<div class="shebei_n1dou"
							style="margin-top: 20px; margin-left: 20px;">
							<div class="shebei_t1" style="margin-top: 0px;">
								<a class="shebei_da2" href="#">
									<div class="shebei_da2div">
										<div class="shebei_timg1">
											<img src="../images/4-130.png" class="img" alt="" />
										</div>
										<p class="shebei_p">Press Break</p>
									</div>
								</a>
							</div>
						</div>
						<div class="shebei_n1dou"
							style="margin-top: 20px; margin-left: 20px;">
							<div class="shebei_t1" style="margin-top: 0px;">
								<a class="shebei_da2" href="#">
									<div class="shebei_da2div">
										<div class="shebei_timg1">
											<img src="../images/5-130.png" class="img" alt="" />
										</div>
										<p class="shebei_p">Stamping</p>
									</div>
								</a>
							</div>
						</div>
						<div class="shebei_n1dou"
							style="margin-top: 20px; margin-left: 20px;">
							<div class="shebei_t1" style="margin-top: 0px;">
								<a class="shebei_da2" href="#">
									<div class="shebei_da2div">
										<div class="shebei_timg1">
											<img src="../images/6-130.png" class="img" alt="" />
										</div>
										<p class="shebei_p">Deep Drawing</p>
									</div>
								</a>
							</div>
						</div>
					</div>
				</div>
			</form>

			<!-- 搜索结果 -->
			<div id="body2" style="display: none">
				<table class="altrowstable" id="alternatecolor"
					style="width: 100%; text-align: center; /* COLOR: #0076C8; */ BACKGROUND-COLOR: #F4FAFF; font-weight: bold">
                    <thead>
						<tr id="tr2" style="background-color: #F5F5F5;">
						    <td><font style="font-size: 15px;">产品id</font></td>
							<td><font style="font-size: 15px;">公司名称</font></td>
							<td><font style="font-size: 15px;">类别</font></td>
							<td><font style="font-size: 15px;">品名</font></td>
							<td><font style="font-size: 15px;">材质</font></td>
							<td><font style="font-size: 15px;">规格</font></td>
							<td><font style="font-size: 15px;">钢厂</font></td>
							<td><font style="font-size: 15px;">仓库</font></td>
							<td><font style="font-size: 15px;">重量(吨)</font></td>
							<td><font style="font-size: 15px;">单价 (元/吨)</font></td>
							<td><font style="font-size: 15px;">操作</font></td>
						</tr>
					</thead>
					<tbody id="categoryInfo_tbody">
					 <c:forEach var="obj" items="${list}" varStatus="i">
					    <tr>
					    <td style="width: 17%;">${obj.guapaishangjia}</td>
						<td style="width: 10%;">${obj.zhonglei}</td>
						<td style="width: 10%;">${obj.pinming}</td>
						<td style="width: 10%;">${obj.caizhi}</td>
						<td style="width: 10%;">${obj.guige}</td>
						<td style="width: 10%;">${obj.changjia}</td>
						<td style="width: 10%;">${obj.cunhuodi}</td>
						<td style="width: 10%;">${obj.zhongliang}</td>
						<td style="width: 10%;">${obj.jiage}</td>					
					   </tr>
					 </c:forEach>
					</tbody>
				</table>				
				<div class="fg-toolbar ui-toolbar ui-widget-header ui-corner-bl ui-corner-br ui-helper-clearfix">
					<div class="dataTables_filter" id="DataTables_Table_0_filter">
					</div>
					<div
						class="dataTables_paginate fg-buttonset ui-buttonset fg-buttonset-multi ui-buttonset-multi paging_full_numbers"
						id="DataTables_Table_0_paginate">
 
                    </div>
				</div>				
			</div>	
		</div>
	</div>
</div>

</body>
</html>