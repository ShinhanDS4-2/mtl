<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>
<!-- Header START -->
<header class="navbar-light header-sticky">
	<!-- Logo Nav START -->
	<nav class="navbar navbar-expand-xl p-1">
		<div class="container">
			<!-- Logo START -->
			<a class="navbar-brand pb-1 pt-1" href="javascript:;" data-src="header" data-act="clickLogo">
				<img class="light-mode-item navbar-brand-item" src="assets/images/logo-80.png" alt="logo">
			</a>
			<!-- Logo END -->

			<!-- Responsive category toggler -->
			<button class="navbar-toggler ms-sm-auto mx-3 me-md-0 p-0 p-sm-2" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCategoryCollapse" aria-controls="navbarCategoryCollapse" aria-expanded="false" aria-label="Toggle navigation">
				<i class="bi bi-grid-3x3-gap-fill fa-fw"></i><span class="d-none d-sm-inline-block small">메뉴</span>
			</button>

			<!-- Main navbar START -->
			<div class="navbar-collapse collapse" id="navbarCategoryCollapse">
				<ul class="navbar-nav navbar-nav-scroll nav-pills-primary-soft text-center ms-auto p-2 p-xl-0">
					<li class="nav-item"> <a class="nav-link" href="partner/list"><i class="fa-solid fa-hotel me-2"></i>숙소</a>	</li>
					<li class="nav-item"> <a class="nav-link" href="area/list"><i class="fa-solid fa-route me-2"></i>여행지</a> </li>
				</ul>
			</div>
			<!-- Main navbar END -->
			
			<!-- Profile and Notification START -->
			<ul class="nav flex-row align-items-center list-unstyled ms-xl-auto">
				<!-- 비로그인 시 로그인/회원가입 버튼 -->
				<li class="nav-item">
					<a class=" btn btn-outline-primary btn-sm mt-2" href="login" role="button">
						로그인 / 회원가입
					</a>
				</li>
				<!-- 로그인 시 사용자 버튼 START -->
				<li class="nav-item ms-3 dropdown">
					<a class=" btn btn-outline-primary btn-sm mt-2" href="#" id="profileDropdown" role="button" data-bs-auto-close="outside" data-bs-display="static" data-bs-toggle="dropdown" aria-expanded="false">
						<span>사용자</span> 님<i class="fas fa-angle-right ms-2"></i>
					</a>

					<ul class="dropdown-menu dropdown-animation dropdown-menu-end shadow pt-3" aria-labelledby="profileDropdown">
						<!-- Profile info -->
						<li class="px-3 mb-3">
							<div class="d-flex align-items-center">
								<div>
									<a class="h6 mt-2 mt-sm-0" href="mypage/info">Lori Ferguson</a>
									<p class="small m-0">example@gmail.com</p>
								</div>
							</div>
						</li>

						<!-- Links -->
						<li> <hr class="dropdown-divider"></li>
						<li><a class="dropdown-item" href="mypage/info"><i class="bi bi-person fa-fw me-2"></i>내 정보 관리</a></li>
						<li><a class="dropdown-item" href="mypage/reservation"><i class="fa-solid fa-calendar-check fa-fw me-2"></i>예약 내역</a></li>
						<li><a class="dropdown-item" href="service/qna"><i class="fa-solid fa-headset fa-fw me-2"></i>고객 센터</a></li>
						<li><a class="dropdown-item bg-danger-soft-hover" href="#"><i class="bi bi-power fa-fw me-2"></i>로그아웃</a></li>
					</ul>
				</li>
				<!-- Profile dropdown END -->
			</ul>
			<!-- Profile and Notification START -->

		</div>
	</nav>
	<!-- Logo Nav END -->
</header>
<!-- Header END -->