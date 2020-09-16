<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<div class="btnArea">
	<button class="openbtn fl" id="openbtn" onclick="openNav()"><i class="fa fa-chevron-right"></i></button>
	<span class="depthIndicator">${not empty dataList ? '목록' : ''}</span>
	<button class="formbtn fr" onclick="js_pageLoad('form');"><i class="fa fa-pencil"></i></button>
</div>
<div class="list">
	<c:if test="${empty dataList}">
		<h1> <-학생목록을 클릭하세요 </h1>
	</c:if>
	<c:forEach var="item" items="${dataList}">
		<div class="col-md-4 pb15">
			<div class="card box-shadow" onClick="js_imgList(${item.hwSeq});">
				<img class="card-img-top maxSize cusPoint" src="${item.fileUrl }"/>
				<div class="imgFoot">
					<div>
						<span class="imgTitle" onClick="js_imgList(${item.hwSeq});">${item.title}</span>
					</div>
					<div class="text-muted fr">
						<span class="">${item.regDt}</span>
					</div>
				</div>
			</div>
		</div>
	</c:forEach>
</div>