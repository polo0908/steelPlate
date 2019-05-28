// JavaScript Document
function fenye(){
	//根据总页数判断，如果小于5页，则显示所有页数，如果大于5页，则显示5页。根据当前点击的页数生成
	var maxPage = jQuery("#countPage").text();//模拟后台总页数 
	var nowPage=jQuery("#nowPage").text();
	var title1=jQuery("#title").text();//当前页
	var pageCount =parseInt(maxPage) ;//模拟后台总页数
	var index =parseInt(nowPage);
	var title=parseInt(title1);//当前页
	//生成分页按钮
	if(pageCount>5){
		page_icon(1,5,0);
//		pageGroup(index,pageCount);
	}else{
		page_icon(1,pageCount,0);
//		pageGroup(index,pageCount);
	}
	//点击分页按钮触发
	$("#pageGro li").live("click",function(){
		if(pageCount > 5){
			var pageNum = parseInt($(this).html());//获取当前页数
			pageGroup(pageNum,pageCount);
			divshow(title,pageNum);
		}else{
			var indexpage=jQuery(this).text();
			//alert(indexpage);
			divshow(title,parseInt(indexpage));
			//$("#pageGro li").eq(indexpage).addClass("on").siblings("li").removeClass("on");
			$(this).addClass("on");
			$(this).siblings("li").removeClass("on");
		}
	});
	
	//点击上一页触发
	$("#pageGro .pageUp").click(function(){
		if(pageCount > 5){
//			var pageNum = parseInt($("#pageGro li.on").html());//获取当前页
			pageUp(index,pageCount);
			divshow(title,(index-1));
		}else{
//			var index = $("#pageGro ul li.on").index();//获取当前页
			if(index > 1){
				$("#pageGro li").removeClass("on");//清除所有选中
				$("#pageGro ul li").eq(index-1).addClass("on");//选中上一页
				divshow(title,(index-1));
			}
		}
	});
	
	//点击下一页触发
	$("#pageGro .pageDown").click(function(){
		if(pageCount > 5){
//			var pageNum = parseInt($("#pageGro li.on").html());//获取当前页
			pageDown(index,pageCount);
			divshow(title,(index+1));
		}else{
//			var index = $("#pageGro ul li.on").index();//获取当前页
			if(index < pageCount){
				divshow(title,(index+1));
				$("#pageGro li").removeClass("on");//清除所有选中
				$("#pageGro ul li").eq(index+1).addClass("on");//选中上一页
			}
		}
	});
};

//点击跳转页面
function pageGroup(pageNum,pageCount){
	switch(pageNum){
		case 1:
			page_icon(1,5,0);
		break;
		case 2:
			page_icon(1,5,1);
		break;
		case pageCount-1:
			page_icon(pageCount-4,pageCount,3);
		break;
		case pageCount:
			page_icon(pageCount-4,pageCount,4);
		break;
		default:
			page_icon(pageNum-2,pageNum+2,2);
		break;
	}
}

//根据当前选中页生成页面点击按钮
function page_icon(page,count,eq){
	var ul_html = "";
	for(var i=page; i<=count; i++){
		ul_html += "<li >"+i+"</li>";
	}
	$("#pageGro ul").html(ul_html);
	$("#pageGro ul li").eq(eq).addClass("on");
}

//上一页
function pageUp(pageNum,pageCount){
	switch(pageNum){
		case 1:
		break;
		case 2:
			page_icon(1,5,0);
		break;
		case pageCount-1:
			page_icon(pageCount-4,pageCount,2);
		break;
		case pageCount:
			page_icon(pageCount-4,pageCount,3);
		break;
		default:
			page_icon(pageNum-2,pageNum+2,1);
		break;
	}
}

//下一页
function pageDown(pageNum,pageCount){
	switch(pageNum){
		case 1:
			page_icon(1,5,1);
		break;
		case 2:
			page_icon(1,5,2);
		break;
		case pageCount-1:
			page_icon(pageCount-4,pageCount,4);
		break;
		case pageCount:
		break;
		default:
			page_icon(pageNum-2,pageNum+2,3);
		break;
	}
}