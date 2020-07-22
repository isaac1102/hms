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
	<h2>회원 등록폼</h2>
	<form action="${path}/member/insert.do" method="post" name="form1">
		<table border="1" width="400px">
			<tr>
				<th>아이디</th>
				<td>
					<input name="userId">
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td>
					<input name="userPw" type="password">
				</td>
			</tr>
			<tr>
				<th>이름</th>
				<td>
					<input name="userName">
				</td>
			</tr>
			<tr>
				<th>이메일주소</th>
				<td>
					<input name="userEmail">
				</td>
			</tr>
			<tr>
				<td colspan="2"  align="center">
					<input type="submit" value="확인">
					<input type="reset" value="취소">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>