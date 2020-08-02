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

	var myFunction = function(){
		var x = document.getElementById("myTopnav");
		if (x.className === "topnav") {
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

	var js_submit = function(){

		//Title validation
		var title = $('#formGroupExampleInput').val();
		var file = $('#exampleFormControlFile1').val();

		if(title == ''){
			alert('제목을 입력하세요.')
		}

		if(file == ''){
			alert('파일을 업로드 하세요.');
			return false;
		}

		$('.dataForm').attr('action', '/homework/insertAction.do');
		$('.dataForm').submit();

		//데이터 저장
		//list.jsp로 이동
		js_loadView('list');
	};

	var js_replyForm = function(hwSeq, exist){
		if ( exist == undefined ){
			var input = '';

			input += '<form class="replyForm" method="post">';
			input += 	'<input type="hidden" name="hwSeq" id="hwSeq">';
			input += 	'<div class="form-group">';
			input += 		'<textarea class="form-control" id="exampleFormControlTextarea1" name="reply" rows="5"></textarea>';
			input += 	'</div>';

			input += 	'<button type="button" class="btn btn-warning fr mg5" style="color:white;" onclick="js_cancel();"><i class="fa fa-times"></i></button>';
			input += 	'<button type="button" class="btn btn-warning fr mg5" style="color:white;" onclick="js_replyUpdate();"><i class="fa fa-check"></i></button>';
			input += '</form>';

			$('.replyDiv').html(input);
		}else{
			$('.replyBtnCaller').css('display', 'none');
			$('#replyContent').css('display', 'none');
			$('#replytextarea').css('display', '');
		}
	};


	var js_replyUpdate = function(hwSeq){
		$('#hwSeq').val(hwSeq);

		$('.replyForm').attr('action', '/homework/updateAction.do');
		$('.replyForm').submit();

// 		js_loadView('view');

		$.ajax({
			async:false,
			url: 'view.do?hwSeq='+hwSeq,
			success:function(data){
				$('.content').html(data);
			}
		});
	};

	var js_cancel = function(){
		$('#replyContent').css('display', '');
		$('#replytextarea').css('display', 'none');
	};
</script>

</body>
</html>