<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<div class="topBtn">
	<button class="openbtn fl" id="openbtn" onclick="openNav()"><i class="fa fa-chevron-right"></i></button>
	<button class="formbtn fr" onclick="js_insert();"><i class="fa fa-pencil"></i></button>
</div>
<div class="list">
	<c:forEach var="item" items="${dataList}">
			<div class="col-md-4 pb15">
				<div class="card box-shadow" onClick="js_view(${item.hwSeq});">
					<img class="card-img-top maxSize cusPoint" src="${item.fileUrl }"/>
					<div class="imgFoot">
						<div>
							<span class="imgTitle" onClick="js_view(${item.hwSeq});">${item.title}</span>
						</div>
						<div class="text-muted">
							<span class="">${item.regDt }</span>
						</div>
					</div>
				</div>
			</div>
	</c:forEach>
</div>