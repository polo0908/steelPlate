<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>商城首页</title>
<meta name="description" content="">
<meta name="keywords" content="">
<link href="<%=request.getContextPath() %>/css/style.css"
	rel="stylesheet">
<link href="<%=request.getContextPath() %>/css/style-3.css"
	rel="stylesheet">

<script src="<%=request.getContextPath() %>/js/jquery.js"
	type="text/javascript"></script>
<script src="<%=request.getContextPath() %>/js/scripts.js"
	type="text/javascript"></script>
<style>
</style>
</head>
<div class="top">
	<div class="topnav clear">
		<div class="user-entry">
			您好，欢迎来到 <b><a href="">板材网</a></b>&nbsp;&nbsp; [<a href="">登录</a>]&nbsp;&nbsp;
			[<a href="">注册</a>]
		</div>
		<ul class="quick-menu">
			<li class="user-center">
				<div class="menu">
					<a href="">我的商城</a> <i class="arrow"></i>

				</div> <span class="hline"></span>
				<div class="menu-bd menu-bdp">
					<ul>
						<li><a href="">已买到的商品</a></li>
						<li><a href="">个人主页</a></li>
						<li><a href="">我的好友</a></li>
					</ul>
				</div>
			</li>
			<li class="user-center">
				<div class="menu">
					<a href="">卖家中心</a> <i class="arrow"></i> <span class="hline"></span>
				</div>
				<div class="menu-bd menu-bdp">
					<ul>
						<li><a href="">已售出的商品</a></li>
						<li><a href="">销售处的商品</a></li>
					</ul>
				</div>
			</li>
			<li class="user-center">
				<div class="menu">
					<a href="">我的订单</a> <span class="hline"></span>
				</div>
			</li>
			<li class="user-center">
				<div class="menu">
					<a href="">我的收藏</a> <i class="arrow"></i> <span class="hline"></span>
				</div>
				<div class="menu-bd">
					<ul>
						<li><a href="">收藏的商品</a></li>
						<li><a href="">收藏的店铺</a></li>
					</ul>
				</div>
			</li>
			<li class="user-center">
				<div class="menu">
					<a href="">站内消息</a> <span class="hline"></span>
				</div>
			</li>
			<li class="user-center">
				<div class="menu">
					<a href="">更多链接</a> <i class="arrow"></i>
				</div>
				<div class="menu-bd">
					<ul>
						<li><a href="">商家入驻</a></li>
						<li><a href="">商家帮助</a></li>
					</ul>
				</div>
			</li>
		</ul>

	</div>
</div>
<div class="head">
	<div class="logo fl">
		<a href="HomePage.jsp"><img src="../images/logo.png"></a>
	</div>

	<div class="cart fr">
		<div class="cartb">
			<i class="buyicon"></i> <a href="">我的购物车</a>
		</div>
	</div>
</div>
<div class="dtw">
	<div class="dtww clear">
		<div class="dt fl" style="background-color: white;">
			<a href="javascript:void(0)"
				style="color: #000; background-color: white; font-weight: bold;">全部商品分类</a>
		</div>
		<ul class="navbar fl">
			<li><a href="HomePage.jsp">首页</a></li>
			<li><a href="HomePage.jsp">首页</a></li>
			<li><a href="HomePage.jsp">首页</a></li>
			<li><a href="HomePage.jsp">首页</a></li>
		</ul>
	</div>
</div>
<div style="clear: both;"></div>
<div class="nav clear">
	<div class="left">
		<ul class="more li">
			<li>
				<ul class="ul1">
					<li class="li1"><a href="">板材</a></li>
					<li><a href="">碳钢板</a></li>
					<li><a href="">不锈钢板</a></li>
					<li><a href="">冲孔钢板</a></li>
					<li><a href="">铝板</a></li>
					<li><a href="">花纹铝板</a></li>
					<li><a href="">塑料板</a></li>
					<li><a href="">定制</a></li>
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

		<p class="xifenleibie">板材>碳钢板>...</p>

		<div class="big_box">
			<div class="small-left">
				<img src="../images/1-180.png" alt="" />
			</div>
			<div class="small-right">
				<h2>316不锈钢</h2>
				<table id="table">
					<thead>
						<tr>
							<th class="th1">Spec</th>
							<th class="th2">Market Price</th>
							<th>Change</th>


						</tr>
					</thead>
					<tbody>
						<tr>
							<td><a
								href="<%=request.getContextPath()%>/SteelPlate/steelPlateInfo.do">0.5mm
									厚</a></td>
							<td><a
								href="<%=request.getContextPath()%>/SteelPlate/steelPlateInfo.do">2000
									USD/ton</a></td>
							<td class="td3"><a
								href="<%=request.getContextPath()%>/SteelPlate/steelPlateInfo.do"><img
									src="../images/down.jpg" /> -0.5%</a></td>
							<td><a
								href="<%=request.getContextPath()%>/SteelPlate/steelPlateInfo.do"><marquee
										width=200 behavior=scroll direction=left align=middle>0
										offerings， 0.5x800x1000 @ 2100USD,0.5x800x1200 @ 1900USD</marquee></a></td>


							<td><a
								href="<%=request.getContextPath()%>/SteelPlate/steelPlateInfo.do"
								class="td_a4"> View</a></td>
						</tr>
						<tr>
							<td><a
								href="<%=request.getContextPath()%>/SteelPlate/steelPlateInfo.do">1mm
									厚</a></td>
							<td><a
								href="<%=request.getContextPath()%>/SteelPlate/steelPlateInfo.do">2000
									USD/ton</a></td>
							<td class="td3"><a
								href="<%=request.getContextPath()%>/SteelPlate/steelPlateInfo.do"><img
									src="../images/top.jpg" /> 0.5%</a></td>
							<td><a
								href="<%=request.getContextPath()%>/SteelPlate/steelPlateInfo.do">20个正着进行的拍卖</a></td>
							<td><a
								href="<%=request.getContextPath()%>/SteelPlate/steelPlateInfo.do"
								class="td_a4"> View</a></td>
						</tr>
						<tr>
							<td><a
								href="<%=request.getContextPath()%>/SteelPlate/steelPlateInfo.do">1mm
									厚</a></td>
							<td><a
								href="<%=request.getContextPath()%>/SteelPlate/steelPlateInfo.do">2000
									USD/ton</a></td>
							<td class="td3"><a
								href="<%=request.getContextPath()%>/SteelPlate/steelPlateInfo.do"><img
									src="../images/top.jpg" /> 0.5%</a></td>
							<td><a
								href="<%=request.getContextPath()%>/SteelPlate/steelPlateInfo.do">20个正着进行的拍卖</a></td>
							<td><a
								href="<%=request.getContextPath()%>/SteelPlate/steelPlateInfo.do"
								class="td_a4"> View</a></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>

		<div class="big_box">
			<div class="small-left">
				<img src="../images/2-180.png" alt="" />
			</div>
			<div class="small-right">
				<h2>316不锈钢</h2>
				<table id="table">
					<thead>
						<tr>
							<th>Spec</th>
							<th>Market Price</th>
							<th>Change</th>

						</tr>
					</thead>
					<tbody>
						<tr>
							<td><a
								href="<%=request.getContextPath()%>/SteelPlate/steelPlateInfo.do">0.5mm
									厚</a></td>
							<td><a
								href="<%=request.getContextPath()%>/SteelPlate/steelPlateInfo.do">2000
									USD/ton</a></td>
							<td><a
								href="<%=request.getContextPath()%>/SteelPlate/steelPlateInfo.do"><img
									src="../images/down.jpg" /> -0.5%</a></td>
							<td><a
								href="<%=request.getContextPath()%>/SteelPlate/steelPlateInfo.do"><marquee
										width=200 behavior=scroll direction=left align=middle>0
										offerings， 0.5x800x1000 @ 2100USD,0.5x800x1200 @ 1900USD</marquee></a></td>
							<td><a
								href="<%=request.getContextPath()%>/SteelPlate/steelPlateInfo.do"
								class="td_a4"> View</a></td>
						</tr>
						<tr>
							<td><a
								href="<%=request.getContextPath()%>/SteelPlate/steelPlateInfo.do">1mm
									厚</a></td>
							<td><a
								href="<%=request.getContextPath()%>/SteelPlate/steelPlateInfo.do">2000
									USD/ton</a></td>
							<td><a
								href="<%=request.getContextPath()%>/SteelPlate/steelPlateInfo.do"><img
									src="../images/top.jpg" /> 0.5%</a></td>
							<td><a
								href="<%=request.getContextPath()%>/SteelPlate/steelPlateInfo.do">20个正着进行的拍卖</a></td>
							<td><a
								href="<%=request.getContextPath()%>/SteelPlate/steelPlateInfo.do"
								class="td_a4"> View</a></td>
						</tr>
						<tr>
							<td><a
								href="<%=request.getContextPath()%>/SteelPlate/steelPlateInfo.do">1mm
									厚</a></td>
							<td><a
								href="<%=request.getContextPath()%>/SteelPlate/steelPlateInfo.do">2000
									USD/ton</a></td>
							<td><a
								href="<%=request.getContextPath()%>/SteelPlate/steelPlateInfo.do"><img
									src="../images/top.jpg" /> 0.5%</a></td>
							<td><a
								href="<%=request.getContextPath()%>/SteelPlate/steelPlateInfo.do">20个正着进行的拍卖</a></td>
							<td><a
								href="<%=request.getContextPath()%>/SteelPlate/steelPlateInfo.do"
								class="td_a4"> View</a></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>

		<div class="big_box">
			<div class="small-left">
				<img src="../images/3-180.png" alt="" />
			</div>
			<div class="small-right">
				<h2>316不锈钢</h2>
				<table id="table">
					<thead>
						<tr>
							<th>Spec</th>
							<th>Market Price</th>
							<th>Change</th>

						</tr>
					</thead>
					<tbody>
						<tr>
							<td><a
								href="<%=request.getContextPath()%>/SteelPlate/steelPlateInfo.do">0.5mm
									厚</a></td>
							<td><a
								href="<%=request.getContextPath()%>/SteelPlate/steelPlateInfo.do">2000
									USD/ton</a></td>
							<td><a
								href="<%=request.getContextPath()%>/SteelPlate/steelPlateInfo.do"><img
									src="../images/top.jpg" /> 0.5%</a></td>
							<td><a
								href="<%=request.getContextPath()%>/SteelPlate/steelPlateInfo.do"><marquee
										width=200 behavior=scroll direction=left align=middle>0
										offerings， 0.5x800x1000 @ 2100USD,0.5x800x1200 @ 1900USD</marquee></a></td>
							<td><a
								href="<%=request.getContextPath()%>/SteelPlate/steelPlateInfo.do"
								class="td_a4"> View</a></td>
						</tr>
						<tr>
							<td><a
								href="<%=request.getContextPath()%>/SteelPlate/steelPlateInfo.do">1mm
									厚</a></td>
							<td><a
								href="<%=request.getContextPath()%>/SteelPlate/steelPlateInfo.do">2000
									USD/ton</a></td>
							<td><a
								href="<%=request.getContextPath()%>/SteelPlate/steelPlateInfo.do"><img
									src="../images/top.jpg" /> 0.5%</a></td>
							<td><a
								href="<%=request.getContextPath()%>/SteelPlate/steelPlateInfo.do">20个正着进行的拍卖</a></td>
							<td><a
								href="<%=request.getContextPath()%>/SteelPlate/steelPlateInfo.do"
								class="td_a4"> View</a></td>
						</tr>
						<tr>
							<td><a
								href="<%=request.getContextPath()%>/SteelPlate/steelPlateInfo.do">1mm
									厚</a></td>
							<td><a
								href="<%=request.getContextPath()%>/SteelPlate/steelPlateInfo.do">2000
									USD/ton</a></td>
							<td><a
								href="<%=request.getContextPath()%>/SteelPlate/steelPlateInfo.do"><img
									src="../images/down.jpg" /> -0.5%</a></td>
							<td><a
								href="<%=request.getContextPath()%>/SteelPlate/steelPlateInfo.do">20个正着进行的拍卖</a></td>
							<td><a
								href="<%=request.getContextPath()%>/SteelPlate/steelPlateInfo.do"
								class="td_a4"> View</a></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<div class="big_box">
			<div class="small-left">
				<img src="../images/4-180.png" alt="" />
			</div>
			<div class="small-right">
				<h2>316不锈钢</h2>
				<table id="table">
					<thead>
						<tr>
							<th>Spec</th>
							<th>Market Price</th>
							<th>Change</th>

						</tr>
					</thead>
					<tbody>
						<tr>
							<td><a
								href="<%=request.getContextPath()%>/SteelPlate/steelPlateInfo.do">0.5mm
									厚</a></td>
							<td><a
								href="<%=request.getContextPath()%>/SteelPlate/steelPlateInfo.do">2000
									USD/ton</a></td>
							<td><a
								href="<%=request.getContextPath()%>/SteelPlate/steelPlateInfo.do"><img
									src="../images/down.jpg" /> -0.5%</a></td>
							<td><a
								href="<%=request.getContextPath()%>/SteelPlate/steelPlateInfo.do"><marquee
										width=200 behavior=scroll direction=left align=middle>0
										offerings， 0.5x800x1000 @ 2100USD,0.5x800x1200 @ 1900USD</marquee></a></td>
							<td><a
								href="<%=request.getContextPath()%>/SteelPlate/steelPlateInfo.do"
								class="td_a4"> View</a></td>
						</tr>
						<tr>
							<td><a
								href="<%=request.getContextPath()%>/SteelPlate/steelPlateInfo.do">1mm
									厚</a></td>
							<td><a
								href="<%=request.getContextPath()%>/SteelPlate/steelPlateInfo.do">2000
									USD/ton</a></td>
							<td><a
								href="<%=request.getContextPath()%>/SteelPlate/steelPlateInfo.do"><img
									src="../images/top.jpg" /> 0.5%</a></td>
							<td><a
								href="<%=request.getContextPath()%>/SteelPlate/steelPlateInfo.do">20个正着进行的拍卖</a></td>
							<td><a
								href="<%=request.getContextPath()%>/SteelPlate/steelPlateInfo.do"
								class="td_a4"> View</a></td>
						</tr>
						<tr>
							<td><a
								href="<%=request.getContextPath()%>/SteelPlate/steelPlateInfo.do">1mm
									厚</a></td>
							<td><a
								href="<%=request.getContextPath()%>/SteelPlate/steelPlateInfo.do">2000
									USD/ton</a></td>
							<td><a
								href="<%=request.getContextPath()%>/SteelPlate/steelPlateInfo.do"><img
									src="../images/top.jpg" /> 0.5%</a></td>
							<td><a
								href="<%=request.getContextPath()%>/SteelPlate/steelPlateInfo.do">20个正着进行的拍卖</a></td>
							<td><a
								href="<%=request.getContextPath()%>/SteelPlate/steelPlateInfo.do"
								class="td_a4"> View</a></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>









</body>
</html>