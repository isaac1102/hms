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

		// id�� ȸ������ ��ȸ
		MemberVO memberInfo =  sqlSession.selectOne("_member.view", mbVO);

		//�Էµ� ��й�ȣ�� ��ȣȭ
		//��ȣȭ�� ��й�ȣ�� id���� ��й�ȣ�� ����
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
