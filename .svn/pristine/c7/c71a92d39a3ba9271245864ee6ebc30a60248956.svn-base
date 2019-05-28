

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
function fnPayFright(){
	$.dialog({
		id:'email_payfright',
		width: '852px',
		height:'510px',
		fixed: true,
		max: false,
	    min: false,
		skin: 'discu',
	    lock: true,
	    title: '提醒用户支付运费',
	    drag: false,
	    cache: false,
	    resize:false,
	    content: 'url:/cbtconsole/cbt/email_payfright.jsp?sum_v=' + actual_lwh==""?0:actual_lwh + '&sum_w=' + weight + '&max_w=${max_w}&currency='+currency+'&state=1&country='+country
	});
}
//提醒用户支付运费
function fnEmail_payfright(){
	var orderNo = $("#orderNo").val();
	var currency = $("#currency").val();
	var actual_ffreight = $("#actual_ffreight").val();//实际运费
	var pay_ffreight = $("#pay_price_tow").val();//支付运费金额
	var weight = $("#actual_weight_estimate").val();//原本重量
	var actual_weight = $("#actual_weight").val();//实际重量
	var arrive_time = $("#date").val();//到货日期
	var transport_time = $("#transport_time").val();//国际运输时间
	if(transport_time == ""){
		alert("请输入运输时间！");
		return;
	}
	if(arrive_time == ""){
		alert("请输入预计到货时间！");
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