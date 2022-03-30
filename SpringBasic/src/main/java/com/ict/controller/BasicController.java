package com.ict.controller;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	@RequestMapping(value="/getData", method=RequestMethod.POST)
					// /getData?data1=데이터1&data2=데이터2 에 해당하는 요소를 받아옵니다.
	public String getData(String data1, int data2, Model model) {
								// HttpServletRequest request) 
								// throws UnsupportedEncodingException {
		// request.setCharacterEncoding("utf-8");
		System.out.println("data1에 든 값 : " + data1);
		System.out.println("data2에 든 값 : " + data2);
		System.out.println("data2가 정수임을 증명 : " + (data2+100));
		
		model.addAttribute("data1", data1);
		model.addAttribute("data2", data2);
		
		return "getResult";
	}
	
	// 외부에서 전송하는 데이터를 /getMoney 주소로 받아오겠습니다.
	// 이 주소는 int won 이라는 형식으로 금액을 받아서
	// 환율에 따른 환전 금액을 콘솔에 찍어줍니다. 환전화폐는 임의로 정해주세요.
	// 결과페이지는 exchange.jsp 로 하겠습니다.
	// 메서드명은 임의로 만들어주세요.
	@RequestMapping(value="/getMoney", method=RequestMethod.POST)
	public String getMoney(int won, Model model) {
		System.out.println("입력한 금액은 " + won + "원 입니다.");
		System.out.println("현재 달러 환율은 1220원당 1달러입니다.");
		System.out.print(won + "원은 " + (won/1220.0) + "달러입니다.\n");
		double dollar = won/1220.0;
		// model.addAttribute("보낼 이름", 보낼 자료);
		// 넘어간 데이터는 .jsp파일에서 el을 이용해 출력합니다.
		// ex -> model.addAttribute("test", 자료); 바인딩한 경우
		// ${test} 로 .jsp에서 출력가능
		
		model.addAttribute("won",  won);
		model.addAttribute("dollar", dollar);
		return "exchange";
	}
	
	// form 페이지와 결과페이지를 분리해야 합니다.
	// 다만 목적지 주소가 .jsp기준이 아닌, @RequestMapping상의 주소기준으로 갑니다.
	// 주소 moneyForm으로 연결되도록 아래에 어노테이션 + 메서드를 구성해주세요.
	// moneyForm.jsp로 연결됩니다.
	// moneyForm.jsp에는 목적지를 # 으로 하고
	// name=won인 폼을 추가로 만들어주세요.
	@RequestMapping(value="/moneyForm")
	public String moneyForm() {
		
		return "moneyForm";
	}
	
	// 상단 /getData 주소를 타겟으로 하는 /dataForm을 만들어주세요.
	// data1, data2를 자료형에 맞게 폼으로 입력받아 전송버튼을 누르면
	// 해당 데이터가 결과 페이지에 마올 수 있도록 .jsp파일부터 시작해서
	// form태그나 세부 로직까지 완성시켜주세요.
	// 1. 주소 및 연결 메서드 완성
	@RequestMapping(value="/dataForm")
	public String dataForm() {
		return "dataForm";
	}
	// 2. form태그 완성
	
	// 스프링 5버전부터 허용
	// @요청메서드Mapping 은 해당 매서드만 허용하는 어노테이션입니다.
	@GetMapping(value="/onlyGet")
	public String onlyGet() {
		return "onlyGet";
	}
	
	@GetMapping(value="/score")
	public String scoreForm() {
		
		return "scoreForm";
	}
	
	@PostMapping(value="/score")
	public String scroeResult(int kor, int eng, int math, int sci, int com, Model model) {
		int total = (kor + eng + math + sci + com);
		model.addAttribute("total", total);
		double avg = total / 5.0;
		model.addAttribute("avg", avg);
		model.addAttribute("kor", kor);
		model.addAttribute("eng", eng);
		model.addAttribute("math", math);
		model.addAttribute("sci", sci);
		model.addAttribute("com", com);
		
		return "scoreResult";
	}
	
}
