function fnFreight_detail(id){
		$("#"+id1).hide();
		id1 = id;
	}
function fnShowChengeC(){
	document.getElementById("contry_a").className = "contry_a contry_a_active";
	$("#showContry").css("display","block");
}
$(function(){
	var api = frameElement.api, W = api.opener;
	parent.document.onclick = function(){
		try {
			if( typeof parent.fnClose === 'function'){
				parent.fnClose();
			}
		} catch (e) {
			// TODO: handle exception
		}
	}
})
var shipping_cost;
var express_type;
//运费中选择国家,刷新运费
var sum_w_ff = 0;
var sum_v_ff = 0;
function fnChangeCountry(val,id){
	if(id1 != ""){
		$("#"+id1).hide();
	}
	$("#chengeContry").html(val);
	$("#showContry").css("display","none"); 
	if(id == 38 || id == 40 || id == 41){
		$("#country_img").attr("src","/cbtconsole/img/country/39.jpg");
	 }else{
		$("#country_img").attr("src","/cbtconsole/img/country/"+id+".jpg");
	 }
	if(id == 29 || id == 37){
		sum_w_ff = 0;
		sum_v_ff = 0;
		$("#tab_car_ff tr:gt(0):even").each(
				function(i) {
					var emvw = $(this).find("td:eq(1)");
					var emv = emvw.find("em:eq(0)").html();
					var emw = emvw.find("em:eq(1)").html();
					if ((emw != null && emw !="") && emw !='Weight Unknown') {
						sum_w_ff = sum_w_ff + parseFloat(emw);
						sum_v_ff = sum_v_ff + parseFloat(emv);
					}
				});
		$("#sum_w2").html((parseFloat(sum_w)+sum_w_ff).toFixed(1)+"KG");
	}else{
		$("#sum_w2").html(parseFloat(sum_w).toFixed(1)+"KG");
	}
	document.getElementById("contry_a").className = "contry_a";
	country = id;
	fnGetFreight(country);
}

//快递类型窗口的OK按钮
function fnChange_express_type(){
	$("#countryid").val(country);
	var et = "";
	var chengeContry = $("#chengeContry").html();
	var days = "";
	$("#express_change tbody tr").each(function(i,item) {
		var checked = $(this).find("input:radio").is(":checked");
		if(checked){
			shipping_cost = $(this).find("td:eq(2) em").html();
			express_type = $(this).find("th input:radio").val();
			$("#shipping_cost").html(shipping_cost);
			/*$("#country_change").html(chengeContry);
			$("#country_change").attr("title","chengeContry");*/
			/*if(country == 38 || country == 40 || country == 41|| country == 39){
				$("#country_change_img").attr("src","/cbtconsole/img/country/39.jpg");
			}else{
				$("#country_change_img").attr("src","/cbtconsole/img/country/"+country+".jpg");
			}*/
			et = $(this).find("td:eq(0) em").html();
			days =  $(this).find("td:eq(1) em").html();
		}
	});
	var type = $("#param_type").val();
	if(type != null){
		parent.fnChangeMethod(et,shipping_cost,days,country,chengeContry,type);
	}else{
		parent.fnChangeMethod(et,shipping_cost,days,country,chengeContry);
	}
}

//获取运费
function fnGetFreight(countryId,state){
	$("#loading_ex").show();
	$("#freight_tr1").hide();
	var min = 0;
	var express = 0;
	var max_w = 0;//购物车中商品重量最大的
	var sum_ww = $("#sum_w").html();
	var sum_vv = $("#sum_v").val();
	var max_w = $("#max_w").val();//购物车中商品重量最大的
	var et = "";//从cookie中取出的运输方式
	if(sum_ww == 0){
		$("#shipping_cost").html(0);
		return;
	}
	var expressType = $("#expressType").val();
	if(countryId == 0){
		if(expressType != null && expressType != ""){
			et = expressType.split("@")[1];
			countryId = expressType.split("@")[0];
			$("#chengeContry").html($("#country_change").html());
		}else{
			$("#chengeContry").html("USA");
		}
	}
	var currency = $("#currency").val();
	country = countryId;
	if(state != 1){
		currency = "";
	}
	var ac = parseFloat($("#ac").html());
	 $.post("/cbtconsole/feeServlet",
			{action:'getCost',className:'ZoneServlet',countryid:countryId,weight:sum_ww,volume:sum_vv,singleweightmax:max_w,currency:currency},
			function(res){
				$("#loading_ex").hide();
				$("#freight_tr1").show();
				var jsons = eval(res);
				var tab = $("#express_change tbody");
				var tab2 = $("#shopfeediv2 tbody");
				$("#shopfeediv2 tbody tr:gt(0)").remove();
				$("#express_change tbody tr:gt(0)").remove();
			var top = 102;
			if(jsons.length == 0){$("#shopfeediv").hide();}
				for (var i = 0; i < jsons.length; i++) {
					var json = jsons[i];
					var result = json.result;
					var result1 = json.result1;
					if(min != 0){
						tab.find("tr:last").after(tab.find("tr").eq(0).clone());
						 if(et != "" && et == json.name){
							 min = result;
						 }
					}
					else if(min == 0){
						min = result;
					}
					
					tab.find("tr:last").find("th input").val(i).attr("onclick","fnRadio(this,"+result+")");
					tab.find("tr:last").find("th input").val(i).prop("checked", false);
					tab.find("tr:last").find("td:eq(2) em").html(result);
					//tab.find("tr:last").find("td:eq(0)").html(json.name).attr("onclick","fnExpressClick('freight_detail_"+json.id+"',"+top+")");
					tab.find("tr:last").find("td:eq(0)").html("<em>"+json.name +'</em><div ></div>') ;//添加details按钮--1023
					tab.find("tr:last").find("td:eq(0)").find("div").addClass("frede_add");//添加details按钮--1023
					tab.find("tr:last").find("td:eq(0)").find("div").attr("onclick","fnExpressClick('freight_detail_"+json.id+"',"+top+")");
					tab.find("tr:last").find("td:eq(1)").html("<em>" + json.days+"</em>&nbsp;Days");
					tab.find("tr:last").attr("id","freight_tr"+(i+1));
					tab.find("tr:last").attr('onclick','fcheck(this)');
					tab.find("tr:last").find("th input").val(i).attr("id","freight_tr"+(i+1)+"in");
					tab2.find("tr:last").after("<tr></tr>");
					tab2.find("tr:last").append("<td class='shopfeetd2'>&nbsp;&nbsp;&nbsp;"+currency+"<em>"+result1+"</em></td>");
						top = top + 41;
				}
				if(min == 0){
					tab.find("tr:last").css("display","none");
					shipping_cost = 0;
					tab.find("tr:last").hide();
					$("#ok_button").css("display","none");
					$("#ok_img").css("display","none");
				}else{
					tab.find("tr:last").show();
					$("#ok_button").css("display","block");
					$("#ok_img").css("display","block");
				}
				if(ac > 0 && ac <= min){
					min = min - ac;
				}else if(ac > min){
					min = 0;
				}
				tab.find("tr").eq(0).find("th input").prop("checked", true);
  				tab.find("tr").eq(0).find("td:eq(3)").css("color", "red");
				$("#credit").html(currency+""+min.toFixed(2));
	  	});
}
//点击运输方式显示对应备注信息
var id1 = "";
function fnExpressClick(id,top){
	if(id1 != ""){
		$("#"+id1).hide();
	}
	var ev = window.event || arguments.callee.caller.arguments[0]; 
	$("#"+id).show();
    ev.cancelBubble=true; 
	top = top+"px";
	$("#"+id).css("margin-top",top);
	id1 = id;
}
 $("#"+id1).onclick=function(ev)
 {
	 var ev = e || window.event || arguments.callee.caller.arguments[0]; 
     ev.cancelBubble=true;        
 };
 function fcheck(obj){
     document.getElementById(obj.id+'in').checked=true;
}
function fnRadio(val,price){
	var tab = $("#express_change tbody");
	tab.find("tr").find("td:eq(3)").css("color", "#5A5A5A");
	$(val).parent().parent().find("td:eq(3)").css("color", "red");
	var ac = parseFloat($("#ac").html());
	if(ac > 0 && ac <= price){
		price = price - ac;
	}else if(ac > price){
		price = 0;
	}
	var currency = $("#currency").val();
	var scac = $("#credit").html(currency+""+price.toFixed(2));
}
//获取国家
function fnGetContry(c_name,state){
	var showContry_ul = document.getElementById("showContry_ul");
	var res = '[{"id":"43","country":"USA", "zone":"6"}, {"id":"1","country":"ARGENTINA", "zone":"9"}, {"id":"2","country":"AUSTRALIA", "zone":"5"}, {"id":"3","country":"AUSTRIA", "zone":"7"}, {"id":"4","country":"BELGIUM", "zone":"7"}, {"id":"5","country":"BRAZIL", "zone":"9"}, {"id":"6","country":"CANADA", "zone":"6"}, {"id":"7","country":"CHILE", "zone":"9"}, {"id":"8","country":"CZECH", "zone":"7"}, {"id":"9","country":"DENMARK", "zone":"7"}, {"id":"10","country":"EGYPT", "zone":"8"}, {"id":"11","country":"FINLAND", "zone":"7"}, {"id":"12","country":"FRANCE", "zone":"7"}, {"id":"13","country":"GERMANY", "zone":"7"}, {"id":"14","country":"GREECE", "zone":"7"}, {"id":"15","country":"HUNGARY", "zone":"7"}, {"id":"16","country":"INDIA", "zone":"7"}, {"id":"17","country":"IRAQ", "zone":"8"}, {"id":"18","country":"IRELAND", "zone":"7"}, {"id":"19","country":"ISRAEL", "zone":"8"}, {"id":"20","country":"ITALY", "zone":"7"}, {"id":"21","country":"JAPAN", "zone":"3"}, {"id":"22","country":"MEXICO", "zone":"6"}, {"id":"23","country":"Holland", "zone":"7"}, {"id":"24","country":"NEW ZEALAND", "zone":"5"}, {"id":"25","country":"NORWAY", "zone":"7"}, {"id":"26","country":"POLAND", "zone":"7"}, {"id":"27","country":"PORTUGAL", "zone":"7"}, {"id":"28","country":"KSA (Saudi)", "zone":"8"}, {"id":"29","country":"S. AFRICA", "zone":"9"}, {"id":"30","country":"SPAIN", "zone":"7"}, {"id":"31","country":"SWEDEN", "zone":"7"}, {"id":"32","country":"SWITZERLAND", "zone":"7"}, {"id":"33","country":"TURKEY", "zone":"8"}, {"id":"34","country":"UAE", "zone":"8"}, {"id":"35","country":"UK", "zone":"7"}, {"id":"37","country":"AFRICA", "zone":"9"}, {"id":"38","country":"APAC", "zone":"5"}, {"id":"39","country":"EUROPE", "zone":"7"}, {"id":"40","country":"MID EAST", "zone":"8"}, {"id":"41","country":"S. AMERICA", "zone":"9"}]';
	var json=eval(res);
	var contry_ul = showContry_ul.innerHTML;
	var countryid = 36;
	for(var i=0;i<json.length;i++){
		var map=json[i];
		var text=map.country;
		var value=map.zone;
		var id=map.id;
		if(state != 1){
			showContry_ul.innerHTML += contry_ul;
			var li  = showContry_ul.getElementsByTagName("li")[i+1];
			li.setAttribute("onclick","fnChangeCountry('"+text+"',"+id+")");
			li.getElementsByTagName("span")[1].innerHTML = text;
			li.getElementsByTagName("span")[1].id = "contry_"+id;
			li.getElementsByTagName("input")[0].value = id;
			if(id == 38 || id == 40 || id == 41){
				li.getElementsByTagName("img")[0].src = "/cbtconsole/img/country/39.jpg";
			}else{
				li.getElementsByTagName("img")[0].src = "/cbtconsole/img/country/"+id+".jpg";
			}
		}
		if(text == c_name || id == c_name){
			document.getElementById("countryid").value = id;
			document.getElementById("chengeContry").innerHTML = text;
			/*document.getElementById("country_change").innerHTML = text;*/
			fnSetCountryImg(id,'country_img');
			countryid = id;
		}
	}
	if(state != 1){
		showContry_ul.removeChild(showContry_ul.getElementsByTagName("li")[0]);
	}
	fnGetFreight(countryid,state);
}
//点击编辑层的其他地方消失
$(document).click(function (e) {
	 var ev = e || window.event || arguments.callee.caller.arguments[0];  
	 var height1 =  $('#showContry').offset().top ;//775
	 var width1 =  $('#showContry').offset().left;//960  
	 var show_id = $(e.target).attr('id') ;
	if(show_id == "showContry" || show_id == "contry_a" || show_id == "chengeContry" || show_id == "country_img" || show_id == "black_arrow"){
		 $("#showContry").css("diplay","block");
	 	return;
	} 
	//offset()获得的是元素的左上角相对于整个网页的坐标    
	 if(height1 <= ev.pageY && ev.pageY <= (height1) && width1 <= ev.pageX  && ev.pageX <= (width1)){	 
		 $("#showContry").css("diplay","block");
	 }else{ 
		 $("#showContry").hide();
	 }
	if(id1 != ""){
		 $("#"+id1).hide();
	}
	 });
/*运费弹出框样式（重量双倍）*/
function shoefee(){
	document.getElementById('shopfeediv').style.display='none';
	document.getElementById('shopfeediv2').style.display='block';
}

function fnSaveEmail(){
	var tab = document.getElementById('express_change').getElementsByTagName("tbody")[0].getElementsByTagName("tr");
	for (var i = 0; i < tab.length; i++) {
		var checked = tab[i].getElementsByTagName("input")[0].checked;
		if(checked){
			j = i;
			shopping_price_ = tab[i].getElementsByTagName("td")[2].getElementsByTagName("em")[0].innerHTML;
			shopping_company_ = tab[i].getElementsByTagName("td")[0].innerHTML;
		}
	}
	weight_ = $("#sum_w").html();
	$.dialog({
		id:'ao',
		width: '800px', 	
	    height: 310,
		fixed: true,
		max: false,
	    min: false,
		skin: 'discuz',
	    lock: true,
	    title: '',
	    drag: false,
	    content: 'url:/cbtconsole/apa/postage_discounts.html'
	   /* close: function () {
	        show(1);
	    }*/
	});
}
function fnShowAC(){
	$.dialog.alert("Message",'We give each new customer a $50 credit.  It can only be applied against shipping cost.');
}

function gghide(){
	$.dialog.alert().close();
}

function fnSetCountryImg(val,id){
	if(val == 38 || val == 40 || val == 41|| val == 39){
		$("#"+id).attr("src","/cbtconsole/img/country/39.jpg");
	}else{
		$("#"+id).attr("src","/cbtconsole/img/country/"+val+".jpg");
	}
}