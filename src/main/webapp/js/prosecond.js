function show11(obj){
	
	 var u=obj.parentNode;
	var a=u.children;
var b=document.getElementById("u2");
var c=b.children;
for(i=0;i<1;i++)
{ if( a[i]==obj ){c[i].style.display="block";
a[i].className="lion";}
else{c[i].style.display="none";
  a[i].className="liout";}
}}
function hideall1(obj){
var u1=document.getElementById("u1");
var a=u1.children;
for(i=0;i<1;i++)
{a[i].className="liout";}

 document.getElementById("u2").style.display="none";
}
function showall1(obj){
document.getElementById("u2").style.display="block";
}
function fnshow1(obj){
	document.getElementById("u2").style.display="block";
}
function show13(obj){
	
	 var u=obj.parentNode;
	var a=u.children;
var b=document.getElementById("u2");
var c=b.children;
for(i=0;i<2;i++)
{ if( a[i]==obj ){c[i].style.display="block";
a[i].className="lion";}
else{c[i].style.display="none";
 a[i].className="liout";}
}}
function hideall3(obj){
var u1=document.getElementById("u1");
var a=u1.children;
for(i=0;i<2;i++)
{a[i].className="liout";}

document.getElementById("u2").style.display="none";
}
function showall3(obj){
document.getElementById("u2").style.display="block";
}
function fnshow23(obj){
	document.getElementById("u2").style.display="block";
}