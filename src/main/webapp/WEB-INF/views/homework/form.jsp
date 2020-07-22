<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="formArea">
	<form action="dataForm">
		<table>
			<tr>
				<th>제목</th>
				<td>
					<input type="text" name="title" size="30">
				</td>
			</tr>
			<tr>
				<th>첨부파일</th>
				<td>
					<input type="file" name="file">
				</td>
			</tr>
		</table>
		<input type="button" value="제출">
	</form>
</div>