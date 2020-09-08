package com.isaac.bcu.homework.member;

import java.security.NoSuchAlgorithmException;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDao {

	@Autowired
	SqlSession sqlSession;

	EncryptUtil encryptUtil = new EncryptUtil();

	public MemberVO view(MemberVO mbVO) {
		return sqlSession.selectOne("_member.view", mbVO);
	}

	public boolean loginChck(MemberVO mbVO) throws NoSuchAlgorithmException {

		// id로 회원정보 조회
		MemberVO memberInfo =  sqlSession.selectOne("_member.view", mbVO);

		//입력된 비밀번호를 암호화
		//암호화된 비밀번호를 id기준 비밀번호와 대조
		String encPasswd = encryptUtil.encryptPsswd(mbVO.getPassword());

		if ( memberInfo == null ) return false;

		if ( memberInfo.getPassword().equals(encPasswd) )
			return true;
		else
			return false;
	}

	public void signupAction(MemberVO mbVO) throws NoSuchAlgorithmException {
		
		String encPasswd = encryptUtil.encryptPsswd(mbVO.getPassword());
		mbVO.setPassword(encPasswd);

		sqlSession.insert("_member.insert", mbVO);
	}

	public boolean checkDupleId(MemberVO mbVO) {

		int cnt = sqlSession.selectOne("_member.checkDupl", mbVO);

		return cnt == 0 ? true : false;
	}
}
