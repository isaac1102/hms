<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<%
	String path = request.getContextPath();	
%>

<body>
	<h2>컨트롤러 호출 연습</h2>
	<a href="<%=path%>/sample/doA">doA</a> : model <br>
	<a href="<%=path%>/sample/doB">doB</a> : 단순호출 <br>
	<a href="<%=path%>/sample/doC">doC</a> : modelAndView <br>
	<a href="<%=path%>/sample/doD">doD</a> : redirect <br>
	<a href="javascript:doF()">doF</a> : json <br>
	
	<div id="result"></div>
	
<script type="text/javascript">
	function doF(){
		$.ajax({
			type: "POST",
			url : "<%=path%>/sample/doF",
			success:function(result){
				console.log(result)
				$('#result').html("상품명 : "+ result.productName + ", 가격 : " + result.productPrice );
			}
		});
	}
</script>
</body>
</html>
