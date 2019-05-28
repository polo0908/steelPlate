var Ajax=function(){
	var e=function(){
		return"XMLHttpRequest"in window?function(){
			return new XMLHttpRequest}:function(){
				return new ActiveXObject("Microsoft.XMLHTTP")}}(),t=function(e){
					var t="";for(var n in e){t+=n+"="+e[n]+"&"}
					return t.slice(0,-1)},n=function(n){
						var r=this,i=e();
						r.url=n.url;
						r.type=n.type||"responseText";
						r.method=n.method||"GET";
						r.async=n.async||true;
						r.data=n.data||{};
						r.complete=n.complete||function(){};
						r.success=n.success||function(){};
						r.error=n.error||function(e){};
						r.abort=i.abort;
						r.setData=function(e){
							for(var t in e){
								r.data[t]=e[t]}};
								r.send=function(){
									var e=t(r.data),n,s=false,o=r.async,u=r.complete,a=r.method,f=r.type;
									if(a==="GET"){r.url+="?"+e;
									s=true}i.open(a,r.url,o);
									if(!s){i.setRequestHeader("Content-type","application/x-www-form-urlencoded");
									n=e}
									i.onreadystatechange=o?function(){
										if(i.readyState==4){u();
										if(i.status==200){
											r.success(i[f])
											}else{
												r.error(i.status)}}}:null;
												i.send(n);if(!o){u();
												r.success(i[f])}};
												r.url&&r.send()};
												return function(e){
													return new n(e)}}()