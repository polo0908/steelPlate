function fnMousemove(val,i,img){
	var obj = val.parentNode;
	obj.getElementsByTagName("img")[i].src = "../img/"+img;
	obj.getElementsByTagName("a")[i].style.color = "#E85C2F";
	val.style.borderBottom="2px solid #E85C2F";
	
}
function fnMouseup(val,i,img){
	var obj = val.parentNode;
	obj.getElementsByTagName("img")[i].src = "../img/"+img;
	obj.getElementsByTagName("a")[i].style.color = "#000000";
	val.style.borderBottom="2px solid #777";
}
function changeli(obj,im){
	obj.style.background="url('../img/index/7d-1b.png') repeat-x";
	var img=obj.getElementsByTagName('img');
	img[0].src="/cbtconsole/img/index/"+im;
	var ex=obj.getElementsByTagName('div');
	ex[0].style.color="#fff";

}
function reli(obj,im){
	obj.style.background="url('../img/index/7ib.png') no-repeat right top";
	var img=obj.getElementsByTagName('img');
	img[0].src="/cbtconsole/img/index/"+im;
	var ex=obj.getElementsByTagName('div');
	ex[0].style.color="#393836";
	
}
window.onload=function(){
	document.getElementById('home').onmousemove=null;
	document.getElementById('home').onmouseout=null;
	timer=window.setInterval(fnimg,2000);
	
}
var timer;
var img=2;
function fnimg(){
	if(img==-1)
		{img=2;}
	var poi=document.getElementById("u2");
	var poii=poi.getElementsByTagName('img');
	var doi=document.getElementById('u1');
	var doii=doi.getElementsByTagName('img');
	poii[0].src="/cbtconsole/img/index/2ca.png";
	poii[1].src="/cbtconsole/img/index/2ba.png";
	poii[2].src="/cbtconsole/img/index/2da.png";
	if(img==0)
		{
		doii[0].src="/cbtconsole/img/index/2.png";
		poii[0].src="/cbtconsole/img/index/2c.png";
		poii[1].src="/cbtconsole/img/index/2ba.png";
		poii[2].src="/cbtconsole/img/index/2da.png";
		}
	else if(img==1)
		{
		doii[0].src="/cbtconsole/img/index/2-1.png";
		poii[0].src="/cbtconsole/img/index/2ca.png";
		poii[1].src="/cbtconsole/img/index/2b.png";
		poii[2].src="/cbtconsole/img/index/2da.png";
		}
	else if(img==2)
	{
	doii[0].src="/cbtconsole/img/index/2-2.png";
	poii[0].src="/cbtconsole/img/index/2ca.png";
	poii[1].src="/cbtconsole/img/index/2ba.png";
	poii[2].src="/cbtconsole/img/index/2d.png";
	}
	img=img-1;}
	function fncmove(i){
		img=i;
		fnimg();
		clearInterval(timer);
	}
	function fncout(i){
		img=i;
		timer=window.setInterval(fnimg,2000);
	}
