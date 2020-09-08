package com.isaac.bcu.homework;


import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.isaac.bcu.file.FileDao;
import com.isaac.bcu.homework.member.MemberService;

@Controller
@RequestMapping(value="/homework")
public class HomeworkController {

	@Autowired
	HomeworkService homeworkService;

	@Autowired
	FileDao fileDao;

	//	메인화면
	@RequestMapping(value="/main.do", method=RequestMethod.GET)
	public String delete(ModelMap model, HomeworkVO hwVO) {

		// 과제물 리스트 기본 세팅
		if ( hwVO.getViewName() == null ) {
			hwVO.setViewName("list");
			hwVO.setHwSeq(StaticResource.ZERO);
		}

		model.addAttribute("hwVO", hwVO);

		return "homework/main";
	}

	@RequestMapping(value="/returnView.do", method=RequestMethod.GET)
	public String returnView(@RequestParam("viewName") String viewName) {
		System.out.println(viewName);
		return viewName;
	}
	@RequestMapping(value="/list.do", method=RequestMethod.GET)
	public ModelAndView list(HomeworkVO hwVO) {

		ModelAndView mv = new ModelAndView();

		mv.setViewName("homework/list");
		mv.addObject("dataList", homeworkService.list(hwVO));

		return mv;
	}

	@RequestMapping(value="/view.do", method=RequestMethod.GET)
	public ModelAndView view(HomeworkVO hwVO) {

		ModelAndView mv = new ModelAndView();

		mv.setViewName("homework/view");
		mv.addObject("dataView", homeworkService.view(hwVO));
		return mv;
	}

	@RequestMapping(value="/form.do", method=RequestMethod.GET)
	public String form(HomeworkVO hwVO) {

		return "homework/form";
	}


	@RequestMapping(value="/insertAction.do", method=RequestMethod.POST)
	public String insertAction(HomeworkVO hwVO,@RequestParam("file") MultipartFile mfile) throws IOException {

		int fileSeq = fileDao.insert(mfile);

		hwVO.setFileSeq(fileSeq);
		hwVO.setRegId("isaac"); // 테스트 데이터

		homeworkService.insert(hwVO);

		return "redirect:main.do?viewName=list";
	}

	@RequestMapping(value="/updateAction.do", method=RequestMethod.POST)
	public String updateAction(ModelMap model, HomeworkVO hwVO) throws IOException {

		homeworkService.update(hwVO);

		return "redirect:main.do?viewName=view&hwSeq="+hwVO.getHwSeq();
	}
}
