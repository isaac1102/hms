<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<div class="topBtn">
	<button class="openbtn fl" id="openbtn" onclick="openNav()"><i class="fa fa-chevron-right"></i></button>
	<button class="formbtn fr" onclick="moveToMain();"><i class="fa fa-list-alt"></i></button>
</div>
<div class="contentView dis_flx">
	<div class="imgWrapper customcard">
		<img class="imgView" src="${dataView.fileUrl}"/>
	</div>
	<div class="replyArea">
		<div class="titleArea pd15">${dataView.title}</div>
		<div class="feedBackDiv pd15">
			<div class="replyDiv">
				<div class="replyInfoDiv">
					<c:if test="${empty dataView.reply}">
						<button type="button" onclick="js_replyForm();" class="btn btn-outline-secondary">답변달기</button>
					</c:if>
					<c:if test="${not empty dataView.reply}">
						<textarea class="form-control" rows="5" readonly="readonly">${dataView.reply}</textarea>
						<div id="replyContent">${dataView.reply}</div>
						<div class="replyBtnCaller">
							<button type="button" class="btn btn-warning fr mg5" style="color:white;" onclick="js_replyForm('${dataView.hwSeq}', 'exist');">답글수정</button>
						</div>
					</c:if>
				</div>
				<div class="formDiv" style="display: none;">
					<form class="replyForm" method="post">
						<input type="hidden" name="hwSeq" id="hwSeq">
						<div class="form-group">
							<textarea class="form-control" name="reply" rows="5">${dataView.reply}</textarea>
						</div>
						<button type="button" class="btn btn-warning fr mg5" style="color:white;" onclick="js_cancel();"><i class="fa fa-times"></i></button>
						<button type="button" class="btn btn-warning fr mg5" style="color:white;" onclick="js_replyUpdate('${dataView.hwSeq}');"><i class="fa fa-check"></i></button>
					</form>
				</div>
			</div>
			<span class="text-muted ftSz15 fr">${dataView.regDt}</span>
		</div>
	</div>
</div>