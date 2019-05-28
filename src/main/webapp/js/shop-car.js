 
var flag=0;
function fnSerch(){
	 var url = $.trim($("#url").val());
	 var reg = new RegExp("http(s)?://([\\w-]+\\.)+[\\w-]+(/[\\w- ./?%&=]*)?");
    if (url.indexOf("http://") < 0 && url.indexOf("https://") < 0)
        url = "http://" + url;
   var suffix = url.substring(url.length-4);
   var cn = url.substring(url.length-3);
    if (!reg.test(url)) {
        $("#url").css("color","red").val("Incorrect URL, please re-enter!");
        return;
    }else if(suffix.indexOf(".com") > -1 || cn.indexOf(".cn") > -1 || suffix.indexOf(".net") > -1 || suffix.indexOf(".org") > -1){
        $("#url").css("color","red").val("请直接 找到 产品的页面，然后 把该页的 网址（URL） 发给我");
   	 	return;
    }else{
		window.location.href = "/cbtconsole/processesServlet?action=getSpider&className=SpiderServlet&url=" + encodeURIComponent(url);
    }

}
function fnBlur(){
	var str = $.trim($("#url").val());
	if(str.length<1){
		 $("#url").val("http://");
	}
}
function fnFocus(){
	$("#url").val('');
	$("#url").css('color','black');
}

function fn(){
	$("#navigationn").css("display","none");
	initListener();	
	if($("#url").val().length > 10 ){
		$("#url").removeClass("search_url_text"); 
	}
	$("#cart_state").html($("#free_div input[type=checkbox]:checked").length);
	/*if($('input[type=checkbox]:checked').length == 1 && $('input[type=checkbox]:eq(0)').attr("checked") == "checked"){
		$('input[type=checkbox]:eq(0)').attr("checked","");
	}
	$('#checkbox').attr("checked", "");*/
}
	//加载购物车
	
	//判断阿里巴巴运费
	function fnFreight(freight){
		if(freight <300 && freight!=0){
			return freight> 45?45:freight;
		}
	}
	
	//询价表单和免邮表单中是否有数据
	function fnInquiryTab(){
		var rows = $("#tab_car_unknown tr").length;
		if(rows > 1){
			$("#inquiry").show();
		}else{
			$("#inquiry").hide();
		}
		var rows = $("#tab_car_ff_e tr").length;
		if(rows > 1){
			$("#freightFree").show();
		}else{
			$("#freightFree").hide();
		}
		var rows = $("#tab_car_ff_s tr").length;
		if(rows > 1){
			$("#freightFree_s").show();
		}else{
			$("#freightFree_s").hide();
		}
//		var rows1 = $("#tab_car tr").length;
		/*if(rows1 <= 1 &&rows > 1){
			$("#pro_div").hide();
		}else{
			$("#pro_div").show();
		}*/
	}

	//点击und价格修改价格
	function fnUpprice(val){
		$(val).val("");
	}
	var max_w = 0;//购物车中商品重量最大的
	//计算总重量
	//type是否是删除，如果是删除则不判断是否勾选
	function fnSumZL(type){
		sum_w = 0;sum_v = 0;
		$("#tab_car tr:gt(0):even").each(
			function(i) {
				var emvw = $(this).find("td:eq(1)");
				var emv = emvw.find("em:eq(0)").html();
				var emw = emvw.find("em:eq(1)").html();
				if (($(this).prev().find("input:eq(0)").prop("checked")||type == 1) && (emw != null && emw !="") && emw !='Weight Unknown') {
					sum_w = sum_w + parseFloat(emw);
					sum_v = sum_v + parseFloat(emv);
					var ww = parseFloat(emw);
					if(max_w == 0){
						max_w = ww;
					}else if(ww > max_w){
						max_w = ww;
					}
				}
			});
		$("#sum_w").html(sum_w.toFixed(1));
		sum_v = sum_v.toFixed(6);
		sum_w = sum_w.toFixed(2);
		if(type == 2){
			fnGetFreight(1,2);
		}else{
			fnGetFreight(1,0);
		}
	}
	
	function fnUpprice1(val){
		var price = $(val).val();
		var this_tr=$(val).parent().parent().parent(); 
		if(price != ""){
			$.dialog.confirm("Message","You can only edit the unit price once, please confirm!", function(){
				var this_tr=$(val).parent().parent().parent();
				var number = this_tr.find("td:eq(4) input:eq(1)").val();
				var goodsid = this_tr.find("input:eq(0)").attr("id"); 
				this_tr.find("td:eq(7) em:eq(0)").html(parseFloat(price)*parseFloat(number));
				this_tr.find("td:eq(7) em:eq(1)").html("");
				this_tr.find("td:eq(6) em:eq(1)").remove();
				var tr = this_tr.clone();
				var tr_next = this_tr.next().clone();
				$("#tab_car tr:last").after(tr);
				$("#tab_car tr:last").after(tr_next);
				var s = this_tr.index();
				$("#tab_car_unknown tr:eq("+s+")").remove();
				$("#tab_car_unknown tr:eq("+s+")").remove();
				$("#tab_car tr:eq("+($("#tab_car").find('tr').length-2)+") td:eq(0) input:eq(0)").removeAttr("onchange");
				$("#tab_car tr:eq("+($("#tab_car").find('tr').length-2)+") td:eq(0) input:eq(0)").change(function(){(this, '1', "tab_car");});
				$("#tab_car tr:eq("+($("#tab_car").find('tr').length-2)+") td:eq(3) em:eq(0)").html(currency+price); 
				//修改数据库的价格
				 $.post("processesServlet", {
					action : 'upGoodsprice',
					className : 'Goods',
					goodsid : goodsid,
					price : price
				}, function(res) {
					
				});
					fnInquiryTab();
					fnTotPrice();
			}, function(){
				$(val).val("Unknown");
			});
		}else{ 
			$(val).val("Unknown");
			fnInquiryTab();
			fnTotPrice();
		}
	}
	
	//复选框效果
	function fnChange(val, id, tableID) {
		var inpu = $(val).prop("id");
		if(tableID == "tab_car"){
			var checked = $('#spider_div input[type=checkbox]:gt(0)');
			var s = 0;
			var sizecheked = 0;
			var size1 = 0;
			if(id == 2){
				$("#spider_div input[type=checkbox]").prop("checked", $(val).prop("checked"));
			}
			$(checked).each(function(){
				size1 ++;
				if ($(this).prop("checked")){
					sizecheked ++;
				}
			});
			if(sizecheked < size1){
				$("#checkbox").prop("checked",false);
			}else{
				$("#checkbox").prop("checked",true);
			}
			$("#cart_state").html(sizecheked);
			$("#cart_state1").html(size1);
			fnSumZL(0);
		}
		if(inpu == "check_all_un"){
			$("#checkbox_un").prop("checked", true);
			$('#'+tableID+' input[type=checkbox]').prop("checked", true);
		}
		 if(tableID == "tab_car_unknown"){
				$("#cart_state_un").html(sizecheked + "/" + size_un);
				if(sizecheked == size_un){
					$("#checkbox_un").prop("checked", true);
				}else{
					$("#checkbox_un").prop("checked", false);
				}
			}else{
				$("#cart_state_un").html(sizecheked + "/" + size_un);
			}
		/*else if(inpu == "check_all"){
			$("#checkbox").prop("checked", true);
			$('#'+tableID+' input[type=checkbox]').prop("checked", true);
		}
		else if(inpu == "check_all_free"){
			$("#checkbox_ff").prop("checked", true);
			$('#'+tableID+' input[type=checkbox]').prop("checked", true);
		}*/
		fnTotPrice();
	}

	//计算总价格
	function fnTotPrice() {
		var n_p = 0;
		var freight = 0;
		 var classprice = [];
		var servicefee = 0;
		$("#spider_div :checkbox").each(
				function(i) {
					var tr = $(this).parent().parent();
					tr.find("td:eq(7) em").html((parseFloat(tr.find("td:eq(4) input:eq(1)").val())*parseFloat(tr.find("td:eq(3) em").html())).toFixed(2));
					if ($(this).prop("checked")
							&& $(this).parent().parent().find("td:eq(5) em")
									.html() != null) {
						var em_price = parseFloat(tr.find("td:eq(7) em").html());
						n_p = n_p + em_price;
						if($(tr).parent().parent().attr("id") == "tab_car"){
							servicefee += em_price;
						}
						freight = freight
								+ parseFloat($(this).parent().parent().find(
										"td:eq(8) em").html());
						var type = $(this).next().next().next().val();
						var oneprice = parseFloat($(this).parent().parent().find("td:eq(3) em").html());
						if(oneprice <= 150){
							for (var i = 0; i < class_discount.length; i++) {
								if(class_discount[i].id == type){
									if(typeof(classprice[i]) == "undefined"){
										classprice[i] = 0;
									}
									classprice[i] += em_price;
								}
							}
						}
					}
				});
		var servicePrice = 0;
		$("#tab_car_unknown tr:gt(0) :checkbox").each(
				function(i) {
					if ($(this).prop("checked")){
						servicePrice = servicePrice + 50;
					}
				});
		var deposit_price = 0;//折扣总金额
		 for(var i =0; i<classprice.length; i++){
	          if(classprice[i]>class_discount[i].price){
	        	  deposit_price += classprice[i]*(1-class_discount[i].deposit_rate);
	          }
	     }
		//n_p总询价费
		$("#service_total").html(currency+servicePrice.toFixed(2));
		$("#total").html(currency + n_p.toFixed(2));
		$("#total2").html(currency + n_p.toFixed(2));
		
		if (servicefee < 1000) {
			servicefee =  servicefee * 0.08;
		} else if (servicefee < 3000) {
			servicefee =  servicefee * 0.06;
		} else if (servicefee < 5000) {
			servicefee =  servicefee * 0.04;
		} else if (servicefee < 10000) {
			servicefee =  servicefee * 0.03;
		} else {
			servicefee =  servicefee * 0.025;
		}
		
		
/*		$("#servicefee").html(servicefee.toFixed(2));
*/		
		$("#servicefee").html(0);
		
		if(deposit_price > 0){
			$("#p_discount").show();
			deposit_price = (deposit_price).toFixed(2);
			$("#class_discount").html(currency +"("+ deposit_price+")");
		}else{
			$("#p_discount").hide();
		}
	}

	//修改购物车数量
	var timerUpNumber ;
	function fnUpNumber_car(val, algorithm, carId, patype,least) {
		clearInterval(timerUpNumber);
		var number = $(val).parent().find('input:eq(1)').val();
		var number_i = parseFloat(number);
		if (algorithm == 1) {
			number_i = number_i - 1;
		} else if (algorithm == 2) {
			number_i = number_i + 1;
			if(number_i > 99999){
				return;
			}
		}
		if (number_i < 1) {
			return;
		}
		if(number_i < least){
			return;
		}
		var this_tr = $(val).parent().parent();
		$(val).parent().find('input:eq(1)').val(number_i);
		//500ms未有再点击才对数据库操作
		timerUpNumber = window.setInterval(function(){
			 clearInterval(timerUpNumber);
		var kg = this_tr.next().find("em:eq(1)");
    	var m3 = this_tr.next().find("em:eq(0)");
    	var sum_ww = sum_w - parseFloat(kg.html());
    	var sum_vv = sum_v - parseFloat(m3.html());
		$.post("processesServlet", {
			action : 'spiderUpNumber',
			className : 'Goods',
			guid : carId,
			number : number_i
		}, function(res) {
			if(res == null){
				return ;
			}
			var json = eval(res)[0];
			var json_price = json.price;
			var em = this_tr.find("td:eq(7) em:eq(0)");
			this_tr.find("td:eq(3) em:eq(0)").html(json_price);
			var freePrice = json.freePrice;
			var freePriceToCostPrice = json.freePriceToCostPrice;
			if(freePriceToCostPrice != 0){
				this_tr.find("td:eq(3) input:eq(0)").val(freePriceToCostPrice);
			}
			var number = this_tr.find("td:eq(4) input:eq(1)").val();
			em.html( parseFloat(json_price * number_i).toFixed(2));
			if(this_tr.parent().parent().attr("id") != "tab_car_ff_s" && this_tr.parent().parent().attr("id") != "tab_car_ff_e" && json.totalweight != 0){
  		    	sum_w = sum_ww + parseFloat(json.totalweight);
  		    	sum_v = sum_vv + parseFloat(json.totalvalume);
  		    	kg.html(json.totalweight);
  		   		m3.html(json.totalvalume);
  		   		$("#sum_w").html(sum_w.toFixed(1));
	    	}
			fnTotPrice();
			fnGetFreight(1,0);
		});
		}, 500);
	}
	
	//输入框失焦
	function fnUpNumber_carB(val, algorithm, carId, patype,least){
		var number = $(val).val();
		if(number == '' || number == 0){
			val.value = 1;
			number = 1;
		}
		var number_i = parseFloat(number);
		if (number_i < 1) {
			return;
		}
		if(number_i < least){
			val.value = least;
			number_i = least;
		}
		var this_tr = $(val).parent().parent();
		var kg = this_tr.next().find("em:eq(1)");
    	var m3 = this_tr.next().find("em:eq(0)");
    	var sum_ww = sum_w - parseFloat(kg.html());
    	var sum_vv = sum_v - parseFloat(m3.html());
		$.post("processesServlet", {
			action : 'spiderUpNumber',
			className : 'Goods',
			guid : carId,
			number : number_i
		}, function(res) {
			var json = eval(res)[0];
			var json_price = json.price;
			var em = this_tr.find("td:eq(7) em:eq(0)");
			this_tr.find("td:eq(3) em:eq(0)").html(json_price);
			var number = this_tr.find("td:eq(4) input:eq(1)").val();
			em.html( parseFloat(json_price * number_i).toFixed(2));
	    	if(typeof(kg.html()) != "undefined" && json.totalweight != 0){
  		    	sum_w = sum_ww + parseFloat(json.totalweight);
  		    	sum_v = sum_vv + parseFloat(json.totalvalume);
  		    	kg.html(json.totalweight);
  		   		m3.html(json.totalvalume);
  		   		$("#sum_w").html(sum_w.toFixed(1));
	    	}
			fnTotPrice();
			fnGetFreight(1,0);
		});
	}
 
	//弹出编辑层
	var t = 0,l = 0;
	var editID;
	function fnOpenEdit(thisObj, key, page, carID, edit,free) {
		editID = "edilt" + edit;
		$("#edit").hide();
		var d = $(thisObj);
		var pos = d.offset();
		  t = pos.top - 272; // 弹出框的上边位置
		  l = pos.left - 570; // 弹出框的左边位置
		$("#edit").css({
			"top" : t,
			"left" : l
		}).show();
		$("#edit_url")
				.val(
						$(thisObj).parent().parent().find(
								"input[type=checkbox]").val());
		/* $("#edit_seller").val(seller); */
		$("#page").attr("href",decodeURIComponent(page));
		$("#edit_title").val(
				$(thisObj).parent().parent().find("a:eq(1)").html());
		var price = $(thisObj).parent().parent().find("em:eq(0)").html();
		if(price == "Unknown"){
			price = 0;
		}
		/* $("#edit_price").val(price); */
		$("#edit_number").val($(thisObj).parent().parent().find("input[class=tb_text]").val());
		var remark = $(thisObj).parent().parent().next().find("input:eq(0)").val();
		$("#edit_remark").val(remark);
		$("#carId").val(carID);
		$("#editbt").attr("onClick","fnSaveEdit("+carID+")");
	}

	function fnOpenURL(url){
		window.location.href = "/cbtconsole/processesServlet?action=getSpider&className=SpiderServlet&url=" + encodeURIComponent(url);
	}
	
	//点击编辑层的其他地方消失
	 $(document).click(function (e) {
		var height =  $('#edit').offset().top ;//775
		var width =  $('#edit').offset().left;//960      
		//775  567
		//alert($('#edit').offset().top+",w:"+event.clientY );///h555 186,w960 1140
//		var ev = e || window.event;
		 var ev = e || window.event || arguments.callee.caller.arguments[0];      
		if($(e.target).attr('id') == editID || $(e.target).parent().attr('id') == editID){
			 $("#edit").css("diplay","block");
		}else if(height <= ev.pageY && ev.pageY <= (height+251) && width <= ev.pageX  && ev.pageX <= (width+397)){	 
			 $("#edit").css("diplay","block");
		 }else{ 
			 $("#edit").hide();
		 }
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
	
	//保存编辑
	function fnSaveEdit(carID) {
		var form = $("#edit_form").serialize();
		$("#edit").hide();
		 $.ajax({
			  type: "POST",
			  url: "processesServlet?action=upGoodInfo&className=Goods",
			  processData:true,
			  data:form,
			  success: function(data){
				  var remark_e = $("#edit_remark").val();
				  $("#"+carID).parent().parent().next().find("input:eq(0)").val(remark_e);
				  $("#"+carID).parent().next().next().find("a:eq(0)").html($("#edit_title").val());
				  if(remark_e == ''){
					  $("#"+carID).parent().parent().find("td:last a").html('<img src="/cbtconsole/img/shopcar/remark1.jpg"/>');
				  }else{
					  var remark_ee = remark_e.length > 50?remark_e.substring(0,50)+"..." :remark_e;
					  $("#"+carID).parent().parent().find("td:last a").html("<em title='"+remark_e+"' style='word-break: break-all;'>"+remark_ee+"</em>");
				  }
			  }
		});
	}
	//删除商品
	function fnDelGoods(type){
		var checked = $("#"+type+" input[type=checkbox]:checked");
		if(checked.length>0){
			/*if(!window.confirm("Are you sure you want to delete this item?")){
				return;
			}*/
			$.dialog.confirm("Message","Are you sure you want to delete this item?", function(){
				fnDelGoods2(checked,type);
			}, function(){
				
			});
		}else{
			return;
		}
	}
	
	function fnDelGoods2(checked,type){
		var goodsid = "";
		var guids = "";
		$(checked).each(function(){
			var id = this.id;
			var name = this.name;
			var guid = $(this).next().next().val();
			if(id != "checkbox" && id != "checkbox_un" && id != "cbt"  && name != "shopname"){
				goodsid = goodsid + id + "@";
				guids = guids + guid + "@";
			}
		});
		var goodsids = goodsid.split("@");
		 $.post("processesServlet", {
			action : 'delGoods',
			className : 'Goods',
			goodsid : goodsid,
			guids : guids
		}, function(res) {
				var cart_state = parseInt($("#cart_state1").html());
				var goodsids = goodsid.split("@");
				for (var i = 0; i < goodsids.length; i++) {
					$("#"+goodsids[i]).parent().parent().next().remove();
					$("#"+goodsids[i]).parent().parent().remove();
				}
				if(type == "tab_car_unknown"){
					size_un = size_un - goodsids.length+1;
					$("#cart_state_un").html(0 + "/" + size_un);
					$("#checkbox_un").prop("checked",true);
					if(size_un == 0)$("#inquiry").css("display","none");
				}else{
					cart_state = cart_state - goodsids.length+1;
					$("#cart_state").html(cart_state);
					$("#cart_state1").html(cart_state);
					$("#checkbox").prop("checked",true);
					if($("#tab_car tr").length == 0){
						$("#goods_car_spider").hide();
						$("#free_shipping_info").hide();
						
					}
					fnSumZL(1);
				}
				$('#'+type+' input[type=checkbox]').prop("checked", true);
			//计算价格
			fnTotPrice();
			//获取运费
//			fnGetFreight(1);
		});
	}
	
	var reg1=/\d+/;//取数字的正则
	function toRequiredInfo(){
		var checked = $("#spider_div input[type=checkbox]:checked");
		var itemidStr= "";
		var sf = $("#shipping_cost_").val();
		$(checked).each(function(){
			if(this.id!=""&&this.id!="checkbox"&&this.id!="checkbox_un"){//商品id
				//商家id重复的话应该会出现itemid覆盖的情况,后续修改
				var itemid=$(this).next().val();
				if(itemid!=undefined){
					itemidStr=itemidStr+itemid+"@";
				}
				var tr = $(this).parent().parent();
				var delivery = tr.next().find("td:eq(0) input:eq(1)").val();
				var norm_least = tr.next().find("td:eq(0) input:eq(2)").val();
				var number = $(tr).find("td:eq(4) input:eq(1)").val();
				var Weight = $(tr).next().find("td:eq(1) em:eq(1)").html();
				if(Weight == "Weight Unknown"){
					sf = "";
				}
				if(parseInt(delivery)>10||delivery==''||delivery==null){
					
					  flag=1;
				  }
				  if(parseInt(number)<parseInt(norm_least.match(reg1)) && flag !=1){
					  flag=2;
				  }
			}
		});
		if(itemidStr==""){
			$.dialog.alert("Message",'Please add at least 1 item!');
			return;
		}
		var total2 = $("#total2").html();
		total2 = parseFloat(total2.split(currency)[1]);
		if(total2<20){
			$.dialog.alert("Message",'Our minimum order amount is '+currency+'20, please add more products if possible.');
			return;
		}
		parameter=itemidStr.substr(0,itemidStr.length-1);
		fnSlz("Proceed To Checkout");
		var express_ = $("#show_express_").val().replace(" Days","");
		var max_w = getMax_w("tab_car");
		$("#itemId_").val(parameter);
		$("#flag_").val(1);
		$("#sum_w_").val(sum_w);
		$("#sum_v_").val(sum_v);
		$("#max_w_").val(max_w);
		/*var max_w_ff = 0;
		var sum_w_ff_ = 0;
		var sum_v_ff_ = 0;
		$("#tab_car_ff tr:gt(0):even").each(
				function(i) {
					if($(this).prev().find("input:eq(0)").prop("checked")){
						var emvw = $(this).find("td:eq(1)");
						var emv = emvw.find("em:eq(0)").html();
						var emw = emvw.find("em:eq(1)").html();
						if ((emw != null && emw !="")) {
							var w = emvw.find("input").val();
							var ww = parseFloat(w);
							if(emw !='Weight Unknown'){
								sum_w_ff_ = sum_w_ff_ + parseFloat(emw);
								sum_v_ff_ = sum_v_ff_ + parseFloat(emv);
							}else{
								sum_w_ff_ = 0;
								return false;
							}
							if(max_w_ff == 0){
								max_w_ff = ww;
							}else if(ww > max_w_ff){
								max_w_ff = ww;
							}
						}
					}
		});
		$("#sum_w_ff").val(sum_w_ff_.toFixed(2));
		$("#sum_v_ff").val(sum_v_ff_.toFixed(6));
		$("#max_w_ff").val(max_w_ff);*/
		$("#sf_").val(sf);
		$("#express_").val(express_+"@"+$("#country_change").html());
		$("#loginCart").submit();
//		window.location.href="/cbtconsole/cbt/orderinfonew/loginCart?action=loginCart&className=OrderInfoNew&userId="+userid+"&itemId="+parameter+"&flag=1&state=1&sf="+sf+"&express="+express_+"@"+$("#country_change").html()+"&"+htmlref;
	}
	
	function toAdvanceOrder(){
		var checked = $("#tab_car input[type=checkbox]:checked");
		var itemidStr= "";
		$(checked).each(function(){
			if(this.id!=""&&this.id!="checkbox"&&this.id!="checkbox_un"){//商品id
				//商家id重复的话应该会出现itemid覆盖的情况,后续修改
				var itemid=$(this).next().val();
				if(itemid!=undefined){
					itemidStr=itemidStr+itemid+"@";
				}
			}
		});
		if(itemidStr==""){
			$.dialog.alert("Message",'Please add at least 1 item!');
			return;
		}
		parameter=itemidStr.substr(0,itemidStr.length-1);
		window.location.href="/cbtconsole/processesServlet?action=loginCarttoAdvance&className=OrderInfo&userId="+userid+"&itemId="+parameter+"&flag=1";
		 
	}
	
/*	function toRequiredInfo_ff(){
		var checked = $("#tab_car_ff input[type=checkbox]:checked");
		var itemidStr= "";
		
		$(checked).each(function(){
			if(this.id!=""&&this.id!="checkbox_ff"){//商品id
				//商家id重复的话应该会出现itemid覆盖的情况,后续修改
				var itemid=$(this).next().val();
				if(itemid!=undefined){
					itemidStr=itemidStr+itemid+"@";
				}
			}
			var tr = $(this).parent().parent();
			var delivery = tr.next().find("td:eq(0) input:eq(1)").val();
			var norm_least = tr.next().find("td:eq(0) input:eq(2)").val();
			var number = $(tr).find("td:eq(4) input:eq(1)").val();
			if(parseInt(delivery)>10||delivery==''||delivery==null){
				  flag=1;
			  }
			  if(parseInt(number)<parseInt(norm_least.match(reg1)) && flag !=1){
				  flag=2;
			  }
		});
		if(itemidStr==""){
			$.dialog.alert("Message",'Please add at least 1 item!');
			return;
		}
		var totalp = $("#total2_ff").html();
		totalp = parseFloat(totalp.split(currency)[1]);
		
		if(totalp < 20){
			$.dialog.alert("Message",'Our minimum order amount is '+currency+'20, please add more products if possible.');
			return;
		}
			parameter=itemidStr.substr(0,itemidStr.length-1);
			fnSlz("Proceed To Checkout(free)");
			$("#userId_").val(userid);
			$("#itemId_").val(parameter);
			$("#flag_").val(1);
			$("#FreeShipping").val(1);
			$("#loginCart").submit();
			var sum_w_ff_ = 0;
			var sum_v_ff_ = 0;
			if($(this).prev().find("input:eq(0)").prop("checked")){
				var w = $(this).find("td:eq(1)").find("span input").val();
				if(w != ""){
					var ww = parseFloat(w);
					if(max_w == 0){
						max_w = ww;
					}else if(ww > max_w){
						max_w = ww;
					}
				}
			}
			var max_w_ff = 0;
			$("#tab_car_ff tr:gt(0):even").each(
					function(i) {
						if($(this).prev().find("input:eq(0)").prop("checked")){
							var emvw = $(this).find("td:eq(1)");
							var emv = emvw.find("em:eq(0)").html();
							var emw = emvw.find("em:eq(1)").html();
							if ((emw != null && emw !="")) {
								var w = emvw.find("input").val();
								var ww = parseFloat(w);
								if(emw !='Weight Unknown'){
									sum_w_ff_ = sum_w_ff_ + parseFloat(emw);
									sum_v_ff_ = sum_v_ff_ + parseFloat(emv);
								}else{
									sum_w_ff_ = 0;
									return false;
								}
								if(max_w_ff == 0){
									max_w_ff = ww;
								}else if(ww > max_w_ff){
									max_w_ff = ww;
								}
							}
						}
			});
			$("#itemId_").val(parameter);
			$("#flag_").val(1);
			$("#FreeShipping").val(1);
			$("#sum_w_").val(sum_w_ff_.toFixed(1));
			$("#sum_v_").val(sum_v_ff_.toFixed(5));
			$("#max_w_").val(max_w_ff);
			$("#state_").val(0);
			$("#sf_").val("");
			$("#express_").val("");
			$("#loginCart").submit();
//			window.location.href="/cbtconsole/cbt/orderinfonew/loginCart?action=loginCart&className=OrderInfoNew&userId="+userid+"&itemId="+parameter+"&flag=1&FreeShipping=1&"+htmlref;
	}*/
	
	//用户名
	function fnxjSubmit(){
		var inquiryid = "";
		$("#tab_car_unknown input[type=checkbox]:checked").each(
				function(i){
					if ($(this).attr("checked")){
						var goodsid = $(this).next().val();
						inquiryid = goodsid + "@" + inquiryid;
					}
		});
		if(inquiryid == ""){
			$.dialog.alert("Message",'Please add at least 1 item!');
			return;
		}else{
			 window.location.href = '/cbtconsole/processesServlet?action=getInquiryGoods&className=Inquiry&id='+inquiryid;
		}
	}

	
	/*ylm计算运费   start  */
	var show_div = 1;
	//隐藏运费
	function hide(){
		if(show_div == 1){
			 var light=document.getElementById("light");
			 var fade=document.getElementById('fade');
			 light.style.display='none';
			 fade.style.display='none';
			 $("#freight_detail").css("display","none");
			 $("#showContry").css("display","none");
			 $("#shopfeediv2").css("display","none");
			 $("#shopfeediv").css("display","none");
		}else{
			var light1=document.getElementById("light1");
			 var fade=document.getElementById('fade');
			 light1.style.display='none';
			 fade.style.display='none';
		}
	}
	//显示运费
	function show(type){
	 var fade=document.getElementById('fade');
	 var light=document.getElementById('light');
	 light.style.display='block';
	 fade.style.display='block';
	 if(country == 38 || country == 40 || country == 41|| country == 39){
		$("#country_img").attr("src","/cbtconsole/img/country/39.jpg");
	 }else{
		$("#country_img").attr("src","/cbtconsole/img/country/"+country+".jpg");
	 }
	 document.getElementById("contry_a").className = "contry_a";
	 $("#sum_w1").html($("#sum_w").html());
	 $("#sum_w2").html($("#sum_w").html()+"KG");
	 if(type == 0){
		 fnGetFreight(0,0);
	 }
	 show_div = 1;
	}
	
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
			$("#free_div tr:gt(0):even").each(
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
		fnGetFreight(2,0);
	}
	function fnShowChengeC(){
		document.getElementById("contry_a").className = "contry_a contry_a_active";
		$("#showContry").css("display","block");
	}

	
	var shipping_cost = 0;
	var express_type = 0;

	function fnSetCountryImg(val,id){
		if(val == 38 || val == 40 || val == 41|| val == 39){
			$("#"+id).attr("src","/cbtconsole/img/country/39.jpg");
		}else{
			$("#"+id).attr("src","/cbtconsole/img/country/"+val+".jpg");
		}
	}
	
	function getMax_w(tableId){
		var max_w = 0;
		$("#"+tableId+" tr:odd").each(function(i,item) {
			if($(this).prev().find("input:eq(0)").prop("checked")){
				var w = $(this).find("td:eq(1)").find("span input").val();
				if(w != ""){
					var ww = parseFloat(w);
					if(max_w == 0){
						max_w = ww;
					}else if(ww > max_w){
						max_w = ww;
					}
				}
			}
		});
		return max_w;
	}
	
	//获取运费
	function fnGetFreight(type,savef){
		$("#loading_ex").show();
		$("#freight_tr1").hide();
		var min = 0;
		var express = 0;
		var max_w = 0;//购物车中商品重量最大的
		var sum_ww = sum_w;
		var sum_vv = sum_v;
		var et = "";//从cookie中取出的运输方式
		if(sum_w == 0){
			if(country != 29 && country != 37){
				$("#shipping_cost").html(0);
				$("#shipping_cost_").val(0);
				$("#loading_ex").hide();
				$("#freight_tr1").show();
				$("#shipping-dialog-free").hide();
				$("#cfs").show();
				$("#ok_button").show();
				$("#expresstypediv2n").hide();
				$("#shopfeediv").hide();
				return;
			}
		}
		$("#cfs").hide();
		$("#shipping-dialog-free").show();
		$("#expresstypediv2n").show();
		max_w = getMax_w("tab_car");
		var countryid = 36;
		if(type == 2){
			countryid = country;
			if(country == 29 || country == 37){
				sum_ww = parseFloat(sum_w) + parseFloat(sum_w_ff);
				sum_vv = parseFloat(sum_v) + parseFloat(sum_v_ff);
				$("#free_div tr:gt(0):odd").each(function(i,item) {
					var w = $(this).find("td:eq(1)").find("span input").val();
					if(w != ""){
						var ww = parseFloat(w);
						if(max_w == 0){
							max_w = ww;
						}else if(ww > max_w){
							max_w = ww;
						}
					}
				});
			}
		}else{
			var countryid = $("#countryid").val();
			$("#chengeContry").html($("#country_change").html());
			if(expressType != null && expressType != ""){
				et = expressType.split("@")[1];
				countryid = expressType.split("@")[0];
			}
			fnSetCountryImg(countryid,'country_img');
			if(countryid == undefined){
				countryid = 36;
			}
			country = countryid;
		}
		 $.post("/cbtconsole/feeServlet",
  			{action:'getCost',className:'ZoneServlet',countryid:countryid,weight:sum_ww,volume:0,singleweightmax:max_w},
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
			                express_type = i;
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
						tab.find("tr:last").find("td:eq(1)").html(json.days+" Days");
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
  				if(express_type > jsons.length){
  					express_type = 0;
  				}
  					min = jsons[type == 2 ? 0 : express_type].result;
					if(ac > 0 && ac <= min){
						min = min - ac;
					}else if(ac > min){
						min = 0;
					}
					if(type == 2){
	  					tab.find("tr").eq(0).find("th input").prop("checked", true);
	  	  				tab.find("tr").eq(0).find("td:eq(3)").css("color", "red");
	  				}else{
	  					$("#countryId_").val(countryid);
						shipping_cost = jsons[express_type].result;
	  	  				tab.find("tr").eq(express_type).find("th input:radio").prop("checked", true);
	  	  				tab.find("tr").eq(express_type).find("td:eq(3)").css("color", "red");
						$("#shipping_cost").html(parseInt(shipping_cost)+parseInt(extra_freight));
						$("#shipping_cost_").val(shipping_cost);
						if(jsons.length>0){
							$("#show_express").html(" by "+jsons[express_type].name+" "+jsons[express_type].days+" Days");
							$("#show_express_").val(jsons[express_type].name+"@"+jsons[express_type].days+" Days");
						}
	  				}
					$("#credit").html(currency+min.toFixed(2));
					if((savef == 1&&(expressType == null || expressType == ""))||savef == 2){
						fnChange_express_type();
					}
		  	});
	}
	function fcheck(obj){
	     document.getElementById(obj.id+'in').checked=true;
		}
	//快递类型窗口的OK按钮
	function fnChange_express_type(){
		$("#countryid").val(country);
		$("#countryId_").val(country);
		var et = "";
		var days = "";
		var chengeContry = $("#chengeContry").html();
		$("#country_change").html(chengeContry);
		$("#country_change").attr("title","chengeContry");
		if(country == 38 || country == 40 || country == 41|| country == 39){
			$("#country_change_img").attr("src","/cbtconsole/img/country/39.jpg");
		}else{
			$("#country_change_img").attr("src","/cbtconsole/img/country/"+country+".jpg");
		}
		if(et == ""){
			hide();
		}
//		$("#shipping-dialog-free").hide();
		if(!$("#shipping-dialog-free").is(":visible")){
			$("#express_change tbody tr").each(function(i,item) {
				var checked = $(this).find("input:radio").is(":checked");
				if(checked){
					shipping_cost = $(this).find("td:eq(2) em").html();
					express_type = $(this).find("th input:radio").val();
					$("#shipping_cost").html(parseInt(shipping_cost)+parseInt(extra_freight));
					$("#shipping_cost_").val(shipping_cost);
					et = $(this).find("td:eq(0) em").html();
					days =  $(this).find("td:eq(1)").html();
					$("#show_express").html(" by "+$(this).find("td:eq(0) em:eq(0)").html()+" "+$(this).find("td:eq(1)").html());
					$("#show_express_").val($(this).find("td:eq(0) em:eq(0)").html()+"@"+$(this).find("td:eq(1)").html());
				}
			});
			if(country == 29 || country == 37){
				fnFreeToShpping(1,'free_div');
				sum_w = (parseFloat(sum_w) + parseFloat(sum_w_ff)).toFixed(1);
				$("#sum_w").html(sum_w);
			}
		}else{
			shipping_cost = 0;
			ids = "";
		}
		expressType = null;
		 $.post("/cbtconsole/processesServlet",
		  			{action:'saveExpress',className:'Goods',country:country,express:et,shipping_cost:shipping_cost,days:days,countryname:chengeContry,ids:ids},
		  			function(res){
		  				ids = "";
		  				if(res != ""){
							var guid_prices = res.split(",");
							for (var i = 0; i < guid_prices.length-1; i++) {
								var guid_price = guid_prices[i].split(":");
								var guid_price1 = guid_price[1].split("@");
								$("#"+guid_price[0]).find("td:eq(3) em").html(guid_price1[0]);
								$("#"+guid_price[0]).find("td:eq(3)").append("<div class='div_info_goods_td_free_price'>"+currency+guid_price1[1]+"</div>");
								var sum = parseFloat(guid_price[1]);
								var number = parseFloat($("#"+guid_price[0]).find("td:eq(4) input:eq(1)").val());
								$("#"+guid_price[0]).find("td:eq(7) em:eq(0)").html((sum * number).toFixed(2));
							}
							fnTotPrice();
						}
		  			});
		hide();
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
		var scac = $("#credit").html(currency+price.toFixed(2));
	}
	
	function fnShowAC(){
		$.dialog({id:'shicri',title:'Message',content:'We give each new customer a $50 credit.  It can only be applied against shipping cost.',max: false,
		    min: false,lock: true,drag: false,fixed: true,});		
	}
	function gghide(){
		$.dialog({id:'shicri'}).close();
		$.dialog({id:'changecmb'}).close();
		$.dialog.alert().close();
		$.dialog.confirm().close();
	}
	/*function shihidalert(){
		$('#bigestdiv_s').hide();
		$.dialog({id:'shicri'}).close();
	}*/
	//弹出邮费折扣申请
	var shopping_company_ = "";
	var shopping_price_ = "";
	var weight_ = "";
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
		weight_ = $("#sum_w2").html();
		hide();
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
		    content: 'url:/cbtconsole/apa/postage_discounts.html',
		    close: function () {
		        show(1);
		    }
		});
	}
	
	var ac = 0;
	//获取用户剩余运费补贴
	function fnGetAC(){
	var useris = $("#userinfo").find("li:eq(1) a").length;
	if(useris == 0){$("#ac").html("50");$("#ac1").html("50" +currency);ac = 50;return;}
	 $.post("/cbtconsole/processesServlet",
	  			{action:'getUserAC',className:'Goods'},
	  			function(res){
	  				ac = res;
	  				if(ac == 0){
	  					$("#ac_show").hide();
	  				}
	  				$("#ac").html(ac);
	  				$("#ac1").html(ac+currency);
	  			});
	}
	function fnFreight_detail(id){
		$("#"+id1).hide();
		id1 = id;
	}
	/*ylm计算运费   end  */
	
	/*运费弹出框样式（重量双倍）*/
	function shoefee(){
		document.getElementById('shopfeediv').style.display='none';
		document.getElementById('shopfeediv2').style.display='block';
	}
	
	//免邮产品转入非免邮中
	function fnProceed(tab,extra_freight){
		var freeMethod = "";
		if(tab == "tab_car_ff_e"){
			freeMethod = "China Post Express";
		}else if(tab == "tab_car_ff_s"){
			freeMethod = "China Post SAL";
		}
		$.dialog.setting.okVal = "Proceed";
		var tab_car = $("#tab_car tr").length;
		var show_tab = "";
		if(tab_car > 0){
			show_tab = "<br>In your shopping cart, some other products don't have free shipping either.<br>If you proceed, they will ship together";
			$.dialog.setting.okVal = "Proceed to Combine";
		}
		var checked = $('#'+tab+' input[type=checkbox]:checked');
		var freePrice = 0;
		var price = 0;
		$(checked).each(function(){
			var tr = $(this).parent().parent();
			price += parseFloat(tr.find("td:eq(3) input:eq(0)").val()) * parseInt(tr.find("td:eq(4) input:eq(1)").val());//非免邮价格
			freePrice += parseFloat(tr.find("td:eq(7) em:eq(0)").html());//免邮价格
		});
		$.dialog({id:'changecmb',title: 'Change Shipping Method?',content:'For these items, the selected shipping method is <em style="color:#BF8F00">Free Shipping: '+freeMethod+'</em>.<br>If you change it, shipping won\'t be free anymore, but you get these benefits:<br>(1) You may choose a faster shipping option<br>(2) Your product price reduces from ' + freePrice.toFixed(2) + ' to ' + price.toFixed(2) + '.'+show_tab,max: false,
			    min: false,lock: true,drag: false,fixed: true,ok: function(){ 
			fnFreeToShpping(0,tab);
	    }} );
		$.dialog.setting.okVal = "Proceed";
	}
	//免邮产品转入非免邮中
	var ids = "";
	function fnFreeToShpping(type,tab){
		var checked ;
		if(type == 0){
			checked = $('#'+tab+' input[type=checkbox]:checked');
		}else{
			checked = $('#'+tab+' input[type=checkbox]');
		}
		var sizecheked = 0;
		var tab_car = $("#tab_car");
		$(checked).each(function(){
			ids += "@" + $(this).next().next().val() + "@";
			var tr = $(this).parent().parent();
			tr.find("td:eq(6) em:eq(1)").remove();
			tr.find("td:eq(6) br").remove();
			tr.find("td:eq(6)").css("font-size","14px");
			var tr_n = $(this).parent().parent().next();
			if(tab_car.find("tr").length < 1){
				$("#tab_car").append(tr);
				tr_n.insertAfter("#tab_car tr:last");
			}else{
				tr.insertAfter("#tab_car tr:last");
				tr_n.insertAfter("#tab_car tr:last");
			}
			sizecheked++;
		});
		/*var cart_state = $("#cart_state").html().split("/");
		if(cart_state.length > 1){
			$("#cart_state").html((parseInt(cart_state[0])+sizecheked)+"/"+size);
		}*/
		if($('#tab_car_ff_e tr').length < 1){
				$("#freightFree").hide();
		}
		if($('#tab_car_ff_s tr').length < 1){
			$("#freightFree_s").hide();
		}
		$("#free_shipping_info").show();
		if(type == 0){
			fnSumZL(2);
		}
		fnTotPrice();
		$("#goods_car_spider").show();
	}
	
	//获取国家
	function fnGetContry(){
		var showContry_ul = document.getElementById("showContry_ul");
		var res = '[{"id":"43","country":"USA", "zone":"6"}, {"id":"1","country":"ARGENTINA", "zone":"9"}, {"id":"2","country":"AUSTRALIA", "zone":"5"}, {"id":"3","country":"AUSTRIA", "zone":"7"}, {"id":"4","country":"BELGIUM", "zone":"7"}, {"id":"5","country":"BRAZIL", "zone":"9"}, {"id":"6","country":"CANADA", "zone":"6"}, {"id":"7","country":"CHILE", "zone":"9"}, {"id":"8","country":"CZECH", "zone":"7"}, {"id":"9","country":"DENMARK", "zone":"7"}, {"id":"10","country":"EGYPT", "zone":"8"}, {"id":"11","country":"FINLAND", "zone":"7"}, {"id":"12","country":"FRANCE", "zone":"7"}, {"id":"13","country":"GERMANY", "zone":"7"}, {"id":"14","country":"GREECE", "zone":"7"}, {"id":"15","country":"HUNGARY", "zone":"7"}, {"id":"16","country":"INDIA", "zone":"7"}, {"id":"17","country":"IRAQ", "zone":"8"}, {"id":"18","country":"IRELAND", "zone":"7"}, {"id":"19","country":"ISRAEL", "zone":"8"}, {"id":"20","country":"ITALY", "zone":"7"}, {"id":"21","country":"JAPAN", "zone":"3"}, {"id":"22","country":"MEXICO", "zone":"6"}, {"id":"23","country":"Holland", "zone":"7"}, {"id":"24","country":"NEW ZEALAND", "zone":"5"}, {"id":"25","country":"NORWAY", "zone":"7"}, {"id":"26","country":"POLAND", "zone":"7"}, {"id":"27","country":"PORTUGAL", "zone":"7"}, {"id":"28","country":"KSA (Saudi)", "zone":"8"}, {"id":"29","country":"S. AFRICA", "zone":"9"}, {"id":"30","country":"SPAIN", "zone":"7"}, {"id":"31","country":"SWEDEN", "zone":"7"}, {"id":"32","country":"SWITZERLAND", "zone":"7"}, {"id":"33","country":"TURKEY", "zone":"8"}, {"id":"34","country":"UAE", "zone":"8"}, {"id":"35","country":"UK", "zone":"7"}, {"id":"37","country":"AFRICA", "zone":"9"}, {"id":"38","country":"APAC", "zone":"5"}, {"id":"39","country":"EUROPE", "zone":"7"}, {"id":"40","country":"MID EAST", "zone":"8"}, {"id":"41","country":"S. AMERICA", "zone":"9"}]';
    	var json=eval(res);
    	var contry_ul = showContry_ul.innerHTML;
		for(var i=0;i<json.length;i++){
			var map=json[i];
			var text=map.country;
			var value=map.zone;
			var id=map.id;
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
			if(id == country){
				$("#countryId_").val(country);
				document.getElementById("countryid").value = id;
				document.getElementById("chengeContry").innerHTML = text;
				document.getElementById("country_change").innerHTML = text;
				fnSetCountryImg(country,'country_img');
			}
		}
		showContry_ul.removeChild(showContry_ul.getElementsByTagName("li")[0]);
	}
	
	//显示类别混批折扣
	function fnCategoryDiscount(id){
		var classprice = [];
		for (var i = 0; i < class_discount.length; i++) {
			classprice[i] = 0;
		}
		$("#"+id+" :checkbox").each(
				function(i) {
					var tr = $(this).parent().parent();
					var tr_total = tr.find("td:eq(7) em").html();
					if ($(this).prop("checked")
							&& $(this).parent().parent().find("td:eq(5) em")
									.html() != null) {
						var em_price = parseFloat(tr.find("td:eq(7) em").html());
						var type = $(this).next().next().next().val();
						var oneprice = parseFloat($(this).parent().parent().find("td:eq(3) em").html());
						if(oneprice <= 150){
							for (var i = 0; i < class_discount.length; i++) {
								if(class_discount[i].id == type){
									classprice[i] += em_price;
								}
							}
						}
					}
				});
		var classprice_str = "";
		for (var i = 0; i < class_discount.length; i++) {
			classprice_str += classprice[i]+"@";
		}
		$.dialog({
			id:'class_disco',
			width: '677px',
		    height: 336,
			fixed: true,
			max: false,
		    min: false,
			skin: 'discu',
		    lock: true,
		    title: '20% Business Discount',
		    drag: false,
		    cache: false,
		    content: 'url:/cbtconsole/processesServlet?action=getClass_discount&className=Preferential&classprice='+classprice_str
		});
	}
	