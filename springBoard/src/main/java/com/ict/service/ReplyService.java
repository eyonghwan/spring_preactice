package com.ict.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ict.domain.ReplyVO;
@Service
public interface ReplyService {

	public List<ReplyVO> listReply(Long bno);
	
	public void addReply(ReplyVO vo);
	
	public void modifyReply(ReplyVO vo);
	
	public void removeReply(Long rno);
	
}
