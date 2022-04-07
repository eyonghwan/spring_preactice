package com.ict.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.ict.mapper.BoardMapper;

@Controller
public class BoardController {

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
	
	
}
