<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>

<link rel="stylesheet" type="text/css" href="/resources/include/css/ticket/ticket.css" />

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW"
	crossorigin="anonymous"></script>

<script type="text/javascript">
	$(function(){
		
		$("#modalBtn").click(function(){
			if($("#totalPrice").text() == 0){
				alert("인원을 선택해주세요");
				location.href = "/ticket/allDayTicketView";
			}
		});
		
		/* 예약하기 버튼 클릭 시 처리 이벤트 */
		$("#ticketInsertBtn").click(function(){
			$("#visit_date").val($("#input_date").text());
			$("#t_adult").val($("#number-adult").text());
			$("#t_student").val($("#number-student").text());
			$("#t_child").val($("#number-child").text());
			$("#allday_price").val($("#alldayPrice").text());
			$("#total_price").val($("#totalPrice").text());
			$("#t_category").val("종일권");
			
			console.log($("#input_date").text());
			console.log("대인 : ",$("#number-adult").text());
			console.log("청소년 : ",$("#number-student").text());
			console.log("소인/경로 : ",$("#number-child").text());
			
			// 필요한 약관 동의 여부 확인
	        if ($("#check_1").is(":checked") &&
	            $("#check_2").is(":checked") &&
	            $("#check_3").is(":checked")) {
	        	
	            // 모든 약관에 동의한 경우 visitInfoView 페이지로 이동
	        	$("#alldayTicket_data").attr({
					"method":"post",
					"action":"/ticket/visitInfoView"
				});
				$("#alldayTicket_data").submit();
	        } else {
	            alert("모든 약관에 동의해주세요.");
	            return;
	        }
			
			
		});
		
		/* totalPrice 계산하기 위한 변수 */
		let adult = 0;
		let student = 0;
		let child = 0;
		let alldayPrice = 0;
		let discountRate = 0;
		let totalPrice = 0;
		
		/* - 버튼 클릭 시 수량과 가격 계산 */
		$(".minusBtn").click(function(){
			let span = $(this).parent().children().eq(1);
			let num = span.text();
			if(num > 0) {num--;}
			span.text(num);
			
			let category = $(this).parent().parent().children().eq(0).text();
			if(category == "대인"){
				adult = 70 * num;
			} else if(category == "청소년"){
				student = 60 * num;
			} else if(category == "소인/경로"){
				child = 50 * num;
			}
			alldayPrice = adult + student + child;
			$("#alldayPrice").text(alldayPrice);
			console.log(totalPrice);
			totalPrice = alldayPrice * (100-discountRate)/100;	//할인율 계산
			$("#totalPrice").text(totalPrice);
			$("#total_price").val($("#totalPrice").text());
		});
		
		/* + 버튼 클릭 시 수량과 가격 계산 */
		$(".plusBtn").click(function(){
			let span = $(this).parent().children().eq(1);
			let num = span.text();
			num++;
			span.text(num);
			
			let category = $(this).parent().parent().children().eq(0).text();
			if(category == "대인"){
				adult = 70 * num;
			} else if(category == "청소년"){
				student = 60 * num;
			} else if(category == "소인/경로"){
				child = 50 * num;
			}
			alldayPrice = adult + student + child;
			$("#alldayPrice").text(alldayPrice);
			console.log(totalPrice);
			totalPrice = alldayPrice * (100-discountRate)/100;	//할인율 계산
			$("#totalPrice").text(totalPrice);
			$("#total_price").val($("#totalPrice").text());
		});
		
		// 체크박스 요소와 테이블 요소 참조
        let checkbox = $("#showCardTable");
        let cardTable = $("#cardTable");
        
        checkbox.change(function(){
        	// 체크박스가 선택되었으면 테이블 표시, 그렇지 않으면 숨기기
            if (checkbox.is(":checked")) {
                cardTable.css("display", "block");
            } else {
                cardTable.css("display", "none");
                $("#card_company").val("");
                $(".cardTable tr td").css("backgroundColor", "white");
                totalPrice = alldayPrice;
                $("#totalPrice").text(alldayPrice);
                discountRate = 0;
            }
        });
        
        // 카드 종류 선택 시 이벤트
	    $(".cardTable tr td").click(function(){
	    	let card_company = $(this).text();
            $("#card_company").val($(this).text());
            console.log($(this).text());
            
            $(".cardTable tr td").css("backgroundColor", "white");
            $(this).css("backgroundColor", "#E6FFFF");
            
            $.ajax({
            	url:"/ticket/getDiscountRate",
            	type:"get",
            	data:"card_company="+card_company,
            	dataType:"text",
            	success: function(data){
            		console.log(data);
            		discountRate = data;
            		totalPrice = alldayPrice * (100-discountRate)/100;
            		$("#totalPrice").text(totalPrice);
            	},
            	error: function(){
            		alert("시스템 오류");
            	}
            })
        });
	});
	
</script>

</head>
<body>
	<h1>종일권 예매하기</h1>

	<div class="container">
		<div class="row">
			<div class="div_left col-md-7">
				<input type="image" id="dongsanimg" src="/resources/images/day.jpg"
					alt="놀이공원종일권" />
				<div id="ticket_sub">
					<h4>하루종일 놀 수 있는 종일권!</h4>
				</div>
				<table class="pricetable table table-bordered">
					<tr>
						<th>상품명</th>
						<th>가격</th>
					</tr>
					<tr>
						<td>대인</td>
						<td>70,000</td>
					</tr>
					<tr>
						<td>청소년</td>
						<td>60,000</td>
					</tr>
					<tr>
						<td>소인/경로</td>
						<td>50,000</td>
					</tr>
				</table>
			</div>


			<div class="div_right col-md-3">
			<div class="div_right_inner">
			
				<h5>예약옵션을 선택해주세요.</h5>
				<hr>

				<!-- ------------------------------------ -->
				<div id="div_calendar">
					<div id="div_calendar_year">
						<input type="hidden" onclick="changeMonth(-1);" id="fa1" value="" />
						<input type="text" id="year" value="2020"
							style="width: 60px; display: initial;" class="form-control"
							readonly="readonly" />년
						<input type="text" id="month"
							value="changeMonth(0);" style="width: 50px; display: initial;"
							class="form-control" readonly="readonly">월 
						<input type="button" onclick="changeMonth(1);" id="fa2" value="" />
					</div>
					<table class="table table-bordered" id="calendar">
						<thead>
							<tr>
								<th>일</th>
								<th>월</th>
								<th>화</th>
								<th>수</th>
								<th>목</th>
								<th>금</th>
								<th>토</th>
							</tr>
						</thead>
						<tbody id="tb_body"></tbody>
					</table>
				</div>
				<!-- ------------------------------------ -->
				<!-- 예약옵션 테이블 -->
					<form name="alldayTicket_data" id="alldayTicket_data" method="post">
						<input type="hidden" name="visit_date" id="visit_date" value="" />
						<input type="hidden" name="t_adult" id="t_adult" value="" /> <input
							type="hidden" name="t_student" id="t_student" value="" /> <input
							type="hidden" name="t_child" id="t_child" value="" /> <input
							type="hidden" name="card_company" id="card_company" value="" />
						<input type="hidden" name="allday_price" id="allday_price"
							value="" /> <input type="hidden" name="total_price"
							id="total_price" value="" /> <input type="hidden"
							name="t_category" id="t_category" value="" />
					</form>

					<table id="ticket_table">
						<tr>
							<td class="ticket_td">방문예정일</td>
							<td id="input_date" class="td_right"></td>
						</tr>
						
						<tr>
						<td class="ticket_td">상품선택</td>
						<td>
						<table class="td_btn">
					        <tr>
					            <td>대인</td>
					            <td>
					                <button id="minus-adult" class="minusBtn">-</button>
					                <span id="number-adult">0</span>
					                <button id="plus-adult" class="plusBtn">+</button>
					            </td>
					        </tr>
					        <tr>
					            <td>청소년</td>
					            <td>
					                <button id="minus-student" class="minusBtn">-</button>
					                <span id="number-student">0</span>
					                <button id="plus-student" class="plusBtn">+</button>
					            </td>
					        </tr>
					        <tr>
					            <td>소인/경로</td>
					            <td>
					                <button id="minus-child" class="minusBtn">-</button>
					                <span id="number-child">0</span>
					                <button id="plus-child" class="plusBtn">+</button>
					            </td>
					        </tr>
					    </table>
						</td>
					</tr>
						
						<tr>
							<td class="ticket_td">제휴카드 선택</td>
							<td class="td_right">
								<input type="checkbox" id="showCardTable" />
							</td>
						</tr>
						<tr>
							<td></td>
							<td class="td_right">
								<div id="cardTable">
									<table class="cardTable table table-bordered">
										<tr>
											<td>삼성카드</td>
											<td>하나카드</td>
											<td>국민카드</td>
										</tr>
										<tr>
											<td>BC카드</td>
											<td>현대카드</td>
											<td>농협카드</td>
										</tr>
										<tr>
											<td>신한카드</td>
											<td>우리카드</td>
											<td>씨티카드</td>
										</tr>
									</table>
								</div>
							</td>

						</tr>
						<tr>
							<td class="ticket_td">할인전가격</td>
							<td class="td_right"><span id="alldayPrice">0</span>원</td>
						</tr>
						<tr>
							<td class="ticket_td">총가격</td>
							<td class="td_right"><span id="totalPrice">0</span>원</td>
						</tr>
<%-- 						<tr>
							<td></td>
							<jsp:include page="../../modal/modal.jsp" />
							<!-- <td><a href="#" data-toggle="modal" data-target="#myModal" id="modalBtn" class="btn btn-success">예약하기(모달)</a></td> -->
							<td class="td_btn">
								<button type="button" id="modalBtn" data-bs-toggle="modal" data-bs-target="#myModal" class="btn btn-success">예약하기(모달)</button>
							</td>
						</tr> --%>
					</table>
			</div>
			<jsp:include page="../../modal/modal.jsp" />
			<!-- <button type="button" id="modalBtn" data-bs-toggle="modal" data-bs-target="#myModal" class="btn btn-success">예약하기(모달)</button> -->
			<input type="button" id="modalBtn" class="modalBtn" data-bs-toggle="modal" data-bs-target="#myModal" value="예약하기(모달)" />
			</div>
		</div>
	</div>




	<script>
	let date = new Date();
	let y = date.getFullYear();
	let m = ('0' + (date.getMonth() + 1)).slice(-2);
	let d = ('0' + date.getDate()).slice(-2);
	let today = document.getElementById("input_date");
	today.innerHTML = y + '-' + m + '-' + d;
	
	// 날짜 선택을 제한할 최소 날짜 설정 (오늘 이후)++
    let minDate = new Date(y, m - 1, d);

    // 이전 날짜 비활성화 함수++
    function disablePastDates(date) {
        return date >= minDate;
    }
	
	$("#fa1").val((Number(m) - 1) + "월");
	$("#fa2").val((Number(m) + 1) + "월");

	function checkLeapYear(year) {//윤년 계산
		if (year % 400 == 0) {
			return true;
		} else if (year % 100 == 0) {
			return false;
		} else if (year % 4 == 0) {
			return true;
		} else {
			return false;
		}
	}

	function getFirstDayOfWeek(year, month) {//선택한 달의 1일 요일 구하기
		if (month < 10)
			month = "0" + month;//month가 10보다 작으면 month앞에 "0"

		return (new Date(year + "-" + month + "-01")).getDay(); //getDay () 메소드는 일주 (0-6), 하루 수를 반환
	}

	function changeYearMonth(year, month) {//버튼 클릭시 월별 날짜 구하기
		let month_day = [ 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 ];//월별 마지막 날짜

		if (month == 2) {
			if (checkLeapYear(year))
				month_day[1] = 29;//2월이면 년도 나누기 4 했을 때 0이면 2월29일(윤년이면)
		}

		let first_day_of_week = getFirstDayOfWeek(year, month);//일요일이면 0, 월요일이면 1....
		let arr_calendar = [];
		for (let i = 0; i < first_day_of_week; i++) {
			arr_calendar.push("");//
		}

		for (let i = 1; i <= month_day[month - 1]; i++) {
			arr_calendar.push(String(i));//arr_calendar에 월에 마지막 날짜까지 1,2,3... 넣음 
		}

		let remain_day = 7 - (arr_calendar.length % 7);//빈공간
		if (remain_day < 7) {
			for (let i = 0; i < remain_day; i++) {
				arr_calendar.push("");
			}
		}

		renderCalendar(arr_calendar);
	}

	function renderCalendar(data) {
		let h = [];
		for (let i = 0; i < data.length; i++) {
			if (i == 0) {//첫주
				h.push('<tr>');
			} else if (i % 7 == 0) {
				h.push('</tr>');
				h.push('<tr>');//다음주..
			}

			if (data[i] === "") {
				h.push('<td></td>');
			} else {
				let day = Number(data[i]);
                let selectedDate = new Date(current_year, current_month - 1, day);

                if (disablePastDates(selectedDate)) {
                    h.push('<td class="t_day" id="day' + data[i] + '" onclick="setDate(' + data[i] + ');" style="cursor:pointer;">' + data[i] + '</td>');
                } else {
                    h.push('<td class="t_day" id="day' + data[i] + '" style="cursor:not-allowed; color:lightgray;">' + data[i] + '</td>');
                }
			}

		}

		h.push('</tr>');

		$("#tb_body").html(h.join(""));
		for (let i = 1; i <= $(".t_day").text().length; i++) {
			if (d == i && m == current_month && y == current_year) {
				$("#day" + i).css("backgroundColor", "#E6FFFF");
			}

		}
	}

	function setDate(day) {//선택할 날짜 가져가기
		$(".t_day").css("backgroundColor", "white");
		$("#day" + day).css("backgroundColor", "#E6FFFF");
		let text_month = current_month;
		if (day < 10) day = "0" + day;
		if (current_month < 10) text_month = "0" + text_month;

		$("#date_text").text(current_year + "-" + text_month + "-" + day);

		$("#input_date").html(current_year + "-" + text_month + "-" + day);
		//$("#div_calendar").hide();

	}

	function changeMonth(diff) {
		if (diff == undefined) {
			current_month = parseInt($("#month").val());
		} else {
			current_month = current_month + diff;

			if (current_month == 0) {//전년도로 바뀜
				current_year = current_year - 1;
				current_month = 12;
			} else if (current_month == 13) {//다음년로 바뀜
				current_year = current_year + 1;
				current_month = 1;
			}
		}

		loadCalendar();
		if ((current_month) == Number(m)) {
			$("#fa1").prop("type", "hidden");
			//$("#fa1").css("visibility", "hidden");
		} else {
			$("#fa1").prop("type", "button");
			//$("#fa1").css("visibility", "visible");
		}
		if ((current_month) == (Number(m) + 1)) {
			$("#fa2").prop("type", "hidden");
			//$("#fa2").css("visibility", "hidden");
		} else {
			$("#fa2").prop("type", "button");
			//$("#fa2").css("visibility", "visible");
		}
	}

	function loadCalendar() {
		$("#year").val(current_year);
		$("#month").val(current_month);
		changeYearMonth(current_year, current_month);

		let previous_month = current_month - 1
		let next_month = current_month + 1
		if (previous_month === 0) {
			$("#fa1").val(12 + "월");
			//$("#fa1").text(12 + "월");
		} else {
			$("#fa1").val(previous_month + "월");
			//$("#fa1").text(previous_month + "월");
		}

		if (next_month === 13) {
			$("#fa2").val(1 + "월");
			//$("#fa2").text(1 + "월");   
		} else {
			$("#fa2").val(next_month + "월");
			//$("#fa2").text(next_month + "월");
		}

	}

	let current_year = (new Date()).getFullYear();
	let current_month = (new Date()).getMonth() + 1;

	$("#year").val(current_year);
	$("#month").val(current_month);

	changeYearMonth(current_year, current_month);

	</script>

</body>
</html>