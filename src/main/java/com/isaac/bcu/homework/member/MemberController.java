package com.isaac.bcu.homework.member;

import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.isaac.bcu.homework.HomeworkVO;
import com.isaac.bcu.homework.StaticResource;

@Controller
public class MemberController {

	@Autowired
	MemberService service;

	@RequestMapping(value="/member/loginForm.do", method=RequestMethod.GET)
	public String loginForm(HomeworkVO hwVO) {

		return "homework/member/loginForm";
	}

	@ResponseBody
	@RequestMapping(value="/member/sso/loginAction.do", method=RequestMethod.POST)
	public MemberVO ssologinAction(HttpServletRequest request, ModelMap model, MemberVO mbVO) throws NoSuchAlgorithmException {

		HttpSession session = request.getSession();

		MemberVO loginInfo = service.view(mbVO);

		mbVO.setLoginStatusCd(StaticResource.LOGIN_SUCCESS_CODE);
		session.setAttribute("loginInfo", loginInfo);
		model.addAttribute("loginInfo", loginInfo);

		return mbVO;
	}

	@ResponseBody
	@RequestMapping(value="/member/loginAction.do", method=RequestMethod.POST)
	public MemberVO loginAction(HttpServletRequest request, ModelMap model, MemberVO mbVO) throws NoSuchAlgorithmException {

		HttpSession session = request.getSession();

		MemberVO loginInfo = service.view(mbVO);
		boolean loginSuccess = service.loginCheck(mbVO);

		mbVO.setLoginCheck(loginSuccess);

		if ( loginSuccess ) {
			mbVO.setLoginStatusCd(StaticResource.LOGIN_SUCCESS_CODE);
			session.setAttribute("loginInfo", loginInfo);
			model.addAttribute("loginInfo", loginInfo);
		}

		return mbVO;
	}

	@ResponseBody
	@RequestMapping(value="/member/logout.do", method=RequestMethod.GET)
	public void logout(HttpServletRequest request, MemberVO mbVO) {
		HttpSession session = request.getSession();
		session.invalidate();
	}


	@ResponseBody
	@RequestMapping(value="/member/list.do", method=RequestMethod.GET)
	public List<MemberVO> list(MemberVO mbVO) {

		List<MemberVO> dataList =  new ArrayList<MemberVO>();
		mbVO = service.view(mbVO);

		if ( mbVO.getTeacherYn().equals("y") )
			dataList = service.list(mbVO);
		else
			dataList.add(mbVO);

		return dataList;
	}

	@RequestMapping(value="/member/signupForm.do", method=RequestMethod.GET)
	public String signupForm(MemberVO mbVO) {

		return "homework/member/signupForm";
	}

	@RequestMapping(value="/member/signupForm2.do", method=RequestMethod.GET)
	public String signupForm2(MemberVO mbVO) {

		return "homework/member/signupForm2";
	}

	@RequestMapping(value="/member/signupAction.do", method=RequestMethod.POST)
	public String signupAction(ModelMap model, MemberVO mbVO) throws NoSuchAlgorithmException {

		service.signupAction(mbVO);

		return "redirect:/homework/main.do";
	}

	@ResponseBody
	@RequestMapping(value="/member/checkDupleId.do", method=RequestMethod.GET)
	public boolean checkDupleId(ModelMap model, MemberVO mbVO) throws NoSuchAlgorithmException {

		boolean result = service.checkDupleId(mbVO);

		return result;
	}

	}
