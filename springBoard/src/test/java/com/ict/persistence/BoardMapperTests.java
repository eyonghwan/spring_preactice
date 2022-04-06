package com.ict.persistence;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ict.domain.BoardVO;
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
		log.info(mapper.getList());
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
		
		List<BoardVO> vo = mapper.getList();
		
		mapper.select(vo.get(1).getBno());
		
	}
	
	@Test
	public void testDelete() {
		mapper.delete(1);
	}
	
}
