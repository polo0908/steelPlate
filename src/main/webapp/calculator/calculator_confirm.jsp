<%@ page language="java" contentType="text/html; charset=utf-8"
		pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
		<title>Calculator</title>
		<link rel="stylesheet" type="text/css" href="css/bootstrap.css"/>
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
<style type="text/css">
body{font-family:\5FAE\8F6F\96C5\9ED1;color:#666;line-height:20px;}
.big-box{margin:0 auto;width:980px;border:1px solid #cdcdcd;}
.w-email{text-align:right;margin-top:26px;font-size:16px;}
#breadcrumb{background-color:#fff;border-bottom:1px solid #e3ebed;}
#breadcrumb a{font-size:14px;color:#00a2e9;padding:8px 20px 8px 10px;display:inline-block;text-decoration:none;cursor:pointer;}
#breadcrumb a:hover{color:#333333;}
.form-group{margin-bottom:40px;}
.w-top{height:50px;margin-bottom:20px;}
.form-group .btn{padding:4px 30px;color:#fff;text-shadow:0 -1px 0 rgba(0,0,0,0.25);background-color:#49afcd;}
.nav-bground{background:url(images/navtop/top_bg.png) top no-repeat;background-size:cover;}
.header_content{width:1139px;height:60px;margin:0 auto;}
.header_content a{display:inline-block;}
.header_content a img{max-width:100%;padding-top:7px;}
.w-email{text-align:right;margin-top:26px;font-size:16px;display:inline-block;float:right;color:#000;}
.w-email a{color: #000;}
</style>
	</head>
	<body>
		<div class="navbar nav-bground" role="navigation">
			<div class="header_content">
		    	<a href="#"><img src="images/navtop/logo.png" class="logo-img" alt=""></a>
		    	<div class="w-email"> Email us : <a class="o-email" href="mailto:rfq@csmfg.com?subject=Steel Fabrication RFQ&body=%0d%0d%0a Note:We will reply you within 24 hours." onclick="gtag_report_conversion('http://calculator.metal-work.com/steelPlate/calculator/queryAll.do')">RFQ@csmfg.com</a></div>
			</div>
		</div>
		<div class="big-box">
			<div class="container-fluid" style="margin-top:20px;">
				<!-- <div class="w-email"> Email us : <a style="color: #F00;" href="mailto:rfq@csmfg.com?subject=Steel Fabrication RFQ&amp;body=%0d%0d%0a Note:We will reply you within 24 hours." onclick="gtag_report_conversion('http://calculator.metal-work.com/steelPlate/calculator/queryAll.do')">RFQ@csmfg.com</a></div> -->
				<div id="breadcrumb"> <a onclick="window.history.go(-1)" class="tip-bottom" style="padding-left:0;"><i class="icon-chevron-left"></i> < Back</a></div>
				<div class="w-top">
		            <h4 style="float: left;color: #333;">Quick questions before we proceed:</h4>
	        	</div>
	        	<form class="form-horizontal" action="${ctx}/calculator/queryResult.do?quoteId=<%=request.getParameter("quoteId")%>" id="form_id" onsubmit="return submitForm()"   method="post">
<%-- 				  	<input type="hidden" name="quoteId" value="<%=request.getParameter("quoteId")%>"/> --%>
				  	<input type="hidden" name="orderPlan" id="orderPlan"/>
				  	<div class="form-group">
					    <label class="col-sm-4 control-label">Your E-mail address ?</label>
					    <div class="col-sm-4">
					      	<input class="form-control" name="email" type="text" placeholder="Your E-mail address">
					    </div>
				  	</div>
				  	<div class="form-group">
					    <label class="col-sm-4 control-label"><span style="color:red">*</span>When do you plan to order ?</label>
					    <div class="col-sm-8">
					      	<label class="radio-inline">
						        <input type="radio" name="optionsRadiosinline" value="ASAP"> ASAP
						    </label>
						    <label class="radio-inline">
						        <input type="radio" name="optionsRadiosinline" value="Not Sure"> Not Sure
						    </label>
						    <label class="radio-inline">
						        <input type="radio" name="optionsRadiosinline" value="2 Month"> 2 Month
						    </label>
					    </div>
				  	</div>
				  	<div class="form-group">
					    <div class="col-sm-offset-4 col-sm-8">
					      <button type="submit" class="btn btn-default">Submit</button>
					    </div>
					 </div>
				</form>
			</div>
		</div>	
  <script type="text/javascript" src="${ctx}/calculator/js/jquery-1.8.2.min.js"></script>		
  <script type="text/javascript" src="${ctx}/calculator/js/easydialog.min.js"></script> 	
  <script type="text/javascript" src="js/cookie_util.js"></script> 	
<script type="text/javascript">
   $(function(){
	   $('input:radio').change(function(){
		   $('#orderPlan').val($(this).val());
	   })
   })

   
   //提交form
   function submitForm(){
	   var orderPlan = $("input[name='optionsRadiosinline']:checked").val();
	   if(orderPlan == null || orderPlan == '' || orderPlan == undefined){
		   easyDialog.open({
	    		  container : {
	    		    header : 'Prompt message',
	    		    content : 'Please select a plan!'
	    		  },
	    		  autoClose : 1000
	    		}); 
		   return false;
	   }else{
		   return true;  
	   }	   
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
