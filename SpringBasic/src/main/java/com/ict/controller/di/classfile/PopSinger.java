package com.ict.controller.di.classfile;

import org.springframework.stereotype.Component;

@Component
public class PopSinger extends Singer{

	@Override
	public void sing() {
		System.out.println("가수가 팝 송을 합니다.");
	}
	
}
