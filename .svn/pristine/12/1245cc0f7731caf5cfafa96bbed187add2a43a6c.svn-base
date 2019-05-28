$(function(){
	 $("body").on("keyup","input.form-control",function(){
		 /* var obj=$(this)[0];
		 	//先把非数字的都替换掉，除了数字和.
			obj.value = obj.value.replace(/[^\d.]/g,"");
			//必须保证第一个为数字而不是.
			obj.value = obj.value.replace(/^\./g,"");
			//保证只有出现一个.而没有多个.
			obj.value = obj.value.replace(/\.{2,}/g,".");
			//保证.只出现一次，而不能出现两次以上
			obj.value = obj.value.replace(".","$#$").replace(/\./g,"").replace("$#$",".");*/
		    
		 var reg = /^\d+\.?(\d{1,2})?$/;
	       while (!reg.test($(this).val()) && $(this).val() != "") {
	      $(this).val(checkStr($(this).val()));
	     }
	 });
	 
	//检查是否符合金额格式:只能输入数字且最多保留小数点后两位
     function checkStr(str) {
         str = str.substring(0,str.length-1);
         return str;
     }
	
})