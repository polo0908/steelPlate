<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html class="no-js" lang="">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>自定义产品</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="${ctx}/css/index-4.css" rel="stylesheet">
<script src="${ctx}/js/jquery.js" type="text/javascript"></script>
<script type=text/javascript src="${ctx}/js/newbase.js"></script>
<style>

/*弹框样式3*/
.cd-popup2 {
	position: fixed;
	left: 0;
	top: 0;
	height: 100%;
	width: 100%;
	background-color: rgba(0, 0, 0, 0.5);
	opacity: 0;
	visibility: hidden;
	-webkit-transition: opacity 0.3s 0s, visibility 0s 0.3s;
	-moz-transition: opacity 0.3s 0s, visibility 0s 0.3s;
	transition: opacity 0.3s 0s, visibility 0s 0.3s;
	z-index: 9999;
}

.cd-popup3 {
	position: fixed;
	left: 0;
	top: 0;
	height: 100%;
	width: 100%;
	background-color: rgba(0, 0, 0, 0.5);
	opacity: 0;
	visibility: hidden;
	-webkit-transition: opacity 0.3s 0s, visibility 0s 0.3s;
	-moz-transition: opacity 0.3s 0s, visibility 0s 0.3s;
	transition: opacity 0.3s 0s, visibility 0s 0.3s;
	z-index: 9999;
}

.is-visible3 {
	opacity: 1;
	visibility: visible;
	-webkit-transition: opacity 0.3s 0s, visibility 0s 0s;
	-moz-transition: opacity 0.3s 0s, visibility 0s 0s;
	transition: opacity 0.3s 0s, visibility 0s 0s;
}

.cd-popup-container3 {
	position: relative;
	width: 400px;
	margin: 250px auto;
	height: 250px;
	background: #FFF;
	border-radius: .4rem .4rem .4rem .4rem;
	text-align: center;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
	-webkit-transform: scale(0.8);
	-moz-transform: scale(0.8);
	-ms-transform: scale(0.8);
	-o-transform: scale(0.8);
	transform: scale(0.8);
	-webkit-backface-visibility: hidden;
	-webkit-transition-property: -webkit-transform;
	-moz-transition-property: -moz-transform;
	transition-property: transform;
	-webkit-transition-duration: 0.3s;
	-moz-transition-duration: 0.3s;
	-ms-transition-duration: 0.3s;
	-o-transition-duration: 0.3s;
	transition-duration: 0.3s;
}

.cd-popup-close {
	position: absolute;
	right: 10px;
	top: 10px;
	z-index: 10;
	width: auto;
	height: 1.25rem;
	display: block;
	font-size: 14px;
}

.is-visible3 .cd-popup-container3 {
	-webkit-transform: scale(1);
	-moz-transform: scale(1);
	-ms-transform: scale(1);
	-o-transform: scale(1);
	transform: scale(1);
}
</style>
<script type="text/javascript">
        function account()
        {
            var a=document.all.a.value;
            var b=document.all.b.value;
            var d=document.all.d.value;
            var w=document.all.w.value;
            var f=document.all.opinp.value;
            var e=document.all.e.value;
            var c=a*b*d*w*(0.000001); 
            var g=50+(e-f)*(0.1)*5;
            document.all.c.value=c.toFixed(2);
            document.all.g.value=g.toFixed(2); 
           /*  alert(g); */
        }
    </script>

<script language=javascript>
	$(document).ready(function(){
		$("#opinp").val($("#jiage").text());
		})
        function show(obj)
        {
            if($(obj).val()==6){
               $("#select_else").show();
            }else{
                $("#select_else").hide()
            }
           // document.getElementById("select_else").style.display=(obj.value==6)?"":"none"
        }
    </script>
<script type="text/javascript"
	src="http://apps.bdimg.com/libs/jquery/2.1.1/jquery.js"></script>
<script type="text/javascript">
       /*弹框JS内容*/
       jQuery(document).ready(function($){

           //打开窗口
           $('.cd-popup-trigger2').on('click', function(event){
               event.preventDefault();
               $('.cd-popup2').addClass('is-visible3');

           });
           
           $('.cd-popup-trigger3').on('click', function(event){
               event.preventDefault();
               $('.cd-popup3').addClass('is-visible3');
               $("#getsm").text($("#a").val());
               $(".cd-popup2").removeClass('is-visible3');
           });
           //关闭窗口
           $('.cd-popup3').on('click', function(event){
               if( $(event.target).is('.cd-popup-close') || $(event.target).is('.cd-popup3') ) {
                   event.preventDefault();
                   $(this).removeClass('is-visible3');
                   $(".in2").val($("#c").val());
                   
                   
               }
           });
           $('.cd-popup2').on('click', function(event){
               if( $(event.target).is('.cd-popup-close') || $(event.target).is('.cd-popup2') ) {
                   event.preventDefault();
                   $(this).removeClass('is-visible3');

               }
           });
           //ESC关闭
           $(document).keyup(function(event){
               if(event.which=='27'){
                   $('.cd-popup3').removeClass('is-visible3');
               }
           });
       });
   </script>
<script type="text/javascript">
   function submit(){
		document.getElementById("idForm").submit();
	}
   </script>

</head>


<body>
	<form action="${ctx}/SteelPlate/customerInfo.do" method="post" id="idForm">
				<div class="all_box">
					<div class="fanhui">
						<a href="${ctx}/SteelPlate/getCategoryInfoByPage1.do" class="fanhui_a">< 返回</a>
					</div>
					<div class="wenzimokuai">
						<h2 class="wenzi_h2">
							Current Term: <span id="jiage">${list.jiage}</span> RMB/Ton FOB
							Shanghai, Minimum Order: 10 Ton, 30% Down 70% Before Shipping
						</h2>
						<!-- <h2 class="wenzi_h2">Current Term: <span id="opri"></span>    USD/Ton FOB Shanghai, Minimum Order: 10 Ton, 30% Down 70% Before Shipping</h2> -->
						<div>
							<table>
								<tr>
									<td><input type="hidden" name="id" value="${list.id}">
									</td>
									<td><input type="hidden" name="guige"
										value="${list.guige }"></td>
									<td><input type="hidden" name="zhonglei"
										value="${list.zhonglei }"></td>
									<td><input type="hidden" name="pinming"
										value="${list.pinming }"></td>
									<td><input type="hidden" name="width" id="w"
										value="${list.width }"></td>
									<td><input type="hidden" name="jiage" id="e"
										value="${list.jiage }"></td>
									<td><input type="hidden" name="caizhi"
										value="${list.caizhi }"></td>
									<td><input type="hidden" name="length"
										value="${list.length }"></td>
								</tr>
							</table>
						</div>
						<div class="cd-popup3">
							<div class="cd-popup3_div">
								<img src="../images/false.jpg" class="cd-popup-close">
								<p class="p">
									<!-- 用户输入的长度，或者数量最少为一 限定一下 -->
									<span id="getsm"></span>&nbsp;&nbsp;Sq.Meter weighs<input
										id="c" type="text" class="p_c" placeholder="">Ton
								</p>
								<img src="../images/ok.jpg" alt="" class="cd-popup3">
							</div>
						</div>
						<div class="dt_dd">
							<div class="kuang">
								<div class="name">Your offer/Price:</div>
								<input type="text" name="uprice" placeholder="请输入您要出的价格"
									class="form-control" id="opinp" value="${list.jiage}" /> <input
									type="hidden" id="g" id="Margin" name="Margin">
								<div class="bitian">RMB/TON</div>
							</div>
							<div style="clear: both;"></div>
							<div class="kuang">
								<div class="name">Quanity:</div>
								<input type="text" name="weight" placeholder="${list.zhongliang}" class="in2" />

								<div class="bitian">TON</div>
								<a href="" class="lianjie cd-popup-trigger2">Calculator</a>
							</div>
							<div style="clear: both;"></div>
							<div class="kuang">
								<div class="name" name="price">Your offer/Price:</div>
								<from> <select class="form-control"
									style="padding: 6px 0px 6px 0px; display: inline-block; float: left;"
									onChange="show(this)" name="PMethod">
									<option selected>100% L/C at sight</option>
									<option>30% Down, 70% L/C at sight</option>
									<option>30% Down, 70% Before Shipping</option>
									<option>30% Down, 70% Against B/L</option>
									<option>50% Down, 50% Against B/L</option>
									<option>Others</option>
								</select> </textarea> </from>
							</div>
							<div style="clear: both;"></div>
							<div class="right">
								<img src="../images/1-180.png"/ >
							</div>
						</div>
					</div>
					<!--    dibu-->
					<div style="clear: both;"></div>
					<div class="dibu_di">
						<img src="../images/bottom.jpg" />
						<!-- <a href="customerInfo.do"> -->
						<input  class="div_button" value="Submit Offer" onclick="submit()">
						<!-- </a> -->
					</div>
				</div>
				<div class="cd-popup2">
					<div class="cd-popup2_div" onUnload="opener.location.reload()">
						<div class="neirong">
							<div class="left">
								<div class="xuanze">
									<img src="../images/false.jpg" class="cd-popup-close">
									<p class="one">
										Area:&nbsp <input id="a" type="text" onKeyUp="account()"
											class="one_input"> <span
											class="houmian"> Sq. Meter </span>
									</p>
									<p class="two">
										Thickness:&nbsp <input id="b" type="text" value="${list.high}"
											class="two_input" name="high">
										<!-- <input id="b" type="text"  class="two_input"> -->
										<span class="houmian">mm</span>
									</p>
									<p class="three">
										Density:&nbsp <input id="d" type="text" class="three_input"
											value="7.85"> <span class="houmian"> g/cm3</span>
									</p>
								</div>
							</div>

						</div>
						<div class="dibu">
							<img src="../images/dibu-400.png" alt="" class="dibu_img" /> <input
								type="image" src="../images/btn_11.jpg"
								class="cd-popup-trigger3"
								onMouseMove="this.src='../images/btn_12.jpg'"
								onMouseOut="this.src='../images/btn_11.jpg'"
								style="outline: 0; display: inline-block; float: right; position: absolute; right: 30px; top: 236px;" />
						</div>
					</div>
				</div>

	</form>
</body>

</html>