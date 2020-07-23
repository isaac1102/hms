package com.isaac.bcu.homework;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.isaac.board.BoardVO;

@Controller
@RequestMapping(value="/homework")
public class HomeworkController {

	@Autowired
	HomeworkService service;

	@RequestMapping(value="/main.do", method=RequestMethod.GET)
	public String delete(HomeworkVO homeworkVO) {
		for(HomeworkVO vo : service.list(homeworkVO)) {
			System.out.println(vo);
		}
		return "homework/main";
	}

	@RequestMapping(value="/list.do", method=RequestMethod.GET)
	public String list(BoardVO boardVO) {
		return "homework/list";
	}

	@RequestMapping(value="/view.do", method=RequestMethod.GET)
	public String view(BoardVO boardVO) {
		return "homework/view";
	}

	@RequestMapping(value="/form.do", method=RequestMethod.GET)
	public String form(BoardVO boardVO) {
		return "homework/form";
	}
}
