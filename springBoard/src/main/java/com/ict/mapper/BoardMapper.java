package com.ict.mapper;

import java.util.List;

import com.ict.domain.BoardVO;

public interface BoardMapper {
	
	// board_tbl에서 글번호 3번 이하만 조회하는 쿼리문 작성
	// 어노테이션 이용
	// @select("SELECT * FROM board_tbl WHERE bno < 4")
	public List<BoardVO> getList();
	
	public void insert(BoardVO vo);
	
	public BoardVO select(long bno);
	
	public void delete(long bno);

}
