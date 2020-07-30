package com.isaac.bcu.file;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.isaac.bcu.homework.HomeworkVO;

@Repository
public class FileDao{

	@Autowired
	SqlSession sqlSession;

	public List<HomeworkVO> list(HomeworkVO hwVO){
		return sqlSession.selectList("_homework.list", hwVO);
	}

	public HomeworkVO view(HomeworkVO hwVO){
		return sqlSession.selectOne("_homework.view", hwVO);
	}

	public int insert(FileVO fileVO) {
		return sqlSession.insert("_file.insert", fileVO);
	}
}