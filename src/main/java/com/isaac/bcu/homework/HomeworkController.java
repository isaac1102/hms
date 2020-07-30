package com.isaac.bcu.homework;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import java.io.File;
import java.io.IOException;

import com.isaac.board.BoardVO;

@Controller
@RequestMapping(value="/homework")
public class HomeworkController {

	@Autowired
	HomeworkService service;
	@Autowired
	@Qualifier("uploadPath")
	String uploadPath;


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
	public String insertAction(HomeworkVO hwVO,@RequestParam("file") MultipartFile mfile) throws IOException {
		// 파일저장
		// 데이터 저장
		String orgName = mfile.getOriginalFilename();
		File target = new File(uploadPath, orgName);

		FileCopyUtils.copy(mfile.getBytes(), target);

		return "homework/main";
	}
}
