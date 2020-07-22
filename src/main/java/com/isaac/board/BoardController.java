package com.isaac.board;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/board")
public class BoardController {

	@Inject
	IBoardService service;

	@RequestMapping(value="list.do", method=RequestMethod.GET)
	public ModelAndView list(BoardVO boardVO) {

		List<BoardVO> dataList = service.list(boardVO);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("board/list");
		mv.addObject("dataList", dataList);

		return mv;
	}

	@RequestMapping(value="view.do")
	public ModelAndView view(BoardVO boardVO, HttpSession session) {
		service.updateReadCnt(boardVO, session);
		BoardVO dataVO = service.view(boardVO);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("board/view");
		mv.addObject("dataVO", dataVO);

		return mv;
	}

	@RequestMapping(value="write.do")
	public ModelAndView write(BoardVO boardVO) {

		ModelAndView mv = new ModelAndView();
		if(boardVO.getBno() > 0) {
			BoardVO dataVO = service.view(boardVO);
			mv.addObject("dataVO", dataVO);
		}
		mv.setViewName("board/write");

		return mv;
	}

	@RequestMapping(value="insert.do", method=RequestMethod.POST)
	public String insert(BoardVO boardVO) {
		System.out.println("===========");
		System.out.println(boardVO.getBno());

		service.insert(boardVO);
		return "redirect:list.do";
	}

	@RequestMapping(value="update.do", method=RequestMethod.POST)
	public String update(BoardVO boardVO) {

		service.update(boardVO);
		return "redirect:list.do";
	}

	@RequestMapping(value="delete.do", method=RequestMethod.GET)
	public String delete(BoardVO boardVO) {
		service.delete(boardVO);
		return "redirect:list.do";
	}
}
