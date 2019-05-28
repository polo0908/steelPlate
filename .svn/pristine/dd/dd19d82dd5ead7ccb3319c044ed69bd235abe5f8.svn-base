//<script type="text/javascript" src="${path}/js/warehousejs/tbGoodsSample.js"></script>
$(document).ready(function(){  //加载完成
	getTbGoodsSample('')  //样品表格数据加载
	getAliCategory();
	
})

//添加样品
function insertTbGoodsSample(){
	
	var cid = $("#cid").val();
	var category = $("#category").val();
	var title = $("#title").val();
	var viewimg = $("#viewimg").val();
	var discount = $("#discount").val();
	var ymx_discount = $("#ymx_discount").val();
	if(ymx_discount==''){
		ymx_discount=0;
	}
	var discountprice = $("#discountprice").val();
	if(discountprice==''){
		discountprice=0;
	}
	var minnum = $("#minnum").val();
	var defaultnum = $("#defaultnum").val();
	var remark = $("#remark").val();
	
	$.ajax({
		type:"post", 
		url:"insertTbGoodsSample.do",
		data:{ymx_discount:ymx_discount,cid:cid,category:category,title:title,viewimg:viewimg,
			discount:discount,discountprice:discountprice,
			minnum:minnum,defaultnum:defaultnum,remark:remark}, 
		dataType:"text",
		success : function(data){  
			if(data=="1000"){
				getTbGoodsSample(''); 
			}else{
				//失败
				alert("失败");
			}
		}
	});
}

//清空样品
function emptyAllText(){
	$("#d_sampleInfo input[type='text']").val("");
}

//清空样品
function emptyDsdAllText(){
	$("#d_gsdInfo input[type='text']").val("");
}



//读取商品根据id
function getGoodsDataById(){
	var val = $("#idOrUrl").val();
	$.ajax({
		type:"post", 
		url:"getGoodsDataById.do",
		data:{id:val,url:val}, 
		dataType:"text",
		success : function(data){ 
			var obj = eval("("+data+")");
			
			
			$("#gsd_goodsid").val(obj.id);
			$("#gsd_goodsname").val(obj.name);
			$("#gsd_goodsurl").val(obj.url);
			
			var img = obj.img;
			if(img.length>3){
				if(img.indexOf(",")!=-1){
					img = img.substring(1,img.indexOf(","));
				}else{
					img = img.substring(1,img.length-1);
				}
			}       
			
			$("#gsd_goodsimg").val(img);
			var sPrice = obj.sPrice;
			if(sPrice.indexOf(" ")!=-1){
				sPrice = sPrice.substring(0,sPrice.indexOf(" "));
			}
			var discount = 100;
			var ymx_discount = 120
			try
			{
				discount = Number($("#discount").val());
			//	ymx_discount = Number($("#ymx_discount").val());
				
			   //在此运行代码
			}
			catch(err)
			{
			   //在此处理错误
			}
		//	$("#gsd_amazongoosprice").val(ymx_discount*sPrice/100);
			$("#gsd_goodsprice").val(discount*sPrice/100);
			$("#gsd_amazongoosid").val("");
			
			
			$("#gsd_flag").val("1");
			
		//	$("#gsd_cid").val("");
		//	$("#gsd_cidpath").val("");
		//	$("#gsd_category").val("");
			$("#gsd_type").val("0");
			if(obj.weight.indexOf("kg")!=-1){
				obj.weight = obj.weight.substring(0,obj.weight.indexOf("kg"));
			}
			$("#gsd_weight").val(obj.weight);
			$("#gsd_originalprice").val(sPrice);
			
		}
	});
}
//手动计算价格
function JsPrice(sPrice){
	var discount = 100;
	var ymx_discount = 120;
	try
	{
		discount = Number($("#discount").val());
	//	ymx_discount = Number($("#ymx_discount").val());
	   //在此运行代码
	}
	catch(err)
	{      
	   //在此处理错误
	}                  

	$("#gsd_goodsprice").val(discount*sPrice/100);
//	$("#gsd_amazongoosprice").val(ymx_discount*sPrice/100);
	
}


//样品数据表格
function getTbGoodsSample(title){
	
	$.ajax({   
		type:"post", 
		url:"getTbGoodsSample.do",
		data:{title:title}, 
		dataType:"text",
		success : function(data){  
			var t= false;
			var objlist = eval("("+data+")");
			$("#table_id").html("");
			var newRow ="";
			newRow = "<tr> "+
			"<td width='169px'>" +
				"样品名称"+
			"</td>"+
			"</tr>";
			$('#table_id').append(newRow); 
			for(var i=0; i<objlist.length; i++){
				newRow = "<tr> "+
								"<td id='userid"+objlist[i].id+"'>" +
								"<a id='order_no"+i+"' href='javascript:void(0);' onclick=\"getTbGoodsSampleById('"+objlist[i].id+"')\" >"+objlist[i].title+"</a>"+
								"</td>"+
							"</tr>";
				 $('#table_id').append(newRow);  
				 t = true;
			}
			//有值 查询第一个
			if(t){
				getTbGoodsSampleById(objlist[0].id);
				
			}
			
		
		}
	});
}


//样品所有商品数据表格
function getTbGoodsSampleDetails(goodssampleid){
	$("#h_sample_id").val(goodssampleid);// 保存样品id  用来删除商品之后 在刷新 样品对应所有商品
	$.ajax({   
		type:"post", 
		url:"getTbGoodsSampleDetails.do",
		data:{goodssampleid:goodssampleid}, 
		dataType:"text",
		success : function(data){  
			var objlist = eval("("+data+")");
			$("#t_GoodsSampleDetails").html("");
			var newRow ="";
			newRow = "<tr> ";
			for(var i=0; i<objlist.length; i++){
//				商品图片<br/>
//				商品规格<br/>
//				商品价格<br/> 
				newRow +=
								"<td id='userid"+objlist[i].id+"'>" +
								"<img onclick=\"getTbGoodsSampleDetailsById('"+objlist[i].id+"')\" width='150px' height='150px' src='"+objlist[i].goodsimg+"'/><br/>"+
								""+objlist[i].goodsname+"<br/>"+
								""+objlist[i].goodsprice+"<br/>"+
								"<input onclick=\"delteCommodityByid('"+objlist[i].id+"')\" type='button' value='删除'/>"+
								"</td>";
				if((i+1)%3 == 0){
					$('#t_GoodsSampleDetails').append(newRow+"</tr>");  
					newRow = "<tr> ";
				}
			}
			newRow += "</tr>";
			 
			 $('#t_GoodsSampleDetails').append(newRow);  
		}
	});
}
//删除单个商品根据id
function delteCommodityByid(id){
//	alert(id);
	$.ajax({
		type:"post", 
		url:"delteCommodityByid.do",
		data:{id:id}, 
		dataType:"text",
		success : function(data){ 
			
			if(data == "1000"){
				getTbGoodsSampleDetails($("#h_sample_id").val()) //刷新商品
			}else{
				alert("失败")
			}
		}
	});
}


//插入单个商品根据id
function insertTbGoodsSampleDetails(){
//	$("#gsd_goodssampleid").val(objlist.goodssampleid);
//	$("#gsd_goodsid").val(objlist.goodsid);
//	$("#gsd_goodsname").val(objlist.goodsname);
//	$("#gsd_goodsurl").val(objlist.goodsurl);
//	$("#gsd_goodsimg").val(objlist.goodsimg);
//	$("#gsd_goodsprice").val(objlist.goodsprice);
//	$("#gsd_amazongoosid").val(objlist.amazongoosid);
//	$("#gsd_amazongoosprice").val(objlist.amazongoosprice);
//	$("#gsd_cid").val(objlist.cid);
//	$("#gsd_cidpath").val(objlist.cidpath);
//	$("#gsd_category").val(objlist.category);
	
	//var id = $("#h_gsd_id").val();
	var goodssampleid = $("#h_sample_id").val();
	var goodsid = $("#gsd_goodsid").val();
	var goodsname = $("#gsd_goodsname").val();
	var goodsurl = $("#gsd_goodsurl").val();
	var goodsimg = $("#gsd_goodsimg").val();
	var goodsprice = $("#gsd_goodsprice").val();
	var amazongoosid = $("#gsd_amazongoosid").val();
	var amazongoosprice = $("#gsd_amazongoosprice").val();
	if(amazongoosprice==''){
		amazongoosprice = 0;
	}
	var originalprice = $("#gsd_originalprice").val();
	var flag = $("#gsd_flag").val();
	
	
//	var cid = $("#gsd_cid").val();
//	var cidpath = $("#gsd_cidpath").val();
//	var category = $("#gsd_category").val();
	
	var type = $("#gsd_type").val();
	var weight = $("#gsd_weight").val();
	
//	alert(id);
	$.ajax({
		type:"post", 
		url:"insertTbGoodsSampleDetails.do",
		data:{flag:flag,originalprice:originalprice,weight:weight,type:type,goodssampleid:goodssampleid,goodsid:goodsid,goodsname:goodsname,goodsurl:goodsurl,
			goodsimg:goodsimg,goodsprice:goodsprice,
			amazongoosid:amazongoosid,amazongoosprice:amazongoosprice//,cid:cid,cidpath:cidpath,category:category
			}, 
		dataType:"text",
		success : function(data){ 
			
			if(data == "1000"){
			//	alert("成功")
				getTbGoodsSampleDetails($("#h_sample_id").val());
			}else{
				alert("失败")
			}
		}
	});
}

//修改单个商品根据id
function updateTbGoodsSampleDetailsByid(){
//	$("#gsd_goodssampleid").val(objlist.goodssampleid);
//	$("#gsd_goodsid").val(objlist.goodsid);
//	$("#gsd_goodsname").val(objlist.goodsname);
//	$("#gsd_goodsurl").val(objlist.goodsurl);
//	$("#gsd_goodsimg").val(objlist.goodsimg);
//	$("#gsd_goodsprice").val(objlist.goodsprice);
//	$("#gsd_amazongoosid").val(objlist.amazongoosid);
//	$("#gsd_amazongoosprice").val(objlist.amazongoosprice);
//	$("#gsd_cid").val(objlist.cid);
//	$("#gsd_cidpath").val(objlist.cidpath);
//	$("#gsd_category").val(objlist.category);
	
	var id = $("#h_gsd_id").val();
//	var goodssampleid = $("#gsd_goodssampleid").val();
	var goodsid = $("#gsd_goodsid").val();
	var goodsname = $("#gsd_goodsname").val();
	var goodsurl = $("#gsd_goodsurl").val();
	var goodsimg = $("#gsd_goodsimg").val();
	var goodsprice = $("#gsd_goodsprice").val();
	var amazongoosid = $("#gsd_amazongoosid").val();
	var amazongoosprice = $("#gsd_amazongoosprice").val();
	if(amazongoosprice==''){
		amazongoosprice = 0;
	}
	var flag = $("#gsd_flag").val();
	
//	var cid = $("#gsd_cid").val();
//	var cidpath = $("#gsd_cidpath").val();
//	var category = $("#gsd_category").val();
	var type = $("#gsd_type").val();
	var weight = $("#gsd_weight").val();
	var originalprice = $("#gsd_originalprice").val();
	
	$.ajax({
		type:"post", 
		url:"updateTbGoodsSampleDetailsByid.do",
		data:{flag:flag,originalprice:originalprice,weight:weight,type:type,id:id,goodsid:goodsid,goodsname:goodsname,goodsurl:goodsurl,
			goodsimg:goodsimg,goodsprice:goodsprice,
			amazongoosid:amazongoosid,amazongoosprice:amazongoosprice//,cid:cid,cidpath:cidpath,category:category
			}, 
		dataType:"text",
		success : function(data){ 
			
			if(data == "1000"){
			//	alert("成功")
				getTbGoodsSampleDetails($("#h_sample_id").val());
			}else{
				alert("失败")
			}
		}
	});
}
//修改单个样品根据id
function updateTbGoodsSampleByid(){
	var cid = $("#cid").val();
	var category = $("#category").val();
	var title = $("#title").val();
	var viewimg = $("#viewimg").val();
	var discount = $("#discount").val();
	var ymx_discount = $("#ymx_discount").val();
	
	var discountprice = $("#discountprice").val();
	if(discountprice==''){
		discountprice=0;
	}
	if(ymx_discount==''){                 
		ymx_discount=0;
	}
	
	var minnum = $("#minnum").val();
	var defaultnum = $("#defaultnum").val();
	var remark = $("#remark").val();
//	alert(id);
	$.ajax({
		type:"post", 
		url:"updateTbGoodsSampleByid.do",
		data:{ymx_discount:ymx_discount,cid:cid,id:$("#h_sample_id").val(),category:category,title:title,viewimg:viewimg,
			discount:discount,discountprice:discountprice,
			minnum:minnum,defaultnum:defaultnum,remark:remark}, 
		dataType:"text",
		success : function(data){ 
			
			if(data == "1000"){
				alert("成功")
			//	getTbGoodsSampleDetails($("#h_sample_id").val()) //刷新商品
			}else{
				alert("失败")
			}
		}
	});
}
//批量导入
function batchImportTbGSD(){
	var goodssampleid = $("#h_sample_id").val();
	var profit = $("#discount").val();
	var useridORorderid = $("#useridORorderid").val();

	$("#msg_p").html("正在处理....");
	$.ajax({
		type:"post", 
		url:"batchImportTbGSD.do",
		data:{goodssampleid:goodssampleid,
			profit:profit,
			useridORorderid:useridORorderid}, 
		dataType:"text",
		success : function(data){ 
			if(data > 0){
				$("#msg_p").html("导入成功");
				getTbGoodsSampleDetails($("#h_sample_id").val());
			}else{
				$("#msg_p").html("导入失败");
			}
			
			setTimeout(function () { 
				$("#msg_p").html("");
			 }, 3000);
		}
	});
}

//单件商品信息
function getTbGoodsSampleDetailsById(id){
	//保存商品id  用来做修改
	$("#h_gsd_id").val(id);
	$.ajax({
		type:"post", 
		url:"getTbGoodsSampleDetailsById.do",
		data:{id:id}, 
		dataType:"text",
		success : function(data){  
//			<td>基本样品表id</td>  
//			<td><input type="text" id="gsd_goodssampleid"/></td>
//			<td>产品id</td>  
//			<td><input type="text" id="gsd_goodsid"/></td>
//			<td>产品名字</td>  
//			<td><input type="text" id="gsd_goodsname"/></td>
//			<td>goodsurl</td>  
//			<td><input type="text" id="gsd_goodsurl"/></td>
//			<td>goodsimg</td>  
//			<td><input type="text" id="gsd_goodsimg"/></td>
//			<td>原价</td>  
//			<td><input type="text" id="gsd_goodsprice"/></td>
//			<td>亚马逊货号</td>  
//			<td><input type="text" id="gsd_amazongoosid"/></td>
//			<td>亚马逊价格</td>
//			<td><input type="text" id="gsd_amazongoosprice"/></td>
//			<td>cid</td>  
//			<td><input type="text" id="gsd_cid"/></td>
//			<td>cidpath</td>
//			<td><input type="text" id="gsd_cidpath"/></td>
//			<td>category</td>
//			<td><input type="text" id="gsd_category"/></td>
			var objlist = eval("("+data+")");
			$("#gsd_goodssampleid").val(objlist.goodssampleid);
			$("#gsd_goodsid").val(objlist.goodsid);
			$("#gsd_goodsname").val(objlist.goodsname);
			$("#gsd_goodsurl").val(objlist.goodsurl);
			$("#gsd_goodsimg").val(objlist.goodsimg);
			$("#gsd_goodsprice").val(objlist.goodsprice);
			$("#gsd_amazongoosid").val(objlist.amazongoosid);
			$("#gsd_amazongoosprice").val(objlist.amazongoosprice);
		//	$("#gsd_cid").val(objlist.cid);
		//	$("#gsd_cidpath").val(objlist.cidpath);
		//	$("#gsd_category").val(objlist.category);
			$("#gsd_type").val(objlist.type);
			$("#gsd_weight").val(objlist.weight);
			$("#gsd_originalprice").val(objlist.originalprice);
			$("#gsd_flag").val(objlist.flag);
			
		}
	});
}

//删除样品
function deleteTbGoodsSample(){
	if(!confirm("确定要删除吗"))
	{        
		return;
	}
	$.ajax({
		type:"post", 
		url:"deleteTbGoodsSample.do",
		data:{id:$("#h_sample_id").val()},
		dataType:"text",
		success : function(data){  
			if(data == "1000"){
				getTbGoodsSample('') //刷新样品
			}else{
				alert("失败")
			}
		}
	});
}

//获得样品下一级类型
function getSubType(){
	var id = $('#sel').val();
	$("#category").val($('#sel').find("option:selected").text());
	$("#cid").val(id);
	$.ajax({
		type:"post", 
		url:"getSubType.do",
		data:{id:id},
		dataType:"text",
		success : function(data){  
			var objlist = eval("("+data+")");
			var sel="<br id='brsel'/><select id='sel2' onchange='getSubType2()'>";
			sel += "<option >请选择</option>";
			var i=0
			for(; i<objlist.length; i++){
				sel += "<option value='"+objlist[i].cid+"'>"+objlist[i].category+"</option>";
			}
			sel += "</select>";
			      
			if(i>0){
				
				$("#brsel").remove();
			
				$("#sel2").remove();
				$('#sel').after(sel);
			}
		}
	});
}              

//获得样品下一级类型2
function getSubType2(){
	var id = $('#sel2').val();
	$("#category").val($('#sel2').find("option:selected").text());
	$("#cid").val(id);
//	$.ajax({
//		type:"post", 
//		url:"getSubType2.do",
//		data:{id:id},
//		dataType:"text",
//		success : function(data){  
//			var objlist = eval("("+data+")");
//			var sel="<br id='brsel2'/><select id='sel3' onchange=''>";
//			var i=0
//			for(; i<objlist.length; i++){
//				sel += "<option value='"+objlist[i].cid+"'>"+objlist[i].category+"</option>";
//			}
//			sel += "</select><br id='brsel22'/>";
//			      
//			if(i>0){
//				
//				$("#brsel2").remove();
//				$("#brsel22").remove();
//				$("#sel3").remove();
//				$('#sel2').after(sel);
//			}
//		}
//	});
}
//获得样品类型
function getAliCategory(){
	$.ajax({
		type:"post", 
		url:"getAliCategory.do",
		dataType:"text",
		success : function(data){  
			var objlist = eval("("+data+")");
			for(var i=0; i<objlist.length; i++){
				$("#sel").append("<option value='"+objlist[i].cid+"'>"+objlist[i].category+"</option>");
			}
		}
	});
}
//查询单个样品信息,以及样品的所有商品信息
function getTbGoodsSampleById(id){
	//清空样品
		$("#d_sampleInfo input[type='text']").val("");

		$("#d_gsdInfo input[type='text']").val("");

	$.ajax({
		type:"post", 
		url:"getTbGoodsSampleById.do",
		data:{id:id}, 
		dataType:"text",
		success : function(data){  
			var objlist = eval("("+data+")");
			$("#category").val(objlist.category);
			$("#title").val(objlist.title);
			$("#viewimg").val(objlist.viewimg);
			$("#discount").val(objlist.discount);
			$("#ymx_discount").val(objlist.ymx_discount);
			$("#discountprice").val(objlist.discountprice);
			$("#minnum").val(objlist.minnum);
			$("#defaultnum").val(objlist.defaultnum);
			$("#remark").val(objlist.remark);
			$("#cid").val(objlist.cid);
			
			
			getTbGoodsSampleDetails(id) //查询样品对应所有商品信息
//			<td>样品类型id</td>
//			<td><input type="text" id="cid"/></td>
//			<td>样品类型名字</td>  
//			<td><input type="text" id="category"/></td>
//			<td>样品标题</td>
//			<td><input type="text" id="title"/></td>
//			<td>样品图片</td>
//			<td><input type="text" id="viewimg"/></td>
//			<td>整体折扣(%)</td>
//			<td><input type="text" id="discount"/></td>
//			<td>商品价格总和</td>
//			<td><input type="text" id="discountprice"/></td>
//			<td>最低数量</td>
//			<td><input type="text" id="minnum"/></td>
//			<td>初始数量</td>
//			<td><input type="text" id="defaultnum"/></td>
//			<td>备注</td>  
//			<td><input type="text" id="remark"/></td>
		
		}
	});
}

//添加样品   已取消使用
function addSample(){
	//alert("123");
	 if ( event && event.stopPropagation ) { 
	    event.stopPropagation(); 
	} 
	else if (window.event) { 
	    window.event.cancelBubble = true; 
	}
	//点击div之外任意地方隐藏 div
	$(document).click(function(){
	     var wx = window.event.clientX;
	     var wy = window.event.clientY;
	     var d_left = document.getElementById('t_sample_add').offsetLeft;
		 var d_top = document.getElementById('t_sample_add').offsetTop;
		 var d_width = document.getElementById('t_sample_add').clientWidth;
		 var d_height = document.getElementById('t_sample_add').clientHeight;
		 if(wx < d_left || wy < d_top || wx > (d_left + d_width) || wy > (d_top + d_height)){
		 	$('#t_sample_add').hide();
		 }
	});
	$('#t_sample_add').show();
}