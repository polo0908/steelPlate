var onsub = true;
function fnSumit(){
	 var email =  $.trim($("#email").val());
 	 var name =  $.trim($("#email").val());
 	 //Form:name
 	 $("#name").val($.trim($("#email").val()));
	 var pass =  $.trim($("#pass").val());
	 var businessName =  $.trim($("#businessName").val());
//	 var passt =  $.trim($("#passt").val()); 
	 if(email.length<1){
		 $("#email").next("p").css("color","red");
	     $("#email").css("border","red solid 1px");
	     $("#email").next("p").css("background","white");
	     $("#email").next("p").html("Please enter the email");
	     return;
	 } 
	 
/* 	 if(name.length<1){
		 $("#name").next("p").css("color","red");
	     $("#name").css("border","red solid 1px");
	     $("#name").next("p").css("background","white");
	     $("#name").next("p").html("Please enter the username");
	     return;
	 } */
 	 if(pass.length<1){
		 $("#pass").next("p").css("color","red");
	     $("#pass").css("border","red solid 1px");
	     $("#pass").next("p").css("background","white");
	     $("#pass").next("p").html("Please enter the password");
	     return;
	 } 
/* 	 if(passt.length<1){
		 $("#passt").next("p").css("color","red");
	     $("#passt").css("border","red solid 1px");
	     $("#passt").next("p").css("background","white");
	     $("#passt").next("p").html("Please repeat the password");
	     return;
	 } */

 	var re = /^[0-9a-zA-Z]+$/;
	var length =  $("#pass").val().length;
    if (!re.test(pass) || (6 > length || 20<length)){
    	ps = false;
    }else{
    	ps = true;
	}
    
	var businessNameLength =  $("#businessName").val().length;
    if (100<businessNameLength){
    	ns = false;
    }else{
    	ns = true;
	}
    
// 	if(es && ns && ps && pst && onsub){
 	if(es && ns && ps && onsub){
		onsub = false;
		$.ajax({ 
	       type: "post", 
	       url: '../processesServlet', 
	       cache:false, 
	       async:false, 
	       data:{action:'getNameEmail',className:'User',email:email,name:name},
	       dataType: "html", 
	       success: function(result){ 
 	        	if(result > 0){
	        		onsub = true;
	        		 $("#code_faild").html('Already exists');return;
	        	}
	        	$.post('/cbtconsole/processesServlet',{action:'regSendEmail',className:'RegServlet',email:email,name:name,pass:pass},function(res){});
	     		var form1 = $("#form").serialize();
	     		$.post('/cbtconsole/processesServlet?action=reg&className=RegServlet',form1,function(res){
	     			if(res == 0){
	     				var info = $("#info").val();
	     				if(info != ""){
	     					info = "info=" + info;
	     				}
	     				//zlw add start
	     				showLoading();
	     				//zlw add end
	     				window.location.href = "/cbtconsole/cbt/reg_success.jsp?" + info;
	     			}else if(res == 1){
		        		onsub = true;
	     				$("#code_faild").html('Already exists');return;
	     			}else{
	     				window.location.href = res;
	     			}
	     		});
	        }

		});
	} 
}
	 
//聚焦
function fnFocusCheck(thi,val){
	 $(thi).next("p").html(val);
	 $(thi).next("p").attr("class","prompt");
	 $(thi).next("p").css("color","#9AC55A");
    $(thi).css("border","#BADBEA solid 1px");
	 $(thi).next("p").css("background","url(http://sf.panli.com/FrontEnd/images20090801/Register/prompt.gif) no-repeat "); 
}
function fnFocusCheck1(thi,val){
	 $(thi).next("p").html(val);
	 $(thi).next("p").attr("class","prompt");
	 $(thi).next("p").css("color","#9AC55A");
  // $(thi).css("border","#BADBEA solid 1px");
	 $(thi).next("p").css("background","url(http://sf.panli.com/FrontEnd/images20090801/Register/prompt.gif) no-repeat "); 
}
var es =false; 
var ns = false;
var ps = false; 
//var pst = false;
function fnBlurCheck(id,val,ctx){
	 if(val !=''){
		if($("#"+id).val() == ""){
			 $("#"+id).next("p").html(val);
	    	 $("#"+id).next("p").css("background","white");
			 $("#"+id).next("p").css("color","#CCC");
			return ;
		}
	 } 
		if(id == "email" || val == ''){
		    var email =  $("#email").val();
			  var re =  /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/;   
		     if (!re.test(email))
		    {
		        $("#email").next("p").css("color","red");
		        $("#email").css("border","red solid 1px");
		    	 $("#email").next("p").css("background","white");
		    	 $("#email").next("p").html("Please enter a valid email address.");
		    	 es = false;
		        return false;
		     }else{
		    	 $.post(ctx+'/processesServlet',
		                {action:'getUserEmail',className:'User',email:email},function(res){
		                	if(res == "true"){
								 $("#email").next("p").css("color","red");
							     $("#email").css("border","red solid 1px");
							     $("#email").next("p").html("Email already exists");
							     $("#email").next("p").css("background","white");
							     es = false;
							     return false;
						     }else{
						    	 es = true;
						    	 $("#email").next("p").html("Correct");
						    	 //zlw add start
						    	 getPassword();
						    	 $("#register").show();
						    	 $("#registerBtn").val('Register Now')
						    	// $("#enter").hide();
						    	 //zlw add end
						    	 
							}
		                }
		            );
		     }
		}
		/* else if(id == "name" || val == ''){
			 var name = $("#name").val();
			 var  re = /^[0-9a-z]+$/gi;
		     var length =  $("#name").val().replace(/[^\x00-\xff]/g,"aa").length;
		      if (!re.test(name) || (4 > length || 16<length))
		    {
		        $("#name").next("p").css("color","red");
		        $("#name").css("border","red solid 1px");
		    	 $("#name").next("p").html("Please use 4 - 16 characters (A-Z, a-z, 0-9 only)");
		    	 $("#name").next("p").css("background","white");
		    	 ns = false;
			        return false;
			     }else{
			    	 $.post(ctx+'/processesServlet',{action:'getUserName',className:'User',name:name},
			    			 function(res){
		                	if(res == "true"){
								 $("#name").next("p").css("color","red");
							     $("#name").css("border","red solid 1px");
							     $("#name").next("p").html("User name already exists");
							     $("#name").next("p").css("background","white");
							     ns = false;
							        return false;
							     }else{
							    	 ns = true;
								 $("#name").next("p").html("Correct");
							}
		                }
		           );
		     }
		}*/
		else if(id == "businessName" || val == ''){
			 var businessName = $("#businessName").val();
			 var  re = /^[0-9a-z]+$/gi;
		     var length =  $("#businessName").val().replace(/[^\x00-\xff]/g,"aa").length;
		      if (!re.test(businessName) || (100<length))
		    {
		        $("#businessName").next("p").css("color","red");
		        $("#businessName").css("border","red solid 1px");
		    	 //$("#businessName").next("p").html("Please use 4 - 16 characters (A-Z, a-z, 0-9 only)");
		    	 $("#businessName").next("p").html("Please enter the following character 100 (A-Z, a-z, 0-9 only)");
		    	 $("#businessName").next("p").css("background","white");
		    	 ns = false;
			        return false;
			}else{
		    	 ns = true;
				 $("#businessName").next("p").html("Correct");
		    }
		}
		else if(id == "pass" || val == ''){
			 var pass = $("#pass").val();
			 var re = /^[0-9a-zA-Z]+$/;
			  var length =  $("#pass").val().length;
		      if (!re.test(pass) || (6 > length || 20<length))
		    {
		        $("#pass").next("p").css("color","red");
		        $("#pass").css("border","red solid 1px");
		    	 $("#pass").next("p").html("Please enter 6 - 20 characters");
		    	 $("#pass").next("p").css("background","white");
		    	 ps = false;
			        return false;
			     }else{
			    	 ps = true;
		    	 $("#pass").next("p").html("Correct");
		     }
		}
/* 		else if(id == "passt" || val == ''){
			 var pass = $("#pass").val();
			 var passt = $("#passt").val();
		      if (pass != passt)
		    {
		        $("#passt").next("p").css("color","red");
		        $("#passt").css("border","red solid 1px");
		    	 $("#passt").next("p").html("Your passwords do not match.");
		    	 $("#passt").next("p").css("background","white");
		    	 pst = false;
			        return false;
			     }else{
			    	 pst = true;
		    	 $("#passt").next("p").html("Correct");
		     }
		}  */
		
		var isCheck = document.getElementById("regAgree").checked;
		 if (!isCheck) {
			$("#name").next("p").css("color","red");
	        $("#name").css("border","red solid 1px");
	    	 $("#name").next("p").css("background","white");
	    	// $("#name").next("p").html("请勾选使用条件");
	    	 es = false;
	        return false;
		}
}

function getPassword() {
	var rc = "";
	var yw = new Array("save","win","love","sale","buy","deal","fit","sun","sea","sup","biz",
			"ghip","good","nice","hot","kick","gain","pro","profit","max","won","act","now")
	var numberChars = "0123456789";
	for (var i = 0; i < 6; i++) {
		rc = rc + numberChars.charAt(getRandomNum(0, 6));
	}
	var tmp = yw[parseInt(Math.random()*yw.length)];

	$("#pass").val(tmp+rc);
	$("#autoPass").text(tmp+rc);
	$("#password").show();
	$("#autoPassShow").show();
	$("#passShow").hide();

}

function getRandomNum(lbound, ubound) {
	return (Math.floor(Math.random() * (ubound - lbound)) + lbound);
}

function changePass(){
	$("#autoPassShow").hide();
	$("#passShow").show();
	//清除提交后的错误信息
	$("#pass").next("p").css("color","#CCC");
    $("#pass").css("border","#BADBEA solid 1px");
    $("#pass").next("p").css("background","#FFF");
    $("#pass").next("p").html("6 - 20 characters (A-Z, a-z, 0-9 only)");
    
}

function fnCheck() {
	var isCheck = document.getElementById("regAgree").checked;
	if (isCheck) {
		$("#registerBtn").attr("disabled",false); 
		//$("#enterBtn").attr("disabled",""); 
		$("#registerBtn").css('background','url(/cbtconsole/img/register/nav.gif) 0 0 no-repeat');
		//$("#enterBtn").css('background','url(/cbtconsole/img/register/nav.gif) 0 0 no-repeat');	
		$("#msgact").html('&nbsp;&nbsp;&nbsp;');
	}else{
		$("#registerBtn").attr("disabled","disabled"); 
		//$("#enterBtn").attr("disabled","disabled");
		$("#registerBtn").css('background','url(/cbtconsole/img/register/nav_01.png) 0 0 no-repeat');
		//$("#enterBtn").css('background','url(/cbtconsole/img/register/nav_01.png) 0 0 no-repeat');
		$("#msgact").html('&nbsp;&nbsp;&nbsp;You must accept the Condition of Use'); 
	}
}


 function loadimage(){
		document.getElementById("randImage").src = "${path}/processesServlet?action=getRegImage&className=ImageServlet&"+Math.random(); 
}
 
function showLoading(){
		cDiv();
	    document.getElementById("over2").style.display = "block";
	    document.getElementById("layout2").style.display = "block";
}
 
function cDiv(){
		var divObj=document.createElement("div"); 
		divObj.innerHTML="<div id='over2' style='display: none;position: absolute;top: 0;left: 0;width: 100%;height: 150%;background-color: #f5f5f5;opacity:0.5;z-index: 1000;'></div>" +
				                                        " <div id='layout2' style=' display: none; position: absolute;top: 40%;left: 40%;width: 20%;height: 20%;z-index: 1001;text-align:center;'><img src='/cbtconsole/img/loading/loading.gif' /></div>";
		var first=document.body.firstChild;//得到页面的第一个元素 
		document.body.insertBefore(divObj,first);//在得到的第一个元素之前插入 
}

	