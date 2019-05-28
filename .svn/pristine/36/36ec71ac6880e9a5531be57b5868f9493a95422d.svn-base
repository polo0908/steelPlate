<%@ page language="java" contentType="text/html; charset=utf-8"
		pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
		<title>Calculator</title>
		<link rel="stylesheet" type="text/css" href="css/bootstrap.css"/>
        <link rel="shortcut icon" href="images/favicon1.ico">
        <link rel="stylesheet" href="css/king-table.css"/>
		
	</head>
	<body>
<h2 style="margin-left: 10px;">最近一个月询盘列表（${clientOrders.size()}）</h2>	
<table id="cs_table" style="border: solid 1px #ddd;" class="data-table">
 <thead>
 <tr>
	 <th>订单编号</th>
	 <th>邮箱</th>
	 <th>总金额(USD)</th>
	 <th>订单计划</th>
	 <th>创建时间</th>
	 <th>操作</th>
 </tr>
 </thead>
 <tbody>
 <c:forEach var="obj" items="${clientOrders}" varStatus="i"> 
	 <tr>
	 <td>${obj.quoteId}</td>
	 <td>${obj.email}</td>
	 <td>${obj.totalPrice}</td>
	 <td>${obj.orderPlan}</td>
	 <td>${obj.createTime != null ?fn:substring(obj.createTime,0,fn:indexOf(obj.createTime,".")):""}</td>
	 <td><a href="/steelPlate/calculator/queryResult.do?quoteId=${obj.quoteId}" target="_blank">查看详情</a></td>
	 </tr>
 </c:forEach>
 </tbody>
 </table>

</body>
</html>
