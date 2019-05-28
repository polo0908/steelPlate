// 工艺名
var process_arr = new Array("Plate shearing", "Bar cut off", "Punching/ Stamping","Cutting edge","CNC turret punch", 
		"Laser cutting", "Water jet cutting", "Plasma cutting","Flame cutting", "CNC machining","Lathe machining",
		"Plate bending","Pipe bending",
		"Welding-TIG","Welding-MIG","Welding-robotic welding","Assembly(manual)","Deep drawing",
		"Annealing","---Surface Treatment---", 
		"Mirror polishing","Anodizing","Powder coating","Electro plating(Chrome)","Spray painting",
		"Hot dip galvanizing","Cold galvanizing","Electrophoretic painting","Brushing","Polishing machine");
 
// 工艺处理过程
var s_a = new Array();

//level2&level3&superficial_state&level2_explain

s_a[0] = "&times&0&&/steelPlate/calculator/images/001blanking.jpg&0.375";
s_a[1] = "&times&0&&/steelPlate/calculator/images/002barcutoff.jpg&0.375";
s_a[2] = "small|middle|large&times&0&Machine Tonnage&/steelPlate/calculator/images/003punching.jpg&0.225|0.375|0.9";
s_a[3] = "160T|200T&times&0&Machine Tonnage&/steelPlate/calculator/images/029cuttingEdge.jpg&5|8";
s_a[4] = "&hrs&0&&/steelPlate/calculator/images/006turretpunching.jpg&150";
s_a[5] = "<5mm|5-10mm|10-20mm&mm&0&Thickness&/steelPlate/calculator/images/005lasercutting.jpg&0.0038|0.0064|0.015";
s_a[6] = "<5mm|5-10mm|10-20mm&mm&0&Thickness&/steelPlate/calculator/images/012waterjetcutting.jpg&0.003|0.0051|0.012";

s_a[7] = "&mm&0&Length&/steelPlate/calculator/images/009plasmacutting.jpg&0.0015";
s_a[8] = "&mm&0&Length&/steelPlate/calculator/images/010flamecutting.jpg&0.0011";
s_a[9] = "3 AXIS|4 AXIS|5 AXIS&hrs&0&&/steelPlate/calculator/images/008cnc.jpg&60|150|225";
s_a[10] = "&hrs&0&&/steelPlate/calculator/images/004lathemachining.jpg&22.5";
s_a[11] = "63T|100T&times&0&Machine Tonnage&/steelPlate/calculator/images/011bending.jpg&0.1875|0.75";
s_a[12] = "φ20*2|φ38*2|φ50*2|φ60*2|φ80*2&times&0&Outer Dia.*Thk&/steelPlate/calculator/images/028pipebend.jpg&0.15|0.3|0.75|1.35|2.25";

s_a[13] = "&mm&0&Length&/steelPlate/calculator/images/013weldingtig.jpg&0.015";
s_a[14] = "&mm&0&Length&/steelPlate/calculator/images/014weldingmig.jpg&0.0112";
s_a[15] = "&mm&0&Length&/steelPlate/calculator/images/015weldingrobotic.jpg&0.0075";
s_a[16] = "&hrs&0&&/steelPlate/calculator/images/007assembly.jpg&18.75";

s_a[17] = "250T|400T|600T|800T|1000T&times&0&Machine Tonnage&/steelPlate/calculator/images/031deepDrawing.jpg&6|8|10|15|20";

s_a[18] = "&hrs&0&&/steelPlate/calculator/images/034annealing.jpg&200";
s_a[19] = "&&&&";
s_a[20] = "&m^2&1&Surface Area&/steelPlate/calculator/images/mirrorpolishing.jpg&150";
s_a[21] = "&m^2&1&Surface Area&/steelPlate/calculator/images/021anodizing.jpg&37.5";
s_a[22] = "&m^2&1&Surface Area&/steelPlate/calculator/images/022powdercoating.jpg&18.75";
s_a[23] = "&m^2&1&Surface Area&/steelPlate/calculator/images/024electroplating.jpg&15";
s_a[24] = "&m^2&1&Surface Area&/steelPlate/calculator/images/023painting.jpg&18.75";
s_a[25] = "&m^2&1&Surface Area&/steelPlate/calculator/images/026hotdipgalvanizing.jpg&5";
s_a[26] = "&m^2&1&Surface Area&/steelPlate/calculator/images/027coldgalvanizing.jpg&2.5";
s_a[27] = "&m^2&1&Surface Area&/steelPlate/calculator/images/electrophoreticpainting.jpg&37.5";
s_a[28] = "&m^2&1&Surface Area&/steelPlate/calculator/images/033brushing.jpg&5";
s_a[29] = "&hrs&0&&/steelPlate/calculator/images/030polishingMachine.jpg&50";


 
function getLevel2(index) {

//    var selectedIndex = $(obj).find('option:selected').selectedIndex;    
    var state_arr = s_a[index].split("&");
    if(state_arr[0] != '' && state_arr[0] != undefined){
    	return state_arr[0].split("|");
    }else{
    	return '';
    }
}
function getLevel3(index) {
	
//	var selectedIndex = $(obj).find('option:selected').selectedIndex;    
	var state_arr = s_a[index].split("&");
	if(state_arr[1] != '' && state_arr[1] != undefined){
		return state_arr[1];
	}else{
		return '';
	}
}
function getSuperficialState(index) {
	
//	var selectedIndex = $(obj).find('option:selected').selectedIndex;    
	var state_arr = s_a[index].split("&");
	if(state_arr[2] != '' && state_arr[2] != undefined){
		return state_arr[2];
	}else{
		return '';
	}
}
function getLevel2Explain(index) {
	
//	var selectedIndex = $(obj).find('option:selected').selectedIndex;    
	var state_arr = s_a[index].split("&");
	if(state_arr[3] != '' && state_arr[3] != undefined){
		return state_arr[3];
	}else{
		return '';
	}
}
function getProcessImg(index) {
	
//	var selectedIndex = $(obj).find('option:selected').selectedIndex;    
	var state_arr = s_a[index].split("&");
	if(state_arr[4] != '' && state_arr[4] != undefined){
		return state_arr[4];
	}else{
		return '';
	}
}
 
//获取工艺单价
function getPrice(index,num) {

  var state_arr = s_a[index].split("&");
  if(state_arr[5] != '' && state_arr[5] != undefined){
	  var split = state_arr[5].split("|"); 
	  if(split != '' && split != null){
		  return split[num];
	  }else{
		 return 0; 
	  } 	
  }else{
  	return 0;
  }
}
