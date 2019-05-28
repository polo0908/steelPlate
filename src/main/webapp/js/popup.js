function fn(val){
	if(val==1){
		 window.location = 'http://'+window.location.hostname;
	}else{
		 window.location = "/cbtconsole/processesServlet?action=getCenter&className=IndividualServlet";
	}
}
function popup(){
	    $('#paypopup').lightbox_me({
	        centered: true, 
	        onLoad: function() {		        	
	        }   
	     });
	
	$('#cancel').click(function(){
		    $('#addAddressPopup').trigger('close');
	});
}