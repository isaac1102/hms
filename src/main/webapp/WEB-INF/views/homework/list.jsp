<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="btnPd">
	<input type="button" class="fr" value="제출" onclick="js_insert();">
</div>
<script type="text/javascript">
	var html = '';

	html += '<li>';
	html += '<div class="imgWrapper">';
	html += '<div class="imgHead">';
	html += '<span class="imgTitle" onClick="js_click();">과제물입니다.</span>';
	html += '<span class="fr">checked</span>';
	html += '</div>';
	html += '<div class="imgBody" onClick="js_click();">';
	html += '<img src="http://placehold.it/350x350"/>';
	html += '</div>';
	html += '<div class="imgFoot">';
	html += '<span>2020-07-19</span>';
	html += '<span class="fr">something</span>';
	html += '</div>';
	html += '</div>';
	html += '</li>';

	for(var i = 0 ; i < 10; i++){
		$('ul').append(html);
	}
</script>
<ul>
</ul>
