<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>

<!-- adminSidebar START -->
<nav class="navbar sidebar navbar-expand-xl navbar-light">
	<!-- Navbar brand for xl START (사이드바 로고) -->
	<div class="d-flex justify-content-center">
		<a class="navbar-brand pe-0 d-flex justify-content-center" href="/mtl/admin/dashboard">
			<img class="light-mode-item w-80" src="assets/images/logo-200.png" alt="logo">
		</a>
	</div>
	<!-- Navbar brand for xl END -->

	<div class="offcanvas offcanvas-start flex-row custom-scrollbar h-100" data-bs-backdrop="true" tabindex="-1" id="offcanvasSidebar">
		<div class="offcanvas-body sidebar-content d-flex flex-column pt-4">
			<!-- Sidebar menu START -->
			<ul class="navbar-nav flex-column" id="navbar-sidebar">
				<!-- Menu item -->
				<li class="nav-item"><a href="/mtl/admin/dashboard" class="nav-link">홈</a></li>

				<!-- Menu item -->
				<li class="nav-item">
					<a class="nav-link" data-bs-toggle="collapse" href="#collapsemember" role="button" aria-expanded="false" aria-controls="collapsemember"> 회원 관리 </a> <!-- Submenu -->
					<ul class="nav collapse flex-column" id="collapsemember" data-bs-parent="#navbar-sidebar">
						<li class="nav-item">
							<a class="nav-link" href="/mtl/admin/user/list">사용자 관리</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="/mtl/admin/partner/list">판매자 관리</a>
						</li>
					</ul>
				</li>

				<!-- Menu item -->
				<li class="nav-item">
					<a class="nav-link" data-bs-toggle="collapse" href="#collapsehotel" role="button" aria-expanded="false" aria-controls="collapsehotel"> 숙소 관리 </a> <!-- Submenu -->
					<ul class="nav collapse flex-column" id="collapsehotel" data-bs-parent="#navbar-sidebar">
						<li class="nav-item">
							<a class="nav-link" href="/mtl/admin/accomodation/list">숙소 관리</a></li>
						<li class="nav-item">
							<a class="nav-link" href="/mtl/admin/accomodation/reservation/list">예약 관리</a></li>
						<li class="nav-item">
							<a class="nav-link" href="/mtl/admin/accomodation/question">숙소 문의 관리</a>
						</li>
					</ul>
				</li>

				<!-- Menu item -->
				<li class="nav-item">
					<a class="nav-link" data-bs-toggle="collapse" href="#collapsepayment" role="button" aria-expanded="false" aria-controls="collapsepayment"> 정산 관리 </a> <!-- Submenu -->
					<ul class="nav collapse flex-column" id="collapsepayment" data-bs-parent="#navbar-sidebar">
						<li class="nav-item">
							<a class="nav-link" href="/mtl/admin/payout">정산 내역</a>
						</li>
					</ul>
				</li>

				<!-- Menu item -->
				<li class="nav-item">
					<a class="nav-link" data-bs-toggle="collapse" href="#collapsetravel" role="button" aria-expanded="false" aria-controls="collapsetravel"> 여행지 관리 </a> <!-- Submenu -->
					<ul class="nav collapse flex-column" id="collapsetravel" data-bs-parent="#navbar-sidebar">
						<li class="nav-item">
							<a class="nav-link" href="/mtl/admin/location/list">여행지 관리</a>
						</li>
					</ul>
				</li>

				<!-- Menu item -->
				<li class="nav-item"><a class="nav-link"
					data-bs-toggle="collapse" href="#customerInquiry" role="button"
					aria-expanded="false" aria-controls="customerInquiry"> 고객 문의 </a> <!-- Submenu -->
					<ul class="nav collapse flex-column" id="customerInquiry" data-bs-parent="#navbar-sidebar">
						<li class="nav-item">
							<a class="nav-link" href="/mtl/admin/question">1:1 문의</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="/mtl/admin/qna">자주 묻는 질문</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="/mtl/admin/notice">공지사항</a>
						</li>
					</ul>
				</li>

			</ul>
			<!-- Sidebar menu end -->

			<!-- Sidebar footer START -->
			<div class="d-flex align-items-center justify-content-between text-primary-hover mt-auto p-3">
				<a class="h6 fw-light mb-0 text-body" href="javascript:;" data-bs-toggle="tooltip" data-bs-placement="top" aria-label="Sign out" data-src="adminTopbar" data-act="clickLogoutBtn">
					<i class="fa-solid fa-arrow-right-from-bracket"></i> Log out
				</a> 
				<a class="h6 mb-0 text-body" href="/mtl/admin/mypage" data-bs-toggle="tooltip" data-bs-placement="top" aria-label="Settings"> 
					<i class="bi bi-gear-fill"></i>
				</a>
			</div>
			<!-- Sidebar footer END -->

		</div>
	</div>
</nav>
<!-- adminSidebar END -->