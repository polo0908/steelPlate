

function fnChangeMethod(f_methodc,f_price,f_date,c_id,c_namec){
	fnClose();
	$("#actual_ffreight").val(f_price);
	var mode_transport = $("#mode_transport").val();
	var sp = mode_transport.split("@");
	mode_transport = f_methodc+"@"+f_date+"@"+c_namec+"@"+f_price + "@" + sp[sp.length-1];
	$("#mode_transport").val(mode_transport);
	j = 0;
	changeFee = 1;
}
function fnClose(){
	$.dialog({id:'shipping_method'}).close();
}
function fnShippingMethod(weight){
	var actual_lwh = $("#actual_lwh").val();
	var currency = $("#currency").val();
	var country = $("#country").val();
	$.dialog({
		id:'shipping_method',
		width: '852px',
		height:'510px',
		fixed: true,
		max: false,
	    min: false,
		skin: 'discu',
	    lock: true,
	    title: 'Change Combine Shipping Method',
	    drag: false,
	    cache: false,
	    resize:false,
	    content: 'url:/cbtconsole/cbt/shipping-method.jsp?sum_v=' + (actual_lwh==""?0:actual_lwh) + '&sum_w=' + weight + '&max_w=${max_w}&currency='+currency+'&state=1&country='+country
	});
}
 
//提醒用户支付运费
function fnEmail_payfright(){
	var orderNo = $("#orderNo").val();
	var currency = $("#currency").html();
	var actual_ffreight = $("#actual_ffreight").val();//实际运费
	var pay_ffreight = $("#pay_price_tow").val();//支付运费金额
	var weight = $("#actual_weight_estimate").html();//原本重量
	var actual_weight = $("#actual_weight").html();//实际重量
	var arrive_time = $("#expect_arrive_time").val();//到货日期
	var transport_time = $("#transport_time").val();//国际运输时间
	if(transport_time == ""){
		alert("运输时间为空！");
		return;
	}
	if(arrive_time == ""){
		alert("预计到货时间为空！");
		return;
	}
	var remark = $("#remark").val();
	var price = $("#price").val();
	var copyEmail = $("#email").val();
	var userid=$("#userId").val();
	$.dialog({
			id:'login',
			width: '550px',
		    height: 465,
			fixed: true,
			max: false,
		    min: false,
			skin: 'discuz',
		    lock: true,
		    title: '提醒用户支付运费',
		    drag: false,
		    content: 'url:/cbtconsole/website/email_payfright.jsp?orderNo=' + orderNo + '&currency=' + currency + '&actual_ffreight=' + actual_ffreight + '&pay_price_tow=' + pay_price_tow +
		    + '&weight=' + weight + '&actual_weight=' + actual_weight + '&arrive_time=' + arrive_time + '&transport_time=' + transport_time +'&copyEmail=' + copyEmail+'&userid=' + userid 
		});
}

function fnChange(id,thi){
	if($(thi).prop("checked")){
		$(thi).parent().parent().css("background-color","#84FFFF");
	}else{
		$(thi).parent().parent().css("background-color","");
	}
}

function fnChangeAll(state){
	if(state == 0){
		$("#orderDetail input:checkbox").prop("checked", "checked");
		$("#orderDetail tr:gt(0)").css("background-color","#84FFFF");
	}else{
		$("#orderDetail input:checkbox").each(function () {  
            this.checked = !this.checked; 
            if(this.checked){
            	$(this).parent().parent().css("background-color","#84FFFF");
            }else{
            	$(this).parent().parent().css("background-color","");
            }
         });
	}
}

//确认到账
function fnConfirmnamebtn(){
	var userid = $("#userId").html();
	var orerNos = $("#orderNo").val();
	window.open('/cbtconsole/website/paymentConfirm.jsp?orderNo=' + orerNos + '&userid=' + userid,"windows","height=200,width=600,top=250,left=500,toolbar=no,menubar=no,scrollbars=no, resizable=no,location=no, status=no");
}

//重量失焦计算运输方式
//提示总重量
var changeFee = 0;
function fnChangeVolume(shipMethod){
	var volume_l = $("#volume_l").val();
	var volume_w = $("#volume_w").val();
	var volume_h = $("#volume_h").val();
	var actual_weight = $("#actual_weight").val();
	var sum_vv = $("#actual_lwh").val();
	if(volume_l != "" && volume_w != "" && volume_h != "" && actual_weight != ""){
		sum_vv = parseFloat(volume_l)*parseFloat(volume_h)*parseFloat(volume_w)/1000000;
		$("#actual_lwh").val(sum_vv.toFixed(5));
	}else{
		return;
	}
	if(shipMethod == "0"){
		return;
	}
	var weight = 0;
	var sum_ww = actual_weight;
	if(sum_ww == ""){
		return;
	}
	var currency = $("#currency").val();
	var countryId=document.getElementById("country").value;
	 $.post("/cbtconsole/feeServlet",
				{action:'getCost',className:'ZoneServlet',countryid:countryId,weight:sum_ww,volume:sum_vv==""?0:sum_vv,singleweightmax:0,currency:currency},
				function(res){
					$("#loading_ex").hide();
					$("#freight_tr1").show();
					var jsons = eval(res);
					var tab = $("#express_change tbody");
					var tab2 = $("#shopfeediv2 tbody");
					$("#shopfeediv2 tbody tr:gt(0)").remove();
					$("#express_change tbody tr:gt(0)").remove();
					changeFee = 2;
					var actual_ffreight = parseInt($("#actual_ffreight").val());
					for (var i = 0; i < jsons.length; i++) {
						var json = jsons[i];
						if(json.name == shipMethod){
							if(actual_ffreight <  parseInt(json.result)){
								actual_ffreight = json.result;
							}
							$("#actual_ffreight").val(actual_ffreight);
							changeFee = 1;
							break;
						}
					}
					if(changeFee == 2){
						alert("原来的运输方式不再可行，请切换其他运输方式");
						fnShippingMethod(sum_ww);
					}
		});
}

//订单拆分
function fnSplitOrder(orderno,email,paytime){
	var content = "";
	var tab = $("#orderDetail tr").length;
	var tab_yx = 0;
	var time_ = 0;
	var time = 0;
	var odids = "";var check_num = 0;
	for (var i = 1; i < tab; i++) {
		var cansonl = $("#user_cancel_"+(i-1)).html();//是否取消
		var od_time = $("#orderd_delivery_"+(i-1)).html();//交期时间
		var check = $("#orderDetail tr").eq(i).find("input:checkbox");
		if($(check).next().val() != 2){
			tab_yx ++;
		}
		if(!$(check).prop("checked")){
			odids += $(check).val()+"@";
			if($(check).next().val() != 2){
				check_num ++;
			}
			if(parseInt(od_time) > time_){
				time_ = parseInt(od_time);
			}
		}else{
			if(parseInt(od_time) > time){
				time = parseInt(od_time);
			}
		}
	}
	if(check_num == 0){
		alert("请选择先出货的商品");
		return;
	}
	if(check_num == tab_yx){
		alert("请选择后出货的商品");
		return;
	}
	$("#split_order_btn").hide();
	time = addDate(time,paytime);
	time_ = addDate(time_,paytime);
	//不取消
	content = '<div id="split_div">选中的为后出货的商品<br><input type="radio" checked="checked" onclick="fnRodio(1)" value="1" name="splitOrder" id="spilitOrder1"><label for="spilitOrder1">两次出货</label><input type="radio" onclick="fnRodio(0)" value="0" name="splitOrder" id="spilitOrder2"><label for="spilitOrder2">建议退款</label><br>';
	content += '出货时间-<br>先出货订单：<input name="transport_time" id="ch_date1" readonly="readonly" value="' + time_ + '" onfocus="WdatePicker()" /></div>';
	$.dialog({title: '确认拆分？',content:content,max: false,
	    min: false,lock: true,drag: false,fixed: true,ok: function(){ 
	    	var state = $("#split_div input[type=radio]:checked ").val();
	    	if(state == 1){
	    		time_ = $("#ch_date1").val();
	    	}else{
	    		time_ = $("#ch_date1").val();
	    	}
	    	  $.post("/cbtconsole/WebsiteServlet?action=orderSplit&className=OrderSplitServlet",
					{orderno:orderno,odids:odids,state:state},
					function(res){
						$("#split_order_btn").show();
						if(res == 0){
							 if(confirm("拆分失败，请登录")){
								 window.location.href="/cbtconsole/website/main_login.jsp";
							    }else{
							   }
						}
						else if(res == ""){
							alert("拆分失败,错误代码："+res);
						}else{
							if(confirm("拆分成功,是否发送邮件?")){
								window.open("/cbtconsole/WebsiteServlet?action=getOrderSplit&className=OrderSplitServlet&orderno="+orderno+"&ordernoNew="+res+"&time_="+time_+"&state="+state+"&email="+email,"windows","height=900,width=1100,top=200,left=500,toolbar=no,menubar=no,scrollbars=yes, resizable=no,location=no, status=no");
						 	}
							
					 }
				 	});    
	 },cancel:function(){}} );
}

function fnRodio(state){
	if(state == 0){
		$("#div_split_time").hide();
	}else{
		$("#div_split_time").show();
	}
}

//价格
function pricechange(orderNo,goodId,oldPrice,index){
	window.open("/cbtconsole/website/orderchange_price.jsp?orderNo="+orderNo+"&goodId="+goodId+"&oldPrice="+oldPrice+"&index="+index,"windows","height=200,width=400,top=500,left=500,toolbar=no,menubar=no,scrollbars=no, resizable=no,location=no, status=no");
}
//交期
var deliverychange=function(orderNo,goodid,oldDeliver,index){
	window.open("/cbtconsole/website/orderchange_delivery.jsp?orderNo="+orderNo+"&goodId="+goodid+"&oldDeliver="+oldDeliver+"&index="+index,"windows","height=200,width=400,top=500,left=500,toolbar=no,menubar=no,scrollbars=no, resizable=no,location=no, status=no");
};
//订量偏低
 function rationchange(orderNo,goodid,oldRation,index){
	window.open("/cbtconsole/website/orderchange_ration.jsp?orderNo="+orderNo+"&goodId="+goodid+"&oldRation="+oldRation+"&index="+index,"windows","height=200,width=400,top=500,left=500,toolbar=no,menubar=no,scrollbars=no, resizable=no,location=no, status=no");
};
//直接取消
var cancelchange=function(orderNo,goodid,index){
	window.open("/cbtconsole/website/orderchange_cancel.jsp?orderNo="+orderNo+"&goodId="+goodid+"&index="+index,"windows","height=200,width=400,top=500,left=500,toolbar=no,menubar=no,scrollbars=no, resizable=no,location=no, status=no");
};
//需要沟通
var communicatechange=function(orderNo,goodid){
	//获取聊天历史
	window.open("/cbtconsole/WebsiteServlet?action=getOrderCommunication&className=OrderwsServlet&orderNo="+orderNo+"&goodId="+goodid+"&changeType=5","windows","height=200,width=400,top=500,left=500,toolbar=no,menubar=no,scrollbars=no, resizable=no,location=no, status=no");
};

//打开订单备注内容
function openremark(){
	$("#openremark").val("隐藏内部沟通");
	$("#remarkdiv").css("display","");
	$("#openremark").attr("onclick","closeremark()");
}

//关闭订单备注内容
function closeremark(){
	$("#openremark").val("查看内部沟通");
	$("#remarkdiv").css("display","none");
	$("#openremark").attr("onclick","openremark()");
}

//显示备注
function showBz(orderNo){
	$.post("/cbtconsole/OrderRemarkServlet",
			{action:'get',orderid:orderNo},
			function(res){
				var json=eval(res);
				var str1='<table style="border-collapse:separate; border-spacing:5px;"><tr><td><input id="remarkbtn" type="button" value="添加备注内容(对内)" onclick="addremark(\'' + orderNo + '\')"></td><td rowspan="2">备注内容:</td><td rowspan="2"><textarea id="orderremark_" style="width:400px;height:50px;"></textarea></td><td id="success" style="color:red"></td><td></td></tr>'
					+'<tr><td></td><td></td><td></td></tr></table>';
				$("#remarkdiv").html(str1);
				$("#openremark").show();
				
				$("#idshouBz").remove();
				var remarkuser=new Array();
				var str='<div  class="ormamark">';
				for(var i=0;i<json.length;i++){
					str+='<div  align="left">备注人员：' + json[i][2] + ',时间：' + json[i][3] + ',内容：' + json[i][1] + '</div>';
				}
				$("#remarkdiv").html(str+str1+"</div>");
			});
}

function addremark(orderNo){
	var orderremark=$("#orderremark_").val();
	$.post("/cbtconsole/OrderRemarkServlet",
			{action:'add',orderid:orderNo,orderremark:orderremark},
			function(res){
				if(res==1){
					$("#success").html("Success!!!");
					window.location.href=location;
				}else{
					alert('Add Failed!!!');
				}
			});
}

//取消订单
function fnCloseOrder(orderno,userId,actualPay,currency,order_ac, email, confirmEmail){
	 var params = {  
    			"action":"closeOrder",
    			"className":"OrderwsServlet",
    			"orderNo":orderno,
    			"userId":userId,	
    			"actualPay":actualPay,
    			"currency":currency,
    			"order_ac":order_ac,
    			"email":email,
    			"confirmEmail":confirmEmail
    		};
	 $("#closeOrder").hide();
	$.ajax({
        url:'/cbtconsole/WebsiteServlet',  
        type:"post",
        data:params,  
        dataType:"json",  
        success:function(data)
                { 
      	  //alert(data.result+"==="+data);
      	  		if(data>0){
      	  			window.location.href=location;
   						alert("取消成功");
   						//zlw add start
   						//$("#purchaseId").attr("disabled","disabled");	
   						//zlw add end		

      	  		}else{
      	 		 $("#closeOrder").show();
      	  			alert("取消失败");
      	  		}
                }, 
        error:function(){alert("取消失败");}
    }  
);
}

//确认弹出框关闭方法
function fnPaymentConfirmClose(confirmtime,confirmname){
	location.reload();
}

function fnChangeProduct(orderNo){
	window.location.href = '/cbtconsole/customerServlet?action=findOrdersPurchaseInfo&className=OrdersPurchaseServlet&selled=2&orderNo=' + orderNo;
}

 function sendCutomers(orderNo,whichOne){
	$("#notifycustomer").attr("disabled","disabled");
	$("#msg").css("display","none");
	 var params = {
    			"orderNo":orderNo,
    			"action":"sendCutomers",
    			"className":"OrderwsServlet",
    			"whichOne":whichOne
    		};
       $.ajax({  
               url:'/cbtconsole/WebsiteServlet',  
               type:"post",  
               data:params,  
               dataType:"json",  
               success:function(data){ 
            	   $("#notifycustomer").removeAttr("disabled");
             	  		if(data.result>0){
    	   					$("#msg").css("display","inline");
             	  		}else{
             	  			alert("失败,请通知开发人员");
             	  		}
                       }, 
               error:function(data){
            	   		alert("失败,请通知开发人员");
            	   }
           }  
       );  
}
 
 function fnRend(url){
		window.open(decodeURIComponent(url));
	};
	
function addDate(n,paytime){
	var s, d, t, t2;
	var paytime = paytime.split(" ")[0];
    t = new Date(paytime).getTime();
    t2 = n * 1000 * 3600 * 24;  
    t+= t2;  
    d = new Date(t);  
    s = d.getUTCFullYear() + "-";  
    s += ("00"+(d.getUTCMonth()+1)).slice(-2) + "-";  
    s += ("00"+d.getUTCDate()).slice(-2);
    return s;
}

//打开订单详情地址
function openorderaddress(){
	$("#open").val("隐藏订单详情地址");
	$("#orderaddressdiv").css("display","");
	$("#open").attr("onclick","closeorderaddress()");
	$.post("/cbtconsole/feeServlet?action=getAllZone&className=ZoneServlet",
			 function(data){
		 		var json = eval(data);
		 		if(countryid==36){
		 			countryid=43;
		 		}
		 		for (var i = 0; i < json.length; i++) {	
		 			if(json[i].id==countryid){
		 				$('#ordercountry').append('<option value="'+json[i].id+'" selected="selected">'+json[i].country+'</option>');
		 			}else{
		 				$('#ordercountry').append('<option value="'+json[i].id+'">'+json[i].country+'</option>');
		 			}
		 		}
		}); 
}
//直接抵扣赠送运费操作
function refreight(){
	var unpaid_freight = $("#unpaid_freight").html();
	var refreight = $("#refreight").html();
	var re = 0;
	var f_unpaid_freight = parseFloat(unpaid_freight);
	var f_refreight = parseFloat(refreight);
	if(f_refreight>f_unpaid_freight){
		re = f_unpaid_freight;
	}else{
		re = f_refreight;
	}
	if(re<0.0001){
		return ;
	}
	$("#refreightResult").html("");
	var orderNo = $("#orderNo").val();
	var userId = $("#userId").html();
	var href = window.location;
	$.post("/cbtconsole/WebsiteServlet?action=freightDeduction&className=OrderwsServlet&refreight="+re+"&orderNo="+orderNo+"&userId="+userId,
			function(data){
		var i_data = parseInt(data);
		if(i_data>0){
			window.location.href=href;
		}else if(i_data===-1){
			$("#refreightResult").html("订单更改失败");
		}else if(i_data===-1){
			$("#refreightResult").html("用户赠送运费更改失败");
		}
		
	});
	
}



//问题解决了
function fnResolve(orderNo,goodId){
	 
       var params = {
    			"orderNo":orderNo,
    			"action":"upOrderChangeResolve",
    			"className":"OrderwsServlet",
    			"goodId":goodId,
    			"changeType":5
    		};
       $.ajax({  
                 url:'/cbtconsole/WebsiteServlet',
                 type:"post",  
                 data:params,  
                 dataType:"json",  
                 success:function(data)  
                         { 
               	  //alert(data.result+"==="+data);
               	  		if(data>0){
    	   						$("#msg2").css("display","inline");
    	   						var obj=setTimeout(null, 3000);
    	   						clearTimeout(obj);
    	   						parent.location.href = "WebsiteServlet?action=getOrderDetail&className=OrderwsServlet&orderNo="+orderNo+"&state=5&rand="+Math.random();
               	  		}else{
               	  			alert("保存失败");
               	  		}
                         }, 
                 error:function(){alert("保存失败");}
             }  
         );  
}

//关闭订单详情地址
function closeorderaddress(){
	$("#open").val("查看订单详情地址");
	$("#orderaddressdiv").css("display","none");
	$("#open").attr("onclick","openorderaddress()");
}
function OrderAddress(){
	document.getElementById("orderrecipients").disabled=false;
	document.getElementById("orderstreet").disabled=false;
	document.getElementById("orderstreet2").disabled=false;
	document.getElementById("ordercity").disabled=false;
	document.getElementById("orderstate").disabled=false;
	document.getElementById("ordercountry").disabled=false;
	document.getElementById("orderzipcode").disabled=false;
	document.getElementById("orderphone").disabled=false;
	document.getElementById("OrderAddress").value="更新订单地址";
	$("#OrderAddress").attr("onclick","updateOrderAddress()");
}
function updateOrderAddress(){
	var address=document.getElementById("orderstreet").value;
	var address2=document.getElementById("ordercity").value;
	var statename=document.getElementById("orderstate").value;
	var countryid=document.getElementById("ordercountry").value;
	var zipcode=document.getElementById("orderzipcode").value;
	var phonenumber=document.getElementById("orderphone").value;
	var recipients=document.getElementById("orderrecipients").value;
	var street=document.getElementById("orderstreet2").value;
	var orderNo=document.getElementById("orderNo").value;
	$.post("/cbtconsole/WebsiteServlet?action=updateOrderAddress&className=OrderwsServlet",
			{orderid:orderNo,address:address,address2:address2,statename:statename,countryid:countryid,zipcode:zipcode,phonenumber:phonenumber,recipients:recipients,street:street},
			 function(data){
				if(data==0){
					alert('更新失败');
				}else{
					alert('更新成功');
					window.location.href=location;
				}
		});
}
var countryid;
var getAddress = 0;
function fnGetAddress(){
	if(getAddress == 1)return;
	var orderNo=document.getElementById("orderNo").value;
	 $.post("/cbtconsole/WebsiteServlet?action=getIpnaddress&className=OrderwsServlet",{orderid:orderNo},
			 function(res){
		 		if(res !== null && res !== 'null' && res !== undefined){
		 			var json=eval(res);
		 			for(var i=0;i < json.length; i++){
		 				document.getElementById("residence_country").value=json[i].residence_country;
		 				document.getElementById("receiveremail").value=json[i].receiverEmail;
		 				document.getElementById("address_name").value=json[i].address_name;
		 				document.getElementById("address_country_code").value=json[i].address_country_code;
		 				document.getElementById("address_country").value=json[i].address_country;
		 				document.getElementById("address_city").value=json[i].address_city;
		 				document.getElementById("address_state").value=json[i].address_state;
		 				document.getElementById("address_status").value=json[i].address_status;
		 				document.getElementById("address_street").value=json[i].address_street;
		 			}
	 			}
		 		});
	 $.post("/cbtconsole/WebsiteServlet?action=getOrderAddress&className=OrderwsServlet",{orderid:orderNo},
			 function(data){
			 if(data !== null && data !== 'null' && data !== undefined){
		 		var json = eval(data);
		 		for (var i = 0; i < json.length; i++) {
		 			var orderaddress = json[i];
		 			document.getElementById("orderstreet").value=orderaddress.address;
		 			document.getElementById("ordercity").value=orderaddress.address2;
		 			document.getElementById("orderstate").value=orderaddress.statename;
		 			countryid=orderaddress.country;
		 			document.getElementById("orderzipcode").value=orderaddress.zip_code;
		 			document.getElementById("orderphone").value=orderaddress.phone_number;	
		 			if((orderaddress.recipients+'')=='null'){
		 				document.getElementById("orderrecipients").value='';
		 			}else{
		 				document.getElementById("orderrecipients").value=orderaddress.recipients;
		 			}
		 			document.getElementById("orderstreet2").value=orderaddress.street;
		 		}
			 }
		}); 
	 getAddress = 1;
}

function getAllBuyuser(){
	  var buysrt='';
	  var saler='';
	  $.post("/cbtconsole/ConfirmUserServlet",
				{},
				function(res){
					var json=eval(res);
					buysrt=buysrt+'<option value="0">全部</option>';
					saler=saler+'<option value="0">全部</option>';
					var buyuser = $("#buyuser_em").html();
					var saleruser = $("#saler_em").html();
					for (var i=0;i<json.length;i++){
						if(json[i].role=='2'|| json[i].role=='0'){
							buysrt +='<option value="'+json[i].id+'" '+(buyuser == json[i].confirmusername ? 'selected="selected"':'')+'>'+json[i].confirmusername+'</option>';
						}
						if (json[i].role == '0' || json[i].role == '1') {
							saler +='<option value="'+json[i].id+'"  '+(saleruser == json[i].confirmusername ? 'selected="selected"':'')+'>'+json[i].confirmusername+'</option>';
						}
					}
					$('#buyuser').html(buysrt);
					$('#saler').html(saler);
				});
}
function fninitbuy(){
	$("#td_buyuser").show();
	getAllBuyuser();
	fnGetAddress();
	if(document.getElementById("orderNo")){
		var orderNo = document.getElementById("orderNo").value; 
		$.post("${path}/WebsiteServlet",
				{action:'getInit',className:'OrderwsServlet',orderno:orderNo},
				function(res){
					$("#buyuser option[value='"+res+"']").attr('selected','selected'); 
				});
		showBz(orderNo);
	}
}
function fnchangebuy(){
	if(document.getElementById("orderNo")){
		var orderNo = document.getElementById("orderNo").value; 
		var options= document.getElementById("buyuser");
		var buyuser = options.options[options.options.selectedIndex].text;;
		var buyid = options.options[options.options.selectedIndex].value;
		$("#buy_but").attr("disabled","disabled");
		$.post("/cbtconsole/WebsiteServlet",
				{action:'getChangeBuy',className:'OrderwsServlet',orderno:orderNo,buyid:buyid,buyuser:buyuser},
				function(res){
					var reslt = res.split('=');
					var result = '';
					if(reslt.length>0){
						if(reslt[0]=='add'){
							if(reslt[1]=='0'){
								result = '分配失败';
							}else{
								result = '分配成功';
								$("#buyuser_em").html(buyuser);
								window.location.reload(true);
							}
						}else{
							if(reslt[1]=='0'){
								result = '更改失败';
							}else{
								result = '更改成功';
								$("#buyuser_em").html(buyuser);
								window.location.reload(true);
							}
						}
						$("#salerresult").html("");
					}
					document.getElementById("buyresult").innerHTML = result;
					$("#buy_but").removeAttr("disabled");
				});
	}
}
function fnShowForwarder(){
	  $("#tab_forwarder").toggle();
}
//改变销售负责人
function   addUser(uid,userName) {
	var id=$("#saler").find("option:selected").val();
	var stradmName_=$("#saler").find("option:selected").text();
	$("#saler_but").attr("disabled","disabled");
		$.post("/cbtconsole/UpdateAdminUserServlet", {
			adminid : id,
			userid : uid,
			admName:stradmName_,
			userName:userName
		}, function(res) {
			if (res == 1) {
				document.getElementById("salerresult").innerHTML = "更新成功";
				$("#saler_em").html(stradmName_);
				//whj
				window.location.reload(true);
			}
			else
				{
				document.getElementById("salerresult").innerHTML = "更新失败";
				}
			$("#buyuser_em").html("");
			$("#saler_but").removeAttr("disabled");
		});
	}