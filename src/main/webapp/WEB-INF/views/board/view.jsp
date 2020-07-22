<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
<%@ include file="../include/header.jsp" %>
<title>게시글 작성</title>
</head>
<body>
	<h2>상세보기</h2>
	<table>
		<colgroup>
			<col width="20%">
			<col width="40%">
			<col width="20%">
			<col width="40%">
		</colgroup>
		<tr>
			<th>작성일자</th>
			<td>${dataVO.regdate}</td>
			<th>조회수</th>
			<td>${dataVO.viewcnt}</td>
		</tr>
		<tr>
			<th>제목</th>
			<td colspan="3">${dataVO.title}</td>
		</tr>

		<tr>
			<th>내용</th>
			<td colspan="3">${dataVO.content}</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td colspan="3">${dataVO.writer}</td>
		</tr>
	</table>
	<button id="btnUpdate" onclick="js_updateForm();">수정</button>
	<button id="btnDelete" onclick="js_delete();">삭제</button>
	<button id="btnList" onclick="js_list();">목록</button>
	<script type="text/javascript">
		function js_updateForm(){
			location.href="write.do?bno="+${dataVO.bno};
		}
		function js_list(){
			location.href="list.do"
		};
		function js_delete(){
			if(confirm("삭제하시겠습니까?")){
				location.href="delete.do?bno="+${dataVO.bno};
			}
		};
	</script>
</body>
</html>