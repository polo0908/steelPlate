<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>商城首页</title>
<meta name="description" content="">
<meta name="keywords" content="">
<link href="${ctx}/css/style.css"
	rel="stylesheet">
<link href="${ctx}/css/style-3.css"
	rel="stylesheet">

<script src="${ctx}/js/jquery.js" type="text/javascript"></script>
<script src="${ctx}/js/scripts.js" type="text/javascript"></script>
<script type="text/javascript" src="${ctx}/js/jquery-1.10.2.js"></script>	
<script type="text/javascript">
$(function(){
	
	/**
	 * 板材类点击事件
	 */	 
	$('.ul1').find("li:first").attr('disabled',"true");
	$('.ul2').find("li:first").attr('disabled',"true");	
	 $('.li li').children("ul").children("li").click(function(){
		$(this).addClass("active"); 
    	var pinming = $(this).text();
    	if(pinming == "定制"){
    		return false;
    	}
    	$('#categoryInfo_tbody').empty();
    	$.ajax({
    		url : '${ctx}/SteelPlate/queryByCategory1.do',
			method : 'post',
			data : {
				"pinming" : pinming
			},
			success : function(result) { 
				
			   var path =  "${ctx}"+result.steelSortDetails.imageAddr;
			   var list = result.steelPlate;
			   $('.small-left').find("img").attr('src',path); 
			   var trs = '';
			   for(var i = 0;i<list.length;i++){
				   var tr = '<tr>'+
				   '<td style="width: 10%;">'+list[i].pinming+'</td>'+
				   '<td style="width: 10%;">'+list[i].caizhi+'</td>'+
				   '<td style="width: 10%;">'+list[i].guige+'</td>'+
				   '<td style="width: 10%;">'+list[i].zhongliang+'</td>'+
				   '<td style="width: 10%;">'+list[i].jiage+'</td>'+
				   '<td style="width: 10%;"><a href="${ctx}/SteelPlate/category.do">View</a></td>'+
				'</tr>';
				  trs +=tr;
			   }		 
			   $('#categoryInfo_tbody').append(trs);
			    
			},			
			error : function(msg) {
			}
    	})
    	
    	return false;
    })
    
    
})

</script>	
<style>
</style>
</head>
<div class="top">
	<div class="topnav clear">
		<div class="user-entry">
			您好，欢迎来到 <b><a href="">板材网</a></b>&nbsp;&nbsp; [<a href="">登录</a>]&nbsp;&nbsp;
			[<a href="">注册</a>]
		</div>
<!-- 		<ul class="quick-menu"> -->
<!-- 			<li class="user-center"> -->
<!-- 				<div class="menu"> -->
<!-- 					<a href="">我的商城</a> <i class="arrow"></i> -->

<!-- 				</div> <span class="hline"></span> -->
<!-- 				<div class="menu-bd menu-bdp"> -->
<!-- 					<ul> -->
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
<!-- 		</ul> -->

	</div>
</div>
<div class="head">
	<div class="logo fl">
		<a href="home.do"><img src="../images/logo.png"></a>
	</div>

<!-- 	<div class="cart fr"> -->
<!-- 		<div class="cartb"> -->
<!-- 			<i class="buyicon"></i> <a href="">我的购物车</a> -->
<!-- 		</div> -->
<!-- 	</div> -->
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
<div style="clear: both;"></div>
<div class="nav clear">
	<div class="left">
		<ul class="more li">
			<li>
				<ul class="ul1">
					<li class="li1"><a href="#">板材</a></li>
					<li><a href="#">优碳钢板</a></li>
					<li><a href="#">不锈钢板</a></li>
					<li><a href="#">冲孔钢板</a></li>
					<li><a href="#">铝板</a></li>
					<li><a href="#">花纹铝板</a></li>
					<li><a href="#">塑料板</a></li>
					<li><a href="#">定制</a></li>
				</ul>
			</li>
			<li>
				<ul class="ul2">
					<li class="li1"><a href="">型材</a></li>
					<li><a href="">不锈钢管</a></li>
					<li><a href="">碳钢方管</a></li>
					<li><a href="">碳钢方管</a></li>
					<li><a href="">挤塑型材</a></li>
					<li><a href="">碳钢型材</a></li>
					<li><a href="">铝型材</a></li>
					<li><a href="">定制</a></li>
				</ul>
			</li>

		</ul>

	</div>
	<hr width="1 " size="450 " color="#dedede "
		style="float: left; margin-left: 10px; margin-top: -10px;">

	<div class="right">

		<p class="xifenleibie">板材</p>

		<div class="big_box">
			<div class="small-left">
				<img src="../images/1-180.png" alt="" />
			</div>
			<div class="small-right">
				<!-- 数据块 -->
				<div>
					<div>

						<div>
							<table class="altrowstable" id="alternatecolor"
								style="width: 100%; text-align: center; /* COLOR: #0076C8; */ BACKGROUND-COLOR: #F4FAFF; font-weight: bold">
                               <thead>							
                                <tr style="background-color: #F5F5F5;">
									<!-- <td><font style="font-size : 15px;">公司名称</font></td> -->
									<!-- <td><font style="font-size : 15px;">类别</font></td> -->
									<td><font style="font-size: 15px;">品名</font></td>
									<td><font style="font-size: 15px;">材质</font></td>
									<td><font style="font-size: 15px;">规格</font></td>
									<!-- <td><font style="font-size : 15px;">钢厂</font></td> -->
									<!-- <td><font style="font-size : 15px;">仓库</font></td> -->
									<td><font style="font-size: 15px;">重量(吨)</font></td>
									<td><font style="font-size: 15px;">单价 (元/吨)</font></td>
									<td><font style="font-size: 15px;">操作</font></td>
								</tr>
								</thead>
								<tbody id="categoryInfo_tbody">
									<c:forEach items="${list}" var="list" varStatus="st">
										<tr>
											<td style="width: 10%;">${list.pinming }</td>
											<td style="width: 10%;">${list.caizhi }</td>
											<td style="width: 10%;">${list.guige }</td>
											<td style="width: 10%;">${list.zhongliang }</td>
											<td style="width: 10%;">${list.jiage }</td>
											<td style="width: 10%;"><a
												href="${ctx}/SteelPlate/category.do">View</a></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
</div>









</body>
</html>