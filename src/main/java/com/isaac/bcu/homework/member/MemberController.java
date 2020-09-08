package com.isaac.bcu.homework.member;

import java.security.NoSuchAlgorithmException;

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

	@RequestMapping(value="/member/signupForm.do", method=RequestMethod.GET)
	public String signupForm(MemberVO hwVO) {

		return "homework/member/signupForm";
	}

	@RequestMapping(value="/member/signupAction.do", method=RequestMethod.POST)
	public String signupAction(ModelMap model, MemberVO mbVO) throws NoSuchAlgorithmException {

		service.signupAction(mbVO);

		return "";
//		return "redirect:/homework/main.do";
	}

	@ResponseBody
	@RequestMapping(value="/member/checkDupleId.do", method=RequestMethod.GET)
	public boolean checkDupleId(ModelMap model, MemberVO mbVO) throws NoSuchAlgorithmException {

		boolean result = service.checkDupleId(mbVO);

		return result;
	}

	@RequestMapping(value="/member/loginForm.do", method=RequestMethod.GET)
	public String loginForm(HomeworkVO hwVO) {

		return "homework/member/loginForm.do";
	}

	@ResponseBody
	@RequestMapping(value="/member/loginAction.do", method=RequestMethod.POST)
	public MemberVO loginAction(HttpServletRequest request, ModelMap model, MemberVO mbVO) throws NoSuchAlgorithmException {

		HttpSession session = request.getSession();

		MemberVO loginInfo = service.view(mbVO);
		boolean loginResult = service.loginCheck(mbVO);

		mbVO.setLoginCheck(loginResult);


		if ( loginResult ) {
			mbVO.setLoginStatusCd(StaticResource.LOGIN_SUCCESS_CODE);
			session.setAttribute("loginId", loginInfo.getUserId());
		}

		return mbVO;
	}

	@ResponseBody
	@RequestMapping(value="/member/logout.do", method=RequestMethod.GET)
	public void logout(HttpServletRequest request, MemberVO mbVO) {
		HttpSession session = request.getSession();
		session.invalidate();
	}
}
