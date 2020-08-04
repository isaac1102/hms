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
	  <a href="#home" onclick="moveToMain();" class="active">과제</a>
	  <a href="#news">개인정보</a>
	  <a href="javascript:void(0);" class="icon" onclick="myFunction()">
	    <i class="fa fa-bars"></i>
	  </a>
	</div>
</div>
<div class="main">
	<div id="mySidebar" class="sidebar">
	    <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">×</a>
	    <a href="#" onclick="moveToMain();">구다영</a>
	</div>
	<div class="content"></div>
</div>

<script>

	$(document).ready(function(){

		var hwSeq = ${hwSeq};

		if ( hwSeq != '' || hwSeq != 0 ) {
			js_view(hwSeq);
		}else{
			js_pageLoad('list');
		}
	});

	var js_pageLoad = function(action){
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

	var moveToMain = function(){
		location.href="/homework/main.do";
	}

	var myFunction = function(){
		var x = document.getElementById("myTopnav");
		if ( x.className === "topnav" ) {
			x.className += " responsive";
		} else {
			x.className = "topnav";
		}
	};

	var openNav = function(){
		document.getElementById("mySidebar").style.width = "200px";
		document.getElementById("openbtn").style.display = "none";
	};

	var closeNav = function(){
		document.getElementById("mySidebar").style.width = "0";
		document.getElementById("openbtn").style.display = "block";
	};

	var validator = function(name, data, length){

		var pass = true;

		if ( data.length >= length ) {
			alert(length+'자까지만 입력할 수 있어요.');

			pass = false;
		}

		if( data == '' || data.length == 0) {
			if ( name == '파일'){
				alert('파일을 업로드하세요.');
				pass = false;
			}
			else {
				alert(name + '을 입력하세요.');
				pass = false;
			}
		}

		return pass;
	};

	var js_submit = function(){

		// validation
		var title = $('#formGroupExampleInput').val();
		var file = $('#exampleFormControlFile1').val();

		if ( !validator('제목', title, 50) )  return false;
		if ( !validator('파일', file, 50) ) return false;


		$('.dataForm').attr('action', '/homework/insertAction.do');
		$('.dataForm').submit();

		//데이터 저장
		js_pageLoad('list');
	};

	var js_replyForm = function(){
		$('.formDiv').css('display', '');
		$('.replyInfoDiv').css('display', 'none');
	};


	var js_replyUpdate = function(hwSeq){
		$('#hwSeq').val(hwSeq);
		var reply = $('#reply').val();

		if ( !validator('답변', reply, 1000) )  return false;

		$('.replyForm').attr('action', '/homework/updateAction.do');
		$('.replyForm').submit();
	};

	var js_cancel = function(){
		$('.formDiv').css('display', 'none');
		$('.replyInfoDiv').css('display', '');
	};
</script>

</body>
</html>