/**
 * 报表页面日期选择的级联的条件
 */
$(function(){
	
	var mydate = new Date();
	var rYear =mydate.getFullYear(); 
	var rMonth = mydate.getMonth();
	var rDay = mydate.getDate();
	var rWeek = mydate.getDay();
    var html_ = "<option value='-1'>选择年份</option>";
    html_ +="<option value='"+(rYear-1)+"'>"+(rYear-1)+"</option>";
    html_ +="<option value='"+rYear+"'>"+rYear+"</option>";
    $('#rYear').append(html_);
    
    $('#rYear').change(function(){ 
    	var monthop="<option value='-1'>请选择</option>";
    	$('#rMonth').empty();
    	$('#rDay').empty();
    	$('#rWeek').empty();
    	if($('#rYear').val()!=''){
    		if($('#rYear').val() == rYear){
    			for(var i=1;i<=rMonth+1;i++){
    				monthop+="<option value='"+i+"'>"+i+"</oiption>";
    			}
    			$('#rMonth').append(monthop);
    		}else{
    			for(var i=1;i<=12;i++){
    				monthop+="<option value='"+i+"'>"+i+"</oiption>";
    			}
    			$('#rMonth').append(monthop);
    		}
    	}
    });
    
    $('#rMonth').change(function(){
        var dayop="<option val='-1'>请选择</option>"
        var month = $('#rMonth').val();
        var year =$('#rYear').val();
        $('#rDay').empty();
    	$('#rWeek').empty();
    	if($('#rMonth').val()!=''){
    		if($('#rYear').val() ==rYear && $('#rMonth').val() == rMonth+1){
    			for(var i=1;i<=rDay;i++){
    				dayop+="<option val='"+i+"'>"+i+"</oiption>";
    			}
    			$('#rDay').append(dayop);
    		}
    		else if(month==1 ||month==3 || month==5 || month ==7 ||month==8||month==10 ||month == 12){
    			for(var i=1;i<=31;i++){
    				dayop+="<option value='"+i+"'>"+i+"</oiption>";
    			}
    			$('#rDay').append(dayop);
    		}
    		else if(month==4 ||month==6 || month==9 || month ==11 ){
    			for(var i=1;i<=30;i++){
    				dayop+="<option value='"+i+"'>"+i+"</oiption>";
    			}
    			$('#rDay').append(dayop);
    		}else if(month ==2){
    			if(year%4==0 && year%100!=0 || year%400==0){
	    			for(var i=1;i<=29;i++){
	    				dayop+="<option value='"+i+"'>"+i+"</oiption>";
	    			}
	    			$('#rDay').append(dayop);
	    		}else{
	    			for(var i=1;i<=28;i++){
	    				dayop+="<option value='"+i+"'>"+i+"</oiption>";
	    			}
	    			$('#rDay').append(dayop);
	    		}			
    		}		
    	}
    });
});






