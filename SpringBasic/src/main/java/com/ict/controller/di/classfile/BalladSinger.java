package com.ict.controller.di.classfile;

import org.springframework.stereotype.Component;

@Component
public class BalladSinger extends Singer{

	// Singer를 상속하고 sing()을 오버라이딩해서
	// "발라드 가수가 노래합니다."
	// 를 콘솔에 찍도록 설정해줍니다.
	// 빈 컨테이너에 등록
	
	@Override
	public void sing() {
		System.out.println("가수가 발라드 노래를 합니다.");
	}
	
}
