<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- 아임포트 모듈 -->
<script type="text/javascript" src="https:cdn.iamport.kr/js/iamport/payment-1.1.5.js"></script>
<!-- 제이쿼리 -->
<script src="https:ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>품질 좋은 상품목록</h1>
	
	<div class="itemSection">
		<div class="itemCard">
			<div class="itemTitle">
				<h2>헬창을 위한 단백질 보충제</h2>
			</div>
			<div class="itemContent">
				<h2>맛없지만 단백질 보충이 됩니다.</h2>
			</div>
			<div class="itemPrice">
				<p data-price="40000">40000</p>
			</div>
			<div class="itemButton">
				<button class="orderBtn">주문하기</button>
			</div>
		</div>
		
		<div class="itemCard">
			<div class="itemTitle">
				<h2>개발자를 위한 키보드</h2>
			</div>
			<div class="itemContent">
				<h2>타건감이 죽여주는 키보드</h2>
			</div>
			<div class="itemPrice">
				<p data-price="200000">200000</p>
			</div>
			<div class="itemButton">
				<button class="orderBtn">주문하기</button>
			</div>
		</div>
	</div>

<script>
	// 미리 받아와야할 정보들 변수를 전역번수처럼 쓰기 위해 선언해두기
	var itemPrice = 0; // 가격
	var itemTitle = ""; // 물건이름
	var metchant_uid = ""; // 주문번호
	// 위임처리로 어떤 삼품을 클릭했을 때 그 상품에 개한
	$(".itemSection").on("click",".orderBtn", function() {
		itemPrice = $(this).parent().siblings(".itemPrice").cildren().attr("data-price");
		itemTitle = $(this).parent().siblings(".itemTitle").children.text();
		d = new Date(); // 현 시간
		merchant_uid = "order" + d.getTime(); // 현 시간을 유닉스 시간으로 변경해 order에 붙임
		iamport();
	});
	
	
	function iamport() {
		IMP.init('imp30234065'); // 가맹점 번호
		IMP.request_pay({
			pg : 'html5_inicis', // KG이니시스
			pay_method : 'card', // 결제수단
			merchant_uid : metchant_uid, // 주문번호 전달
			name : itemTitle, // 결제창에 뜰 상품명
			amount : itemPrice, // 금액
			// 신상정보는 로그인한 사용자 정보로 대체
			buyer_email : "iamport@siot.do", // 구매자 이메일
			buyer_name : "구매자 이름", // 구매자 이름
			buyer_tel : "010-1234-5678", // 구매자 전화번호
			buyer_addr : "서울특별시 강남구 삼성동", // 구매자 주소
			buyer_postcode : "123-456", // 구매자 우편번호
		}, function(rsp) {
			console.log(rsp);
			if(rsp.success) { // 결제 성공시 ajax로 DB에 데이터를 전송해 입력
				$.ajax({
					type:'post',
					url:'/order',
					headers:{
						"Context-Type":"application/json",
						"X-HTTP-Method-Override:":"POST"
					},
					dataType:"text",
					data:JSON.stringify({
						itemname : itemTitle,
						amount : itemPrice.
						merchant_uid : merchant_uid
					}),
					success : function() {
						alert(itemTitle + "결제완료!");
					}
				});
			} else { //결제 실패시 처리할 내역
				var msg = "결제에 실패했습니다.";
				msg += "에러내용 : " + rsp.error_msg
			}
		});
	}
</script>

</body>
</html>