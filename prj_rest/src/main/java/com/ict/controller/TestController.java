package com.ict.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ict.domain.TestVO;

@RestController
@RequestMapping("/test")
public class TestController {
	
	@RequestMapping("/hello")
	public String sayHello() {
		return "Hello Hello";
	}
	
	@RequestMapping("/sendVO")
	public TestVO sendTestVO() {
		TestVO testVO = new TestVO();
		
		testVO.setName("이용환");
		testVO.setAge(21);
		testVO.setMno(1);
		return testVO;
	}

}
