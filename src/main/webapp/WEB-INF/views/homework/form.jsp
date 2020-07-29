<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="topBtn">
	<button class="openbtn fl" id="openbtn" onclick="openNav()"><i class="fa fa-chevron-right"></i></button>
	<button class="formbtn fr" onclick="js_list();"><i class="fa fa-list-alt"></i></button>
</div>
<div class="formArea">
	<form action="dataForm" class="dataForm">
	    <label for="formGroupExampleInput" class="inputLabel">과제 제출</label>
	    <div class="form-group" style="margin-bottom: 2rem;">
		    <input type="text" class="form-control" id="formGroupExampleInput" placeholder="제목">
	    </div>
	    <div class="form-group" style="margin-bottom: 2rem;">
		    <input type="file" class="form-control-file" id="exampleFormControlFile1">
	    </div>
	    <button type="button" class="btn btn-lg btn-warning btn-block" style="color: white;">Submit</button>
	</form>
</div>