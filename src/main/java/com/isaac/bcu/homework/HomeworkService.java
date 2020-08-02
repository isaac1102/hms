package com.isaac.bcu.homework;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.isaac.bcu.file.FileDao;

public class HomeworkService {

	@Autowired
	HomeworkDao dao;

	public List<HomeworkVO> list(HomeworkVO hwVO){
		return dao.list(hwVO);
	}

	public HomeworkVO view(HomeworkVO hwVO) {
		return dao.view(hwVO);
	}

	public int insert(HomeworkVO hwVO) {
		return dao.insert(hwVO);
	}

	public int update(HomeworkVO hwVO) {
		return dao.update(hwVO);
	}
}
