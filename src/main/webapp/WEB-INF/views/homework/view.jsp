<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="topBtn">
	<button class="openbtn fl" id="openbtn" onclick="openNav()"><i class="fa fa-chevron-right"></i></button>
	<button class="formbtn fr" onclick="js_list();"><i class="fa fa-list-alt"></i></button>
</div>
<div class="contentView">
	<div class="imgWrapper customcard">
		<img class="imgView" src="${dataView.fileUrl}"/>
	</div>
	<div class="replyArea">
		<div class="titleArea pd15">${dataView.title}</div>
		<div class="feedBackDiv pd15">
			<div>${dataView.reply }</div>
			<span class="text-muted ftSz15 fr">${dataView.regDt }</span>
		</div>
	</div>
</div>
<div class="btnArea">
	<div class="btnPd">
		<input type="button" class="fr" value="목록"  onclick="js_list();">
	</div>
</div>