package com.isaac.bcu.file;

import lombok.Data;

@Data
public class FileVO {
	int fileSeq;
	String filePath;
	String fileId;
	String fileNm;
	String fileUrl;
	int orderNo;
	long fileSize;
	String fileType;
	int hwSeq;
}
