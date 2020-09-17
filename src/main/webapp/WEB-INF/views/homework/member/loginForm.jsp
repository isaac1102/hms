<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="btnArea">
	<button class="openbtn fl" id="openbtn" onclick="openNav()"><i class="fa fa-chevron-right"></i></button>
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