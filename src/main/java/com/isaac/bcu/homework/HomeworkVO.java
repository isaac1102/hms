package com.isaac.bcu.homework;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

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

	@Override
	public String toString() {
		System.out.println("=============== parameter ===============");
		System.out.println("hwSeq : " + this.hwSeq);
		System.out.println("title : " + this.title);
		System.out.println("regId : " + this.regId);
		System.out.println("reply : " + this.reply);
		System.out.println("fileSeq : " + this.fileSeq);
		System.out.println("fileUrl : " + this.fileUrl);
		System.out.println("filePath : " + this.filePath);
		System.out.println("confirmYn : " + this.confirmYn);
		System.out.println("checkYn : " + this.checkYn);
		System.out.println("regDt : " + this.regDt);
		System.out.println("modiDt : " + this.modiDt);
		System.out.println("==========================================");
		return super.toString();
	}
}
