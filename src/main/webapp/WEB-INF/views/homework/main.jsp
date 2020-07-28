<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="../include/header.jsp" %>
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1">
<title>부천대학교 과제관리 시스템</title>
</head>
<body>
<div class="top">
	<div class="topnav" id="myTopnav">
	  <a href="#home" onclick="js_list();" class="active">과제</a>
	  <a href="#news">개인정보</a>
	  <a href="javascript:void(0);" class="icon" onclick="myFunction()">
	    <i class="fa fa-bars"></i>
	  </a>
	</div>
</div>
<div class="main">
	<div id="mySidebar" class="sidebar">
	    <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">×</a>
	    <a href="#" onclick="js_list();">구다영</a>
	</div>
	<div class="content"></div>
</div>

<script>
	$(document).ready(function(){
		$.ajax({
			async: false,
			url: 'list.do',
			success:function(data){
				$('.content').html(data);
			}
		});
	});

	var js_loadView = function(action){
		$.ajax({
			url: action + '.do',
			success:function(data){
				$('.content').html(data);
			}
		});
	};

	var js_view = function(seq){
		$.ajax({
			url: 'view.do',
			data:{
				hwSeq : seq
			},
			success:function(data){
				$('.content').html(data);
			}
		});
	};

	var js_list = function(){
		js_loadView('list');
	};

	var js_insert = function(){
		js_loadView('form');
	};

	function myFunction() {
		var x = document.getElementById("myTopnav");
		if (x.className === "topnav") {
			x.className += " responsive";
		} else {
			x.className = "topnav";
		}
	}

	function openNav() {
		document.getElementById("mySidebar").style.width = "200px";
		document.getElementById("openbtn").style.display = "none";
	}

	function closeNav() {
		document.getElementById("mySidebar").style.width = "0";
		document.getElementById("openbtn").style.display = "block";
	}
</script>

</body>
</html>