<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="../include/header.jsp" %>
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1">
<title>과제관리 시스템</title>
<c:set var="isLogin" value="${not empty loginInfo.userId}"/>
</head>
<body>
<div class="top">
	<div class="topnav" id="myTopnav">
	  <a href="main.do" class="active">과제</a>
	  <a href="main.do?viewName=/member/loginForm" class="loginTag"  id="loginTag" ${isLogin ? 'onclick="js_logOut();"' : '' }>${isLogin ? '로그아웃' : '로그인' }</a>
	  <c:if test="${!isLogin}">
		  <a href="main.do?viewName=/member/signupForm" class="loginTag" id="signupTag"> 회원가입 </a>
	  </c:if>
	  <a id="showOutLoginId" class=showOutLoginId>${not empty loginInfo.userNm ? loginInfo.userNm : ''  }</a>
	  <a href="javascript:void(0);" class="icon" onclick="myFunction();">
	    <i class="fa fa-bars"></i>
	  </a>
	</div>
</div>
<div class="main">
	<div id="mySidebar" class="sidebar">
	    <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">×</a>
	    <div id="memberList">

	    </div>
	</div>
	<div class="content">
		<h1>공지사항</h1>
	</div>
</div>

<script>

	// 	뒤로가기 방지
	history.pushState(null, null, location.href);
		window.onpopstate = function () {
	    history.go(1);
	};

	$(document).ready(function(){

		var hwSeq = '${hwVO.hwSeq}';
		var viewName = '${hwVO.viewName}';
		var fileSeq = '${hwVO.fileSeq}';

		if ( ${isLogin} ){
			memberListUp('${loginInfo.userId}');
		}

		if( hwSeq !== '0' ){
			js_view(hwSeq, fileSeq);
			return false;
		}

		js_pageLoad(viewName);

	});

	// 	페이지 로드 함수
	var js_pageLoad = function(action){
		$.ajax({
			url: action + '.do',
			method:'get',
			success:function(data){
				$('.content').html(data);
			}
		});
	};

	var js_list = function(userId){
		$.ajax({
			url: '/homework/list.do',
			method:'get',
			data : {
				regId : userId
			},
			success:function(data){
				$('.content').html(data);
			}
		});
	}


	var js_imgList = function(seq){
		$.ajax({
			url: 'imgList.do',
			method:'get',
			data:{
				hwSeq : seq
			},
			success:function(data){
				$('.content').html(data);
			}
		});
	}

	var js_view = function(seq, fileSeq){
		$.ajax({
			url: 'view.do',
			method:'get',
			data:{
				hwSeq : seq,
				fileSeq : fileSeq
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


	var js_submit = function(){

		// validation
		var title = $('#formGroupExampleInput').val();
		var file = $('#file').val();
		var fileList = $('#file');

		if ( !validator('제목', title, 50) )  return false;
		if ( !validator('파일', file, 50) ) return false;
		if ( !fileSizeCheck(fileList)) return false;
		if ( !fileTypeCheck(fileList)) return false;


		$('.dataForm').attr('action', '/homework/insertAction.do');
		$('.dataForm').submit();

		//데이터 저장
		js_pageLoad('list');
	};

	var js_replyForm = function(){
		$('.formDiv').css('display', '');
		$('.replyInfoDiv').css('display', 'none');
	};

	var js_replyUpdate = function(hwSeq, fileSeq){
		$('#hwSeq').val(hwSeq);
		$('#fileSeq').val(fileSeq);

		var reply = $('#reply').val();

		if ( !validator('답변', reply, 1000) )  return false;

		$('.replyForm').attr('action', '/homework/updateAction.do');
		$('.replyForm').submit();

		memberListUp('${loginInfo.userId}');
	};

	var js_cancel = function(){
		$('.formDiv').css('display', 'none');
		$('.replyInfoDiv').css('display', '');
	};

	var js_login = function(){

		// validation
		var userId = $('#userId').val();
		var password = $('#password').val();

		if ( !validator('아이디', userId, 50) )  return false;
		if ( !validator('비밀번호', password, 50) ) return false;

		$.ajax({
			url:'/member/loginAction.do',
			method:'post',
			data:{
				userId : userId,
				password : password
			},
			success:function(data){

				if ( data.loginStatusCd == 1){
 					// 로그인 성공시 main화면 list
 					location.href='main.do'

					$('#loginTag').text('로그아웃');
					$('#signupTag').html('')
					$('#loginTag').attr('onclick', 'js_logOut();');

					// 학생 리스트 업
					memberListUp(userId);

					//테스트용
					$('#showOutLoginId').text(data.userId);
				}
				else{
					$('.loginMessage').css('display','block').css('padding-bottom', '13px').css('color' ,'red');
				}
			}
		});
	};

	var js_logOut = function(){
		$('#loginTag').text('로그인');
		js_pageLoad('/member/loginForm');
		$('#showOutLoginId').text('');

		$.ajax({
			url:'/member/logout.do',
			method:'get',
			success:function(data){
			}
		});
	};

	var memberListUp = function(userId){

		$.ajax({
			url:'/member/list.do',
			method:'get',
			data:{
				userId : userId
			},
			success:function(data){
				var data = data;
				var names = '';
				for ( var i = 0 ; i < data.length; i++ ){
					names +=  '<div onclick="js_list(\''+data[i].userId+'\')" class="memberEl" >'+data[i].userNm+'</div>'
				}
				$('#memberList').html(names);
			}
		});
	};

	var changeUrl = function(title, url, state){
		if (typeof (history.pushState) != "undefined") {
			//브라우저가 지원하는 경우
			history.pushState(state, title, url);
		} else {
			location.href = url; //브라우저가 지원하지 않는 경우 페이지 이동처리
		}
	};

	var fileSizeCheck = function(el){
		var maxUploadSize = ${maxUploadSize};
		var sum = 0;

		for(var i = 0 ; i < el.length; i++){
		    var files = el[i].files

		    for(var j = 0 ; j < files.length; j++){
		    	sum += files[j].size
		    }
		}

		if(sum >= maxUploadSize ){
			alert('첨부용량은 ' + sizeToMb(maxUploadSize) +'메가바이트를 넘을 수 없습니다. \n현재용량 : '+ sizeToMb(sum) + '메가바이트');
			return false;
		}

		return true;
	};

	var fileTypeCheck = function(el){

		var pass = false;
		var imgType = ['jpeg','jfif',	'jpeg',	'exif',	'tiff',	'gif',	'bmp',	'png',	'ppm',	'pgm',	'pbm',	'pnm',	'hdr',	'heif',	'bpg']

		for(var i = 0 ; i < el.length; i++){
		    var files = el[i].files

		    for(var j = 0 ; j < files.length; j++){
		    	for (t in imgType){

		    		if('image/'+imgType[t] == files[j].type )
		    			pass = true;
		    	}
		    }
		}

		if(!pass){
			alert('이미지 첨부만 가능합니다.');
			return false;
		}

		return true;
	};



	var sizeToMb = function(size){
		return Math.ceil((size / 1024 )/ 1024);
	}
</script>

</body>
</html>