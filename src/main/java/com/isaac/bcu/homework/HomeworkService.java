package com.isaac.bcu.homework;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("homeworkService")
public class HomeworkService {

	@Autowired
	HomeworkDao dao;

	public List<HomeworkVO> list(HomeworkVO hwVO){
		return dao.list(hwVO);
	}

	public List<HomeworkVO> imgList(HomeworkVO hwVO){
		return dao.imgList(hwVO);
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
