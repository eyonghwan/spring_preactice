package com.ict.persistence;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ict.domain.BoardVO;
import com.ict.domain.Criteria;
import com.ict.domain.SearchCriteria;
import com.ict.mapper.BoardMapper;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardMapperTests {

	@Autowired
	private BoardMapper mapper;
	
	//@Test
	public void testGetList() {
		//Criteria cri = new Criteria();
		//log.info(mapper.getList(cri));
	}
	
	//@Test
	public void testInsert() {
		
		BoardVO vo = new BoardVO();
		
		vo.setTitle("새로넣는글");
		vo.setContent("새로넣는본문");
		vo.setWriter("새로넣는글쓴이");
		
		mapper.insert(vo);
	}
	
	//@Test
	public void testSelect() {
		//Criteria cri = new Criteria();
		//List<BoardVO> vo = mapper.getList(cri);
		
		//mapper.select(vo.get(1).getBno());
		
	}
	
	//@Test
	public void testDelete() {
		mapper.delete(1);
	}
	
	//@Test
	public void testUpdate() {
		
		BoardVO vo = new BoardVO();
		
		vo.setTitle("바꾼글");
		vo.setContent("바꾼 내용");
		vo.setBno(21);
		
		mapper.update(vo);
	}
	
	//@Test
	public void testUpdate2() {
		mapper.update2("바꾼글", "바꾼 내용", 41);
	}
	
	@Test
	public void testSearchGetList() {
		SearchCriteria cri = new SearchCriteria();
		cri.setKeyword("테스트");
		cri.setSearchType("w");
		
		mapper.getList(cri);
	}
	
}
