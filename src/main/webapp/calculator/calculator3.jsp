<%@ page language="java" contentType="text/html; charset=utf-8"
		pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Calculator</title>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="stylesheet" href="css/bootstrap.min.css"/>
    <link rel="stylesheet" href="css/bootstrap-responsive.min.css"/>
    <link rel="stylesheet" href="css/matrix-style.css"/>
    <link rel="stylesheet" href="css/matrix-media.css"/>
    <link href="css/font-awesome.css" rel="stylesheet"/>
    <link rel="stylesheet" href="css/invoice.css"/>
    <link rel="stylesheet" href="css/easydialog.css" />
    <link rel="stylesheet" href="css/calculator.css" />
     <link rel="shortcut icon" href="images/favicon1.ico">


 <!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-300197-18"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-300197-18');
</script>




<style>
	#breadcrumb a {
    font-size: 14px;
    color: #00a2e9;
}
#breadcrumb a:hover {
    color: #333333;
}
 .dataTables_wrapper{height:auto;}
 .table{height:auto;} 
   .table td{border-bottom:1px solid #ddd;} 
   .table th{white-space: nowrap;}
   
 .gs{
	width:700px;
	height:150px;
	background-color:#f0f0f0;
	border:1px solid #999;
	position:fixed;
	top:150px;
	left:50%;
	margin-left:-400px;
	z-index:10000;
	text-align:center;
	line-height:150px;
	font-size:20px;
	font-family:"microsoft yahei";
	
}  
.gs span{
	width:43px;
	height:43px;
	background:url(images/close.png) no-repeat;
	position:absolute;
	right: -14px;
    top: -14px;
    cursor:pointer;

}
.gs em{
	position: absolute;
    top: 10px;
    left: 20px;
    display: inline;
    font-size: 15px;
    line-height: 35px;
    font-style: normal;
    color: #115fd8;
    font-weight: 600;
    
}
.gs .d1{
	line-height: 30px;
    width: 670px;
    margin: 0 auto;
    padding-top: 40px;
    word-break: break-all;
}
.gradeA>td {
    text-align: left;
    font-size: 14px;
}
label {
    width: 100%;
    text-align: left;
}
.imgs_add{margin: 0 auto;width: 982px;margin-top:15px;margin-bottom:30px;}

</style>
</head>
<body>
<div class="navbar nav-bground" role="navigation">
	<div class="header_content">
    	<a href="#"><img src="images/navtop/logo.png" class="logo-img" alt=""></a>
    	<div class="w-email"> Email us : <a class="o-email" href="mailto:rfq@csmfg.com?subject=Steel Fabrication RFQ&body=%0d%0d%0a Note:We will reply you within 24 hours." onclick="gtag_report_conversion('http://calculator.metal-work.com/steelPlate/calculator/queryAll.do')">RFQ@csmfg.com</a></div>
	</div>
</div>

<div class="step_list" style="margin: 40px 0;">
	<span style="color: #fff;">Choose Material</span>
	<span style="background: url(images/navtop/step_2_1.png) top no-repeat;color: #fff;">Choose Fabrication Method</span>
	<span style="background: url(images/navtop/step_3_1.png) top no-repeat;color: #fff;">Add to BOM and Calculate</span>
</div>
<div class="big-box">
<div id="details" style="display:none;">
<div class="weui_mask" onclick="close_datails()"></div>		
	<div class="gs">
		<span onclick="close_datails()"></span>
		<em>Unit process price * Qty + Unit process price * Qty ... ≈ Total process price</em>
		<div class="d1"></div>
	</div>
</div>

  
    <div class="container-fluid">
    <!-- <div class="w-email"> Email us : <a href="mailto:rfq@csmfg.com?subject=Steel Fabrication RFQ&body=%0d%0d%0a Note:We will reply you within 24 hours." onclick="gtag_report_conversion('http://calculator.metal-work.com/steelPlate/calculator/queryAll.do')">RFQ@csmfg.com</a></div> -->
        <div id="breadcrumb"> <a onclick="window.history.go(-1)" class="tip-bottom" style="padding-left:0;"><i class="icon-chevron-left"></i>Back</a>
        </div>
        <div class="w-top">
            <div class="div-left">
                <h4 style="float: left;">Bill Of Material:</h4>
            </div>
            <div class="div-right">
                <a href="#">
                    <button class="btn btn-primary btn-large" onclick="queryAll()">Restart</button>
                </a>
                <a href="#">
                    <button class="btn btn-primary btn-large" onclick="increase_product('${clientOrder.quoteId}')">Add more parts</button>
                </a>
            </div>
        </div>
        <div class="row-fluid">
            <div class="span12">
                <div class="widget-box">

                    <div class="widget-content nopadding">
                        <div id="DataTables_Table_0_wrapper" class="dataTables_wrapper" role="grid">
                           <table class="table table-bordered data-table dataTable" id="DataTables_Table_0">
                                <thead>
                                <tr role="row" style="height:20px;">
                                    <th class="ui-state-default" role="columnheader" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="Platform(s): activate to sort column ascending">
                                        <div class="DataTables_sort_wrapper">Part Name
                                            <span class="DataTables_sort_icon css_right ui-icon ui-icon-carat-2-n-s"></span>
                                        </div>
                                    </th>
                                    <th class="ui-state-default" role="columnheader" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="Engine version: activate to sort column ascending">
                                        <div class="DataTables_sort_wrapper">Qty
                                            <span class="DataTables_sort_icon css_right ui-icon ui-icon-carat-2-n-s"></span>
                                        </div>
                                    </th>
                                    <th class="ui-state-default" role="columnheader" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="Engine version: activate to sort column ascending">
                                        <div class="DataTables_sort_wrapper">Material And Price
                                            <span class="DataTables_sort_icon css_right ui-icon ui-icon-carat-2-n-s"></span>
                                        </div>
                                    </th>
<!--                                     <th class="ui-state-default" role="columnheader" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="Engine version: activate to sort column ascending"> -->
<!--                                         <div class="DataTables_sort_wrapper">Material Price(USD) -->
<!--                                             <span class="DataTables_sort_icon css_right ui-icon ui-icon-carat-2-n-s"></span> -->
<!--                                         </div> -->
<!--                                     </th> -->
                                    <th class="ui-state-default" role="columnheader" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="Engine version: activate to sort column ascending">
                                        <div class="DataTables_sort_wrapper">Processing And Price
                                            <span class="DataTables_sort_icon css_right ui-icon ui-icon-carat-2-n-s"></span>
                                        </div>
                                    </th>
                                    <th class="ui-state-default" role="columnheader" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="Engine version: activate to sort column ascending">
                                        <div class="DataTables_sort_wrapper">
                                            <span class="DataTables_sort_icon css_right ui-icon ui-icon-carat-2-n-s"></span>
                                        </div>
                                    </th>
                                </tr>
                                </thead>

                                <tbody role="alert" aria-live="polite" aria-relevant="all">
                                <c:forEach var="obj" items="${orderDetails}" varStatus="i">
                                <tr class="gradeA odd">
                                    <td>${obj.partName}</td>
                                     <td>${obj.goodsSet}</td>
                                    <td>
<%--                                      ${obj.price} &nbsp;USD  --%>
                                     <a href="${ctx}/calculator/toUpdateOrderDetails.do?orderDetailsId=${obj.id}" style="float: right;color: #49afcd;text-decoration: underline;">Edit</a>
                                     <label>${types[i.count-1]}                                      
                                      &nbsp;&nbsp;&nbsp;&nbsp;${unitMaterialPrice[i.count-1].price} ${amountUnit.currencyShorthand}/TON
                                     </label> 
                                     <label>
                                     <c:if test="${obj.selectUnit == 'mm'}">${obj.productSize}</c:if>
                                     <c:if test="${obj.selectUnit == 'inch'}">${obj.productSizeInch}</c:if> 
                                    </label>
                                     <label>Weight:
                                     <fmt:formatNumber type="number" value="${obj.weight * 1000}" maxFractionDigits="2"/>kg
                                     </label>
<%--                                      <c:forEach begin="1" end="${processDetails.get(i.count-1).size()}" varStatus="j" step="1">      --%>
<%--                                      <p style="float:left;color: #2bc82b;">-process${j.index}:${processDetails.get(i.count-1).get(j.count-1).level1}</p><br>   --%>
<%--                                      </c:forEach>                           --%>
                                    <br>
                                    </td>
                                   
<%--                                     <td>${obj.price} </td> --%>
                                    <td>
<%--                                     ${obj.productProcessPrice}&nbsp;USD --%>
                                    <a href="#" onclick="queryEdit('${obj.id}','2')" style="float: right;color: #49afcd;text-decoration: underline;">Edit</a>
                                     <c:forEach begin="1" end="${processDetails.get(i.count-1).size()}" varStatus="j" step="1">     
                                     <p style="color: #2bc82b;">-process${j.index}:${processDetails.get(i.count-1).get(j.count-1).level1}</p>  
                                     </c:forEach>   
<!--                                     <br> -->
<%--                                     <a href="#" onclick="queryEdit('${obj.id}','2')" onclick="queryDetails('${obj.id}','${obj.productProcessPrice}')" style="margin-left: -18px;color: #08c;text-decoration: underline;">Details</a> --%>
                                    </td>
                                    <td class="center" style="white-space: nowrap;">
<%--                                         <a href="${ctx}/calculator/toUpdateOrderDetails.do?orderDetailsId=${obj.id}"><button class="btn btn-primary">Edit</button></a> --%>
                                        <a href="#" style="float: right;color: #aaa;text-decoration: underline;" onclick="delete_product('${obj.id}',this)">Delete</a>
                                    </td>
                                </tr>
                                </c:forEach>                                
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="w-bottom">
            <div class="w-text" style="text-align: center;">
<!--                 <p>How many sets do you need?</p> -->
<%--                 <input id="total_qty" type="text" name="text" placeholder="Required" value="${clientOrder.totalSets}" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"> --%>
                <a href="#"><button type="submit" id="estimate_btn" class="btn btn-info" style="padding: 4px 30px;" onclick="estimate_price('${clientOrder.quoteId}')">Estimate Total Price</button></a>
                
<%--                  <strong>Update&nbsp;&nbsp;Date:</strong><span class="red_txt" style="color: #ff7f59;">${amountUnit.updateDate}</span> --%>
            </div>
            <div style="float: right;margin-top: -25px;font-size: 13px;">
             <strong>Exchange Rate:</strong><span id="amount_unit" class="red_txt" style="color: #ff7f59;">
                 <fmt:parseDate var="dateObj" value="${amountUnit.updateDate}" type="DATE" pattern="yyyy-MM-dd"/>
                 <fmt:formatDate var="reTime" value='${dateObj}' pattern='MM/dd/yyyy' />

             
                 <span id="exchangeRate">
                 <c:if test="${amountUnit.currencyShorthand == 'USD'}">
                 ${unitCNY.exchangeRate}  
                 </c:if>
                 <c:if test="${amountUnit.currencyShorthand != 'USD'}">
                 ${amountUnit.exchangeRate}  
                 </c:if>
                 </span> 
                 <c:if test="${amountUnit.currencyShorthand == 'USD'}">
                 ${unitCNY.currencyShorthand}/USD  ${reTime}
                 </c:if>
                 <c:if test="${amountUnit.currencyShorthand != 'USD'}">
                 ${amountUnit.currencyShorthand}/USD  ${reTime}
                 </c:if>
                 </span>
             </div> 
        </div>
    </div>

</div>
<c:if test="${clientOrder.quoteId == 0001617}">
<div class="imgs_add"><img src="images/new4_8/1.png"></div>
</c:if>
<c:if test="${clientOrder.quoteId == 0001620}">
<div class="imgs_add"><img src="images/new4_8/2.png"></div>
</c:if>
<c:if test="${clientOrder.quoteId == 0001628}">
<div class="imgs_add"><img src="images/new4_8/3.png"></div>
</c:if>
<c:if test="${clientOrder.quoteId == 0001625}">
<div class="imgs_add"><img src="images/new4_8/4.png"></div>
</c:if>
<c:if test="${clientOrder.quoteId == 0001630}">
<div class="imgs_add"><img src="images/new4_8/5.png"></div>
</c:if>

<script type="text/javascript" src="${ctx}/calculator/js/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="${ctx}/calculator/js/calculator.js"></script>
<script type="text/javascript" src="${ctx}/calculator/js/easydialog.min.js"></script> 
<script type="text/javascript" src="js/cookie_util.js"></script>	
<script type="text/javascript">

     //删除产品
     function delete_product(id,obj){
    	 
    	 var btnFn = function(){   		    		 
    		 $.post(
    				  '/steelPlate/calculator/deleteOrderDetailsById.do',
	 					{
    					   "orderDetailsId" : id
	 				    },
	 				   function(result){
	 				    if(result.state == 0){
	 				    	easyDialog.open({
	 				    		  container : {
	 				    		    header : 'Prompt message',
	 				    		    content : 'Delete successfully'
	 				    		  },
	 				    		  autoClose : 500
	 				    		}); 
	 				    $(obj).parents('tr').remove();
	 				    }
	 				    
	 				  })   
    		 
 		 
    		  return false;
    		};

    		easyDialog.open({
    		  container : {
    		    header : 'Prompt message',
    		    content : 'Whether to confirm the deletion?',
    		    yesFn : btnFn,
    		    yesText : 'confirm',
   		        noText : 'cancel',
    		    noFn : true
    		  }
    		});
    	 
     }
     
     //添加产品
     function increase_product(quoteId){
    	 window.location = "${ctx}/calculator/toIncreaseProduct.do?quoteId="+quoteId;	
     }         
     
     //计算总价
     function estimate_price(quoteId){
//     	 if($('#total_qty').val() == null || $('#total_qty').val() == 'undefined' || $('#total_qty').val() == ''){
//     		 easyDialog.open({
// 	    		  container : {
// 	    		    header : 'Prompt message',
// 	    		    content : 'Please enter the quantity'
// 	    		  },
// 	    		  autoClose : 1000
// 	    		}); 
//     	  $('#total_qty').focus();
//           return false;
//     	 }
//     	 var qty = $('#total_qty').val();
    	 
//     		//控制数量不为空
// 			if(qty == 0){
// 				 easyDialog.open({
// 		    		  container : {
// 		    		    header : 'Prompt message',
// 		    		    content :'Qty per set can not be zero'
// 		    		  },
// 		    		  autoClose : 1000
// 		    		}); 	
// 				 return false;
// 			}
    	 
    	 //防止重复点击
    	 $('#estimate_btn').css({"background-color":"#666"}).attr("disabled","true");   	 
    	 
    	 $.ajax({
 	      	url:"updateClientOrder.do",
 	      	method:'post',
 	      	data : {
 					 "quoteId" : quoteId
//  					 "qty" : qty 
 					},
 				success : function(data) {
//  					 $('#estimate_btn').css({"background-color":"#5d9cec"}).removeAttr("disabled");  
//  					 if(data == null || data == '' || data == undefined){
//  						window.location = "${ctx}/calculator/calculator_confirm.jsp?quoteId="+quoteId; 
//  					 }else{
 						window.location = "${ctx}/calculator/queryResult.do?quoteId="+quoteId; 
//  					 }
 					 
 					
 				},error:function(msg){
 					$('#estimate_btn').css({"background-color":"#5d9cec"}).removeAttr("disabled");  
 					easyDialog.open({
			    		  container : {
			    		    header : 'Prompt message',
			    		    content : 'Failed to generate'
			    		  },
			    		  autoClose : 1000
			    		}); 
 				}
 				
 	      });
    	 
     }
     //返回首页
     function queryAll(){
    	 window.location = "${ctx}/calculator/queryAll.do?type="+Math.random();
     }
     //跳转工艺修改页面
     function queryEdit(orderDetailsId,detailCode){
    	 window.location = "${ctx}/calculator/queryAllProcess.do?orderDetailsId="+orderDetailsId+"&type="+Math.random()+"&detailCode="+detailCode;
     }
     
     //查询工艺详情
     function queryDetails(orderDetailsId,processPrice){
    	 $.ajax({
  	      	url:"/steelPlate/calculator/queryOrderDetailsById.do",
  	      	method:'post',
  	      	data : {
  					 "orderDetailsId" : orderDetailsId
  					},
  				success : function(result) {
  					var tl = result.data.processDetails.length;
					var processDetails = result.data.processDetails;
					var processInfos = result.data.processInfos;
					var exchangeRate = result.data.exchangeRate;
					$('.gs').children('div').empty();
					var process = '';
					for(var i=0;i<tl;i++){    
						if(i == tl-1){
							if(processDetails[i].level1Parameter == 'Hot dip galvanizing' || processDetails[i].level1Parameter == 'Cold galvanizing'){
								process += Number(processPrice/processDetails[i].level3Parameter).toFixed(5) +'*'+ processDetails[i].level3Parameter;
							}else{
								process += Number(processDetails[i].unitPrice/exchangeRate).toFixed(5) +'*'+ processDetails[i].level3Parameter;	
							}
						}else{
							if(processDetails[i].level1Parameter == 'Hot dip galvanizing' || processDetails[i].level1Parameter == 'Cold galvanizing'){
								process += Number(processPrice/processDetails[i].level3Parameter).toFixed(5) +'*'+ processDetails[i].level3Parameter+"+";
							}else{
								process += Number(processDetails[i].unitPrice/exchangeRate).toFixed(5) +'*'+ processDetails[i].level3Parameter+"+";	
							}
						}                                 	                                         	
                     }	
					process = process + "≈" + processPrice;		
					$('.gs').children('div').append(process);
  					$('#details').show();
  					
  				},error:function(msg){
  					
  					
  				}
  				
  	      });
     }
     
  //关闭工艺详情
  function close_datails(){
	  $('#details').hide();
  }
  
     
     
</script>





<script async src="https://www.googletagmanager.com/gtag/js?id=AW-1072713230"></script>
<script type="text/javascript" src="js/getKey.js"></script> 
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());
  gtag('config', 'AW-1072713230');
</script>
<script>
function gtag_report_conversion(url) {
  var callback = function () {
    if (typeof(url) != 'undefined') {
      url = "http://calculator.metal-work.com/steelPlate/calculator/queryAll.do?type="+Math.random();		
      window.location = url;
    }
  };
  gtag('event', 'conversion', {
      'send_to': 'AW-1072713230/JAZUCIKrPhCOnMH_Aw',
      'value': 1.0,
      'currency': 'USD',
      'event_callback': callback
  });
  return false;
}
</script>
</body>
</html>
