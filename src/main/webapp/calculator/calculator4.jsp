<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
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
    <link rel="stylesheet" href="css/calculator4.css"/>
    <link rel="stylesheet" href="css/calculator.css" />
     <link rel="shortcut icon" href="images/favicon1.ico">
    
    <link rel="stylesheet" href="css/easydialog.css" />



 <!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-300197-18"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-300197-18');
</script>







<style>
  span.show-span{
      float: right; 
  }
   .w-left p {
    width: 252px;
  }
  #input_qty{
  width: 67px;
  text-align:center;
  margin-left: 24px;
  height: 13px;
  border: solid 1px #ff7f59; 
  margin-bottom: 1px;
  float:right;
  }
 .z-exchange{
     float: right;
     font-size: 14px;
 }
 
</style>
</head>
<body>
<div class="navbar nav-bground" role="navigation">
	<div class="header_content">
    	<a href="#"><img src="images/navtop/logo.png" class="logo-img" alt=""></a>
    	<div class="w-email"> Email us : <a class="o-email" href="mailto:rfq@csmfg.com?subject=Steel Fabrication RFQ&body=%0d%0d%0a Note:We will reply you within 24 hours." onclick="gtag_report_conversion('http://calculator.metal-work.com/steelPlate/calculator/queryAll.do')">RFQ@csmfg.com</a></div>
	</div>
</div>

<div class="out-big-box">            
<div class="big-box">
    <div class="container-fluid">
    <!-- <div class="w-email"> Email us : <a href="mailto:rfq@csmfg.com?subject=Steel Fabrication RFQ&body=%0d%0d%0a Note:We will reply you within 24 hours." onclick="gtag_report_conversion('http://calculator.metal-work.com/steelPlate/calculator/queryAll.do')">RFQ@csmfg.com</a></div> -->
        <div id="breadcrumb"> <a onclick="window.history.go(-1)" class="tip-bottom" style="padding-left:0;"><i class="icon-chevron-left"></i>Back</a>
        </div>
        <div class="row-fluid">
            <div class="span12">
                <div class="widget-box">
                    <div class="widget-content nopadding">
                        <div id="DataTables_Table_0_wrapper" class="dataTables_wrapper" role="grid">
                            <table class="table table-bordered data-table dataTable" id="DataTables_Table_0">
                                <thead>
                                <tr role="row">
                                    <th class="ui-state-default" role="columnheader" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="Platform(s): activate to sort column ascending">
                                        <div class="DataTables_sort_wrapper">Part Name
                                            <span class="DataTables_sort_icon css_right ui-icon ui-icon-carat-2-n-s"></span>
                                        </div>
                                    </th>
                                    <th class="ui-state-default" role="columnheader" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="Engine version: activate to sort column ascending">
                                        <div class="DataTables_sort_wrapper">Material
                                            <span class="DataTables_sort_icon css_right ui-icon ui-icon-carat-2-n-s"></span>
                                        </div>
                                    </th>
                                    <th class="ui-state-default" role="columnheader" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="Engine version: activate to sort column ascending">
                                        <div class="DataTables_sort_wrapper">Weight(KG)
                                            <span class="DataTables_sort_icon css_right ui-icon ui-icon-carat-2-n-s"></span>
                                        </div>
                                    </th>
                                    <th class="ui-state-default" role="columnheader" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="Engine version: activate to sort column ascending">
                                        <div class="DataTables_sort_wrapper">Qty
                                            <span class="DataTables_sort_icon css_right ui-icon ui-icon-carat-2-n-s"></span>
                                        </div>
                                    </th>
                                    <th class="ui-state-default" role="columnheader" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="Engine version: activate to sort column ascending">
                                        <div class="DataTables_sort_wrapper">Material Price(USD)
                                            <span class="DataTables_sort_icon css_right ui-icon ui-icon-carat-2-n-s"></span>
                                        </div>
                                    </th>
                                    <th class="ui-state-default" role="columnheader" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="Engine version: activate to sort column ascending">
                                        <div class="DataTables_sort_wrapper">Processing Price(USD)
                                            <span class="DataTables_sort_icon css_right ui-icon ui-icon-carat-2-n-s"></span>
                                        </div>
                                    </th>
                                    <th class="ui-state-default" role="columnheader" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="Engine version: activate to sort column ascending">
                                        <div class="DataTables_sort_wrapper">Part Price(USD)
                                            <span class="DataTables_sort_icon css_right ui-icon ui-icon-carat-2-n-s"></span>
                                        </div>
                                    </th>
                                </tr>
                                </thead>

                                <tbody role="alert" aria-live="polite" aria-relevant="all">
                               <c:forEach var="obj" items="${orderDetails}" varStatus="i">
                                 <tr class="gradeA odd">
                                    <td>${obj.partName}</td>
                                    <td>${types[i.count-1]}                                    
                                    <c:if test="${obj.selectUnit == 'mm'}">${obj.productSize}</c:if>
                                    <c:if test="${obj.selectUnit == 'inch'}">${obj.productSizeInch}</c:if> 
                                    </td>
                                    <td><fmt:formatNumber type="number" value="${obj.weight * 1000}" maxFractionDigits="2"/></td>
                                    <td>${obj.goodsSet}</td>
                                    <td>${obj.price}</td>
                                    <td style="white-space: nowrap;">${obj.productProcessPrice}<a class="tip-bottom z-a-style" onclick="show_orderDetails('${obj.id}',this)">View Details</a></td>
                                    <td>${obj.unitPrice}</td>
                                </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row-fluid" id="details_div" style="display:none;">
            <div class="span12">
                <div class="widget-box">
                     <input type="hidden" value="" id="click_order_id"/>
                    <div class="widget-content nopadding">
                        <div id="DataTables_Table_0_wrapper" class="" role="grid">
   
                            <table class="table table-bordered data-table dataTable" id="DataTables_Table_0" style="height: inherit;">
                                <thead>
                                <tr role="row">
                                    <th class="ui-state-default w-default" role="columnheader" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="Platform(s): activate to sort column ascending">
                                        <div class="DataTables_sort_wrapper">No.
                                            <span class="DataTables_sort_icon css_right ui-icon ui-icon-carat-2-n-s"></span>
                                        </div>
                                    </th>
                                    <th class="ui-state-default w-default" role="columnheader" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="Engine version: activate to sort column ascending">
                                        <div class="DataTables_sort_wrapper">Process
                                            <span class="DataTables_sort_icon css_right ui-icon ui-icon-carat-2-n-s"></span>
                                        </div>
                                    </th>
                                    <th class="ui-state-default w-default" role="columnheader" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="Engine version: activate to sort column ascending">
                                        <div class="DataTables_sort_wrapper">Requirements
                                            <span class="DataTables_sort_icon css_right ui-icon ui-icon-carat-2-n-s"></span>
                                        </div>
                                    </th>
<!--                                     <th class="ui-state-default w-default" role="columnheader" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="Engine version: activate to sort column ascending"> -->
<!--                                         <div class="DataTables_sort_wrapper">Surface Treatment -->
<!--                                             <span class="DataTables_sort_icon css_right ui-icon ui-icon-carat-2-n-s"></span> -->
<!--                                         </div> -->
<!--                                     </th> -->
                                    <th class="ui-state-default w-default" role="columnheader" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="Engine version: activate to sort column ascending">
                                        <div class="DataTables_sort_wrapper">Units
                                            <span class="DataTables_sort_icon css_right ui-icon ui-icon-carat-2-n-s"></span>
                                        </div>
                                    </th>
<!--                                     <th class="ui-state-default w-default" role="columnheader" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="Engine version: activate to sort column ascending"> -->
<!--                                         <div class="DataTables_sort_wrapper">Unit Price(CNY) -->
<!--                                             <span class="DataTables_sort_icon css_right ui-icon ui-icon-carat-2-n-s"></span> -->
<!--                                         </div> -->
<!--                                     </th> -->
                                    <th class="ui-state-default w-default" role="columnheader" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="Engine version: activate to sort column ascending">
                                        <div class="DataTables_sort_wrapper">Total Price(USD)
                                            <span class="DataTables_sort_icon css_right ui-icon ui-icon-carat-2-n-s"></span>
                                        </div>
                                    </th>
                                </tr>
                                </thead>

                                <tbody role="alert" aria-live="polite" aria-relevant="all" id="process_tbody">                       
                                </tbody>
                            </table>

                        </div>
                    </div>
           
            </div>
    
</div>
</div>
        
        <div class="w-bottom">
            <div class="w-tablt">
                 <div class="z-exchange">
                 <strong>Exchange Rate:</strong><span id="amount_unit" class="red_txt" style="color: #ff7f59;"><span id="exchangeRate">${amountUnit.exchangeRate}</span> ${amountUnit.currencyShorthand}/USD</span>
                 <br>
                 <strong>Update&nbsp;&nbsp;&nbsp; Date:</strong><span class="red_txt" style="color: #ff7f59;">${amountUnit.updateDate}</span>
                 <input type="hidden" value="${exchangeRate}" id="exchange_rate"/>
                </div>
                <table>
                    <tbody>
                    <tr>
                        <td>Unit Price:<span class="show-span" style="color: #ff7f59;"> <fmt:formatNumber value="${unitPrice}" type="number" maxFractionDigits="2"/>USD</span></td>
                    </tr>
                    <tr>
                        <td style="white-space: nowrap;">Profit,Management Cost<span style="color: #ff7f59;">&nbsp;(${profitRate}%):</span><span class="show-span" style="color: #ff7f59;">${clientOrder.profitManagment}USD</span></td>
                    </tr>
                    <tr>
                        <td>Tax:<span class="show-span" style="color: #ff7f59;">${clientOrder.tax}USD</span></td>
                    </tr>                  
                    <tr>
                        <td>Final Price(Ex Work):
                        <span class="show-span" style="color: #ff7f59;margin-left: 21px;">                      
                        <fmt:formatNumber value="${clientOrder.finallyPrice}" type="number" maxFractionDigits="2"/> USD
                        </span></td>   
                        
                                                <c:if test="${amountUnit.currencyShorthand != 'USD'}">
                        <td><span style="white-space: nowrap;color: #3063fb;">(<fmt:formatNumber value="${selectUnitPrice}" type="number" maxFractionDigits="2"/>${amountUnit.currencyShorthand})</span></td>
                        </c:if>
                        <td><button class="btn btn-info btn-large" id="print" style="margin-left: 287px;">Export to EXCEL</button></td>                   
                        <td><a href="mailto:RFQ@CSMFG.COM?subject=Fabrication Inquiry:${clientOrder.quoteId}" onclick="gtag_report_conversion()"><button style="margin-left:3px;" class="btn btn-info btn-large">Email drawings to get precise quotes</button></a></td>                
                    </tr>
<!--                     <tr> -->
<!--                         <td><hr style="margin:0px;height:1px;border:0px;background-color:#D5D5D5;color:#D5D5D5;"/></td> -->
<!--                     </tr> -->
<!--                     <tr> -->
<%--                         <td>Set:<span class="show-span" style="color: #ff7f59;margin-left: 21px;">${clientOrder.totalSets}</span></td> --%>
                        
<!--                     </tr> -->
<!--                     <tr> -->
<!--                         <td>Discount:<span class="show-span" style="color: #ff7f59;">                       -->
<%--                         <fmt:formatNumber value="${clientOrder.discount}" type="number" maxFractionDigits="0"/>USD</span></td>  --%>
<!--                         <td> -->
<!--                         <img src="images/info.png" style="margin-left: 5px;" id="discount_img"/> -->
<!--                         <img style="display:none;position: absolute;margin-left: 25px;margin-top: -160px" src="images/discount.png"> -->
<!--                         </td>  -->
<!--                     </tr>                      -->
<!--                     <tr> -->
<!--                         <td>Total(Ex Work):<span class="show-span" style="color: #ff7f59;">                       -->
<%--                         <fmt:formatNumber value="${clientOrder.totalPrice}" type="number" maxFractionDigits="0"/>USD</span></td>  --%>
<!--                     </tr>  -->
<!--                     <tr> -->
<!--                         <td>China inland shipping cost:<span class="show-span" style="color: #ff7f59;">                       -->
<%--                         <fmt:formatNumber value="${clientOrder.inlandShippingCost}" type="number" maxFractionDigits="0"/>USD</span></td>  --%>
<!--                     </tr>      -->
<!--                     <tr> -->
<!--                         <td>Total (FOB Shanghai):<span class="show-span" style="color: #ff7f59;"> -->
<%--                         <fmt:formatNumber value="${clientOrder.fobPrice}" type="number" maxFractionDigits="0"/>USD</span></td> --%>
<%--                         <c:if test="${amountUnit.currencyShorthand != 'USD'}"> --%>
<%--                         <td><span style="white-space: nowrap;color: #3063fb;">(<fmt:formatNumber value="${selectUnitPrice}" type="number" maxFractionDigits="2"/>${amountUnit.currencyShorthand})</span></td> --%>
<%--                         </c:if> --%>
<!--                         <td><button class="btn btn-info btn-large" id="print" style="margin-left: 287px;">Export to EXCEL</button></td>                    -->
<%--                         <td><a href="mailto:RFQ@CSMFG.COM?subject=Fabrication Inquiry:${clientOrder.quoteId}" onclick="gtag_report_conversion()"><button style="margin-left:3px;" class="btn btn-info btn-large">Email drawings to get precise quotes</button></a></td>                     --%>
<!--                     </tr>                      -->
                    </tbody>
                </table>
            </div>
        </div>
    </div>

</div>
</div>

<div class="w-btn">
<!--     <div class="w-last">         -->
<!--         <a href="#"> -->
<%--         <button class="btn btn-primary btn-large" onclick="get_shipping_cost('${clientOrder.quoteId}')" id="further_cost_btn" style="margin-right: 27px;">Get further shipping cost</button> --%>
<!--         </a> -->
<!--     </div> -->
   <input id="quoteId" type="hidden" value="${clientOrder.quoteId}" /> 
   <input id="modeOfTransport" type="hidden" value="${clientOrder.modeOfTransport}" /> 
</div>

<!-- Start of LiveChat (www.livechatinc.com) code --> 
<script type="text/javascript"> window.__lc = window.__lc || {}; window.__lc.license = 9673975; (function() { var lc = document.createElement('script'); lc.type = 'text/javascript'; lc.async = true; lc.src = ('https:' == document.location.protocol ? 'https://' : 'http://') + 'cdn.livechatinc.com/tracking.js'; var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(lc, s); })(); </script>
 <!-- End of LiveChat code -->

<script type="text/javascript" src="<%=request.getContextPath()%>/calculator/js/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/calculator/js/calculator.js"></script>
<script type="text/javascript" src="js/easydialog.min.js"></script> 	
<script type="text/javascript" src="js/cookie_util.js"></script>
<script type="text/javascript">

   $(function() {
	  
	   var amount = $('#amount_unit').text();  
       if(amount == '1.0 USD/USD'){
    	  var exchangeRate =  $('#exchange_rate').val();
    	  $('#amount_unit').text(exchangeRate+' CNY/USD');
       }      
	   
	   //鼠标移入事件
	   $('#discount_img').mouseover(function(){
		   $('#discount_img').next().show(); 		   
	   }).mouseout(function (){  
		   $('#discount_img').next().hide();
       });  	   
	   
	   
	/**
	 *打印报表(excel)
	 */
	$("#print").click(function(){
		      var quoteId = $('#quoteId').val();				    
		      window.location.href = "/steelPlate/calculator/printResult.do?quoteId="
					+ quoteId;				      
				
			});
	
	
	/**
	 *数量变化情况
	 */
	$('#input_qty').blur(function(){
		
		 if($('#input_qty').val() == null || $('#input_qty').val() == 'undefined' || $('#input_qty').val() == ''){
    		 easyDialog.open({
	    		  container : {
	    		    header : 'Prompt message',
	    		    content : 'Please enter the quantity'
	    		  },
	    		  autoClose : 1000
	    		}); 
    	  $('#input_qty').focus();
          return false;
    	 }
    	 var qty = $('#input_qty').val();
    	 var quoteId = $('#quoteId').val();
    	 $.ajax({
 	      	url:"/steelPlate/calculator/updateClientOrder.do",
 	      	type:'post',
 	      	dataType:"text",
 	      	data : {
 					 "quoteId" : quoteId,
 					 "qty" : qty 
 					},
 				success : function(data) {
 					 window.location = "${ctx}/calculator/queryResult.do?quoteId="+quoteId;
 					
 				},error:function(msg){
 					
 				}
 				
 	      });
    	 return false;
        })
	
	
    })



 function queryDestinationPort(){
	    $('#select_city').html("");
 	var country = $('#select_country').val();
	   $.post(
			 "/steelPlate/calculator/queryLclDestinationPort.do",
				{
				"country":country				    	       
				},
		function(result){
	    	   
			    if(result.state == 0){
			    	var list = result.data;	
			    	for(var i=0;i<list.length;i++){
			    	  $('#select_city').append("<option value='"+list[i].zhongDianRegion+"'>"+list[i].zhongDianRegion+"</option>");
			    	}
	           
			  }else{
				  alert(result.message);
			  }
		  
		  });	
}

//计算运费
function calculate_ShippingFee(){
	
   var totalWeight = $('#totalWeight').text();
   var totalSpace = $('#totalSpace').text();
   var quoteId = $('#quoteId').val();
   
   if(quoteId == null || quoteId == ''){
	   easyDialog.open({
    		  container : {
    		    header : 'Prompt message',
    		    content : 'quoteId can not empty!'
    		  },
    		  overlay : false,
    		  autoClose : 2000
    		}); 
   }
   
   var country = $('#select_country').val();
   var destinationPort = $('#select_city').val();
   
   if(country == null || country == ''){
	   easyDialog.open({
    		  container : {
    		    header : 'Prompt message',
    		    content : 'Country can not empty!'
    		  },
    		  overlay : false,
    		  autoClose : 1000
    		}); 
	   return false; 
   }
   if(destinationPort == null || destinationPort == ''){
	   easyDialog.open({
    		  container : {
    		    header : 'Prompt message',
    		    content : 'City can not empty!'
    		  },
    		  overlay : false,
    		  autoClose : 1000
    		}); 
   }
   var packing =  $('#red_txt1').text();  
   var modeOfTransport = $('input:radio[name="Fruit"]:eq(0)').parent().prev().prev().text();
   $.post(
			 "/steelPlate/calculator/queryCalculatePrice.do",
				{
				"totalWeight":totalWeight,
				"totalSpace" : totalSpace,
				"quoteId" : quoteId,
				"country" : country,
				"destinationPort" : destinationPort,
				"packing" : packing,
				"modeOfTransport" : modeOfTransport
				},
		function(result){
	    	   
			    if(result.state == 0){
                 $('#red_txt2').text(result.data.fobPrice);
                 $('#red_txt3').text(result.data.cifPrice);
                 $("#shippingFee_lcl").text(result.data.shippingFeeLcl);
                 $("#shippingFee_fcl").text(result.data.shippingFeeFcl);
                 
                 $('input:radio[name="Fruit"]:eq(0)').attr("checked",'checked'); 
                 $('#modeOfTransport').val('LCL shipping');
                 
                 if($(".w-show").is(":hidden")){
                	 $('.w-show').show(); 
                 }                                   
                 
                 easyDialog.open({
		    		  container : {
		    		    header : 'Prompt message',
		    		    content : 'submitted successfully'
		    		  },
		    		  overlay : false,
		    		  autoClose : 500
		    		});
                 
			  }else{
			      easyDialog.open({
                	  container : {
                	    header : 'Prompt message',
                	    content : 'Sorry,query failed'
                	  },
                	  overlay : false,
                	  autoClose : 1000
                	});
			  }
			    
		  });

}

  //确认运费选择
  function confirm_shippingFee(){
	  var quoteId = $('#quoteId').val();	  
	  var shippingFee = $('input:radio[name="Fruit"]:checked').parent().prev().find('span:first').text(); 
	  var modeOfTransport = $('input:radio[name="Fruit"]:checked').parent().prev().prev().text();
	  var packing =  $('#red_txt1').text();

	  
	  $.ajax({
      	url:"/steelPlate/calculator/confirmShippingFee.do",
      	method:'post',
      	data : {
				 "quoteId" : quoteId,
				 "shippingFee" : shippingFee,
				 "modeOfTransport" : modeOfTransport,
				 "packing" : packing
				},
			success : function(data) {
				setTimeout(function(){location.reload()},500);	
				
			},error:function(msg){
				
			}
			
      });
	  
  }

  
  //跳转计算运费界面
  function get_shipping_cost(quoteId){	  
	  window.location = "${ctx}/calculator/queryShippingCost.do?quoteId="+quoteId;
  }
  
  //查看订单详情
  function show_orderDetails(orderDetailsId,obj){	 
      var clickId = $('#click_order_id').val();
      $('#click_order_id').val(orderDetailsId);
	  if((clickId == orderDetailsId) && ($('#details_div').css('display') != 'none')){
		  $('#details_div').hide();
		  $(obj).css({"color":"#666"});
		  return false;
	  }else{
		  $('.z-a-style').css({"color":"#666"});
		  $('#details_div').show();
		  $(obj).css({"color":"#00a2e9"});
	  }

	  $('#process_tbody').empty();
	  $.ajax({
	      	url:"/steelPlate/calculator/queryOrderDetailsById.do",
	      	method:'post',
	      	data : {
					 "orderDetailsId" : orderDetailsId
					},
				success : function(result) {
					if(result.state == 0){						
						var tl = result.data.processDetails.length;
						var processDetails = result.data.processDetails;
						var processInfos = result.data.processInfos;
						var exchangeRate = $('#exchange_rate').val();
                        for(var i=0;i<tl;i++){                      	
                           var totalPrice = Number(processDetails[i].unitPrice) * Number(processDetails[i].level3Parameter) / Number(exchangeRate);	
                           var tr = '<tr class="gradeA odd">'+
			                           '<td>'+(i+1)+'</td>'+
			                           '<td>'+processDetails[i].level1Parameter+'</td>'+
			                           '<td>'+(processDetails[i].level2Parameter == '' ? (processInfos[i].superficialState == 0 ? "" : ((processDetails[i].outsideSurface == 1 && processDetails[i].insideSurface == 1) == true ? "Both side" : ((processDetails[i].outsideSurface == 0 ? "" : "Outside ") + (processDetails[i].insideSurface == 0 ? "" : "Inside")))):processDetails[i].level2Parameter)+'</td>'+
// 			                           '<td><span style="display:none;">'+processInfos[i].superficialState+'</span>'+ (processInfos[i].superficialState == 0 ? "" : ((processDetails[i].outsideSurface == 1 && processDetails[i].insideSurface == 1) == true ? "Both side" : ((processDetails[i].outsideSurface == 0 ? "" : "Outside ") + (processDetails[i].insideSurface == 0 ? "" : "Inside")))) +'</td>'+			                           
			                           '<td>'+processDetails[i].level3Parameter+'('+processInfos[i].level3+')</td>'+
			                           '<td>'+processDetails[i].processPrice.toFixed(2)+'</td>'+
                                       '</tr>';
                        	$('#process_tbody').append(tr);
                        	
                        }						
					}else{
						easyDialog.open({
		                	  container : {
		                	    header : 'Prompt message',
		                	    content : 'Query failed'
		                	  },
		                	  overlay : false,
		                	  autoClose : 1000
		                	});						
						
					}					
				}
	  
	     });
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