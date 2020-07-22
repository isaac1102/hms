<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 등록</title>
<%@ include file="../include/header.jsp" %>
<style type="text/css">
	table{
		border: 1px solid black;
		border-collapse: collapse;
		width:100%;
	}
	th, td {
		border: 1px solid black;
	}
</style>

</head>
<body>
	<form method="post" name="dataForm">
		<input type="hidden" name="bno" value="${dataVO.bno }">
		<table>
			<tr>
				<th>제목</th>
				<td>
					<input type="text" name="title" value="${dataVO.title}" >
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<input type="text" name="content" value="${dataVO.content}">
				</td>
			</tr>
			<tr>
				<th>첨부파일</th>
				<td>
					<input type="file" name="files">
				</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>
					<input type="text" name="writer" value="${dataVO.writer}">
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td>
					<input name="userPw" type="password">
				</td>
			</tr>
		</table>
		<button type="button" onclick="js_submit();">저장</button>
		<button type="button" onclick="js_cancel();">취소</button>
	</form>

	<script type="text/javascript">
		function js_submit(){
			if(confirm("저장하시겠습니까?")){

				var title = document.dataForm.title.value;
				var content = document.dataForm.content.value;
				var writer = document.dataForm.writer.value;
				var bno = document.dataForm.bno.value;

				if(title == ''){
					alert('제목을 입력하세요');
					document.dataForm.title.focus();
					return false;
				}
				if(content == ''){
					alert('내용을 입력하세요')
					document.dataForm.content.focus();
					return false;
				}
				if(writer == ''){
					alert('작성자를 입력하세요')
					document.dataForm.writer.focus();
					return false;
				}

				if(bno == ''){
					document.dataForm.bno.name = "";
					document.dataForm.action = 'insert.do';
				}else{
					document.dataForm.action = 'update.do';
				}
				document.dataForm.submit();
			}
		}

		function js_cancel(){
			location.href="list.do"
		}
	</script>
</body>
</html>