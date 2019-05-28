var mo=parent.mo.replace(/[^0-9]/ig,"");
$("#moqspan").text("(MOQ="+mo+")");
var api = frameElement.api, W = api.opener;
document.getElementById("sprice").value = $.trim(W.document.getElementById("price").innerHTML.split("-")[0]);
$("#purl").val(W.document.getElementById("purl").value);
$("#email").val(W.email_);
$("#currency").html(W.currency);
$("#currency1").html(W.currency);
var pGoodsUnit = W.pGoodsUnit;
$("#pGoodsUnit").html(pGoodsUnit);
$(function(){
	W.document.onclick = function(){
		frameElement.api.close();
	}
})
//获取国家
fnGetContry();
function fnGetContry(){
	var showContry_ul = document.getElementById("showContry_ul");
	 $.post("/cbtconsole/feeServlet", {action:'getAllZone',className:'ZoneServlet'},
        function  (res) {
        	var json=eval(res);
        	var contry_ul = showContry_ul.innerHTML;
        	var k = 36;
        	var country_info = "USA";
			for(var i=0;i<json.length;i++){
				var map=json[i];
				var text=map.country;
				var value=map.zone;
				var id=map.id;
				showContry_ul.innerHTML += contry_ul;
				var li  = showContry_ul.getElementsByTagName("li")[i+1];
				li.setAttribute("onclick","fnChangeCountry1('"+text+"',"+id+")");
				li.getElementsByTagName("span")[1].innerHTML = text;
				li.getElementsByTagName("input")[0].value = id;
				if(id == 38 || id == 40 || id == 41){
					li.getElementsByTagName("img")[0].src = "/cbtconsole/img/country/39.jpg";
				}else{
					li.getElementsByTagName("img")[0].src = "/cbtconsole/img/country/"+id+".jpg";
				}
				if(W.country == id){
					country_info = text;
				}
			}
			document.getElementById("country_img").src = "/cbtconsole/img/country/"+W.country+".jpg";
			document.getElementById("countryid").value = W.country;
			document.getElementById("chengeContry").innerHTML = country_info;
			/*if(W.country == 29 || W.country == 37){
				document.getElementById("sprice").value = $.trim(W.document.getElementById("price_combine").innerHTML.split("-")[0]);
			}*/
			showContry_ul.removeChild(showContry_ul.getElementsByTagName("li")[0]);
        });
}
	
	function fnChangeCountry1(val,id){
		 document.getElementById("chengeContry").innerHTML = val;
		 document.getElementById("showContry_ao").style.display = "none";
		document.getElementById("contry_a").className = "contry_a";
		if(id == 38 || id == 40 || id == 41){
			 document.getElementById('country_img').src = "/cbtconsole/img/country/39.jpg";
		 }else{
			 document.getElementById('country_img').src = "/cbtconsole/img/country/"+id+".jpg";
		 }
		/*if(id == 29 || id == 37){
			document.getElementById("sprice").value = $.trim(W.document.getElementById("price_combine").innerHTML.split("-")[0].trim());
		}else{
			document.getElementById("sprice").value = $.trim(W.document.getElementById("price").innerHTML.split("-")[0].trim());
		}*/
		document.getElementById("countryid").value = id;
	}
	
	function fnShowChengeC(){
		document.getElementById("contry_a").className = "contry_a contry_a_active";
		document.getElementById("showContry_ao").style.display = "block";
	}
	//点击编辑层的其他地方消失
	 $(document).click(function (e) {
		var height =  $('#showContry_ao').offset().top ;//775
		var width =  $('#showContry_ao').offset().left;//960      
		 var show_id = $(e.target).attr('id');
		if(show_id == "showContry_ao" || show_id == "contry_a" || show_id == "chengeContry" || show_id == "country_img" || show_id == "black_arrow"){
			 $("#showContry_ao").css("display","block");
			 return;
		}else{
			$("#showContry_ao").hide();
		}
		});
	
	
	function fnclose(){
		 frameElement.api.close();
	}
	
	function fnTprice(obj){
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
		var price = document.getElementById("sprice").value;
		var sprice = (obj.value*price).toFixed(2);
		$("#totalPrice").html(sprice+"&nbsp;"+W.currency);
		if(sprice < 200){
			$("#sprice_ts").show();
		}else{
			$("#sprice_ts").hide();
		}
	}
	
	function fnPreferential(){
		var price = document.getElementById("sprice").value;
		if(price == null || price == ""){
			$("#sprice").css("border","1px red solid");
			return;
		}
		var quantity = $.trim($("#quantity").val());
		var quantity_ = parseInt(quantity, 0);
		var minorder = W.document.getElementById('norm_least').value.split(" ")[0];
		var purl= $("#purl").val();
		var email = $.trim($("#email").val());
		if(email == ""){
			$("#email").css("border","1px red solid");
			return;
		}else{
		  	var re =  /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/;   
	    	 if (!re.test(email))
		    {
		        $("#email").next("p").css("color","red");
		        $("#email").css("border","red solid 1px");
		    	 $("#email").next("p").css("background","white");
		    	 $("#email").next("p").html("Please enter a valid email address.");
		    	 es = false;
		        return;
		     }
		}
		if(quantity == ""){
			$("#email").css("border","1px red #e2e2e2");
			$("#quantity").css("border","1px red solid");
			return;
		}
		var totalPrice = quantity_*parseFloat(price);
		if(minorder * 3 > quantity_ ){
			$("#moq").css("color","red");
			$("#quantity_ts").show();
//			$("#quantity_ts").css("display","block");
			return;
		}else if(totalPrice < 200){
			$("#moq").css("color","Blue");
			$("#tprice").css("color","red");
			$("#sprice_ts").show();
//			$("#sprice_ts").css("display","block");
			return;
		}
		var note = $.trim($("#note").val());
		var country = $("#countryid").val();
		if(typeof(sprice) == "undefined"){
			sprice = 0;
		}
		parent.closeApplicationOffer($("#totalPrice").text(),quantity,email,parent.mo,country);

	}