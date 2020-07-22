<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="../include/header.jsp" %>
<title>부천대학교 과제관리 시스템</title>
<style type="text/css">

</style>
</head>
<body>
<div class="top">
	<div class="topDiv">
		<div class="topTitle">
			<img alt="부천대학교" src="/resources/images/bcu.logo.Black.png">
			<span class="classNm">3급 3반 구다영 선생님반</span>
			<div class="fr">
				<span class="loginNm">환영합니다 구다영님</span>
				<span class="link_logout">로그아웃</span>
			</div>
		</div>
	</div>
	<div class="topnav">
	  <a class="active topBtn" href="#home">과제</a>
	  <a class="topBtn" href="#contact">개인정보</a>
	</div>
</div>
<div class="sidebar">
	<a class="sidebar_btn" id="list">구다영</a>
</div>
<div class="content" id="content">
	<div class="main" id="main"></div>
</div>

<div style="padding-left:16px">
</div>
<script type="text/javascript">
	js_ajax('list', '');

	$('.sidebar_btn').click(function(){

		var action = $(this).attr('id');

		js_ajax(action);

	});

	function js_ajax(action){
		$.ajax({
			url: action + '.do',
			success:function(data){
				$('#main').html(data);
			}
		});
	};

	$('.topBtn').click(function(){
		var existClass = $(this).attr('class');

		$('.topBtn').attr('class', 'sidebar_btn');

		if(existClass.includes('active')){
			$(this).attr('class', 'topBtn');
		}else{
			$(this).attr('class', 'active topBtn');
		}
	});

	var js_click = function(){
		js_ajax('view');
	};

	var js_list = function(){
		js_ajax('list');
	};

	var js_insert = function(){
		js_ajax('form');
	};

</script>

</body>
</html>