<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="topBtn">
	<button class="openbtn fl" id="openbtn" onclick="openNav()"><i class="fa fa-chevron-right"></i></button>
	<button class="formbtn fr" onclick="js_pageLoad('list');"><i class="fa fa-list-alt"></i></button>
</div>
<div class="formArea">
	<form action="" class="signUpForm" method="post">
		<table>
			<tr>
				<th>아이디</th>
				<td>
					<input type="text" name="userId" id="userId">
					<span><input type="button" value="중복확인" onclick="js_overlapCheck();"></span>
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="password" id="password"></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="userNm" id="userNm"></td>
			</tr>
			<tr>
				<th>반</th>
				<td><input type="text" name="klass" id="klass"></td>
			</tr>
			<tr>
				<th>학년</th>
				<td><input type="text" name="level" id="level"></td>
			</tr>
		</table>
	    <button type="button" class="btn btn-lg btn-warning btn-block" style="color: white;" onclick="js_signUp();">등록</button>
	</form>
</div>

<script type="text/javascript">

	var js_signUp = function(){
		// validation
		var userId = $('#userId').val();
		var password = $('#password').val();
		var userNm = $('#userNm').val();
		var klass = $('#klass').val();
		var level = $('#level').val();

		var pattern = /^[0-9]+$/;

		if(!pattern.test(level)){
			alert('학년은 숫자만 입력 가능합니다.');
			return false;
		}
		if ( !validator('아이디', userId, 50) )  return false;
		if ( !validator('비밀번호', password, 50) ) return false;
		if ( !validator('이름', userNm, 50) ) return false;
		if ( !validator('반', klass, 50) ) return false;
		if ( !validator('학년', level, 50) ) return false;

		$('.signUpForm').attr('action', '/member/signupAction.do');
		$('.signUpForm').submit();

// 		//데이터 저장
// 		js_pageLoad('list');
	};

	var js_overlapCheck = function(){
		var userId = $('#userId').val();
		$.ajax({
			url : '/member/overlapCheck.do?userId='+userId,
			success: function(data){
				console.log(data);
			}
		});
	};
</script>