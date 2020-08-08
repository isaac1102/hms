<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="topBtn">
	<button class="openbtn fl" id="openbtn" onclick="openNav()"><i class="fa fa-chevron-right"></i></button>
	<button class="formbtn fr" onclick="js_pageLoad('list');"><i class="fa fa-list-alt"></i></button>
</div>
<div class="formArea">
	<form action="" class="loginForm" method="post">
	    <label for="formGroupExampleInput" class="inputLabel">로그인</label>
	    <div class="form-group">
		    <input type="text" class="form-control" id="userId" name="userId" placeholder="아이디" >
	    </div>
	    <div class="form-group">
		    <input type="password" class="form-control" id="password" name="password" placeholder="비밀번호" >
	    </div>
	    <div class="loginMessage" style="display: none;">
	    	가입하지 않은 아이디이거나, 잘못된 비밀번호입니다.
	    </div>
	    <button type="button" class="btn btn-lg btn-warning btn-block" style="color: white;" onclick="js_login();">로그인</button>
	</form>
</div>

<script type="text/javascript">
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
					js_pageLoad('list');
					$('#loginTag').text('로그아웃');
					$('#loginTag').attr('onclick', 'js_logOut();');

					//테스트용
					$('#testId').text(data.userId);
				}
				else{
					$('.loginMessage').css('display','block').css('padding-bottom', '13px').css('color' ,'red');
				}
			}
		});

		//데이터 저장
// 		js_pageLoad('list');
	};
</script>