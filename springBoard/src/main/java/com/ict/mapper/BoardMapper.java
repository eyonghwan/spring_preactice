package com.ict.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ict.domain.BoardVO;
import com.ict.domain.Criteria;

public interface BoardMapper {
	
	// board_tbl에서 글번호 3번 이하만 조회하는 쿼리문 작성
	// 어노테이션 이용
	// @select("SELECT * FROM board_tbl WHERE bno < 4")
	public List<BoardVO> getList(Criteria cri);
	
	public void insert(BoardVO vo);
	
	public BoardVO select(long bno);
	
	public void delete(long bno);
	
	public void update(BoardVO vo);
	
	public void update2(@Param("title") String title, @Param("content") String content, @Param("bno") long bno);
	
	public int countPageNum();

}
