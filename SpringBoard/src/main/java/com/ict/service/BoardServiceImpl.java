package com.ict.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ict.domain.BoardAttachVO;
import com.ict.domain.BoardVO;
import com.ict.domain.Criteria;
import com.ict.domain.SearchCriteria;
import com.ict.mapper.BoardAttachMapper;
import com.ict.mapper.BoardMapper;
import com.ict.mapper.ReplyMapper;

import lombok.extern.log4j.Log4j;

// BoardService 인터페이스 구현
@Log4j
@Service // 빈 컨테이너 컴포넌트 스캔까지 완요해야 등록됨
public class BoardServiceImpl implements BoardService {

	// 서비스가 DAO(mapper.java)를 호출한다면 선언을 하고 의존성주입을 해아합니다.
	@Autowired
	private BoardMapper mapper;
	
	@Autowired
	private BoardAttachMapper attachMapper;
	
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

	@Transactional
	@Override
	public void insert(BoardVO vo) {
		mapper.insert(vo);
		
		if(vo.getAttachList() == null || vo.getAttachList().size() <= 0) {
			return;
		}
		
		vo.getAttachList().forEach(attach -> {
			attach.setBno(vo.getBno());
			attachMapper.insert(attach);
		});
	}

	@Transactional
	@Override
	public void delete(long bno) {
		replyMapper.deleteAll(bno);
		attachMapper.deleteAll(bno);
		mapper.delete(bno);
	}

	@Override
	public void update(BoardVO vo) {
		mapper.update(vo);
	}

	@Override
	public List<BoardAttachVO> getAttachList(Long bno) {
		log.info("get Attach list : " + bno);
		return attachMapper.findByBno(bno);
	}
	
}
