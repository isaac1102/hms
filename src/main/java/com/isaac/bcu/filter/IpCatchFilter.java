package com.isaac.bcu.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class IpCatchFilter implements Filter{

//	private List<String> passUrl = null;
	private String contextPath;

	private Logger logger = LoggerFactory.getLogger(getClass());

	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
//		HttpSession session = req.getSession();
//		MemberVO userInfo = (MemberVO) session.getAttribute("loginInfo");

        logger.info("client ip : " + req.getRemoteAddr()); //������ ������� IP
        chain.doFilter(req, res);
        return;

//        if(userInfo != null) {
//        	String userId = userInfo.getUserId();
//        	logger.info("client id(name) : " + userId + "("+userInfo.getUserNm()+")"); //������ ������� IP
//
//        }

	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		// ���������� root�������� url�� ����Ѵ�.
		contextPath = filterConfig.getServletContext().getContextPath();
//		passUrl = new ArrayList<String>();
		// web.xml���� �����ߴ� parameter�� �����ͼ� �����Ѵ�.
//		String[] ignoredPaths = filterConfig.getInitParameter("passPage").split(",");
//
//		for (String ignoredPath : ignoredPaths) {
//			passUrl.add(contextPath + ignoredPath);
//		}


	}

}
