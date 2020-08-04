package com.isaac.bcu.homework;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.isaac.bcu.file.FileDao;

@Repository
public class HomeworkDao extends HomeworkService{

	@Autowired
	SqlSession sqlSession;

	public List<HomeworkVO> list(HomeworkVO hwVO){
		return sqlSession.selectList("_homework.list", hwVO);
	}

	public HomeworkVO view(HomeworkVO hwVO){
		return sqlSession.selectOne("_homework.view", hwVO);
	}

	public int update(HomeworkVO hwVO) {
		return sqlSession.update("_homework.update", hwVO);
	}

	public int insert(HomeworkVO hwVO) {
		return sqlSession.update("_homework.insert", hwVO);
	}
}