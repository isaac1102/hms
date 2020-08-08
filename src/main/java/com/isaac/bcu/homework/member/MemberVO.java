package com.isaac.bcu.homework.member;

import lombok.Data;

@Data
public class MemberVO {
	String userId;
	String userNm;
	String password;
	String klass;
	int level;
	String AttendingYn;
	String checkYn;
	String viewName;
	boolean loginCheck;
	int loginStatusCd;
}
