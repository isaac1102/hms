package com.isaac.homework.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.isaac.bcu.homework.member.MemberVO;

public class UserInfoLogger implements HandlerInterceptor{
	private Logger logger = LoggerFactory.getLogger(getClass());

	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {

	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {

	}

//	사용안함
	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse res, Object arg2) throws Exception {
        HttpSession session = req.getSession();
        MemberVO userInfo = (MemberVO) session.getAttribute("loginInfo");

//        logger.info("client ip : " + req.getRemoteAddr()); //접속한 사용자의 IP
        if(userInfo != null) {
        	String userId = userInfo.getUserId();
        	logger.info("client id(name) : " + userId + "("+userInfo.getUserNm()+")"); //접속한 사용자의 IP
        }
        return true;
	}

}
