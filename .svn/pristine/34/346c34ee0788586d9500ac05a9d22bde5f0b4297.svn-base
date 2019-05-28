function showLoading(){
	cDiv();
    document.getElementById("over2").style.display = "block";
    document.getElementById("layout2").style.display = "block";
}

function cDiv(){
	var divObj=document.createElement("div"); 
	divObj.innerHTML="<div id='over2' style='display: none;position: absolute;top: 0;left: 0;width: 100%;height: 300%;background-color: #f5f5f5;opacity:0.5;z-index: 2100;'></div>" +
			                                        " <div id='layout2' style=' display: none; position: absolute;top: 40%;left: 40%;width: 20%;height: 20%;z-index: 2201;text-align:center;'><img src='/cbtconsole/img/loading/loading.gif' /></div>";
	var first=document.body.firstChild;//得到页面的第一个元素 
	document.body.insertBefore(divObj,first);//在得到的第一个元素之前插入 
}

// 输入框聚焦删除背景图
function fnFocus() {
	if(document.getElementById("url").value=='What are you looking for.....'){
		document.getElementById("url").value="";
		document.getElementById("url").style.color="#777";
	}
}

/**************----搜索关键字自动匹配 start------***********************/
//高亮的索引 
var highLightIndex = -1; 
//超时的标识（对用户连续快速按下键盘的事件做延时处理，只对用户在500ms内最后一次请求，让其生效） 
var timeoutId; 

/**
 * 页面加载时为搜索框添加监听事件
 */
function initListener(){
		document.getElementById('url').onclick = function(){
			click();
		}
		/*******************************catid************************************************/
		var options = document.getElementById("catID");
		if(options){
			options.onchange = function(){
				var select = document.getElementById("search-category-value");
				if(select){
					select.innerHTML=options.options[options.options.selectedIndex].text;
					var keywords = document.getElementById("url");
					if(keywords){
						keywords=trim(keywords.value);
						if(keywords!=''&&keywords!='What are you looking for.....'){
							showLoading();
							window.location.href = "/cbtconsole/goodsTypeServerlet?keyword="+encodeURIComponent(keywords)+"&website=a&srt=order-desc&catid="+options.value;
						}
					}
				}
			}
		}
		/***********************************catid**********************************************/
		if(getl()){
			document.getElementById('url').attachEvent('keyup', processKeyup);
		}else{
			document.getElementById('url').addEventListener('keyup', processKeyup,false);
		}
		document.onclick = function (event)  
		{     
			var e = event || window.event;  
			var elem = e.srcElement||e.target;  
			while(elem){   
				if(elem.id == "url_div"){  
					return;  
				}  
				elem = elem.parentNode;       
			}  
			//隐藏div的方法  
			document.getElementById('auto_div').innerHTML='';
			document.getElementById('auto_div').style.display='none';  
		}
}
/**
 * 搜索框添加点击事件
 */
function click(){
	 highLightIndex = -1; 
	 var btn2 = document.getElementById('btn2');
	 if(btn2&&btn2.style.display!='none'){
		 var aito_div = document.getElementById('auto_div');
		 if(aito_div&&aito_div.style.display=='none'){
			 if(document.getElementById('url').value.length>2){
				 clearTimeout(timeoutId); 
				 timeoutId = setTimeout(processAjaxRequest,500); 
			 }else{
				 aito_div.innerHTML=''; 
				 aito_div.style.display='none'; 
			 }
		 }
	 }
}
/** 
 * 处理键盘按下后弹起的事件 
 * @param event 
 */ 
function processKeyup(event){ 
	 var dissplay =  document.getElementById("btn2");
	 if(dissplay&&dissplay.style.display!='none'){
          var myEvent = event || windows.event; 
          var keyCode = myEvent.keyCode; 
          //输入是字母，或者退格键则需要重新请求 
          if((keyCode >= 65 && keyCode <= 90) || keyCode ==8){ 
               //以下两行代码是为了防止用户快速输入导致频繁请求服务器 
               //这样便可以在用户500ms内快速输入的情况下，只请求服务器一次 
               //大大提高服务器性能 
               highLightIndex = -1; 
               if(document.getElementById('url').value.length>2){
	                clearTimeout(timeoutId); 
	                timeoutId = setTimeout(processAjaxRequest,100); 
               }else{
            	   document.getElementById('auto_div').innerHTML=''; 
            	   document.getElementById('auto_div').style.display='none'; 
               }
          //处理上下键(up,down) 
          }else if(keyCode == 38 || keyCode == 40){ 
              processKeyUpAndDown(keyCode); 
          //按下了回车键 
          }else if(keyCode == 13){ 
             // processEnter(); 
        	  if(trim(document.getElementById('url').value).length>0){
        		  keywordSearch("searchdata");
        	  }
          } 
	 }else{
		 document.getElementById('auto_div').innerHTML=''; 
		 document.getElementById('auto_div').style.display='none';
	 }
 } 
function createXMLHttpReq() {  
    try {  
        XMLHttpReq = new ActiveXObject("Msxml2.XMLHTTP");//IE高版本创建XMLHTTP  
    }  
    catch(E) {  
        try {  
            XMLHttpReq = new ActiveXObject("Microsoft.XMLHTTP");//IE低版本创建XMLHTTP  
        }  
        catch(E) {  
            XMLHttpReq = new XMLHttpRequest();//兼容非IE浏览器，直接创建XMLHTTP对象  
        }  
    }  
  
}


/** 
 * 处理请求 
 * @param data 
 */ 
function processAjaxRequest(){ 
	 var reqWord= document.getElementById('url').value;
		 var ajaxurll="/cbtconsole/DataReturnServlet?reqWord="+trim(reqWord)+'&val='+document.getElementById("website").value;
		 createXMLHttpReq();                                //创建XMLHttpRequest对象  
		 XMLHttpReq.open("post", ajaxurll, true);  
		 XMLHttpReq.onreadystatechange =function(){
			 if(XMLHttpReq.readyState==4){
				 if(XMLHttpReq.status==200){
					 var dtext = XMLHttpReq.responseText;  
					 var djson=eval(dtext);
					 var divo = document.getElementById('auto_div');
					 if(djson.length!=0){
						 var word_ul = document.createElement('ul'); 
						 divo.style.display='block';
						 divo.innerHTML='';
						 for(var i = 0 ; i < djson.length ; i ++){ 
							 var datas = djson[i];
							 var inner = "";
							// alert(datas.keyword);
							 if(datas.keyword!=''){
								 var word_div = document.createElement('li'); 
								 inner = '<div class="kywords">'+datas.keyword+"</div>";
								 if(datas.catName){
									 word_div.setAttribute("catid", datas.catId);
									 inner = inner+ '<div class="kycatname">&nbsp;&nbsp;in&nbsp;'+datas.catName+'</div>';
								 }else{
									 if(datas.count){
										 inner = inner+'<div class="kycount">about'+ datas.count+"results&nbsp;&nbsp;</div>";
									 }
								 }
								 word_div.innerHTML=inner+'<div style="clear:both;"></div>';
								 word_div.addEventListener('mouseover', fnOver, false)
								 word_div.addEventListener('mouseout', fnOut, false)
								 word_div.addEventListener('click', getAutoText, false)
								 word_ul.appendChild(word_div)
							 }
						 } 
						 divo.appendChild(word_ul);
					 }
				 }
			 }
		 }
		 XMLHttpReq.send(null);
//	 }
} 

/** 
 * 处理鼠标滑过 
 */ 
function fnOver(){ 
     changeToWhite(); 
     this.style.cssText='background-color:#e3e3e3'; 
    // this.style.minHeight='24px';
     var divs = document.getElementById('auto_div').getElementsByTagName('li');
     for(var i=0;i<divs.length;i++){
    	 if(this==divs[i]){
    		 highLightIndex = i;
    		 break;
    	 }
     }
     //下面一行注释掉了，百度搜索也没这功能，就是鼠标移动时，跟着改变搜索框的内容 
     //$('#auto_txt').val($('#auto_div').children().eq(highLightIndex).html()); 
} 
 
/** 
 * 处理鼠标移除 
 */ 
function fnOut(){ 
	this.style.cssText='background-color:white'; 
} 

/** 
 * 得到自动填充文本 
 */ 
function getAutoText(){ 
   //有高亮显示的则选中当前选中当前高亮的文本 
   if(highLightIndex != -1){ 
	   var wordds = trim(this.getElementsByTagName('div')[0].innerHTML);
	   var vatid = this.getAttribute("catid");
	   vatid = vatid!=null?vatid:"0";
	   document.getElementById('url').value = wordds;
	   document.getElementById('auto_div').innerHTML = '';
	   document.getElementById('auto_div').style.display = 'none';
	   showLoading();
	   window.open("/cbtconsole/goodsTypeServerlet?keyword="
				+ encodeURIComponent(wordds)
				+ "&website=a&srt=order-desc&catid="+vatid, "_self");
   } 
} 

/** 
 * 处理按下Enter键 
 * @param keyCode 
 */ 
function processEnter(){ 
    if(highLightIndex != -1){ 
    	var ahtml = document.getElementById('auto_div').getElementsByTagName('li').item(highLightIndex).getElementsByTagName('div')[0].innerHTML;
    	document.getElementById('url').value = ahtml;
    	document.getElementById('auto_div').innerHTML = '';
 	    document.getElementById('auto_div').style.display = 'none';
    } 
} 

/** 
 * 处理按上下键的情况 
 */ 
function processKeyUpAndDown(keyCode){ 
    var words = document.getElementById('auto_div').getElementsByTagName('li'); 
    var num = words.length; 
    if(num <= 0) return; 
    changeToWhite(); 
    highLightIndex = ((keyCode != 38 ? num + 1:num - 1)+highLightIndex) % num; 
    words.item(highLightIndex).style.cssText='background-color:#e3e3e3';
    document.getElementById('url').value=words.item(highLightIndex).getElementsByTagName('div')[0].innerHTML;
} 

/** 
 * 如果有高亮的则把高亮变白 
 */ 
function changeToWhite(){ 
    if(highLightIndex != -1){ 
    	document.getElementById('auto_div').getElementsByTagName('li').item(highLightIndex).style.cssText='background-color:white';
    } 
} 
/**************----搜索关键字自动匹配 end------***********************/

function getl(){
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

