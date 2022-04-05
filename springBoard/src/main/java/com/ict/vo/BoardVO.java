package com.ict.vo;

import java.sql.Date;

import lombok.Data;

// lombok을 이용해 get-setter, 생성자, toString을 만들어주세요.
@Data
public class BoardVO {
	
	// board_tbl 구조에 맞게 맴버변수를 선언
	private long bno;
	private String title;
	private String content;
	private String writer;
	private Date regdate;
	private Date updatedate;

}