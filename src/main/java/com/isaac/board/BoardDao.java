package com.isaac.board;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDao {

	@Inject
	SqlSession sqlSession;

	List<BoardVO> list(BoardVO boardVO){

		return sqlSession.selectList("board.list", boardVO);
	}

	BoardVO view(BoardVO boardVO){

		return sqlSession.selectOne("board.view", boardVO);
	}

	int insert(BoardVO boardVO) {

		return sqlSession.insert("board.insert", boardVO);
	}

	int update(BoardVO boardVO) {

		return sqlSession.update("board.update", boardVO);
	}

	int delete(BoardVO boardVO) {

		return sqlSession.delete("board.delete", boardVO);
	}

	int updateReadCnt(BoardVO boardVO) {
		return sqlSession.update("board.updateReadCnt", boardVO);
	}


}
