package com.ict.domain;

import lombok.Data;

@Data
public class BoardAttachVO {

	private String uuid;
	private String uploadpath;
	private String fileName;
	private boolean fileType;
	
	private Long bno;
	
}
