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
					<div>
						<input type="text" name="userId" id="userId">
						<span><input type="button" value="중복확인" onclick="js_checkDupleId();"></span>
					</div>
					<div class="resultMsg">이미 존재하는 아이디입니다.</div>
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
			<tr>
				<th>구분</th>
				<td>
					<input type="radio" value="n" name="teacherYn" class="teacherYn" >학생
					<input type="radio" value="y" name="teacherYn" class="teacherYn">선생님
				</td>
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

		var teacherYn;

		$('.teacherYn').each(function(){
		    if ( $(this).prop('checked') )
		    	teacherYn = $(this).val();
		});

		var pattern = /^[0-9]+$/;

		if(!pattern.test(level)){
			alert('학년은 숫자만 입력 가능합니다.');
			return false;
		}
		if ( !validator('아이디', userId, 'text', 50) )  return false;
		if ( !validator('비밀번호', password, 'text', 50) ) return false;
		if ( !validator('이름', userNm, 'text', 50) ) return false;
		if ( !validator('반', klass, 'text', 50) ) return false;
		if ( !validator('학년', level, 'text', 50) ) return false;
		if ( !validator('구분', teacherYn, 'radio') ) return false;

		$('.signUpForm').attr('action', '/member/signupAction.do');
		$('.signUpForm').submit();
	};

	var js_checkDupleId = function(){
		var userId = $('#userId').val();
		$.ajax({
			url : '/member/checkDupleId.do?userId='+userId,
			success: function(data){
				$('.resultMsg').css('display', 'block');

				if ( data ) {
					$('.resultMsg').text('사용가능한 아이디입니다.');
				}else {
					$('.resultMsg').text('이미 존재하는 아이디입니다.');
				}
			}
		});
	};
</script>