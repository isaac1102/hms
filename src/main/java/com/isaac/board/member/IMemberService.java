package com.isaac.board.member;

import java.util.List;

import com.isaac.board.member.MemberVO;

public interface IMemberService {

	public List<MemberVO> memberList();

	public void insertMember(MemberVO mvo);

	public MemberVO viewMember(String userId);

	public void deleteMember(String userId);

	public void updateMember(MemberVO mvo);

	public int checkPw(MemberVO mvo);
}
