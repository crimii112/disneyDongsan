<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/admin-template/admin-common.jspf"%>

	<style>	
		body{margin: 0px; padding: 0px;}
		.container h1{text-align: center;}
		#list{width:400px; margin-left:auto;margin-right:auto;}
		#hoursTable{width: 400px;border:1px solid black;margin-left:auto;margin-right:auto;}
		#update{float: right;}
		tr{border: 1px solid black;}
		
		th, td{border: 1px solid black;}
	</style>
	<script>
	    let date = new Date();
	    let y = date.getFullYear();
	    let m = ('0' + (date.getMonth() + 1)).slice(-2);
	    let d = ('0' + date.getDate()).slice(-2);
	    let today = y + "-" + m + "-" + d;
	    let todayText = y + "-" + m + "-";
	    
	    let currentYear = new Date().getFullYear();
        let currentMonth = new Date().getMonth() + 1;
	    
	    month = Number(m);
	    nextMonth = month+1;
	    lastMonth = month-1;
	    
	    $(function(){
	    	loadData();
	    	changeMonth();
	    	$("#month").text(month+"월");
	    	$("#nextMonthBtn").val(nextMonth+"월");
	    	updateNextMonth();
	    	
			$("#nextMonthBtn").click(function(){
				nextMonth = nextMonth+1;
				lastMonth = lastMonth+1;
				month = month+1;
		    	updateNextMonth();
				changeMonth();
				$("#month").text(month+"월");
				$("#nextMonthBtn").val(nextMonth+"월");
		    	$("#lastMonthBtn").val(lastMonth+"월");	
		    	loadData();
		    	
			});
			$("#lastMonthBtn").click(function(){
				lastMonth = lastMonth-1;
				nextMonth = nextMonth-1;
				month = month-1;
				updateNextMonth();
				changeMonth();
				$("#month").text(month+"월");
				$("#nextMonthBtn").val(nextMonth+"월");	    	
				$("#lastMonthBtn").val(lastMonth+"월");
				loadData();
			});
			$("#update").click(function(){
				location.href = "/admin/operatingHoursUpdateForm";
			});
			
	    });
	    
	    function changeMonth() {
		      if(month == 13){
		    	  month =1;
		    	  currentYear = currentYear+1;
		      }else if(nextMonth == 13){
		    	  nextMonth =1;
		      }else if(lastMonth == 13){
		    	  lastMonth =1;
		      }else if(lastMonth == 0){
		    	  lastMonth = 12;
		      }else if(month == 0){
		    	  month = 12;
		    	  currentYear = currentYear-1;
		      }else if(nextMonth == 0){
		    	  nextMonth = 12;
		      }
		    }
	    function updateNextMonth() {

	        if (nextMonth > currentMonth + 3 || y > currentYear) {
	            $("#nextMonthBtn").attr("type", "hidden");
	        } else {
	            $("#nextMonthBtn").attr("type", "button");
	        }
	        if (nextMonth < currentMonth){
	        	if(nextMonth < currentMonth-9){
	        		$("#nextMonthBtn").attr("type", "button");
	        	}else{
	        		$("#nextMonthBtn").attr("type", "hidden");
	        	}
	        }

	        if (lastMonth < currentMonth && y >= currentYear) {
	            $("#lastMonthBtn").attr("type", "hidden");
	        } else {
	            $("#lastMonthBtn").attr("type", "button");
	        }
	    }
	    function loadData(){
	    	$("#hoursTable tbody").empty();
			$.ajax({
			    url: '${pageContext.request.contextPath}/admin/operatingHours', // Spring 컨트롤러 엔드포인트 URL
			    type: 'POST',
			    data: { data : currentYear+"-"+("0" + month).slice(-2)},
			    dataType: 'json', // 응답 데이터 형식이 JSON임을 지정
			    success: function(data) {
			        // 서버에서 받은 JSON 데이터를 JavaScript 배열로 파싱
			        let hoursList = data;
			        
			        for (let i = 0; i < hoursList.length; i++) {
		                // 데이터를 표에 출력하는 부분을 수정
		                let newRow = "<tr class='text-center'><td class='hoursDate'>" + hoursList[i].hoursDate + "</td><td class='hoursTime'>" + hoursList[i].hoursTime + "</td></tr>";
		                $("#hoursTable tbody").append(newRow);
		            }   
			    },
			    error: function() {
			        // 오류 처리
			        alert('데이터를 가져오는 데 실패했습니다.');
			    }
			}); 
	    }
		
		
	  </script>
	</head>
	<body>
	<%@ include file="/WEB-INF/views/admin-template/header.jsp"%>
	<%@ include file="/WEB-INF/views/admin-template/sidebar.jsp"%>
	
	<main id="main" class="main">
		<div class="pagetitle">
			<h1>운영 시간</h1>
		</div>
		<section class="section dashboard">
			<div class="row">
				<div class="col-lg-12">
					<div class="card">
						<div class="card-body">
							<div id="list">
				            	<input type="hidden" id="lastMonthBtn" name="lastMonthBtn" value="" />
				            	<span id="month"></span>
				            	<input type="button" id="nextMonthBtn" name="nextMonthBtn" value="" />
				            	<input type="button" id="update" name="update" value="수정" />
			            	</div>
			               <table summary="운영시간 관리" id="hoursTable" class="table table-hover">
			                  <thead>
			                     <tr>
			                        <th class="text-center">운영날짜</th>
			                        <th class="text-center">운영시간</th>
			                     </tr>
			                  </thead>
			                  <tbody id="hourslist">
			                     <!-- 데이터 출력 -->
			
			                  </tbody>
			               </table>	
						</div>
					</div>
				</div>
			</div>
		</section>
	</main>
	  <%@ include file="/WEB-INF/views/admin-template/footer.jsp"%>

	<script type="text/javascript"
		src="/resources/include/js/jquery-3.7.0.min.js"></script>
	<script type="text/javascript" src="/resources/include/js/common.js"></script>
	<script
		src="/resources/include/assets/vendor/apexcharts/apexcharts.min.js"></script>
	<script
		src="/resources/include/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="/resources/include/assets/vendor/chart.js/chart.umd.js"></script>
	<script src="/resources/include/assets/vendor/echarts/echarts.min.js"></script>
	<script src="/resources/include/assets/vendor/quill/quill.min.js"></script>
	<script
		src="/resources/include/assets/vendor/simple-datatables/simple-datatables.js"></script>
	<script src="/resources/include/assets/vendor/tinymce/tinymce.min.js"></script>
	<script
		src="/resources/include/assets/vendor/php-email-form/validate.js"></script>

	<!-- Template Main JS File -->
	<script src="/resources/include/assets/js/main.js"></script>
	  
	</body>
</html>