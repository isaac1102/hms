package com.isaac.bcu.homework;


import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.isaac.bcu.file.FileDao;

@Controller
@RequestMapping(value="/homework")
public class HomeworkController {

	@Autowired
	HomeworkService homeworkService;

	@Autowired
	FileDao fileDao;

	@Autowired
	@Qualifier("maxUploadSize")
	Integer maxUploadSize;

	//	메인화면
	@RequestMapping(value="/main.do", method=RequestMethod.GET)
	public String delete(ModelMap model, HomeworkVO hwVO) {

		// 과제물 리스트 기본 세팅
		if ( hwVO.getViewName() == null ) {
			hwVO.setViewName("list");
			hwVO.setHwSeq(StaticResource.ZERO);
		}

		model.addAttribute("maxUploadSize", maxUploadSize);
		model.addAttribute("hwVO", hwVO);
		return "homework/main";
	}

	@RequestMapping(value="/returnView.do", method=RequestMethod.GET)
	public String returnView(@RequestParam("viewName") String viewName) {
		return viewName;
	}

	@RequestMapping(value="/list.do", method=RequestMethod.GET)
	public ModelAndView list(HomeworkVO hwVO) {

		ModelAndView mv = new ModelAndView();

		mv.addObject("dataList", homeworkService.list(hwVO));

		return mv;
	}

	@RequestMapping(value="/imgList.do", method=RequestMethod.GET)
	public ModelAndView imgList(HomeworkVO hwVO) {

		ModelAndView mv = new ModelAndView();

		mv.addObject("dataList", homeworkService.imgList(hwVO));

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
	public String insertAction(HomeworkVO hwVO,  MultipartHttpServletRequest  multiFileRequest) throws Exception {

		hwVO.setRegId(hwVO.getRegId());
		homeworkService.insert(hwVO);
		boolean result = fileDao.insert(multiFileRequest, hwVO.getHwSeq());

		if ( result )
			return "redirect:main.do?viewName=list";
		else {

			System.out.println("예외다. 예외");
			System.out.println("예외다. 예외");
			System.out.println("예외다. 예외");
			System.out.println("예외다. 예외");
			return "";
		}
	}

	@RequestMapping(value="/updateAction.do", method=RequestMethod.POST)
	public String updateAction(ModelMap model, HomeworkVO hwVO) throws IOException {

		homeworkService.update(hwVO);

		return "redirect:main.do?viewName=view&hwSeq="+hwVO.getHwSeq()+"&fileSeq="+hwVO.getFileSeq();
	}
}
