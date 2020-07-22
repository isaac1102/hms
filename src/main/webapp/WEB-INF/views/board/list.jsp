<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../include/header.jsp" %>
<title>게시판 목록</title>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#btnWrite").click(function(){
				location.href="${path}/board/write.do";
			});
		});
	</script>
</head>
<body>
<form name="searchForm" method="get" >
	<table>
		<tr>
			<th>
				<select name="searchKey">
					<option value="title">제목</option>
					<option value="content">내용</option>
					<option value="writer">등록자</option>
				</select>
			</th>
			<td>
				<input name="searchVal" type="text"/>
			</td>
			<td>
				<input type="button" onclick="js_search();" value="검색"/>
				<input type="button" onclick="js_reset();" name="btnReset" value="초기화" style="display:none;"/>
			</td>
		</tr>
	</table>
</form>
<br>
<table border="1" width="600px">
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>이름</th>
		<th>작성일</th>
		<th>조회수</th>
	</tr>
	<c:forEach var="row" items="${dataList}">
		<tr>
			<td>${row.bno}</td>
			<td><a href="${path}/board/view.do?bno=${row.bno}">${row.title}</a></td>
			<td>${row.writer}</td>
			<td>${row.regdate}</td>
			<td>${row.viewcnt}</td>
		</tr>
	</c:forEach>
</table>
<button id="btnWrite" onclick="js_writeForm();">등록</button>
<script type="text/javascript">
	function js_writeForm(){
		location.href="write.do";
	};

	function js_search(){
		var searchKey = document.searchForm.searchKey;
		var searchVal = document.searchForm.searchVal;
		document.searchForm.action = "list.do?searchKey="+searchKey+"&searchVal="+searchVal;
		document.searchForm.submit();
		document.searchForm.btnReset.setAttribute('style', '');
	}
</script>
</body>
</html>