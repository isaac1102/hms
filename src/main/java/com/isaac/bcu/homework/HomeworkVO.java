package com.isaac.bcu.homework;

import java.util.List;

import lombok.Data;

@Data
public class HomeworkVO {

	Integer hwSeq;
	String title;
	String reply;
	Integer fileSeq;
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
	Integer orderNo;
	String replyYn;
	Integer cnt;
}
