package com.isaac.board.member;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDaoImpl implements IMemberDao{

	@Inject
	SqlSession sqlSession;

	@Override
	public List<MemberVO> memberList() {

		return sqlSession.selectList("member.list");
	}

	@Override
	public MemberVO viewMember(String userId) {

		return sqlSession.selectOne("member.view", userId);
	}

	@Override
	public void insertMember(MemberVO mvo) {

		sqlSession.insert("member.insert", mvo);
	}

	@Override
	public void updateMember(MemberVO mvo) {

		sqlSession.update("member.update",  mvo);
	}

	@Override
	public void deleteMember(String userId) {

		sqlSession.delete("member.delete", userId);
	}

	@Override
	public int checkPw(MemberVO mvo) {

		return sqlSession.selectOne("member.checkPw", mvo);
	}
}
