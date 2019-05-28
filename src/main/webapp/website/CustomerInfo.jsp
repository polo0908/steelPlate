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
<link href="${ctx}/css/index-5.css" rel="stylesheet">
<link rel="stylesheet" href="${ctx}/css/easydialog.css" />
<script src="${ctx}/js/jquery.js" type="text/javascript"></script>
<script type="text/javascript" src="${ctx}/js/jquery-1.10.2-min.js"></script>
<script type=text/javascript src="${ctx}/js/newbase.js"></script>
 <script type="text/javascript" src="${ctx}/js/easydialog.js"></script>
 <script type="text/javascript" src="${ctx}/js/easydialog.min.js"></script> 
 <script type="text/javascript" src="${ctx}/js/jquery-form.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("input[id='RadioGroup1']").click(function(){
			sbox(this,"div1");
		})
		$("input[id='RadioGroup2']").click(function(){
			sbox(this,"div2");
// 			alert($('#radio_group2').val());
		})
	})
		function sbox(obj,id){
			if($(obj).val()=="yes"){
				$("#"+id).show();
				if(id == "div1"){
				$('#radio_group1').val("yes");	
				}
				if(id == "div2"){
				$('#radio_group2').val("yes");	
				}
			 }else{
					$("#"+id).hide();
					if(id == "div1"){
					$('#radio_group1').val("no");	
					}
					if(id == "div2"){
					$('#radio_group2').val("no");	
					}
				  }
			}
        function show()
        {
            var value = document.getElementById("div1").style.display;
            if(value=="none")
            {
                document.getElementById("div1").style.display="block";
            }
            else
                document.getElementById("div1").style.display="none";
        }

    </script>
<script type="text/javascript">
        function show2()
        {
            var value = document.getElementById("div2").style.display;
            if(value=="none")
            {
                document.getElementById("div2").style.display="block";
            }
            else
                document.getElementById("div2").style.display="none";
        }

    </script>

<script type="text/javascript">
    $(document).ready(function() {
    	//公司名字验证
    	$("#uCompany").focus(function() {
			$("#uCompany").css("background-color", "#FFFFCC");
		});
		$("#uCompany").blur(function() {
			/* alert("失去焦点公司名字验证！！"); */
// 			var regtitle = /^[a-zA-Z][a-zA-Z0-9_]*$/;
			var uname = $("#uCompany").val();
			$("#uCompany").css("background-color", "white");
			if (uname.length <= 0) {
				$("#uCompanyRight").hide();
				$("#uCompanyError").show();
			} else {
				$("#uCompanyRight").show();
				$("#uCompanyError").hide();
			}
		});
		//userphone验证
		$("#uPhoneNumber").focus(function() {
			$("#uPhoneNumber").css("background-color", "#FFFFCC");
		});
		$("#uPhoneNumber").blur(function() {
			
			var uphone = $("#uPhoneNumber").val();
			$("#uPhoneNumber").css("background-color", "white");
			if(uphone.length <= 0){
				$("#uPhoneNumberRight").hide();	
				$("#uPhoneNumberError").show();
			} else {
				$("#uPhoneNumberRight").show();
				$("#uPhoneNumberError").hide();
			} 
					
		});
		//city验证
		//userphone验证
		$("#city").focus(function() {	
			$("#city").css("background-color", "#FFFFCC");
		});
		$("#city").blur(function() {
			$("#cityRight").show();
		});
		//usereamil验证
		$("#uEmail").focus(function() {
			$("#uEmail").css("background-color", "#FFFFCC");
		});
		$("#uEmail").blur(function() {
			/* alert("邮箱验证！"); */
			var regemail = /^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/;
			var uemail = $("#uEmail").val();
			$("#uEmail").css("background-color", "white");
			if (uemail.length <= 0 || !regemail.test(uemail)) {
				$("#uEmailRight").hide();
				$("#uEmailError").show();
			} else {
				$("#uEmailRight").show();
				$("#uEmailError").hide();
			}
		});
	});
	function check(){
		if($(".isRight").css("display")!='none'){
			alert("提交的验证");
			if(confirm("确认提交吗？")){
				return true;
			}else{
				return false;
			}
		}else{
			return false;
		}
    }

   
 	//ajax保存客户订单
 	function save_order(steelPlateId){
 		console.log($("#b").val());
		$.ajax({
			url : "${ctx}/SteelPlate/saveOrder.do",
			method : "post",
			data : {
				"steelPlateId": steelPlateId,
				"sname" : $("#sname").val(),
				"scategory" : $("#scategory").val(),
				"smaterial" : $("#smaterial").val(),
				"width" : $("#width").val(),
				"length" : $("#length").val(),
				"high" : $("#high").val(),
				"weight" : $("#weight").val(),
				"smodel" : $("#smodel").val(),
				"sprice" : $("#b").val(),
				"uprice" : $("#a").val(),
				"PMethod" : $("#PMethod").val(),
				"uCompany" : $("#uCompany").val(),
				"uEmail" : $("#uEmail").val(),
				"uPhoneNumber" : $("#uPhoneNumber").val(),
				"city" : $("#city").val(),
				"incoTerm" : $("#incoTerm").val(),
				"confirm" : $("#radio_group1").val(),
				"confirmInfo" : $("#confirmInfo").val(),
				"custom" : $("#radio_group2").val(),
				"customInfo" : $("#customInfo").val(),
				"margin" : $("#c").val(),			
			},
			success : function(itemId) {	
				 window.location = "${ctx}/SteelPlate/queryByItemId.do?itemId="+itemId;
			},
			error : function(msg) {
				easyDialog.open({
		     		   container : {
		         		     header : '  Prompt message',
		         		     content : '  Save failed. Please try again !'
		     		   },
						  drag : false,
						  overlay : false,
						  autoClose : 4000
		     		 });   
			}

			
		})
		
		
	}
 
	
    </script>
<script type="text/javascript">
    $(document).ready(function() {
    	var a=document.all.a.value;
//     	alert(a);
        var b=document.all.b.value;
//         alert(b);
        var c=50+(b-a)*(0.1)*5;
        document.all.c.value=c.toFixed(2);
//         alert(c);
    }) 
    </script>
</head>
<body>
<!-- 	<form action="saveOrder.do" method="post" id="customer_order_form"> -->
		<div class="all_box">
			<div class="fanhui">
				<a href="${ctx}/SteelPlate/findById1.do?productId=${steelPlateId}" class="fanhui_a"> 返回</a>
			</div>

			<table>
				<tr>
					<td><input type="hidden" name="steelPlateId" id="steelPlateId" value="${steelPlateId}"></td>
					<td><input type="hidden" name="sname" id="sname" value="${sname}">
					</td>
					<td><input type="hidden" name="scategory" id="scategory" value="${scategory}">
					</td>
					<td><input type="hidden" name="smaterial" id="smaterial" value="${smaterial}">
					</td>
					<td><input type="hidden" name="width" id="width" value="${width}">
					</td>
					<td><input type="hidden" name="length" id="length" value="${length}">
					</td>
					<td><input type="hidden" name="high" id="high" value="${high}">
					</td>
					<td><input type="hidden" name="weight" id="weight" value="${weight}">
					</td>
					<td><input type="hidden" name="smodel" id="smodel" value="${smodel}">
					</td>
					<td><input type="hidden" name="sprice" id="b"
						value="${sprice}"></td>
					<td><input type="hidden" name="uprice" id="a"
						value="${uprice}"></td>
					<td><input type="hidden" name="PMethod" id="PMethod" value="${PMethod}">
					</td>
					<td><input type="hidden" name="margin" id="c"
						value="${margin }"></td>
					<td><input type="hidden"></td>
				</tr>
			</table>
			<div class="wenzimokuai">
				<h2 class="wenzi_h2">We need a bit more information from you</h2>
				<div class="dt_dd">
					<div class="kuang">
						<div class="name">Your Company Name:</div>
						<input type="text" onpaste="value=value.replace(/@/,'')" id="uCompany"
							name="uCompany" placeholder="&nbsp;&nbsp;Please enter the company name!"
							class="form-control" /> <img style="display: none;"
							id="uCompanyRight" src="../images/right.png" width="19"
							class="isRight" height="18"></img>
						<!-- <div id="uCompanyRight" width="46%" height="35" colspan="2" class="top_hui_text" style="display:none">
                    	<font color="red" size="-1">输入完成！</font>
                    </div> -->
						<div id="uCompanyError" width="46%" height="35" colspan="2"
							class="top_hui_text" style="display: none">
							<font color="red" size="-1">Company Name can not empty!</font>
						</div>
						<div class="bitian">*</div>

					</div>

					<div style="clear: both;"></div>
					<div class="kuang">
						<div class="name">Your Email Address:</div>
						<input type="text" name="uEmail" id="uEmail"
							placeholder="&nbsp;&nbsp;Please enter the email address" class="form-control" /> <img
							style="display: none;" id="uEmailRight" src="../images/right.png"
							width="19" class="isRight" height="18"></img>
						<!-- <div id="uEmailRight" width="46%" height="35" colspan="2" class="top_hui_text" style="display:none">
                    	<font color="red" size="-1">输入完成！</font>
                    </div> -->
						<div id="uEmailError" width="46%" height="35" colspan="2"
							class="top_hui_text" style="display: none">
							<font color="red" size="-1">E-mail format is incorrect!</font>
						</div>
						<div class="bitian">*</div>

					</div>
					<div class="kuang">
						<div class="name">Your Company Phone:</div>
						<input type="text"
							onpaste="value=value.replace(/@/,'')" id="uPhoneNumber"
							name="uPhoneNumber" placeholder="&nbsp;&nbsp;Please enter your phone!"
							class="form-control" /> <img style="display: none;"
							id="uPhoneNumberRight" src="../images/right.png" width="19"
							class="isRight" height="18"></img>

						<!-- <div id="uPhoneNumberRight" width="46%" height="35" colspan="2" class="top_hui_text" style="display:none">
                    	<font color="red" size="-1">输入完成！</font>
                    </div> -->
						<div id="uPhoneNumberError" width="46%" height="35" colspan="2"
							class="top_hui_text" style="display: none">
							<font color="red" size="-1">The phone format is incorrect!</font>
						</div>
						<div class="bitian">*</div>
					</div>

					<div style="clear: both;"></div>
					<div class="kuang">
						<div class="tishiwenzi">The current term is FOB Shanghai,
							but the supplier can deliver to your port as well.</div>
					</div>

					<div style="clear: both;"></div>
					<div class="kuang">
						<div class="name">What's your required inco term?</div>
						<!-- <input type="text" onKeyUp="value=value.replace(/[^a-zA-Z]/g,'')" name="incoTerm" placeholder="&nbsp;&nbsp;FOB or CIF or DDU" style="margin-left: 10px;"> -->
						<select class="form-control"
							style="padding: 6px 0px 6px 0px; margin-left: 10%; display: inline-block; float: left;"
							name="incoTerm" id="incoTerm">
							<option value="FOB">FOB</option>
							<option value="CIF">CIF</option>
							<option value="DDU">DDU</option>
						</select> <input type="text" onKeyUp="value=value.replace(/[^a-zA-Z]/g,'')"
							name="city" id="city" placeholder="&nbsp;&nbsp;shanghai"
							class="shanghai" style="margin-left: 10px;" /> <img
							style="display: none;" id="cityRight" src="../images/right.png"
							width="19" class="isRight" height="18"></img>
						<div class="bitian">*</div>
					</div>

					<div style="clear: both;"></div>
					<div class="kuang">
						<div class="tishiwenzi">Do you need us to send inspector to
							check product quality and quantity when loading?</div>
					</div>
					<div style="clear: both;"></div>
					<div class="kuang">
						<div class="login-put">
							<label class="label_1"><h5>Pay after getting
									pictures & video confirmation.</h5></label>
							<!-- <form id="form1" name="form1" method="post" action=""> -->
							<div id="form1">
								<p>
								<input type="hidden" name="smodel1" id="radio_group1">
								<input type="hidden" name="smodel2" id="radio_group2">
									<label> <input type="radio" id="RadioGroup1"
										name="confirm" value="yes" /> <span class="recommend">Yes($200
											Fee)</span></label> <label> <input type="radio" id="RadioGroup1"
										name="confirm" value="no" /> <span class="recommend">No</span></label>
									<br />
								</p>
								<!-- </form> -->
							</div>
							<!-- <div id="div1" style="display:none"><textarea  class="text01" onKeyUp="value=value.replace(/[^a-zA-Z]/g,'')" name="message" placeholder="请输入内容"></textarea></div> -->
							<div id="div1" style="display: none">
								<textarea class="text01" name="confirmInfo" id="confirmInfo" placeholder="请输入内容"></textarea>
							</div>
						</div>
					</div>
					<div style="clear: both;"></div>
					<div class="kuang">
						<div class="login-put">
							<label class="label_1"><h5>Do you have customzing
									needs?</h5></label>
							<!-- <form id="form2" name="form2" method="post" action=""> -->
							<div id="form2">
								<p>
									<label> <input type="radio" id="RadioGroup2"
										name="custom" id="s" value="yes" /> <span class="recommend">
											Yes</span></label> <label> <input type="radio" id="RadioGroup2"
										name="custom" value="no" /> <span class="recommend">No</span></label>
									<br />
								</p>
								<!--</form> -->
							</div>
							<div id="div2" style="display: none">
								<textarea class="text01" name="customInfo" id="customInfo" placeholder="请输入内容"></textarea>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!--    dibu-->
			<div style="clear: both;"></div>
			<div class="dibu">
				<img src="../images/bottom.jpg" />
				<!--<a href="palMent.do"> -->
				<input type="submit" class="div_button" value="Submit Offer" onclick="save_order('${steelPlateId}')">
				<!--</a> -->
			</div>
		</div>
		
<!-- 	</form> -->
</body>

</html>