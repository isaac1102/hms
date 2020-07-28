package com.isaac.bcu.homework;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.isaac.board.BoardVO;

@Controller
@RequestMapping(value="/homework")
public class HomeworkController {

	@Autowired
	HomeworkService service;

	@RequestMapping(value="/main.do", method=RequestMethod.GET)
	public String delete(HomeworkVO hwVO) {
		return "homework/main";
	}

	@RequestMapping(value="/list.do", method=RequestMethod.GET)
	public ModelAndView list(HomeworkVO hwVO) {

		ModelAndView mv = new ModelAndView();

		mv.setViewName("homework/list");
		mv.addObject("dataList", service.list(hwVO));

		return mv;
	}

	@RequestMapping(value="/view.do", method=RequestMethod.GET)
	public ModelAndView view(HomeworkVO hwVO) {

		ModelAndView mv = new ModelAndView();

		mv.setViewName("homework/view");
		mv.addObject("dataView", service.view(hwVO));
		return mv;
	}

	@RequestMapping(value="/form.do", method=RequestMethod.GET)
	public String form(BoardVO boardVO) {
		return "homework/form";
	}

	@RequestMapping(value="/insertAction.do", method=RequestMethod.POST)
	public int insertAction(HomeworkVO hwVO) {
		int affected = 0;
		return affected;
	}
}
