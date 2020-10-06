<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<div class="btnArea">
	<button class="openbtn fl" id="openbtn" onclick="openNav()"><i class="fa fa-chevron-right"></i></button>
	<span class="depthIndicator">${dataList[0].regNm}</span>
	<c:if test="${loginInfo.teacherYn == 'n' }">
		<button class="formbtn fr" onclick="js_pageLoad('form');"><i class="fa fa-pencil"></i></button>
	</c:if>
</div>
<div class="list">
	<c:if test="${empty dataList}">
		<h1> <-학생목록을 클릭하세요 </h1>
	</c:if>
	<c:forEach var="item" items="${dataList}">
		<div class="col-md-4 pb15">
			<div class="card box-shadow" id="imgBox"  ${loginInfo.teacherYn == 'y' ? 'onmouseover="js_mouseOnImg(this);" onmouseout="js_mouseOutImg(this);" ' : ''}  >
				<c:if test="${loginInfo.teacherYn == 'y' }">
					<div class="deleteMark" onclick="js_delete();" ><i class="fa fa-times" aria-hidden="true"></i></div>
				</c:if>
				<img class="card-img-top maxSize cusPoint" src="${item.fileUrl}" onClick="js_imgList(${item.hwSeq});" />
				<div class="imgFoot">
					<div>
						<span class="imgTitle" onClick="js_imgList(${item.hwSeq});">${item.title}</span>
						<span class="replyYn fr">${item.replyYn == 'y' ? 'Answered' : ''}</span>
					</div>
					<div class="text-muted fr">
						<span class="">${item.regDt}</span>
					</div>
				</div>
			</div>
		</div>
	</c:forEach>
</div>