package com.ict.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.ict.domain.BoardVO;
import com.ict.mapper.BoardMapper;

@Controller
public class BoardController {

	private static final Logger log = LoggerFactory.getLogger(HomeController.class);
	
	// 전체 회원을 보려면, 회원목록을 들고오는 메서드를 실행해야 하고
	// 그러면, 그 메서드를 보유하고 있는 클래스를 선언하고 주입해줘야 합니다.
	
	@Autowired
	private BoardMapper mapper;
	
	@GetMapping("/boardList")
	public String getList(Model model) {
		
		model.addAttribute("boardList", mapper.getList());
		
		return "boardList";
		
	}
	
	@GetMapping("/boardList/{bno}")
	public String getBoardDetail(@PathVariable long bno, Model model) {
		
		model.addAttribute("board", mapper.select(bno));
		
		return "boardDetail";
	}
	
	// insert 페이지를 위한 form으로 연결되는 컨트롤러를 먼저 만들겠습니다.
	// get방식으로 /boardinsert 주소를 접속시 form페이지로 연결됩니다.
	// 폼 페이지의 이름은 boardForm.jsp 입니다.
	@GetMapping("/boardInsert")
	public String boardInsertForm(Model model) {
			
		return "boardForm";
	}
		
	@PostMapping("/boardInsert")
	public String boardInsert(BoardVO boardvo, Model model) {
			
		log.info("들어온 데이터 디버깅 : " + boardvo);
			
		mapper.insert(boardvo);
			
		return "redirect:/boardList";
	}
		
	@PostMapping("/boardDelete")
	public String boardDelete(long bno) {
		
		mapper.delete(bno);
			
		return "redirect:/boardList";
	}
	
	@PostMapping("/boardUpdateForm")
	public String boardUpdateForm(long bno, Model model) {
		
		BoardVO boardvo = mapper.select(bno);
		
		model.addAttribute("board", boardvo);
		
		return "boardUpdateForm";
	}
	
	@PostMapping("/boardUpdate")
	public String boardUpdate(BoardVO vo, Model model) {
		
		mapper.update(vo);
		
		long bno = vo.getBno();
		
		return "redirect:/boardList/"+bno;
	}
	
}
