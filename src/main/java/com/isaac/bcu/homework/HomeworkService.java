package com.isaac.bcu.homework;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

public class HomeworkService {

	@Autowired
	HomeworkDao dao;

	public List<HomeworkVO> list(HomeworkVO homeworkVO){
		return dao.list(homeworkVO);
	}

	public HomeworkVO view(HomeworkVO homeworkVO) {
		return dao.view(homeworkVO);
	}
}
