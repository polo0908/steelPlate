var i = 1;
var url = location + "";
//document.onkeydown = function(event) {
//	var e = event || window.event || arguments.callee.caller.arguments[0];
//	
//	if (e && e.keyCode == 13) { // enter 键
//		// 要做的事情
//		if (document.getElementById("btn1").style.display == '') {
//			fnSerch();
//		} else {
//			toProduct();
//		}
//	}
//};
/*
 * function changebtn1(){ document.getElementById("btn1").style.display='';
 * document.getElementById("btn2").style.display='none';
 * $('.searchurl').css("background","url(../img/9c.png)");
 * $('.producturl').css("background","url(../img/9d.png)")
 * //$('#btn_img').attr("onclick","toProduct()"); $('#url').val("Please paste
 * URL here"); $('#url').css("color","#9F9F9C");
 * //$("#url").addClass("search_url_text"); i = 1; } function changebtn2(){
 * document.getElementById("btn1").style.display='none';
 * document.getElementById("btn2").style.display='';
 * $('.searchurl').css("background","url(../img/9d.png)");
 * $('.producturl').css("background","url(../img/9c.png)");
 * ///$('#btn_img').attr("onclick","fnSerch()"); $('#url').val("What are you
 * looking for……"); $('#url').css("color","#9F9F9C");
 * //$("#url").removeClass("search_url_text"); i = 2; }
 */
function changebtn1() {
	document.getElementById("auto_div").style.display = "none";
	document.getElementById("btn1").style.display = "";
	document.getElementById("btn2").style.display = "none";
	document.getElementById("urldiv").style.background = "url(/cbtconsole/img/9c.png)";
	document.getElementById("productdiv").style.background = "url(/cbtconsole/img/9d.png)";
	document.getElementById("urldiv").style.color = "#000";
//	document.getElementById("url").value="Please paste URL here";
	document.getElementById("url").style.color="#777";
	//页头修改2
	//document.getElementById("selecttd").style.display='none';
	//document.getElementById("selecttddiv").style.display='none';
	//document.getElementById("website").style.display='none'; 
			i = 1;
}
function changebtn2() {
	document.getElementById("btn1").style.display = "none",
	document.getElementById("btn2").style.display = "",
	document.getElementById("urldiv").style.background = "url(/cbtconsole/img/9d.png)";
	document.getElementById("productdiv").style.background = "url(/cbtconsole/img/9c.png)";
	document.getElementById("urldiv").style.color = "#fff";
	document.getElementById("productdiv").style.color = "#000";
//	document.getElementById("url").value="What are you looking for.....";
	document.getElementById("url").style.color="#777";
	//document.getElementById("selecttd").style.display='block';
	//document.getElementById("selecttddiv").style.display='block';
	//document.getElementById("website").style.display='block';
	//$("#url").removeClass("search_url_text"); 
	i = 2;
}
function trim(str) {
	  return str.replace(/(^\s+)|(\s+$)/g, "");
}
/*function fnBlur() {
	var str = trim(document.getElementById("url").value);
	if(str.length<1){
		if(i == 1){ 
//			document.getElementById("url").value="Please paste URL here";
		}else{
			document.getElementById("url").style.color="#777";
//			document.getElementById("url").value="What are you looking for.....";
		}
	}
}
*/
// 输入框聚焦删除背景图
function fnFocus() {
	if(document.getElementById("url").value=='What are you looking for.....'){
		document.getElementById("url").value="";
		document.getElementById("url").style.color="#777";
	}
}

// 搜索框
function fnSerch() {
	var url = $("#url").val().trim();
	var reg = new RegExp("http(s)?://([\\w-]+\\.)+[\\w-]+(/[\\w- ./?%&=]*)?");
	if (url.indexOf("http://") < 0 && url.indexOf("https://") < 0)
		url = "http://" + url;
	var suffix = url.substring(url.length - 4);
	var cn = url.substring(url.length - 3);
	if (!reg.test(url)) {
		$("#url").removeClass("search_url_text");
		$("#url").css("color", "red").val("Incorrect URL, please re-enter!");
		return;
	} else if (suffix.indexOf(".com") > -1 || cn.indexOf(".cn") > -1
			|| suffix.indexOf(".net") > -1 || suffix.indexOf(".org") > -1) {

		$("#url").removeClass("search_url_text");
		$("#url").css("color", "red").val("请直接 找到 产品的页面，然后 把该页的 网址（URL） 发给我");
		return;
	} else {
		/* count(); */
		/*
		 * $.post(path+"/AbstractServlet",
		 * {action:'getSpider',className:'SpiderServlet',url:url},
		 * function(res){ alert("00000000") var json=eval(res); for(var i=0;i<json.length;i++){
		 * var mapp = json[i]; alert("qqq") } });
		 * 
		 * window.location.href = path+"/cbt/spider.jsp?";
		 */
		// window.location.href =
		// path+"/AbstractServlet?action=getSpider&className=SpiderServlet&url="+encodeURIComponent(url);

		/* 拼接跳转页面的url */
		var spurl = url.replace("http://", "").replace(".html", "9DT5")
				.replace("www.", "2CR5").replace(".com", "0RB5")
				.replace(/\s/g, "9ST5").replace(/%20/g, "9ST5").replace(
						/alibaba/g, "3DL5").replace(/taobao/g, "4DL5").replace(
						/tmall/g, "5DL5").replace(/wholesale/g, "6DL5")
				.replace(/\&/g, "7WT5").replace(/\=/g, "3QY5").replace(/#/g,
						"7BY5").replace(/-/g, "4JK5").replace(/\?/g, "9WR5")
				.replace(/\+/g, "8OK5").replace(/_/g, "3HF5").replace(/\//g,
						"2YK5").replace(/\./g, "6AF5");
		var usize = Math.ceil(spurl.length / 4);
		var u1 = spurl.substring(0, usize);
		var u3 = spurl.substring(usize, usize * 2);
		var u0 = spurl.substring(2 * usize, usize * 3);
		var u2 = spurl.substring(usize * 3, spurl.length);
		// alert(u3)
		window.location.href = "/cbtconsole/processesServlet?action=getSpider&className=SpiderServlet"
				+ "&u0=" + u0 + "&u1=" + u1 + "&u2=" + u2 + "&u3=" + u3;
		/*
		 * window.location.href=path+"/AbstractServlet?action=getSpider&className=SpiderServlet"
		 * +"&url="+encodeURIComponent(url);
		 */
	}
}
function toProduct() {
	if ((location+"").indexOf("goodsTypeServerlet") >= 0) {
		keywordSearch('searchdata');
	} else {
		var productKeyword = document.getElementById("url").value;
		if(productKeyword==''||productKeyword=='What are you looking for.....'){
			document.getElementById("url").value = "What are you looking for.....";
			document.getElementById("url").style.cssText = 'color:#ff0000;';
		}else{
			var options = document.getElementById("catID");
			if(options){
				window.open("/cbtconsole/goodsTypeServerlet?keyword="+encodeURIComponent(productKeyword)+"&website=a&srt=order-desc&catid="+options.value,"_self");
			}else{
				window.open("/cbtconsole/goodsTypeServerlet?keyword="+encodeURIComponent(productKeyword)+"&catid=0&srt=order-desc","_self");
			}
			}
	}
}
function fnNavit(value) {
	if (value == 'indurstries') {
		window.location.href = path + "/apa/Indurstrial.html";
	} else if (value == 'home') {
		window.location.href =  'http://'+window.location.hostname;
	} else if (value == 'consumers') {
		window.location.href = path + "/apa/Consumer.html";
	} else if (value = 'smallbusiness') {
		window.location.href = path + "/apa/SmallBusiness.html";
	}
}
function fnho() {
	if (url.indexOf('Indurstrial') > -1) {
		$('#indurstries').css("background",
				"url(../img/mod.png) no-repeat 0px 39px");
	} else if (url.indexOf('index') > -1) {
		$('#home').css("background", "url(../img/mod.png) no-repeat 0px 39px");
	} else if (url.indexOf('Consumer') > -1) {
		$('#consumers').css("background",
				"url(../img/mod.png) no-repeat 0px 39px");
	} else if (url.indexOf('SmallBusiness') > -1) {
		$('#smallbusiness').css("background",
				"url(../img/mod.png) no-repeat 0px 39px");
	}
}
function fnhou() {
	if (url.indexOf('Indurstrial') > -1) {
		$('#indurstries').css("background", "none");

	} else if (url.indexOf('index') > -1) {
		$('#home').css("background", "none");

	} else if (url.indexOf('Consumer') > -1) {
		$('#consumers').css("background", "none");

	} else if (url.indexOf('SmallBusiness') > -1) {
		$('#smallbusiness').css("background", "none");
	}
}

/*检查关键字*/
var keys = ['fakebrand','fakedesigner','fakewatch',
            'fakebag','luxuryhandbag','cuuci',
            'disney','nike','designerhandbags',
            'designerglasses','designerclothe','designerpurses',
            'famousbrand','adidas','reebok',
            'timberland','vuitton','chanel',
            'burberry','givenchy','celine',
            'miumiu','dunhill','FENDI',
            'Ferragamo','Versace','dior',
            'Armani','ermenegildo','ROLEX',
            'CARTIER','OMEGA','molyneux','gucci',
            'montblanc','piaget','fisherprice','fisher-price',
            '(iphone\s*\d*)$','(ipad\s*\d*)$'];
            
function checkKey(productKey){
	var flag = false;
	var a = productKey.toLowerCase();
	a = a.replace(/\s+/g,'');
	for(var i=0;i<keys.length;i++){
		var reg = new RegExp(keys[i].toLowerCase());
		if(reg.test(a)){
			flag =  true;
			break;
		}else{
			flag =  false;
		}
	}
	return flag;
}

function getl(){
//	alert('8903')
//	alert(navigator.appName)
//	alert(navigator.appVersion)
	if(navigator.appName == "Microsoft Internet Explorer" && navigator.appVersion.match(/6./i)=="6."){ 
//	alert("IE 6"); 
	return true;
	}
	else if(navigator.appName == "Microsoft Internet Explorer" && navigator.appVersion.match(/7./i)=="7."){ 
//	alert("IE 7"); 
	return true;
	} 
	else if(navigator.appName == "Microsoft Internet Explorer" && navigator.appVersion.match(/8./i)=="8."){ 
//	alert("IE 8"); 
	return true;
	}
	else if(navigator.appName == "Microsoft Internet Explorer" && navigator.appVersion.match(/9./i)=="9."){ 
//	alert("IE 9"); 
	return true;
	}
	else if(navigator.appName == "Microsoft Internet Explorer" && navigator.appVersion.match(/10./i)=="10."){ 
//	alert("IE 10"); 
		return true;
	} 
	else if(navigator.appName == "Microsoft Internet Explorer" && navigator.appVersion.match(/11./i)=="11."){ 
//	alert("IE 11"); 
		return true;
	}
	return false;
}
function fnCurrency(currency){
	$.ajax({
		type:'POST',
		url:'/cbtconsole/processesServlet?action=UpCurrency&className=Currency',
		data:{"currency":currency},
		success:function(res){
				 window.location.href=window.location.href;
		}
	});
}
function fnCurrency(currency,href){
	$.ajax({
		type:'POST',
		url:'/cbtconsole/processesServlet?action=UpCurrency&className=Currency',
		data:{"currency":currency},
		success:function(res){
			if(typeof(href) == 'undefined' ){
				 window.location.href=window.location.href;
				 return;
			}
				 window.location.href=href;
		}
	});
}
$(document).click(function (e) {
//	var height =  $('#mp_currency').offset().top;//775
//	var width =  $('#mp_currency').offset().left;//960      
	 var show_id = $(e.target).attr('id') ;
	if(show_id == "mp_currency" || show_id == "mp_currency_a"){
		 $("#mp_currency").css("display","block");
		 return;
	}else{
		 $("#mp_currency").css("display","none");
	}
	/*var ev = e || window.event;
	//offset()获得的是元素的左上角相对于整个网页的坐标 
	 if(height <= ev.pageY+30 && ev.pageY <= (height) && width <= ev.pageX  && ev.pageX <= (width)){	 
		 $("#showContry").css("display","block");
	 }else{ 
		 $("#showContry").hide();
	 }*/
	});

function fnCurrency_top(){
	 $("#mp_currency").css("display","block");
}

