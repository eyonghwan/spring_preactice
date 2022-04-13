package com.ict.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ict.domain.BoardVO;
import com.ict.domain.Criteria;

@Service
public interface BoardService {

	// 인터페이스 내에 먼저 메서드를 선언하고, impl 클래스에서 구현합니다
	public List<BoardVO> getList(Criteria cri);
	
	public int countPageNum();
	
	public BoardVO select(long bno);
	
	public void insert(BoardVO vo);
	
	public void delete(long bno);

	public void update(BoardVO vo);
	
}
