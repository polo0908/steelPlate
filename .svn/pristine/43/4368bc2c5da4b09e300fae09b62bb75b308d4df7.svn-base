<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>商城首页</title>
<meta name="description" content="">
<meta name="keywords" content="">
<link href="<%=request.getContextPath() %>/css/style.css"
	rel="stylesheet">
<link href="<%=request.getContextPath() %>/css/style-03.css"
	rel="stylesheet">

<script src="<%=request.getContextPath() %>/js/jquery.js"
	type="text/javascript"></script>
<script src="<%=request.getContextPath() %>/js/scripts.js"
	type="text/javascript"></script>
<script>
		function msgbox(n){
			document.getElementById('inputbox').style.display=n?'block':'none';     /* 点击按钮打开/关闭 对话框 */
		}
	</script>
<script>
		function bigbox(n){
			document.getElementById('inputbox2').style.display=n?'block':'none';     /* 点击按钮打开/关闭 对话框 */
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
			<i class="buyicon"></i> <a href="" style="margin-left: 30px;">我的购物车</a>
			<span class="shopping_num" id="car_numhd">0</span>
		</div>
	</div>
</div>
<div class="dtw">
	<div class="dtww clear">
		<div class="dt fl" style="background-color: white;">
			<a href="javascript:void(0)" class="dt_a">全部商品分类</a>
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
					<li><input type="button" onClick="msgbox(1)" class="dingzhi"
						value="定制"></li>
					<div id='inputbox' class="box">
						<a class='x' href='' ; onclick="msgbox(0); return false;"></a>
						<textarea class="form-control" name="message" placeholder=""></textarea>
					</div>
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
					<li><input type="button" onClick="bigbox(1)" class="dingzhi"
						value="定制"></li>
					<div id='inputbox2' class="box2">
						<a class='x' href='' ; onclick="bigbox(0); return false;">×</a>
						<textarea class="form-control" name="message" placeholder=""></textarea>
						<!--<input type="button" value="确定">-->

					</div>
				</ul>
			</li>

		</ul>

	</div>
	<hr width="1 " size="570 " color="#dedede "
		style="float: left; margin-left: 10px; margin-top: -10px;">

	<div class="right">

		<p class="xifenleibie">板材>碳钢板>...</p>

		<div class="big_box">
			<div class="small-left">
				<img src="../images/1-180.png" class="img_big" alt="" /> <img
					src="../images/icon1.png" alt="" class="img_label" title="人为确认" />
				<img src="../images/icon2.png" alt="" class="img_label" title="押金"
					style="margin-left: 35px;" />
			</div>
			<div class="small-right">
				<h2>316不锈钢</h2>
				<div class="yajin">

					<p style="float: left;" class="yaqian">押金：</p>
					<a href="<%=request.getContextPath() %>/SteelPlate/custom.do"><img
						src="../images/make.jpg" alt="" class="button" /></a>
				</div>
				<div class="guige">
					<div class="yiqian">
						<p class="mm">0.5 x 800 x 1000 mm</p>
					</div>
					<p class="zhiliang">质量: A+</p>
					<div class="usd">
						<p class="yiqianjiu">
							1900 USD/Ton<span class="span_sp1">Supplier Score: 3</span>
						</p>
					</div>
					<div class="dingliang">
						<p>
							最小订量：10 Ton<span class="span_sp2">Payment Term: 30%/70%</span>
						</p>
					</div>
				</div>
			</div>
		</div>
		<div class="big_box">
			<div class="small-left">
				<img src="../images/2-180.png" class="img_big" alt="" /> <img
					src="../images/icon1.png" alt="" class="img_label" /> <img
					src="../images/icon2.png" alt="" class="img_label"
					style="margin-left: 35px;" />
			</div>
			<div class="small-right">
				<h2>316不锈钢</h2>
				<div class="yajin">
					<p style="float: left;" class="yaqian">押金：</p>
					<a href="<%=request.getContextPath() %>/SteelPlate/custom.do"><img
						src="../images/make.jpg" alt="" class="button" /></a>
				</div>
				<div class="guige">
					<div class="yiqian">
						<p class="mm">0.5 x 800 x 1000 mm</p>
					</div>
					<p class="zhiliang">质量: A+</p>
					<div class="usd">
						<p class="yiqianjiu">
							1900 USD/Ton<span class="span_sp1">Supplier Score: 3</span>
						</p>
					</div>
					<div class="dingliang">
						<p>
							最小订量：10 Ton<span class="span_sp2">Payment Term: 30%/70%</span>
						</p>
					</div>
				</div>
			</div>
		</div>
		<div class="big_box">
			<div class="small-left">
				<img src="../images/3-180.png" class="img_big" alt="" /> <img
					src="../images/icon1.png" alt="" class="img_label" /> <img
					src="../images/icon2.png" alt="" class="img_label"
					style="margin-left: 35px;" />
			</div>
			<div class="small-right">
				<h2>316不锈钢</h2>
				<div class="yajin">

					<p style="float: left;" class="yaqian">押金：</p>
					<a href="<%=request.getContextPath() %>/SteelPlate/custom.do"><img
						src="../images/make.jpg" alt="" class="button" /></a>
				</div>
				<div class="guige">
					<div class="yiqian">
						<p class="mm">0.5 x 800 x 1000 mm</p>
					</div>
					<p class="zhiliang">质量: A+</p>
					<div class="usd">
						<p class="yiqianjiu">
							1900 USD/Ton<span class="span_sp1">Supplier Score: 3</span>
						</p>
					</div>
					<div class="dingliang">
						<p>
							最小订量：10 Ton<span class="span_sp2">Payment Term: 30%/70%</span>
						</p>
					</div>
				</div>
			</div>
		</div>
		<div class="big_box">
			<div class="small-left">
				<img src="../images/4-180.png" class="img_big" alt="" /> <img
					src="../images/icon1.png" alt="" class="img_label" /> <img
					src="../images/icon2.png" alt="" class="img_label"
					style="margin-left: 35px;" />
			</div>
			<div class="small-right">
				<h2>316不锈钢</h2>
				<div class="yajin">

					<p style="float: left;" class="yaqian">押金：</p>
					<a href="<%=request.getContextPath() %>/SteelPlate/custom.do"><img
						src="../images/make.jpg" alt="" class="button" /></a>
				</div>
				<div class="guige">
					<div class="yiqian">
						<p class="mm">0.5 x 800 x 1000 mm</p>
					</div>
					<p class="zhiliang">质量: A+</p>
					<div class="usd">
						<p class="yiqianjiu">
							1900 USD/Ton<span class="span_sp1">Supplier Score: 3</span>
						</p>
					</div>
					<div class="dingliang">
						<p>
							最小订量：10 Ton<span class="span_sp2">Payment Term: 30%/70%</span>
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>