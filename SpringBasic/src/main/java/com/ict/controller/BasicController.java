package com.ict.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

// @ㅓ노테이션 네 종류가 있는데(@Component, @Repository, @Controller, @Service)
// 컨트롤러를 만드는 경우니 당연히 @Controller를 사용합니다.
@Controller
public class BasicController {

	// RequestMapping의 value는 localhost:8181/어떤주소 로 접속시 해당 로직이 실행될 지 결정합니다.
	// 아무것도 안 적으면 기본적으로 get방식을 허용합니다.
	@RequestMapping(value="/goA")
	// 아래에 해당 주소로 접속시 실행하고 싶은 메서드를 작성합니다.
	public String goA() {
		System.out.println("goA 접속이 감지되었습니다.");
		// return "goA"; 라고 적으면 views폴더 내부에 goA.jsp파일을 보여줍니다.
		return "goA";
	}
	
	// goB로 접속했을때 b.jsp 창이 열리도록 아래에 세팅해주세요.
	@RequestMapping(value="/goB")
	public String goB() {
		System.out.println("goB 접속이 감지되었습니다.");
		return "b";
	}
	
	// 이름으로 연습
	@RequestMapping(value="/lee")
	public String yong() {
		System.out.println("goLee 접속이 감지되었습니다.");
		return "hwan";
	}
	
	// 외부에서 전송하는 데이터는 메서드 선언부에 선언된 변수로 받습니다.
	// 이름만 일치하면 알아서 받아옵니다.
	// 자료형을 신경 쓸 필요가 없습니다.
	@RequestMapping(value="/getData")
					// /getData?data1=데이터1&data2=데이터2 에 해당하는 요소를 받아옵니다.
	public String getData(String data1, int data2) {
		System.out.println("data1에 든 값 : " + data1);
		System.out.println("data2에 든 값 : " + data2);
		System.out.println("data2가 정수임을 증명 : " + (data2+100));
		return "getResult";
	}
	
	// 외부에서 전송하는 데이터를 /getMoney 주소로 받아오겠습니다.
	// 이 주소는 int won 이라는 형식으로 금액을 받아서
	// 환율에 따른 환전 금액을 콘솔에 찍어줍니다. 환전화폐는 임의로 정해주세요.
	// 결과페이지는 exchange.jsp 로 하겠습니다.
	// 메서드명은 임의로 만들어주세요.
	@RequestMapping(value="/getMoney")
	public String getMoney(int won) {
		System.out.println("입력한 금액은 " + won + "원 입니다.");
		System.out.println("현재 달러 환율은 1220원당 1달러입니다.");
		System.out.print(won + "원은 " + (won/1220.0) + "달러입니다.\n");
		return "dollar";
	}
	
}
