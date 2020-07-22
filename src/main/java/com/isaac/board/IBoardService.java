package com.isaac.board;

import java.util.List;

import javax.servlet.http.HttpSession;

public interface IBoardService {
	List<BoardVO> list(BoardVO boardVO);
	BoardVO view(BoardVO boardVO);
	int insert(BoardVO boardVO);
	int update(BoardVO boardVO);
	int delete(BoardVO boardVO);
	void updateReadCnt(BoardVO boardVO, HttpSession session);
}
