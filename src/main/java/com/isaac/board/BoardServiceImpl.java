package com.isaac.board;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

@Service
public class BoardServiceImpl implements IBoardService{

	@Inject
	BoardDao dao;
	@Override
	public List<BoardVO> list(BoardVO boardVO) {

		return dao.list(boardVO);
	}

	@Override
	public BoardVO view(BoardVO boardVO) {
		return dao.view(boardVO);
	}

	@Override
	public int insert(BoardVO boardVO) {
		return dao.insert(boardVO);
	}

	@Override
	public int update(BoardVO boardVO) {
		return dao.update(boardVO);
	}

	@Override
	public int delete(BoardVO boardVO) {
		return dao.delete(boardVO);
	}

	@Override
	public void updateReadCnt(BoardVO boardVO, HttpSession session) {
		long update_time = 0;

		if(session.getAttribute("update_time_"+boardVO.getBno()) != null) {
			update_time = (Long) session.getAttribute(("update_time_"+boardVO.getBno()));
		}

		long current_time = System.currentTimeMillis();

		if(current_time  - update_time  > 5 * 1000) {
			dao.updateReadCnt(boardVO);
			session.setAttribute("update_time_"+boardVO.getBno(), current_time);
		}
	}
}
