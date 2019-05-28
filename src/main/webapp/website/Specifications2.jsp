<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html class="no-js" lang="">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>MotoShop | Home Version 1</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="./js/jquery-1.8.2.min.js"></script>
<link href="css/specifications.css" rel="stylesheet">
<script language=javascript>
        function show(obj)
        {
            if($(obj).val()==6){
                $("#select_else").show();
            }else{
                $("#select_else").hide()
            }
            // document.getElementById("select_else").style.display=(obj.value==6)?"":"none"
        }
    </script>
</head>
<body>
	<div class="all_box" style="height: auto;">
		<div class="neirong">
			<h2 class="wenzi_h2">碳钢板</h2>
			<div class="one">
				<label>选择类型：</label>

				<from> <select class="form-control"
					style="margin-top: 10px; padding: 6px 0px 6px 0px; display: inline-block; float: left;"
					onchange="show(this)">
					<option value="1">碳钢方管</option>
					<option selected value="2">碳钢板</option>
					<option value="3">铝型材</option>

					<option value="6">Others</option>
				</select>
				<div style="clear: both;"></div>
				<div id='select_else' style="display: none" class="box">

					<textarea class="form-control" name="message" placeholder=""></textarea>
					<!--<input type="text" class="wenben">-->
					<input type="button" value="确定">

				</div>
				<!--<textarea id="select_else" style="display:none" class="text01" name="message" placeholder=""><></textarea>-->
				</from>

			</div>

			<div style="clear: both"></div>
			<div class="kuang">
				<div class="left_xinxi">
					<label>长：</label> <input type="text" name="pstarttime"
						placeholder="" class="form-kong" />
				</div>
				<div class="right_xinxi">
					<label>宽：</label> <input type="text" name="pstarttime"
						placeholder="" class="form-kong" />
				</div>
			</div>

			<div style="clear: both"></div>
			<div class="kuang">
				<div class="left_xinxi">
					<label>厚：</label> <input type="text" name="pstarttime"
						placeholder="" class="form-kong" />
				</div>
				<!-- <div class="right_xinxi">
                    <label>厚度：</label>
                    <input type="text" name="pstarttime" placeholder="" class="form-kong"/>
                </div>-->
			</div>

			<div style="clear: both"></div>
			<div class="kuang">
				<label>表面处理：</label> <input type="text" name="pstarttime"
					placeholder="" class="form-control" />
			</div>

			<div style="clear: both"></div>
			<div class="kuang" style="display: inline-block;">
				<div class="left_xinxi">
					<label>材质：</label> <input type="text" name="pstarttime"
						placeholder="" class="form-kong" />
				</div>
				<div class="right_xinxi">
					<label>订量：</label> <input type="text" name="pstarttime"
						placeholder="" class="form-kong" />
				</div>
			</div>

			<div style="clear: both"></div>
			<div class="kuang">
				<label>Comments：</label> <input type="text" name="pstarttime"
					placeholder="" class="form-control" />
			</div>
		</div>
		<!--    dibu-->

		<div class="dibu_di">
			<img src="images/button-600.png" /> <a href="index-5.html"> <input
				type="submit" class="div_button" value="Submit Offer">
			</a>
		</div>

	</div>

	<script type=text/javascript src="js/newbase.js"></script>
</body>

</html>