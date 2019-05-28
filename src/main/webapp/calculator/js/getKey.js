var keyword = getCookie('keyword');
var a = 'mailto:rfq@csmfg.com?subject=Steel Fabrication RFQ&body=%0d%0d%0a Note:We will reply you within 24 hours.';
if(keyword != null && keyword != '' &&  keyword != undefined){
	a = 'mailto:rfq@csmfg.com?subject='+keyword+'&body=%0d%0d%0a Note:We will reply you within 24 hours.%0d%0a%0d%0a%0d%0a%0d%0a%0d%0a:::'+keyword;
	$('.o-email').attr("href", a);
}