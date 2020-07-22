package com.isaac.board.member;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements IMemberService{


	@Inject
	IMemberDao dao;

	@Override
	public List<MemberVO> memberList() {

		return dao.memberList();
	}

	@Override
	public MemberVO viewMember(String userId) {

		return dao.viewMember(userId);
	}

	@Override
	public void insertMember(MemberVO mvo) {

		dao.insertMember(mvo);
	}

	@Override
	public void updateMember(MemberVO mvo) {

		dao.updateMember(mvo);
	}

	@Override
	public void deleteMember(String userId) {

		dao.deleteMember(userId);
	}

	@Override
	public int checkPw(MemberVO mvo) {

		return dao.checkPw(mvo);
	}
}
