<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>

<!-- partnerSidebar START -->
<nav class="navbar sidebar navbar-expand-xl navbar-light">
	<!-- Navbar brand for xl START (사이드바 로고) -->
	<div class="d-flex align-items-center">
		<a class="navbar-brand" href="/mtl/partner/dashboard"> <img
			class="light-mode-item navbar-brand-item"
			src="assets/images/logo.svg" alt="logo"> <img
			class="dark-mode-item navbar-brand-item"
			src="assets/images/logo-light.svg" alt="logo">
		</a>
	</div>
	<!-- Navbar brand for xl END -->

	<div class="offcanvas offcanvas-start flex-row custom-scrollbar h-100"
		data-bs-backdrop="true" tabindex="-1" id="offcanvasSidebar">
		<div class="offcanvas-body sidebar-content d-flex flex-column pt-4">

			<!-- Sidebar menu START -->
			<ul class="navbar-nav flex-column" id="navbar-sidebar">

				<!-- Menu item -->
				<li class="nav-item"><a href="/mtl/partner/dashboard"
					class="nav-link">홈</a></li>


				<!-- Menu item -->
				<li class="nav-item"><a class="nav-link"
					data-bs-toggle="collapse" href="#collapsehotel" role="button"
					aria-expanded="false" aria-controls="collapsehotel"> 숙소 관리 </a> <!-- Submenu -->
					<ul class="nav collapse flex-column" id="collapsehotel"
						data-bs-parent="#navbar-sidebar">
						<li class="nav-item"><a class="nav-link "
							href="/mtl/partner/hotelregist">숙소 등록</a></li>
						<li class="nav-item"><a class="nav-link"
							href="/mtl/partner/roomregist">객실 관리</a></li>
					</ul></li>

				<!-- Menu item -->
				<li class="nav-item"><a class="nav-link"
					data-bs-toggle="collapse" href="#collapsebooking" role="button"
					aria-expanded="false" aria-controls="collapsebooking"> 예약 관리 </a> <!-- Submenu -->
					<ul class="nav collapse flex-column" id="collapsebooking"
						data-bs-parent="#navbar-sidebar">
						<li class="nav-item"><a class="nav-link"
							href="/mtl/partner/bookinglist">예약내역 통합검색</a></li>
					</ul></li>

				<!-- Menu item -->
				<li class="nav-item"><a class="nav-link"
					data-bs-toggle="collapse" href="#collapsepayment" role="button"
					aria-expanded="false" aria-controls="collapsepayment"> 결제 관리 </a> <!-- Submenu -->
					<ul class="nav collapse flex-column" id="collapsepayment"
						data-bs-parent="#navbar-sidebar">
						<li class="nav-item"><a class="nav-link"
							href="/mtl/partner/payoutlist">정산 내역</a></li>
					</ul></li>

				<!-- Menu item -->
				<li class="nav-item"><a class="nav-link"
					data-bs-toggle="collapse" href="#collapseguest" role="button"
					aria-expanded="false" aria-controls="collapseguest"> 고객 관리 </a> <!-- Submenu -->
					<ul class="nav collapse flex-column" id="collapseguest"
						data-bs-parent="#navbar-sidebar">
						<li class="nav-item"><a class="nav-link"
							href="/mtl/partner/reviews">후기 관리</a></li>
						<li class="nav-item"><a class="nav-link"
							href="/mtl/partner/question">문의 관리</a></li>
					</ul></li>

				<!-- Menu item -->
				<li class="nav-item"><a class="nav-link"
					data-bs-toggle="collapse" href="#collapseauthentication"
					role="button" aria-expanded="false"
					aria-controls="collapseauthentication"> 기타 페이지들 </a> <!-- Submenu -->
					<ul class="nav collapse flex-column" id="collapseauthentication"
						data-bs-parent="#navbar-sidebar">
						<li class="nav-item"><a class="nav-link"
							href="/mtl/partner/signin">로그인</a></li>
						<li class="nav-item"><a class="nav-link"
							href="/mtl/partner/signup">회원가입</a></li>
						<li class="nav-item"><a class="nav-link"
							href="/mtl/partner/forgotpassword">비밀번호 찾기</a></li>
						<li class="nav-item"><a class="nav-link"
							href="/mtl/partner/notion">공지사항</a></li>
						<li class="nav-item"><a class="nav-link"
							href="/mtl/partner/mypage">마이페이지</a></li>
					</ul></li>
			</ul>
			<!-- Sidebar menu end -->

			<!-- Sidebar footer START -->
			<div
				class="d-flex align-items-center justify-content-between text-primary-hover mt-auto p-3">
				<a class="h6 fw-light mb-0 text-body" href="/mtl/partner/signin"
					data-bs-toggle="tooltip" data-bs-placement="top"
					aria-label="Sign out"> <i
					class="fa-solid fa-arrow-right-from-bracket"></i> Log out
				</a> <a class="h6 mb-0 text-body" href="/mtl/partner/mypage"
					data-bs-toggle="tooltip" data-bs-placement="top"
					aria-label="Settings"> <i class="bi bi-gear-fill"></i>
				</a>
			</div>
			<!-- Sidebar footer END -->

		</div>
	</div>
</nav>
<!-- partnerSidebar END -->
