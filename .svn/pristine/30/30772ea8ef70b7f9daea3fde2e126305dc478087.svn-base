
	function pro2s(i){
		var im=document.getElementById('imgm');
		var ic=document.getElementById('imgc');
		var imi=im.getElementsByTagName('img');
		var ici=ic.getElementsByTagName('img');
		if(i==0)
			{
			imi[0].src="/cbtconsole/img/ad/1.jpg";
			ici[0].src="/cbtconsole/img/index/circle2.png";
			ici[1].src="/cbtconsole/img/index/circle1.png";
			ici[2].src="/cbtconsole/img/index/circle1.png";
			ici[3].src="/cbtconsole/img/index/circle1.png";
			}
		else if(i==1)
			{
			imi[0].src="/cbtconsole/img/ad/2.jpg";
			ici[0].src="/cbtconsole/img/index/circle1.png";
			ici[1].src="/cbtconsole/img/index/circle2.png";
			ici[2].src="/cbtconsole/img/index/circle1.png";
			ici[3].src="/cbtconsole/img/index/circle1.png";
			}
		else if(i==2)
		{
		imi[0].src="/cbtconsole/img/ad/3.jpg";
		ici[0].src="/cbtconsole/img/index/circle1.png";
		ici[1].src="/cbtconsole/img/index/circle1.png";
		ici[2].src="/cbtconsole/img/index/circle2.png";
		ici[3].src="/cbtconsole/img/index/circle1.png";
		}
		else if(i==3)
		{
		imi[0].src="/cbtconsole/img/ad/4.jpg";
		ici[0].src="/cbtconsole/img/index/circle1.png";
		ici[1].src="/cbtconsole/img/index/circle1.png";
		ici[2].src="/cbtconsole/img/index/circle1.png";
		ici[3].src="/cbtconsole/img/index/circle2.png";
		}
	}
function shopro2(i){
	var pb=document.getElementById('pbul');
	var pbu=pb.children;
	var ba=document.getElementById('basic');
	var de=document.getElementById('details');
	var qu=document.getElementById('question');
	if(i==0){
		ba.style.display='block';
		pbu[0].className='pro2conbarlion';
		de.style.display='none';
		pbu[1].className='pro2conbarliout';
		qu.style.display='none';
		pbu[2].className='pro2conbarliout';
	}
	if(i==1){
		de.style.display='block';
		pbu[1].className='pro2conbarlion';
		ba.style.display='none';
		pbu[0].className='pro2conbarliout';
		qu.style.display='none';
		pbu[2].className='pro2conbarliout';
	}
	if(i==2){
		qu.style.display='block';
		pbu[2].className='pro2conbarlion';
		de.style.display='none';
		pbu[1].className='pro2conbarliout';
		ba.style.display='none';
		pbu[0].className='pro2conbarliout';
	}
	
}
function showlide(){
	var ppa=document.getElementById('pslid');
	if(ppa.style.display=='none'){
		ppa.style.display="block";
	}else{
		ppa.style.display="none";
	}	
}
/*function iFrameHeight(name,pi,curr){
	var i;
	for(i=0;i<curr;i++){
		var iframe = document.getElementById(name+i);
	    var bHeight = iframe.contentWindow.document.body.scrollHeight;
	    var dHeight = iframe.contentWindow.document.documentElement.scrollHeight;
	    var height = Math.max(bHeight, dHeight);
	    iframe.height =  height;
	}
    
}*/
function showpage(name,pi,curr){
	document.getElementById('pagebg').style.display="block";
	var i;
	for(i=0;i<curr;i++){
		var pai=document.getElementById(name+i);
		if(i==pi){
			pai.style.display="block";
			var bHeight = pai.contentWindow.document.body.clientHeight;
			var dHeight = pai.contentWindow.document.documentElement.clientHeight;
			var height = Math.max(bHeight, dHeight);
			pai.height =  height;
			
		}else{
			pai.style.display="none";
		}
	}
}
function hidepage(name,pi,curr){
	document.getElementById('pagebg').style.display="none";
	document.getElementById('pacdiv').style.display="none";
	document.getElementById('pro2action').getElementsByTagName('img')[0].src="/cbtconsole/img/product/pdetail/icon/sjx.png";
	var i;
	for(i=0;i<curr;i++){
		var pai=document.getElementById(name+i);
		pai.style.display="none";
	}
}
function showpdiv(obj){
	var pad=document.getElementById('pacdiv');
	if(pad.style.display=='none'){
		pad.style.display="block";
		obj.getElementsByTagName('img')[0].src="/cbtconsole/img/product/pdetail/icon/sjx1.png";
	}else{
		pad.style.display="none";
		obj.getElementsByTagName('img')[0].src="/cbtconsole/img/product/pdetail/icon/sjx.png";
	}
}
function closep(name,pi,curr){
	 parent.document.getElementById('pagebg').style.display="none";
	 parent.document.getElementById('pacdiv').style.display="none";
	 parent.document.getElementById('pro2action').getElementsByTagName('img')[0].src="/cbtconsole/img/product/pdetail/icon/sjx.png";
		var i;
		for(i=0;i<curr;i++){
			var pai=parent.document.getElementById(name+i);
			pai.style.display="none";
		}
	} 
function addlist(obj){
	obj.style.display='none';
	var pf = document.createElement('p');
	var pt = document.createTextNode('Thank you for your interest, we will contact you soon!');
	pf.appendChild(pt);
	var pdiv = document.getElementById('mid');
	pdiv.appendChild(pf);
	pf.className="midat";
}  

		