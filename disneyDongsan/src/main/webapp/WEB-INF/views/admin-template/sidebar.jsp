<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!-- ======= Sidebar ======= -->
<aside id="sidebar" class="sidebar">

	<ul class="sidebar-nav" id="sidebar-nav">

		<li class="nav-item"><a class="nav-link " href="/admin/adminPage">
				<i class="bi bi-grid"></i> <span>Dashboard</span>
		</a></li>
		<!-- End Dashboard Nav -->

		<li class="nav-item">
			<a class="nav-link collapsed" data-bs-target="#memberList" data-bs-toggle="collapse" href="#">
				<i class="bi bi-menu-button-wide"></i><span>회원 관리</span>
				<i class="bi bi-chevron-down ms-auto"></i>
			</a>
			<ul id="memberList" class="nav-content collapse " data-bs-parent="#sidebar-nav">
				<li>
					<a href="/admin/member/memberList"><i class="bi bi-circle"></i>
					<span>회원 정보 리스트</span></a>
				</li>
			</ul>
		</li>

		<li class="nav-item"><a class="nav-link collapsed"
			data-bs-target="#components-nav" data-bs-toggle="collapse" href="#">
				<i class="bi bi-menu-button-wide"></i><span>회원 티켓 관리</span><i
				class="bi bi-chevron-down ms-auto"></i>
		</a>
			<ul id="components-nav" class="nav-content collapse "
				data-bs-parent="#sidebar-nav">
				<li><a href="/admin/ticketOrderList"> <i
						class="bi bi-circle"></i><span>회원 티켓 예매 리스트</span>
				</a></li>
				<li><a href="components-accordion.html"> <i
						class="bi bi-circle"></i><span>Accordion</span>
				</a></li>
				<li><a href="components-badges.html"> <i
						class="bi bi-circle"></i><span>Badges</span>
				</a></li>
				<li><a href="components-breadcrumbs.html"> <i
						class="bi bi-circle"></i><span>Breadcrumbs</span>
				</a></li>
				<li><a href="components-buttons.html"> <i
						class="bi bi-circle"></i><span>Buttons</span>
				</a></li>
				<li><a href="components-cards.html"> <i
						class="bi bi-circle"></i><span>Cards</span>
				</a></li>
				<li><a href="components-carousel.html"> <i
						class="bi bi-circle"></i><span>Carousel</span>
				</a></li>
				<li><a href="components-list-group.html"> <i
						class="bi bi-circle"></i><span>List group</span>
				</a></li>
				<li><a href="components-modal.html"> <i
						class="bi bi-circle"></i><span>Modal</span>
				</a></li>
				<li><a href="components-tabs.html"> <i class="bi bi-circle"></i><span>Tabs</span>
				</a></li>
				<li><a href="components-pagination.html"> <i
						class="bi bi-circle"></i><span>Pagination</span>
				</a></li>
				<li><a href="components-progress.html"> <i
						class="bi bi-circle"></i><span>Progress</span>
				</a></li>
				<li><a href="components-spinners.html"> <i
						class="bi bi-circle"></i><span>Spinners</span>
				</a></li>
				<li><a href="components-tooltips.html"> <i
						class="bi bi-circle"></i><span>Tooltips</span>
				</a></li>
			</ul></li>
		<!-- End Components Nav -->

		<li class="nav-item"><a class="nav-link collapsed"
		data-bs-target="#goodsList" data-bs-toggle="collapse" href="#">
				<i class="bi bi-menu-button-wide"></i><span>굿즈 관리</span> <i
				class="bi bi-chevron-down ms-auto"></i>
		</a>
			<ul id="goodsList" class="nav-content collapse "
				data-bs-parent="#sidebar-nav">
				<li><a href="/admin/goodsList"><i
						class="bi bi-circle"></i> <span>굿즈 리스트</span></a></li>
			</ul>
			<ul id="goodsList" class="nav-content collapse "
				data-bs-parent="#sidebar-nav">
				<li><a href="/admin/deliveryList"><i
						class="bi bi-circle"></i> <span>배송 관리</span></a></li>
			</ul>
		</li>



		<!-- 이용 정보 관리(운영시간, 오시는길) -->
		<li class="nav-item"><a class="nav-link collapsed"
			data-bs-target="#facilityList" data-bs-toggle="collapse" href="#">
				<i class="bi bi-menu-button-wide"></i><span>이용 정보 관리</span> <i
				class="bi bi-chevron-down ms-auto"></i>
		</a>
			<ul id="facilityList" class="nav-content collapse "
				data-bs-parent="#sidebar-nav">
				<li><a href="/admin/operatingHours"><i
						class="bi bi-circle"></i> <span>운영시간</span></a></li>
			</ul>
		</li>
		
			

		<!-- 즐길거리 관리(추천동선, 어트랙션, 레스토랑) -->
		<li class="nav-item"><a class="nav-link collapsed"
			data-bs-target="#joyList" data-bs-toggle="collapse" href="#">
				<i class="bi bi-menu-button-wide"></i><span>즐길거리 관리</span> <i
				class="bi bi-chevron-down ms-auto"></i>
		</a>
			<ul id="joyList" class="nav-content collapse "
				data-bs-parent="#sidebar-nav">
				<li><a href="/admin/routeList"><i
						class="bi bi-circle"></i> <span>추천동선 관리</span></a></li>
			</ul>
			<ul id="joyList" class="nav-content collapse "
				data-bs-parent="#sidebar-nav">
				<li><a href="/admin/rideList"><i
						class="bi bi-circle"></i> <span>어트랙션 관리</span></a></li>
			</ul>
			<ul id="joyList" class="nav-content collapse "
				data-bs-parent="#sidebar-nav">
				<li><a href="/admin/restaurantList"><i
						class="bi bi-circle"></i> <span>레스토랑 관리</span></a></li>
			</ul>
		</li>
		
			
		<!-- 1:1문의 관리 -->
		<li class="nav-item"><a class="nav-link collapsed"
			data-bs-target="#qnaList" data-bs-toggle="collapse" href="#">
				<i class="bi bi-menu-button-wide"></i><span>1:1 문의 관리</span> <i
				class="bi bi-chevron-down ms-auto"></i>
		</a>
			<ul id="qnaList" class="nav-content collapse "
				data-bs-parent="#sidebar-nav">
				<li><a href="/admin/answerList"><i
						class="bi bi-circle"></i> <span>문의 목록</span></a></li>
			</ul>
		</li>
			
		<!-- 메인화면 관리 -->
		<li class="nav-item"><a class="nav-link collapsed"
			data-bs-target="#mainList" data-bs-toggle="collapse" href="#">
				<i class="bi bi-menu-button-wide"></i><span>메인페이지 관리</span> <i
				class="bi bi-chevron-down ms-auto"></i>
		</a>
			<ul id="mainList" class="nav-content collapse "
				data-bs-parent="#sidebar-nav">
				<li><a href="/admin/mainList"><i
						class="bi bi-circle"></i> <span>배너 관리</span></a></li>
			</ul>
		</li>
			
		<!-- 이벤트 관리 -->
		<li class="nav-item"><a class="nav-link collapsed"
			data-bs-target="#eventList" data-bs-toggle="collapse" href="#">
				<i class="bi bi-menu-button-wide"></i><span>이벤트 관리</span> <i
				class="bi bi-chevron-down ms-auto"></i>
		</a>
			<ul id="eventList" class="nav-content collapse "
				data-bs-parent="#sidebar-nav">
				<li><a href="/admin/event/eventList"><i
						class="bi bi-circle"></i> <span>이벤트 목록</span></a></li>
			</ul>
		</li>
			
		<!-- 공지사항 관리 -->
		<li class="nav-item"><a class="nav-link collapsed"
			data-bs-target="#noticeList" data-bs-toggle="collapse" href="#">
				<i class="bi bi-menu-button-wide"></i><span>공지사항 관리</span> <i
				class="bi bi-chevron-down ms-auto"></i>
		</a>
			<ul id="noticeList" class="nav-content collapse "
				data-bs-parent="#sidebar-nav">
				<li><a href="/admin/notice/noticeList"><i
						class="bi bi-circle"></i> <span>공지사항 목록</span></a></li>
			</ul>
		</li>
			
			
		<li class="nav-item"><a class="nav-link collapsed"
			data-bs-target="#forms-nav" data-bs-toggle="collapse" href="#"> <i
				class="bi bi-journal-text"></i><span>Forms</span><i
				class="bi bi-chevron-down ms-auto"></i>
		</a>
			<ul id="forms-nav" class="nav-content collapse "
				data-bs-parent="#sidebar-nav">
				<li><a href="forms-elements.html"> <i class="bi bi-circle"></i><span>Form
							Elements</span>
				</a></li>
				<li><a href="forms-layouts.html"> <i class="bi bi-circle"></i><span>Form
							Layouts</span>
				</a></li>
				<li><a href="forms-editors.html"> <i class="bi bi-circle"></i><span>Form
							Editors</span>
				</a></li>
				<li><a href="forms-validation.html"> <i
						class="bi bi-circle"></i><span>Form Validation</span>
				</a></li>
			</ul></li>
		<!-- End Forms Nav -->

		<li class="nav-item"><a class="nav-link collapsed"
			data-bs-target="#tables-nav" data-bs-toggle="collapse" href="#">
				<i class="bi bi-layout-text-window-reverse"></i><span>Tables</span><i
				class="bi bi-chevron-down ms-auto"></i>
		</a>
			<ul id="tables-nav" class="nav-content collapse "
				data-bs-parent="#sidebar-nav">
				<li><a href="tables-general.html"> <i class="bi bi-circle"></i><span>General
							Tables</span>
				</a></li>
				<li><a href="tables-data.html"> <i class="bi bi-circle"></i><span>Data
							Tables</span>
				</a></li>
			</ul></li>
		<!-- End Tables Nav -->

		<li class="nav-item"><a class="nav-link collapsed"
			data-bs-target="#charts-nav" data-bs-toggle="collapse" href="#">
				<i class="bi bi-bar-chart"></i><span>Charts</span><i
				class="bi bi-chevron-down ms-auto"></i>
		</a>
			<ul id="charts-nav" class="nav-content collapse "
				data-bs-parent="#sidebar-nav">
				<li><a href="charts-chartjs.html"> <i class="bi bi-circle"></i><span>Chart.js</span>
				</a></li>
				<li><a href="charts-apexcharts.html"> <i
						class="bi bi-circle"></i><span>ApexCharts</span>
				</a></li>
				<li><a href="charts-echarts.html"> <i class="bi bi-circle"></i><span>ECharts</span>
				</a></li>
			</ul></li>
		<!-- End Charts Nav -->

		<li class="nav-item"><a class="nav-link collapsed"
			data-bs-target="#icons-nav" data-bs-toggle="collapse" href="#"> <i
				class="bi bi-gem"></i><span>Icons</span><i
				class="bi bi-chevron-down ms-auto"></i>
		</a>
			<ul id="icons-nav" class="nav-content collapse "
				data-bs-parent="#sidebar-nav">
				<li><a href="icons-bootstrap.html"> <i class="bi bi-circle"></i><span>Bootstrap
							Icons</span>
				</a></li>
				<li><a href="icons-remix.html"> <i class="bi bi-circle"></i><span>Remix
							Icons</span>
				</a></li>
				<li><a href="icons-boxicons.html"> <i class="bi bi-circle"></i><span>Boxicons</span>
				</a></li>
			</ul></li>
		<!-- End Icons Nav -->

		<li class="nav-heading">Pages</li>

		<li class="nav-item"><a class="nav-link collapsed"
			href="users-profile.html"> <i class="bi bi-person"></i> <span>Profile</span>
		</a></li>
		<!-- End Profile Page Nav -->

		<li class="nav-item"><a class="nav-link collapsed"
			href="pages-faq.html"> <i class="bi bi-question-circle"></i> <span>F.A.Q</span>
		</a></li>
		<!-- End F.A.Q Page Nav -->

		<li class="nav-item"><a class="nav-link collapsed"
			href="pages-contact.html"> <i class="bi bi-envelope"></i> <span>Contact</span>
		</a></li>
		<!-- End Contact Page Nav -->

		<li class="nav-item"><a class="nav-link collapsed"
			href="pages-register.html"> <i class="bi bi-card-list"></i> <span>Register</span>
		</a></li>
		<!-- End Register Page Nav -->

		<li class="nav-item"><a class="nav-link collapsed"
			href="pages-login.html"> <i class="bi bi-box-arrow-in-right"></i>
				<span>Login</span>
		</a></li>
		<!-- End Login Page Nav -->

		<li class="nav-item"><a class="nav-link collapsed"
			href="pages-error-404.html"> <i class="bi bi-dash-circle"></i> <span>Error
					404</span>
		</a></li>
		<!-- End Error 404 Page Nav -->

		<li class="nav-item"><a class="nav-link collapsed"
			href="pages-blank.html"> <i class="bi bi-file-earmark"></i> <span>Blank</span>
		</a></li>
		<!-- End Blank Page Nav -->

	</ul>

</aside>
<!-- End Sidebar-->