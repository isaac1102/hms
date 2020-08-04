<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="../include/header.jsp" %>
<title>부천대학교 과제관리 시스템</title>
</head>
<body>
<div class="top">
<!-- 	<div class="topDiv">
		<div class="topTitle">
			<img alt="부천대학교" src="/resources/images/bcu.logo.Black.png">
			<span class="classNm">3급 3반 구다영 선생님반</span>
			<div class="fr">
				<span class="loginNm">환영합니다 구다영님</span>
				<span class="link_logout">로그아웃</span>
			</div>
		</div>
	</div> -->
	<div class="topnav" id="myTopnav">
	  <a class="active topBtn" href="#home">과제</a>
	  <a class="topBtn" href="#contact">개인정보</a>
	  <a href="javascript:void(0);" class="icon" onclick="myFunction()">
	    <i class="fa fa-bars"></i>
	  </a>
	</div>
</div>
<div class="container" id="container">
	<div class="row">
	</div>
</div>

<div style="padding-left:16px">
</div>
<script type="text/javascript">

	$(document).ready(function(){
		$.ajax({
			async: false,
			url: 'list.do',
			success:function(data){
				$('.row').html(data);
			}
		});
	});

	$('.sidebar_btn').click(function(){

		var action = $(this).attr('id');

		js_loadView(action);
	});

	$('.topBtn').click(function(){
		var existClass = $(this).attr('class');

		$('.topBtn').attr('class', 'sidebar_btn');

		if(existClass.includes('active')){
			$(this).attr('class', 'topBtn');
		}else{
			$(this).attr('class', 'active topBtn');
		}
	});

	var js_view = function(seq){
		$.ajax({
			url: 'view.do',
			data:{
				hwSeq : seq
			},
			success:function(data){
				$('.row').html(data);
			}
		});
	};

	var js_loadView = function(action){
		$.ajax({
			url: action + '.do',
			success:function(data){
				$('.row').html(data);
			}
		});
	};

	var js_list = function(){
		js_loadView('list');
	};

	var js_insert = function(){
		js_loadView('form');
	};

	var myFunction = function(){
	    var x = $('#myTopnav');
	    var className = $('#myTopnav').attr("class");

	    if (className === "topnav") {
	    	$('#myTopnav').attr("class", className + ' responsive');
	    } else {
	    	$('#myTopnav').attr("class", "topnav");
	    }
	}
</script>

</body>
</html>