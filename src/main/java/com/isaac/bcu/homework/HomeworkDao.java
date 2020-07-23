package com.isaac.bcu.homework;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class HomeworkDao extends HomeworkService{

	@Autowired
	SqlSession sqlSession;

	public List<HomeworkVO> list(HomeworkVO hwVO){
		return sqlSession.selectList("_homework.list", hwVO);
	}

}
