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
     //$(thi).css("border","#BADBEA solid 1px");
	 $(thi).next("p").css("background","url(http://sf.panli.com/FrontEnd/images20090801/Register/prompt.gif) no-repeat "); 
 }
 var es =false; 
 var ns = false;
 var ps = false; 
// var pst = false;
 function fnBlurCheck(id,val){
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
		    	 $.post('../processesServlet',
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
						    	 //zlw add end
							}
		                }
		            );
		     }
		}
/*		else if(id == "name" || val == ''){
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
			    	 $.post('../processesServlet',{action:'getUserName',className:'User',name:name},
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
/*		else if(id == "passt" || val == ''){
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
		}*/
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
		$("#passwordCet").show();
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
	$("#pass").next("p").css("color","black");
    $("#pass").css("border","#BADBEA solid 1px");
    $("#pass").next("p").css("background","#FFF");
    $("#pass").next("p").html("6 - 20 characters (A-Z, a-z, 0-9 only)");
}
 
 function loadimage(){
		document.getElementById("randImage").src = "${path}/processesServlet?action=getRegImage&className=ImageServlet&"+Math.random(); 
}
	