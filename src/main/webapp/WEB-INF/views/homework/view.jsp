<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<div class="btnArea">
	<button class="openbtn fl" id="openbtn" onclick="openNav()"><i class="fa fa-chevron-right"></i></button>
	<span class="depthIndicator">목록>${dataView.title}>${dataView.orderNo}</span>
	<button class="formbtn fr" onclick="js_imgList('${dataView.hwSeq}');"><i class="fa fa-arrow-left" aria-hidden="true"></i></button>
</div>
<div class="contentView dis_flx">
	<div class="imgWrapper customcard">
		<img class="imgView" src="${dataView.fileUrl}"/>
	</div>
	<div class="replyArea">
		<div class="titleArea pd15">
			<span>${dataView.title}</span>
			<span class="fr">${dataView.regDt}</span>
		</div>
		<div class="feedBackDiv pd15">
			<div class="replyDiv">
				<div class="replyInfoDiv">
					<c:if test="${empty dataView.reply and loginInfo.teacherYn == 'y'}">
						<button type="button" onclick="js_replyForm();" class="btn btn-outline-secondary">답변달기</button>
					</c:if>
					<c:if test="${not empty dataView.reply}">
						<div id="replyContent" class="wspw">${dataView.reply}</div>
						<div class="text-muted ftSz15 tr">
							${dataView.regDt}
						</div>
						<c:if test="${loginInfo.teacherYn == 'y'}">
							<div class="replyBtnCaller">
								<button type="button" class="btn btn-warning fr mg5" style="color:white;" onclick="js_replyForm('${dataView.hwSeq}', 'exist');">답글수정</button>
							</div>
						</c:if>
					</c:if>
				</div>
				<div class="formDiv" style="display: none;">
					<form class="replyForm" method="post">
						<input type="hidden" name="hwSeq" id="hwSeq">
						<input type="hidden" name="fileSeq" id="fileSeq">
						<div class="form-group">
							<textarea class="form-control" name="reply" id="reply" rows="5">${dataView.reply}</textarea>
						</div>
						<button type="button" class="btn btn-warning fr mg5" style="color:white;" onclick="js_cancel();"><i class="fa fa-times"></i></button>
						<button type="button" class="btn btn-warning fr mg5" style="color:white;" onclick="js_replyUpdate('${dataView.hwSeq}','${dataView.fileSeq}');"><i class="fa fa-check"></i></button>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>