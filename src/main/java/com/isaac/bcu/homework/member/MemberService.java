package com.isaac.bcu.homework.member;

import java.security.NoSuchAlgorithmException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("memberService")
public class MemberService {


	@Autowired
	MemberDao dao;

	public MemberVO view(MemberVO mbVO) {
		return dao.view(mbVO);
	}

	public boolean loginCheck(MemberVO mbVO) throws NoSuchAlgorithmException {
		return dao.loginChck(mbVO);
	}

	public void signupAction(MemberVO mbVO) throws NoSuchAlgorithmException {
		dao.signupAction(mbVO);
	}

	public boolean checkDupleId(MemberVO mbVO) {

		return dao.checkDupleId(mbVO);
	}

	public List<MemberVO> list(MemberVO mbVO) {

		return dao.list(mbVO);
	}
}
