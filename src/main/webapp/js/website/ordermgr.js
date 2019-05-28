
	
	function showLeftTime() {
		var now = new Date();
		var year = now.getFullYear();
		var month = now.getMonth() + 1;
		var day = now.getDate();
		var hours = now.getHours();
		var minutes = now.getMinutes();
		var seconds = now.getSeconds();
		document.getElementById("time1").innerHTML = "当前时间：" + year + "年"
				+ month + "月" + day + "日 " + hours + ":" + minutes + ":"
				+ seconds + "";
		//一秒刷新一次显示时间
		var timeID = setTimeout(showLeftTime, 1000);
		d = new Date(); //创建一个Date对象 
		localTime = d.getTime();
		localOffset = d.getTimezoneOffset() * 60000; //获得当地时间偏移的毫秒数 
		utc = localTime + localOffset; //utc即GMT时间 
		offset1 = -5; //以夏威夷时间为例，东10区 
		server = utc + (3600000 * offset1);
		nd = new Date(server);
		offset2 = -7;
		paypal = utc + (3600000 * offset2);
		nd2 = new Date(paypal);

		var year2 = nd.getFullYear();
		var month2 = nd.getMonth() + 1;
		var day2 = nd.getDate();
		var hours2 = nd.getHours();
		var minutes2 = nd.getMinutes();
		var seconds2 = nd.getSeconds();
		document.getElementById("time2").innerHTML = "服务器时间：" + year2 + "年"
				+ month2 + "月" + day2 + "日 " + hours2 + ":" + minutes2 + ":"
				+ seconds2 + "";

		var year3 = nd2.getFullYear();
		var month3 = nd2.getMonth() + 1;
		var day3 = nd2.getDate();
		var hours3 = nd2.getHours();
		var minutes3 = nd2.getMinutes();
		var seconds3 = nd2.getSeconds();
		document.getElementById("time3").innerHTML = "Paypal时间：" + year3 + "年"
				+ month3 + "月" + day3 + "日 " + hours3 + ":" + minutes3 + ":"
				+ seconds3 + "";
	}
	
	document.onkeydown = function(event) {
		var e = event || window.event || arguments.callee.caller.arguments[0];
		if (e && e.keyCode == 13) {
			fn(1);
		}
	}
	//数据导出
	function exportExcel() {
		var str = "";
		var tab = $("#table tr").length;
		if (tab < 0) {
			alert("无数据导出");
			return;
		}
		for (var i = 0; i < tab; i++) {
			var tr = $("#table tr").eq(i);
			var td = tr.find("td").length;
			for (var j = 0; j < td - 1; j++) {
				var html = tr.find("td").eq(j).html();
				if (j == 1) {
					html = "'" + html;
				}
				str += html + ",";
			}
			str += "\n";
		}
		str = encodeURIComponent(str);
		var uri = 'data:text/csv;charset=utf-8,\ufeff' + str;
		var downloadLink = document.createElement("a");
		downloadLink.href = uri;
		downloadLink.download = "order.csv";
		document.body.appendChild(downloadLink);
		downloadLink.click();
		document.body.removeChild(downloadLink);
	}
	
	var isshowUnpaid;
	function fnInquiry(va,type){
		var strRoletype = strm;
		 var strAdmid = strname;
		var startdate = $("#startdate").val();
		var enddate = $("#enddate").val();
		var userid = $("#userid").val();
		var orderno = $("#orderno").val();
		var useremail = $("#useremail").val();
		var state = $("#state").val();
		var showUnpaid = $('#isShowUnpaid').prop('checked')==true?1:0;
		if(state == 0){
			showUnpaid = 1;
		}
		if (showUnpaid==null) {
			showUnpaid = 0;
		}
		isshowUnpaid = showUnpaid;
		var username = "";
		var admuserid;
		if ($("#adminusersc").val() == null) {
			admuserid =strAdmid ;
			if(strRoletype==0)
				{
				admuserid=0;
				}
		} else {
			admuserid = $("#adminusersc").val();
			
		}
		var buyuser;
		if ($("#buyuser").val() == null) {
			buyuser = 0;
		} else {
			buyuser = $("#buyuser").val();
		}
		if (va == 1) {
			page = 1;
		} else if (va == 2) {
			page = page + 1;
			if (count < page) {
				return;
			}
		} else if (va == 3) {
			page = page - 1;
			if (0 >= page) {
				page = 1;
				return;
			}
		} else if (va == 4) {
			page = $("#jump").val();
		}
		window.location.href="/cbtconsole/order/getOrderInfo.do?page="+page+"&userid="+userid+"&orderno="+orderno+"&email="+useremail+"&state="+state+"&buyuser="+buyuser+"&admuserid="+admuserid+"&startdate="+startdate+"&enddate="+enddate+"&showUnpaid="+isshowUnpaid+"&type="+type;
	}
	
	
	//判断是否为数字
	function IsNum(s) {
		if (s != null && s != "") {
			return !isNaN(s);
		}
		return false;
		document.cookie;
	}
	
	function reset() {
		$('#startdate').val('');
		$('#enddate').val('');
		$('#state').val('-2');
		$('#adminusersc').val('0');
		$('#buyuser').val('0');
		$('#orderno').val('');
		$('#userid').val('');
		$('#useremail').val('');
		fnInquiry(1,'');
	}
	
	
	
	
	function myfunction()
	{
		var isshowUnpaidCheckBox = showUnpaid;
		isshowUnpaid = isshowUnpaidCheckBox;
	
		if (isshowUnpaidCheckBox == 1) {			
			document.getElementById("isShowUnpaid").checked=true;
		}
	}
	/*function gotoPage(currentPage){
		$('#currentPage').val(currentPage);
	    	jQuery.ajax({
	    		dataType:"json",
	            url:"/cbtconsole/messages/showMessages",
	            data:{"currentPage":currentPage},
	            type:"post",
	            success:function(data){
	            	if(data.ok){
	                    var page = data.data;
	                    var messagesList = page.list;
	                    var currentPage = page.currentPage;
	                    var countPage  = page.countPage;
	                    var countRecord =page.countRecord;
	                    var messages = new Object();
	                    for(var i=0;i<messagesList.length;i++){
	                    	messages = messagesList[i];
	                       var htm_ ='';
	                       htm_+='<tr>';
	                       htm_+='<td >'+(i+1) +'</td> ';
	                       htm_+='<td >'+messages.typeName+'</td>';
	                       htm_+='<td >'+messages.userid+'</td> ';
	                       htm_+='<td >'+messages.title+'</td>';
	                       htm_+='<td >'+messages.content+'</td> ';
	                       htm_+='<td >'+messages.createTime+'</td>';
	                       htm_+='<td ><a href="#" onclick="javascript:toUrl('+messages.hrefName+')" target="_blank" >'+messages.hrefName+'</a></td>';
	                       if(messages.isDelete == 0){
	                    	   htm_ += '<td >新</td> ';
	                    	   htm_+='<td ><a href="#" onclick="javascript:deleteMessage('+messages.id+')">更改</a></td> ';
	                       }else{
	                    	   htm_ += '<td >已完成</td> ';
	                    	   htm_+='<td >&nbsp;&nbsp;&nbsp;</td> ';
	                       }
	                       htm_+='</tr> ';                           
	                        $("#settingall").append(htm_);
	                    }
	                    //消息分页
	                    var html_='共'+countRecord+'条记录，当前第'+currentPage+'/'+countPage+'页，每页显示20行.';
	                    var countPageHtml ='';
	                    if(countPage == 1){
	                    	countPageHtml=' <li><a href="#">当前只有一页</a></li>';
	                    }else if(currentPage==1){
	                    	countPageHtml='<li><a href="#" onclick="javascript:gotoPage('+(currentPage+1)+')">下一页</a></li>';
	                    }else if(countPage==currentPage){
	                    	countPageHtml ='<li><a href="#" onclick="javascript:gotoPage('+(currentPage-1)+')">上一页</a></li>';
	                    }else{
	                    	countPageHtml ='<li><a href="#" onclick="javascript:gotoPage('+(currentPage-1)+')">上一页</a></li>';
	                    	countPageHtml +='<li><a href="#" onclick="javascript:gotoPage('+(currentPage+1)+')">下一页</a></li>';
	                    }
	                    $('#pageshow').html(html_);
	                    $('#gopage').html(countPageHtml);
	                }else{
	    				 alert("消息列表查询失败！");
	    			}
	            },
	        	error:function(e){
	        		alert("消息列表查询失败！");
	        	}
	        });
	}	
	*/

function fnAddDate(datas,day){
	datas = new Date(datas);
	datas = +datas + 1000*60*60*24*day;
	datas = new Date(datas);
     //return d;
     //格式化
     return datas.getFullYear()+"-"+(datas.getMonth()+1)+"-"+datas.getDate();
}
//统计
function fnGetStatistic(){
	 $.post("/cbtconsole/order/getOrderStates.do",
				{},
				function(res){
					var json = eval(res);
					var cacleorder = 0;
					for (var i = 0; i < json.length; i++) {
						if(json[i].state == "deliver")$("#errorgoods").html("<a href='/cbtconsole/order/getOrderInfo.do?showUnpaid=0&type=deliver'>" + json[i].counts + "</a>");//出货问题
						if(json[i].state == "purchase")$("#errorbuy").html("<a href='/cbtconsole/order/getOrderInfo.do?showUnpaid=0&type=purchase'>" + json[i].counts + "</a>");//采购问题
						if(json[i].state == "agree")$("#getchange").html("<a href='/cbtconsole/order/getOrderInfo.do?showUnpaid=0&type=agree'>" + json[i].counts + "</a>");//同意替换
						if(json[i].state == "suggest")$("#changes").html("<a href='/cbtconsole/order/getOrderInfo.do?showUnpaid=0&type=suggest'>" + json[i].counts + "</a>");//建议替换
						if(json[i].state == "cy")$("#onshipping").html("<a href='/cbtconsole/order/getOrderInfo.do?showUnpaid=0&type=cy'>" + json[i].counts + "</a>");//出运
						if(json[i].state == "ck")$("#allgoods").html("<a href='/cbtconsole/order/getOrderInfo.do?showUnpaid=0&state=2'>" + json[i].counts + "</a>");//到达仓库
						if(json[i].state == "purchasewarning")$("#purchasewarning").html("<a href='/cbtconsole/order/getOrderInfo.do?showUnpaid=0&type=purchasewarning'>" + json[i].counts + "</a>");//超期项目
						if(json[i].state == "storagewarning")$("#storagewarning").html("<a href='/cbtconsole/order/getOrderInfo.do?showUnpaid=0&type=storagewarning'>" + json[i].counts + "</a>");//超期项目
						if(json[i].state == "shipmentwarning")$("#shipmentwarning").html("<a href='/cbtconsole/order/getOrderInfo.do?showUnpaid=0&type=shipmentwarning'>" + json[i].counts + "</a>");//超期项目
						if(json[i].state == "close1" || json[i].state == "close") cacleorder += json[i].counts;//取消
						if(json[i].state == "notshipping" )$("#notshipping").html("<a href='/cbtconsole/order/getOrderInfo.do?showUnpaid=0&type=notshipping'>" + json[i].counts + "</a>");//未出货项目
						//超过交期项目
					}
						$("#cacleorder").html("<a href='/cbtconsole/order/getOrderInfo.do?showUnpaid=0&type=cacle'>" + cacleorder + "</a>");
				});
}

function getMessageNum(uid){
	var url= "/cbtconsole/messages/findBasicMessages";
	var mydate = new Date();
	var rYear =mydate.getFullYear(); 
	var rMonth = mydate.getMonth()+1;
	var rDay = mydate.getDate();
	var timeTo = rYear+'-'+ rMonth+'-'+rDay+' 23:59:59';
	mydate.setDate(mydate.getDate() -7);
	rDay = mydate.getDate();
	var timeFrom = rYear+'-'+ rMonth+'-'+rDay+' 00:00:00';
	var admuserid = uid;
	jQuery.ajax({
        url:url,
        data:{"timeFrom":timeFrom,
        	"timeTo":timeTo,
        	"adminid":admuserid},
        type:"post",
        success:function(data, status){
        	if(data.ok){
        		var messagesCountList = data.data;
        		var messagesCountVo = new Object();
        		for(var i=0;i<messagesCountList.length;i++){
        			messagesCountVo = messagesCountList[i];
        			if(messagesCountVo.type=='propagemessage'){
        				$('#propagemessage').html( messagesCountVo.noDeleteCount);
        				$('#propagemessage1').html(messagesCountVo.countAll);
        			}else if(messagesCountVo.type=='shopcarmarket'){
        				$('#shopcarmarket').html(messagesCountVo.noDeleteCount);
        				$('#shopcarmarket1').html(messagesCountVo.countAll);
        			}else
        			if(messagesCountVo.type=='businquiries'){
        				if(admuserid ==1){
        					$('#businquiries').html(messagesCountVo.noArrgCount);
            				$('#businquiries1').html(messagesCountVo.noDeleteCount);
            				$('#businquiries2').html(messagesCountVo.countAll);
        				}else{
        					$('#businquiries').css("display","none");
        					$('#businquiries1').html(messagesCountVo.noDeleteCount);
            				$('#businquiries2').html(messagesCountVo.countAll);
        				}
        			}else
        			if(messagesCountVo.type=='batapply'){
        				if(admuserid ==1){
        				$('#batapply').html(messagesCountVo.noArrgCount);
        				$('#batapply1').html(messagesCountVo.noDeleteCount);
        				$('#batapply2').html(messagesCountVo.countAll);
        				}else{
        					$('#batapply').css("display","none");
            				$('#batapply1').html(messagesCountVo.noDeleteCount);
            				$('#batapply2').html(messagesCountVo.countAll);
        				}
        			}else if(messagesCountVo.type=='refundscom'){
        				$('#refundscom').html(messagesCountVo.noDeleteCount);
        				$('#refundscom1').html(messagesCountVo.countAll);
        			}else if(messagesCountVo.type=='cartMarket'){
        				$('#shopcarmarket1').html(messagesCountVo.countAll);
        				$("#shopcarmarket").html(messagesCountVo.noArrgCount);
        			}else if(messagesCountVo.type=='ordermessage'){
        				$('#ordermessage').html(messagesCountVo.noArrgCount);
        				$("#ordermessage1").html(messagesCountVo.countAll);
        			}
        			if(messagesCountVo.type=='ordermeg'){
        				if(admuserid !=1){
        					$('#showorder').css('display','none');
        				}else{
        					$('#ordermeg').html(messagesCountVo.noArrgCount);	
        				}
        			}
        				
        				
        		}
            }else{
				 alert(data.message);
			}
        },
    	error:function(e){
    		alert("消息数量信息查询失败！");
    	}
    });
}

function fnGetMessage(uid){
	//查询消息列表
	var mydate = new Date();
	var rYear =mydate.getFullYear(); 
	var rMonth = mydate.getMonth()+1;
	var rDay = mydate.getDate();
	var timeTo = rYear+'-'+ rMonth+'-'+rDay;
	mydate.setDate(mydate.getDate() -7);
	rDay = mydate.getDate();
	var timeFrom = rYear+'-'+ rMonth+'-'+rDay;
    var admuserid = uid;
	$('#adminid').val(admuserid);
	if(admuserid!=1){
		$('#assignment').css("display","none");
	}
	getMessageNum(uid); //获取各种消息数量
	$('.btn').click(function(){
		var type = $(this).parent().parent().find('#type').val();
		var style =$(this).parent().find('#style').val();
		var url="";
		if(type=="batapply"){
			url="/cbtconsole/messages/preferential";
			if(style=="noArrage"){
				url+='?adminid='+uid+'&type=-2';
				window.open(url);
			}else if(style=="noDelete"){
				url+='?adminid='+uid+'&type=0';
				window.open(url);
			}else{
				url+='?adminid='+uid+'&type=-1';
				window.open(url);
			}
		}else if(type=="propagemessage"){
			url="/cbtconsole/customerServlet?action=findAll&className=GuestBookServlet";
			if(style=="noDelete"){
				url+='&timeFrom='+timeFrom+'&timeTo='+timeTo+'&adminid='+uid+'&status=0';
				window.open(url);
			}else{
				url+='&timeFrom='+timeFrom+'&timeTo='+timeTo+'&adminid='+uid;
				window.open(url);
			}
		}else if(type=="businquiries"){
			url="/cbtconsole/messages/getBusiess";
			if(style=="noArrage"){
				url+='?adminid='+uid+'&status=2';
				window.open(url);
			}else if(style=="noDelete"){
				url+='?adminid='+uid+'&status=3';
				window.open(url);
			}else{
				url+='?adminid='+uid+'&status=4';
				window.open(url);
			}
		}else if(type=="shopcarmarket"){
			url="/cbtconsole/website/shoppingCartManagement.jsp";
			 if(style=="noDelete"){
				url+='?status=3';
				window.open(url);
			}else{
				url+='?status=2';
				window.open(url);
			}
		}else if(type=="refundscom"){
			url="/cbtconsole/complain/";
			if(style=="noDelete"){
				url+='searchComplainByParam?userid=&creatTime=&complainState=0&username=&toPage=1&currentPage=1';
				window.open(url);
			}else{
				url+='searchComplainByParam?userid=&creatTime=&complainState=-1&username=&toPage=1&currentPage=1';
				window.open(url);
			}
		}else if(type=="ordermessage"){
//			fnInquiry(1,type);
			url="/cbtconsole/order/getOrderInfo.do?showUnpaid=0&type=";
			if(style=="ordermessage"){
				url+='latelyOrdermessage';
			}else{
				url+='ordermessage';
			}
			window.location.href=url;
		}else{
			url="/cbtconsole/order/getOrderInfo.do?showUnpaid=0&type=ordermeg";
			window.open(url);
		}
	});
	//客服分配
	$('#assignment').click(function(){
	   var url= "/cbtconsole/messages/assignment";
	   jQuery.ajax({
	        url:url,
	        type:"post",
	        success:function(data, status){
	        	if(data.ok){
	        		alert("成功分配"+data.data+"条留言");
	            }else{
					 alert(data.message);
				}
	        },
	    	error:function(e){
	    		alert("分配失败！");
	    	}
	   });
	});
}

//比较时间
function fnComparisonDate(a, b) {
    var arr = a.split("-");
    var starttime = new Date(arr[0], arr[1], arr[2]);
    var starttimes = starttime.getTime();
    var arrs = b.split("-");
    var lktime = new Date(arrs[0], arrs[1], arrs[2]);
    var lktimes = lktime.getTime();
    if (starttimes >= lktimes) {
        return false;
    }
    else
        return true;

}
