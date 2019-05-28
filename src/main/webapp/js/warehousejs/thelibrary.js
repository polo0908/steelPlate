//<script type="text/javascript" src="${path}/js/warehousejs/thelibrary.js"></script>

//**************************综合采购部分开始*****************************
//转状态
function getState(state){
	if(state == ''){
		return "没有状态";
	}
	state = Number(state);
	var strRet="";
	switch(state){
	case 0:
		strRet= "等待卖家发货";
		break;
	case 1:
		strRet= "卖家已发货";
		break;
	case 2:
		strRet= "等待买家付款";
		break;
	case 3:
		strRet= "买家已付款";
		break;
	case 4:
		strRet= "物流运输中";
		break;
	case 5:
		strRet= "物流派件中";
		break;
	case 6:
		strRet= "交易关闭";
		break;
	case 7:
		strRet= "快件已签收";
		break;
	case 8:
		strRet= "交易成功";
		break;
	case 9:
		strRet= "等待评价";
		break;
	case 10:
		strRet= "等待买家确认收货";
		break;
	}
	return strRet;
}

var asdfasf=1;
function getOrderProblem(orderno){
	
	
	
//	goodsid= '9339';
	$.ajax({
		type:'post',
		url:'warehouse/getOrderProblem.do',
		data:{orderno:orderno},
		traditional :true,
		success:function(data){
			if(data != "1001" && data !=''){
				$("#OrderProblem"+orderno).html("出库审核不通过的问题描述："+data);
			}
				
	}});
}



       
//获取淘宝快递单号和状态
function getlogisticsidAndState(goodsid){
//	goodsid= '9339';
	$.ajax({
		type:'get',
		url:'warehouse/getlogisticsidAndState.do',
		data:{goodsid:goodsid},
		traditional :true,
		success:function(data){
			if(data.length > 2){
				//eval("("+data+")");
				var obj = eval("("+data+")");
			//	alert($(obj).size());
				var bnts = "";
				var createtime = "";
				for(var i=0; i<obj.length; i++){
					//转状态
					var strState = getState(obj[i].tb_state)
					createtime = obj[i].createtime;
					//alert(obj[i].createtime);
					bnts += '<input type=\"button\" onclick=\'test1('+obj[i].logistics_id+','+obj[i].taobao_itemid+')\' value='+obj[i].logistics_id+strState+'>';
				}
			$("#divtb"+goodsid).html(bnts);
			$("#divftsj"+goodsid).html("下单时间:"+createtime);
			
	//		$("#divtb9114").html(bnts);
			}else{
				//alert(data)
			}
				
	}});
}


//点击快递单号
function test1(logistics_id,taobao_itemid){
	//alert($('#divcss1').is(":hidden") );
	 if ( event && event.stopPropagation ) { 
         // this code is for Mozilla and Opera 
	    event.stopPropagation(); 
	} 
	else if (window.event) { 
         // this code is for IE 
	    window.event.cancelBubble = true; 
	}
	//点击div之外任意地方隐藏 div
	$(document).click(function(){
	     var wx = window.event.clientX;
	     var wy = window.event.clientY;
	     var d_left = document.getElementById('divcss1').offsetLeft;
		 var d_top = document.getElementById('divcss1').offsetTop;
		 var d_width = document.getElementById('divcss1').clientWidth;
		 var d_height = document.getElementById('divcss1').clientHeight;
		 if(wx < d_left || wy < d_top || wx > (d_left + d_width) || wy > (d_top + d_height)){
		 	$('#divcss1').hide();
		 }
	});
	//查询订单
	 $.ajax({
		 type:'get',
		 dataType:"text",
		 url:'warehouse/getlogisticsinfo.do',
		 data:{logistics_id:logistics_id,taobao_itemid:taobao_itemid},
		 success:function(data){
		
			 /*
			 var map = eval("("+data+")");

			 $.each(map[0],function(key,value) {   
                 
				    if(key == 'lgis'){
				    	//$("#tb_state").html(getState(value.tb_state));
				    	//$("#logistics_id").html(value.logistics_id);
				    	//$("#createtime").html(value.createtime);
	
				    }else{
				    	
				    }

				    
			});
			*/
			 $('#divcss1').html(data);
			$('#divcss1').show();
			 
		 }
	 });
	 
//	if($('#divcss1').is(":hidden")  == true){
//		
//	}
	
}





//**************************综合采购部分结束*****************************

//**************************出库审核开始***********************************
//设置表格行颜色
function altRows(id){
	if(document.getElementsByTagName){  
		
		var table = document.getElementById(id);  
		var rows = table.getElementsByTagName("tr"); 
		 
		for(i = 1; i < rows.length; i++){          
			if(i % 2 == 0){
				rows[i].className = "evenrowcolor";
			}else{
				rows[i].className = "oddrowcolor";
			}      
		}
	}
}

//查询 提交
function aSubmit(){
	document.getElementById("idForm").submit();
}

//清空查询条件
function cleText(){
//	document.getElementById("idname").value="";
	$('input[type=text]').val("");
}

//显示问题div
function showProblemDiv(trid){
	//保存

	//显示问题div  
	if( $("#showProblemDiv"+trid).css('display')=='none'){
		$("#showProblemDiv"+trid).show();
	}else{
		$("#showProblemDiv"+trid).hide();
	}
	var h_orderstruts = $("#h_orderstruts").val();
	
	
	if(h_orderstruts == '1') {
		
	
		//验证通过不能点击
		if($("#bYzbtg").attr("disabled") == "disabled"){
			$('#bYzbtg').removeAttr("disabled"); 
		}else{
			$('#bYzbtg').attr('disabled',"true");
		}
	}
}

//审核通过
function auditPass(trid){

	if(trid !=0 ) { //如果 不等于0 表示继续通过进来的，那就需要隐藏问题div
		$("#showProblemDiv"+trid).hide();
	}
	
    setTimeout(function () { 
       
   
	
	//验证通过可以点击
	
	//下面插入数据到 待出库表
	
	insertOrderFee(4,trid,"");
    }, 3000);
		
}

//审核不通过  
function auditNotPass(trid){
	//验证通过可以点击
	
	//隐藏问题
	$("#showProblemDiv"+trid).hide();
	//插入问题到问题表

	//问题
	var userid = $("#h_userid").val();
	var orderid = $("#h_orderno").val();
	var problem = $("#problem"+userid+orderid).val();
	//alert("问题描述"+problem);
	//下面插入数据到 待出库表
	insertOrderFee(3,trid,problem);
	
}

//重新审核  delete
function deleteSh(orderid){
	$.ajax({
		type:"GET", 
		url:"delteFromOrderFeeByOrderid.do",
		dataType:"text",
		data:{orderid : orderid},
		success : function(data){  //返回受影响的行数
			if(data>0){
				showMsg("msgid"+orderid,"<h1 style='color: red;'>操作成功</h1>");
				 setTimeout(function () { 
					 aSubmit();
				    }, 1000);
			}else{
				showMsg("msgid"+orderid,"<h1 style='color: red;'>操作失败</h1>");
			}
		}
	});
}

//取消合并  
function updateHb(mergeOrders){
	$.ajax({
		type:"GET", 
		url:"updateFromOrderFeeByOrderid.do",
		dataType:"text",
		data:{mergeOrders : mergeOrders},
		success : function(data){  //返回受影响的行数
			if(data>0){
				showMsg("msgid"+mergeOrders,"<h1 style='color: red;'>操作成功</h1>");
				 setTimeout(function () { 
					 aSubmit();
				    }, 1000);
			}else{
				showMsg("msgid"+mergeOrders,"<h1 style='color: red;'>操作失败</h1>");
			}
		}
	});
}

//公用提示信息
function showMsg(id,msg){
//	$("#"+id).html(msg).hide(2000);// 这个是渐渐消失 
//	$("#"+id).html(msg).fadeTo(3000).hide(); //这个是让他显示5秒（实际就是没有改变透明度）
	$("#"+id).html(msg).show(800).delay(1000).hide(300); 
	//	$("#"+id).html(msg).show(200).delay(1000).hide(300); 
}

//插入数据到待出库表
function insertOrderFee(state,trid,problem){
	//用户id  用户订单id  状态
	var userid = $("#h_userid").val();
	var orderid = $("#h_orderno").val();
	
	$.ajax({
		type:"GET", 
		url:"insertOrderfee.do",
		dataType:"text",
		data:{userid : userid ,orderid : orderid ,state : state,problem:problem},
		success : function(data){  //返回受影响的行数
			
			if(data > 0){
				/*	
				  动态删除 增加行 有bug  先注释
				var id = $("#h_userid").val();
				//删除之前保存 "合并" 的列  
			//	alert($("#rowspanid"+id).size());
			//	alert($("#rowspanid"+id).size());
				//求出之前合并的长度
				var spantd = $("#trid"+trid).find("td:last");
				var spantdlen = spantd.attr("rowspan")-1;
			//	var trobj = $("#trid"+trid).next().find("td").eq(2)
				$("#trid"+trid).remove(); //删除行
			//	alert($("#tr2"+id).next());
				var  isCz = $("#h_isRemoveTr"+id).size();
				if(isCz == 0){
				//	h_userid
				//	alert("删除行了");
					$("#tr1"+id).remove(); //删除行
					$("#tr2"+id).remove(); //删除行
				}else{
					//进到这里表示还有 订单还处理完 ，如果合并按钮不见了，就加入进来
					//判断合并列是否也被删除
					var trida = $("#h_orderno").val();
					isCz = $("#rowspanid"+trida).size();
					if(isCz == 0){
					//	alert("添加合并列");
					//	$("#tr2"+id).next().append(;
				//		$(" <td id='rowspanid"+trida+"'  rowspan='"+spantdlen+"' ><input type='button' onclick='' class='classSh' value='合并'/></td>").insertAfter(trobj);
					//	$(" <td id='rowspanid"+trida+"'  rowspan='"+spantdlen+"' ><input type='button' onclick='' class='classSh' value='合并'/></td>").insertAfter($("#tr2"+id).next().next().find("td").eq(2));
					}
				}
				*/
		//		$("#spanId").click();//刷新页面
				showMsg("msgid"+orderid,"<h1 style='color: red;'>操作成功</h1>");
				 setTimeout(function () { 
					 aSubmit();
				    }, 1000);
				
				
			}else{
				showMsg("msgid"+orderid,"<h1 style='color: red;'>操作失败</h1>");
				alert("操作失败");
			}
		}
	});
}


//插入数据到待出库表
function batchInsertSP(len){
	//用户id  用户订单id  状态
	//获得用户id
	var userid = $("#h_userid").val();
	//获得需要合并的订单
	var list = new Array();
	var orderid ="0";// $("#h_orderno").val();
	
	//
	var mergestate = $("#mergestate"+$("#h_orderno").val()).val();
	var i=0;
	          
	//            
	if(mergestate == "0"){ //为、未合并
		
		orderid =$("#h_orderno").val();
		list.push(orderid);             
	}else{
		var test = $("input[name='orders"+userid+"']").each(function(){
			list.push($(this).val()); 
			if(i==0){
				orderid=$(this).val();
			}
			i++;
		})                   
	}   
//	alert(mergestate);
//	alert(orderid);                     
//	alert($("#h_orderno").val());       
	                            
	
	var length = len;
	if(len==0){
		length = $("#splitQuantity"+orderid).val();
	}
	var mainMap={};  //主
	mainMap['list']=list;  							
	mainMap['orderid']=orderid; 				
	mainMap['userid']=userid;					
	mainMap['length']=length+""; 
	
//	$("#batchInsertSPId"+orderid).val("正在处理...")
    
	$.ajax({
		type:"post",             
		url:"batchInsertSP",      
		dataType:"text",
		contentType : 'application/json;charset=utf-8', 
		data:JSON.stringify(mainMap),
		success : function(data){  //返回受影响的行数
			if(data>0){
			//	$("#batchInsertSPId"+orderid).val("取消拆分")
				showMsg("msgid"+orderid,"<h1 style='color: red;'>操作成功</h1>");
				 setTimeout(function () { 
					 aSubmit();
				    }, 1000);
			}
		}
	});
}

//取消拆分
function deleteShippingPackage(){
	//用户id  用户订单id  状态
	var orderid = $("#h_orderno").val();
	$("#batchInsertSPId"+orderid).val("正在处理...")
	$.ajax({
		type:"GET",             
		url:"deleteShippingPackage",      
		dataType:"text",
		data:{length : length ,orderid : orderid},
		success : function(data){  //返回受影响的行数
			if(data>0){
			//	$("#batchInsertSPId"+orderid).val("取消拆分")
				showMsg("msgid"+orderid,"<h1 style='color: red;'>操作成功</h1>");
				 setTimeout(function () { 
					 aSubmit();
				    }, 1000);
			}
		}
	});
}
function testAjax(){
	$.ajax({ 
	    type: "post", 
	    url: "Default.aspx", 
	    dataType: "json", 
	    success: function (data) { 
	            $("input#showTime").val(data[0].demoData); 
	    }, 
	    error: function (XMLHttpRequest, textStatus, errorThrown) { 
	            alert(errorThrown); 
	    } 
	});
}   
 
//合并订单
function mergeOrders(){
	//获得用户id
	var userid = $("#h_userid").val();
	//获得需要合并的订单
	var ordersArr = new Array();
	var test = $("input[name='orders"+userid+"']").each(function(){
		ordersArr.push($(this).val()); 
	})
	
//	var ordersArr = new Array();
//	
//	
//	$("input[id^='inputPrintid']").each(function(){
//		//disabled
//		if($(this).prop("checked") == true){
//		//	alert($(this).val());
//			ordersArr.push($(this).val()); 
//		}
//	});
//	if(ordersArr.length < 1){
//		$.messager.show(0, '请选择需要合并的订单',1800).hide(200);
//		return;
//	}
//	return;
	$.ajax({
		type:'post',
		url:'selectOrderidAddress.do',
		data:{'ordersArr':ordersArr,'userid':userid},
		traditional :true,
		success:function(data){
			if(data == '1'){
				showMsg("msgid"+ordersArr[0],"<h1 style='color: red;'>操作成功</h1>");
				 setTimeout(function () { 
					 aSubmit();
				    }, 1000);
				
			//	aSubmit();
				
			}else{
				showMsg("msgid"+ordersArr[0],"<h1 style='color: red;'>操作失败</h1>");
			
			}
	}});
	
	
}

//查询订单收货地址
function getOrderAddress(){
	//traditional true 这个用来传数组 然后request.getParameterValues 就能取到值
	$.ajax({
		type:'get',
		url:'selectOrderidAddress.do',
		traditional :true,
		success:function(data){
			if(data == '1'){
				alert("合并成功");
			}else{
				alert("失败成功");
			}
	}});
	
		
}

//鼠标移动到某一行保存userid 用户订单
function buttonMouseover(userid,orderno){
	
	$("#h_userid").val(userid);
	$("#h_orderno").val(orderno);
	
}

//根据属性设置禁用
function setButtonDisabled(attr){
	
	$(attr).each(function(){
		//disabled
		if($(this).attr)
			$(this).hide();   //隐藏
		//$(this).attr("disabled","true"); //禁用
	});
}

function setButtonDisabled2(attr){
	
	$(attr).each(function(){
		//disabled
		if($(this).attr)
			$(this).attr("disabled",true);   //禁用
		//$(this).attr("disabled","true"); //禁用
	});
}

//全选
function selChecked(){
//	alert("1"); allSelcheckid
//prop  获得特性  http:/ /www.bubuko.com/infodetail-956808.html
//	alert());
	$("input[id^='inputPrintid']").each(function(){
		//disabled
		if($("#allSelcheckid").prop("checked") == true){
			 $(this).prop("checked","true");
			// alert($(this).prop("value"));
		}else{
			$(this).removeProp("checked");
		}
		
	});
	
}

//打印
function print(){
	//获取所有选中的订单
	var ordersArr = new Array();
	
	
	$("input[id^='inputPrintid']").each(function(){
		//disabled
		if($(this).prop("checked") == true){
			//alert($(this).val())
			ordersArr.push($(this).val()); 
		}
	});
	if(ordersArr.length < 1){
		return;
	}
	window.open("OrderPrint.do?ordersArr="+ordersArr,"windows");
	
	
	
}



//**************************出库审核结束***********************************



//******************************采购头部消息*************************************
function getOrderInfoCountByState(state){
	//alert(state);
	$.ajax({
		type:"post", 
		url:"warehouse/getOrderInfoCountByState.do",
		data:{state:state},
		dataType:"text",
		success : function(data){ 
			if(data != '0'){
				if(state=="C" || state=="D" || state=="E"){ //扫描入库特殊处理
					var obj = eval("("+data+")");
					//	alert(obj.ordernonum+"---"+obj.ordernoarray);
						var aHtml = "<a href='javascript:void(0)' onclick=\"$('#idtypes').val('2');FnSearch('"+state+"')\">"+obj.ordernonum+"</a>"
						
						$("#tbzt_"+state).html(aHtml);
						$("#h_tbzt_"+state).val(obj.ordernoarray);
				}else{
					var obj = eval("("+data+")");
					//	alert(obj.ordernonum+"---"+obj.ordernoarray);
						var aHtml = "<a href='javascript:void(0)' onclick=\"$('#idtypes').val('1');FnSearch('"+state+"')\">"+obj.ordernonum+"</a>"
						$("#sid_"+state).html(aHtml);
						$("#h_sid_"+state).val(obj.ordernoarray);
				}
			}
		}
	});
}

//采购物流信息      
function getTb1688State(state){
	//alert(state);
	$.ajax({
		type:"post", 
		url:"warehouse/getTb1688State.do",
		data:{orderstatus:state},
		dataType:"text",
		success : function(data){ 
		//	alert(data);
			if(data != '0'){
				//alert(data);              
				var obj = eval("("+data+")");
			//	alert(obj.ordernonum+"---"+obj.ordernoarray);      
				var aHtml = "<a href='javascript:void(0)' onclick=\"$('#idtypes').val('2');FnSearch('"+state+"')\">"+obj.num+"</a>"
				$("#tbzt_"+state).html(aHtml);
				$("#h_tbzt_"+state).val(obj.ord);
			}
		}
	});
}
