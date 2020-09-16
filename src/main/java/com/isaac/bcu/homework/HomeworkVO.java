package com.isaac.bcu.homework;

import java.util.List;

import lombok.Data;

@Data
public class HomeworkVO {

	int hwSeq;
	String title;
	String reply;
	int fileSeq;
	String fileUrl;
	String filePath;
	String confirmYn;
	String checkYn;
	String regDt;
	String modiDt;
	String regId;
	String viewName;
	List<Integer> fileSeqs;
	String teacherYn;
	int orderNo;
}
