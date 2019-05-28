function changeli(obj,im){
	obj.style.background="url('/cbtconsole/img/index/7d-1b.png') repeat-x";
	var img=obj.getElementsByTagName('img');
	img[0].src="/cbtconsole/img/index/"+im;
	var ex=obj.getElementsByTagName('span');
	ex[0].style.color="#fff";

}
function reli(obj,im){
	obj.style.background="url('/cbtconsole/img/index/7ib.png') no-repeat right top";
	var img=obj.getElementsByTagName('img');
	img[0].src="/cbtconsole/img/index/"+im;
	var ex=obj.getElementsByTagName('span');
	ex[0].style.color="#393836";
	
}
window.onload=function(){
	document.getElementById('search').onmousemove=null;
	document.getElementById('search').onmouseout=null;
	}

	function changesrc(obj){
		if(obj.src.match('9b'))
			{obj.src="/cbtconsole/img/product/9a.png";
			document.getElementById('main2').style.display="block";
			document.getElementById('main1').style.display="none";
			}
		else{obj.src="/cbtconsole/img/product/9b.png";
		document.getElementById('main1').style.display="block";
		document.getElementById('main2').style.display="none";
		}
	}
	function changesort(obj,i,in1,in2,in3){
		if(i==0){
			document.getElementById("sesortimg1").src="/cbtconsole/img/product/"+in1;
			document.getElementById("sesortimg2").src="/cbtconsole/img/product/"+in2;
			document.getElementById("sesortimg3").src="/cbtconsole/img/product/"+in3;
			document.getElementById("sesortimg4").src="/cbtconsole/img/product/10d.png";
			document.getElementById("li0").style.color="#fff";
			document.getElementById("li1").style.color="#000";
			document.getElementById("li2").style.color="#000";
		}
		else if(i==1){
			document.getElementById("sesortimg2").src="/cbtconsole/img/product/"+in1;
			document.getElementById("sesortimg1").src="/cbtconsole/img/product/"+in2;
			document.getElementById("sesortimg3").src="/cbtconsole/img/product/"+in3;
			document.getElementById("sesortimg4").src="/cbtconsole/img/product/10d.png";
			document.getElementById("li1").style.color="#fff";
			document.getElementById("li0").style.color="#000";
			document.getElementById("li2").style.color="#000";
		}
		else if(i==2){
			document.getElementById("sesortimg3").src="/cbtconsole/img/product/"+in1;
			document.getElementById("sesortimg4").src="/cbtconsole/img/product/10d1.png";
			document.getElementById("sesortimg1").src="/cbtconsole/img/product/"+in2;
			document.getElementById("sesortimg2").src="/cbtconsole/img/product/"+in3;
			document.getElementById("li2").style.color="#fff";
			document.getElementById("li0").style.color="#000";
			document.getElementById("li1").style.color="#000";
		}
	}
	function checkNum(obj) {
	    //检查是否是非数字值
	    if (isNaN(obj.value)) {
	        obj.value = "";
	    }
	    if (obj != null) {
	        //检查小数点后是否对于两位
	        if (obj.value.toString().split(".").length > 1 && obj.value.toString().split(".")[1].length > 2) {
	            obj.value = "";
	        }
	    }
	};

	function checkMO(obj) {
	    //检查是否是非数字值
	    if (isNaN(obj.value)) {
	        obj.value = "";
	    }
	    if (obj != null) {
	    	if(obj.value.toString().substring(0,1) == 0){
	    		obj.value = "";
	    	}
	        //检查小数点后是否对于两位
	        if (obj.value.toString().split(".").length > 1) {
	            obj.value = "";
	        }
	    }
	};


	/*检查关键字*/
	var keys = ['fake\\s*brand','fake\\s*designer','fake\\s*watch',
	            'fake\\s*bag','luxury\\s*handbag','cuuci',
	            'disney','nike','designer\\s*handbags',
	            'designer\\s*glasses','designer\\s*clothe','designer\\s*purses',
	            'famous\\s*brand','adidas','reebok',
	            'timberland','vuitton','chanel',
	            'burberry','givenchy','celine',
	            'miumiu','dunhill','FENDI',
	            'Ferragamo','Versace','dior',
	            'Armani','ermenegildo','ROLEX',
	            'CARTIER','OMEGA','molyneux','gucci',
	            'mont\\s*blanc','piaget','fisher-price','(iphone\s*\d*)$','(ipad\s*\d*)$'];

	function checkKey(productKey){
		var flag = false;
		var a = productKey.toLowerCase();
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

	function showLoading(){
		cDiv();
	    document.getElementById("over2").style.display = "block";
	    document.getElementById("layout2").style.display = "block";
	}

	function cDiv(){
		var divObj=document.createElement("div"); 
		divObj.innerHTML="<div id='over2' style='display: none;position: absolute;top: 0;left: 0;width: 100%;height: 100%;background-color: #f5f5f5;opacity:0.5;z-index: 1000;'></div>" +
				                                        " <div id='layout2' style=' display: none; position: absolute;top: 40%;left: 40%;width: 20%;height: 20%;z-index: 1001;text-align:center;'><img src='/cbtconsole/img/loading/loading.gif' /></div>";
		var first=document.body.firstChild;//得到页面的第一个元素 
		document.body.insertBefore(divObj,first);//在得到的第一个元素之前插入 
	}


	/*按钮搜索*/
	function keywordSearch(urlte,sort){
		var productKeyword=removeb(document.getElementById("url").value);//获取搜索关键字
		var offc = 'none';
		if(document.getElementById("clickoff")){
			offc = document.getElementById("clickoff").style.display;
		}
		var onc = 'none';
		if(document.getElementById("clickon")){
			onc = document.getElementById("clickon").style.display;
		}
		if(!checkKey(productKeyword)){
			var catid = '0';
			if(document.getElementById("catID")){
				catid = document.getElementById("catID").value;//类别id
			}
			if(urlte=='searchdata'){
//				document.getElementById('auto_div').innerHTML=('');
//				document.getElementById('auto_div').style.display='none';
				if(productKeyword==''||productKeyword=='What are you looking for.....'){
					document.getElementById("url").value = "What are you looking for.....";
					document.getElementById("url").style.cssText = 'color:#ff0000;';
				}else{
					showLoading();
					//点击search按钮
					if(offc=='none'&&onc=='block'){//wholesale按钮
						window.location.href = "/cbtconsole/goodsTypeServerlet?keyword="+encodeURIComponent(productKeyword)+"&website=w&srt=order-desc&catid="+catid;
					}else{
						if(sort!=null&&sort!=''){
							window.location.href = "/cbtconsole/goodsTypeServerlet?keyword="+encodeURIComponent(productKeyword)+"&website=a&srt="+sort+"&catid="+catid;
						}else{
							window.location.href = "/cbtconsole/goodsTypeServerlet?keyword="+encodeURIComponent(productKeyword)+"&website=a&srt=order-desc&catid="+catid;
						}
					}
				}
			}else{
				var url = location.search//获取当前链接问号（包含问号）以后的字符串
				var price1 = '';
				var price2 = '';
				var minq = '';
				var maxq = '';
				if(document.getElementById("price1")){
					price1=removeb(document.getElementById("price1").value);//价格下限
				}
				if(document.getElementById("price2")){
					price2=removeb(document.getElementById("price2").value);//价格上限
				}
				if(document.getElementById("minq")){
					minq = document.getElementById("minq").value;
				}
				if(document.getElementById("maxq")){
					maxq = document.getElementById("maxq").value;
				}
				var stary = url.split('?');//获取当前链接问号）以后的字符串
				var val="a";
				if(stary.length>1){
					var parasy = stary[1].split('&');
					var  re =  new RegExp('website');
					for(var i=0;i<parasy.length;i++){
						if(re.test(parasy[i])){
							if(parasy[i].split('=').length>1){
								val=parasy[i].split('=')[1];
								break;
							}
						}
					}
				}
				var urlend = "/cbtconsole/goodsTypeServerlet?keyword="+encodeURIComponent(productKeyword);
				if(price1!=''){
					urlend = urlend+"&price1="+price1;
				}
				if(price2!=''){
					urlend = urlend+"&price2="+price2;
				}
				if(minq!=''){
					urlend = urlend+"&minq="+minq;
				}
				if(maxq!=''){
					urlend = urlend+"&maxq="+maxq;
				}
				if(catid!=''){
					urlend = urlend+"&catid="+catid;
				}
				if(offc=='none'&&onc=='block'){
					val = "w";
				}
				urlend = urlend+"&website="+val;
				urlend = urlend +"&srt="+document.getElementById("sortmatch").value;
				if(new RegExp('keyurl').test(url)){
					urlend=urlend+"&keyurl"+url.split('keyurl')[1];
				}else if(new RegExp('k0').test(url)&&url.split('&k0=')[1]!='&k1=&k2=&k3='){
					urlend=urlend+"&k0="+url.split('&k0=')[1];
				}
				showLoading();
				window.location.href=urlend;
			}
		}else{
			var wholefloat = document.getElementById("wholefloat");
			if(wholefloat){
				wholefloat.style.display="none";
			}
			document.getElementById("container").innerHTML="<div  style=\"font-size:18px;color:#ff0000;\" id=\"keywordtable\">Sorry, but we don't sell fake brands or any products that" +
														" infringe other company's brand and intellectual rights." +
														"  Please try other keywords.</div>";
		}
	}

	function removeb(remove){
		var result = '';
		if(remove){
			result = remove.replace(/\"/g,'').replace(/^\s*|\s*$/g,'');
			result = result.replace(/\s+/g,' ')
		}
		return result;
	}


	//收藏商品
	function fnaddCollecte(obj){
		var element = obj.parentNode.parentNode
					  .parentNode.parentNode.getElementsByTagName('a')[0];
		var titile = element.text;
		
		var url = element.href.split('SpiderServlet')[1];
		var img = obj.parentNode.parentNode.parentNode
		  			 .parentNode.parentNode.getElementsByTagName('img')[0].src;
		var el_price = obj.parentNode.parentNode
					   .parentNode.getElementsByTagName('div')[1];
		var price = "unkown";
		if(el_price){
			price = el_price.innerHTML.split('&nbsp;')[0].replace(/\$/g,'');
		}
		
		var el_seller = obj.parentNode.parentNode
							.parentNode.getElementsByTagName('div')[2]
							.getElementsByTagName('span')[0];
		var seller = '1 piece';
		if(el_seller){
			var sellers = el_seller.innerHTML.split(':');
			if(sellers.length>1){
				seller = sellers[1];
			}
		}
		 $.post("/cbtconsole/processesServlet", {
	        	"price":price,
				"img":img,
	   			"url":url,
	   			"titile":titile,
	   			"seller":seller,
	   			"action":"addCollection",
	   			"className":"Goods"
		 }, function(data) {
	        	if(data == 1 || data == 2){
	        		obj.style.display='none';
	        		if(obj.parentNode.getElementsByTagName('a')[1]){
	        			obj.parentNode.getElementsByTagName('a')[1].style.display='block';
	        		}
//	    			obj.getElementsByTagName('img')[0].src='/cbtconsole/img/clla.png';
//	    			obj.getElementsByTagName('span')[0].innerHTML='Favorited';
				}else if(data == 0){
		  		}else{
		  			$.dialog({
		  				id:'login',
		  				width: '550px',
		  			    height: 465,
		  				fixed: true,
		  				max: false,
		  			    min: false,
		  				skin: 'discuz',
		  			    lock: true,
		  			    title: 'Sign in or Join Free now',
		  			    drag: false,
		  			    content: 'url:/cbtconsole/cbt/login?flag=dialog&action=fnaddCollection'
		  			});
		  		}
	        });
		 var url1 = window.location+"";
		$.post("/cbtconsole/cbt/lz/slz",{action:"Add to Favorite",url:url1,pruduct_url:url},
		        function(result){});
	}

	function close(action,currency,name,cartNumber){
		$("#userinfo a:eq(0)").attr("href",path + "/processesServlet?action=logout&className=Login").html("Sign Out");
		$("#userinfo li:eq(1)").html('<a href="' + path + '/processesServlet?action=getCenter&className=IndividualServlet">' + name + '</a>');
		$("#mp_currency_a").html(currency + "&nbsp;&nbsp;&nbsp;▼");
		$("#cartNumber").html(cartNumber);
		$.dialog({id:'login'}).close();
		if(action == "fnaddCollection"){
			fnaddCollecte();
		}
	}

	//删除已收藏的商品
	function removeCollection(obj){
		var element = obj.parentNode.parentNode
		  .parentNode.parentNode.getElementsByTagName('a')[0];
	   var hrf = element.href.split('SpiderServlet');
	    if(hrf.length>1){
	    	var pUrl = hrf[1];
	    	$.post("/cbtconsole/processesServlet", {
	    		"url":pUrl,
	    		"action":"delCollectionByUrl",
	    		"className":"Goods"
	    	}, function(data) {
	    		if(data > 0 ){
	    			obj.style.display='none';
	    			if(obj.parentNode.getElementsByTagName('a')[0]){
	    				obj.parentNode.getElementsByTagName('a')[0].style.display='block';
	    			}
	    		}else if(data == 0){
	    			
	    		}else{
	    			$.dialog({
	    				id:'login',
	    				width: '550px',
	    				height: 465,
	    				fixed: true,
	    				max: false,
	    				min: false,
	    				skin: 'discuz',
	    				lock: true,
	    				title: 'Sign in or Join Free now',
	    				drag: false,
	    				content: 'url:/cbtconsole/cbt/login?flag=dialog&action=removeCollection'
	    			});
	    		}
	    	});
	    }
	}



	function fnsetval(val){
		if(val){
			$.post("/cbtconsole/search", {
				"val":val,
				"action":"setVal",
				"className":"GoodsTypeServerlet"
			}, function(data) {
				
			});
		}
	}
	
	function hshow(obj){
		var csho = obj.getElementsByTagName('span')
		var hsho = obj.parentNode.parentNode.getElementsByTagName('ul');
		
		if(csho.innerHTML=='x'||csho.innerHTML==undefined){
			obj.getElementsByTagName('img')[0].src = '/cbtconsole/img/sj/jiana.png';
			for(var i=0;i<hsho.length;i++){
				hsho[i].style.display = "none";
			}
			csho.innerHTML='X'
		}else{
			obj.getElementsByTagName('img')[0].src = '/cbtconsole/img/sj/jianb.png';
			for(var i=0;i<hsho.length;i++){
				hsho[i].style.display = "block";
			}
			csho.innerHTML='x'
		}
	}
	

	function showmore(obj){
		var gen = obj.parentNode.parentNode.parentNode.getElementsByTagName("li");
		if(gen.length>5){
			if(obj.innerHTML=="View Less"){
				for(var i=5;i<gen.length;i++){
					gen[i].style.display = "none";
				}
				obj.innerHTML="View More";
			}else{
				for(var i=5;i<gen.length;i++){
					gen[i].style.display = "";
				}
				obj.innerHTML="View Less";
			}
		}
	}

