package com.ict.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ict.controller.vo.UserVO;

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
	public String scroeResult(int kor, int eng, int math, int sci, 
			@RequestParam("computer") int com, Model model) {
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
	
	@GetMapping(value="/page/{pageNum}")
	public String getPage(@PathVariable int pageNum, Model model) {
		// page.jsp를 view폴더에 만듭니다.
		// 해당 페이지는 int pageNum을 받아서 바인딩합니다.
		// page.jsp 본문에 더미 데이터도 채웁니다.
		model.addAttribute("page", pageNum);
		return "page";
	}
	
	// 환율계산기를 만들어보겠습니다.
	// 단, 원화금액은 @PathVariable을 이용해 입력받습니다.
	// 주소는 /rate 입니다.
	// get방식으로 처리해주세요.
	// 원화를 입력받으면 rete.jsp에서 결과로 환전금액을 보여줍니다.
	@GetMapping("/rate/{won}")
	public String getRate(@PathVariable int won, Model model) {
		final double DOLLAR_RATE = 1209.60;
		double rate = DOLLAR_RATE;
		double dollar = won / rate;
		model.addAttribute("won", won);
		model.addAttribute("rate", rate);
		model.addAttribute("dollar", dollar);
		
		return "rate";
	}
	
	// 리스트를 받아서 처리하기
	@GetMapping("/getList")
	public String getlist(
			@RequestParam("array") ArrayList<String> array, Model model) {
		// 리스트 자료형의 경우 같은 이름으로 여러 데이터를 연달아 보내면 처리 가능합니다.
		model.addAttribute("array", array);
		return "getList";
	}
	
	// 만약 주소와 매칭된 메서드의 리턴자료형을 String이 아닌 void로 처리하는 경우
	// 지정주소.jsp로 바로 연결됩니다.(view파일(.jsp파일) 이름 지정 불가)
	// 주소와 파일명이 일치한다면 써도 되지만
	// 기본적으로는 String을 쓰는게 좋습니다.
	@GetMapping("/test") // test.jsp로 바로연결됨
	public void gotest() {
		// 내부 실행문 없음.
	}
	
	// VO를 활용해 회원 데이터를 받는 컨트롤러를 만들어보겠습니다.
	@PostMapping("/userInfo")
	public String postUserinfo(UserVO userVO, Model model) {
		// 변수명은 uservo로 지정했으나, 실제로는 내부 맴버변수의 이름으로 데이터를 받습니다.
		
		model.addAttribute("userVO", userVO);
		return "user";
	}
	
	// userInfo 페이지를 만들어서 폼을 만들어
	// 상단의 userInfo로 보내게 해주세요.
	// userInfo로직은 post방식만 허용하게 해 주시고
	// 폼 페이지는 get만식만 허용하도록 수정합니다.
	@GetMapping("/userInfo")
	public String getUserinfo() {
		
		return "userInfo";
	}
}
