package com.ict.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ict.domain.BoardVO;
import com.ict.domain.Criteria;
import com.ict.domain.SearchCriteria;
import com.ict.mapper.BoardMapper;
import com.ict.mapper.ReplyMapper;

// BoardService 인터페이스 구현
@Service // 빈 컨테이너 컴포넌트 스캔까지 완요해야 등록됨
public class BoardServiceImpl implements BoardService {

	// 서비스가 DAO(mapper.java)를 호출한다면 선언을 하고 의존성주입을 해아합니다.
	@Autowired
	private BoardMapper mapper;
	
	@Autowired
	private ReplyMapper replyMapper;

	@Override
	public List<BoardVO> getList(SearchCriteria cri) {
		return mapper.getList(cri);
	}

	@Override
	public int countPageNum(SearchCriteria cri) {
		return mapper.countPageNum(cri);
	}

	@Override
	public BoardVO select(long bno) {
		return mapper.select(bno);
	}

	@Override
	public void insert(BoardVO vo) {
		mapper.insert(vo);
	}

	@Transactional
	@Override
	public void delete(long bno) {
		replyMapper.deleteAll(bno);
		mapper.delete(bno);
	}

	@Override
	public void update(BoardVO vo) {
		mapper.update(vo);
	}
	
}
