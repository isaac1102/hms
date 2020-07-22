<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원목록</title>
<%@ include file="../include/header.jsp" %>
</head>
<body>
<%@ include file="../include/member_menu.jsp" %>
	<h2>회원정보 상세</h2>
	<form name="form1" method="post">
		<table border="1" width="400px">
			<tr>
				<th>아이디</th>
				<td>
					<input name="userId" value="${dataBean.userId}" readonly="readonly">
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td>
					<input name="userPw" value="${dataBean.userPw}" type="password">
				</td>
			</tr>
			<tr>
				<th>이름</th>
				<td>
					<input name="userName" value="${dataBean.userName}">
				</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>
					<input name="userEmail" value="${dataBean.userEmail}">
				</td>
			</tr>
			<tr>
				<th>회원가입일자</th>
				<td>
					${dataBean.userRegDate}
				</td>
			</tr>
			<tr>
				<th>회원정보 수정일자</th>
				<td>
					${dataBean.userUpdateDate}
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="button" value="수정" id="btnUpdate">
					<input type="button" value="삭제" id="btnDelete">
				</td>
			</tr>
		</table>
		<div style="color: red;">
			${message }
		</div>
	</form>

	<script>
		$(document).ready(function(){
			$('#btnUpdate').click(function(){
				if(confirm("수정하시겠습니까?")){
					document.form1.action = "${path}/member/update.do";
					document.form1.submit();
				}
			});
			$('#btnDelete').click(function(){
				if(confirm("삭제하시겠습니까?")){
					document.form1.action = "${path}/member/delete.do";
					document.form1.submit();
				}
			});
		});
	</script>
</body>
</html>