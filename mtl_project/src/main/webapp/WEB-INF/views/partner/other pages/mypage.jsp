<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>Booking - Multipurpose Online Booking Theme</title>

<!-- headerScript -->
<%@ include file="/WEB-INF/views/include/headerScript.jsp"%>
</head>

<body>

	<!-- **************** MAIN CONTENT START **************** -->
	<main>

		<!-- Sidebar START -->
		<nav class="navbar sidebar navbar-expand-xl navbar-light">
			<!-- Navbar brand for xl START (사이드바 로고) -->
			<div class="d-flex align-items-center">
				<a class="navbar-brand" href="index.html"> <img
					class="light-mode-item navbar-brand-item"
					src="assets/images/logo.svg" alt="logo"> <img
					class="dark-mode-item navbar-brand-item"
					src="assets/images/logo-light.svg" alt="logo">
				</a>
			</div>
			<!-- Navbar brand for xl END -->

			<div
				class="offcanvas offcanvas-start flex-row custom-scrollbar h-100"
				data-bs-backdrop="true" tabindex="-1" id="offcanvasSidebar">
				<div class="offcanvas-body sidebar-content d-flex flex-column pt-4">

					<!-- Sidebar menu START -->
					<ul class="navbar-nav flex-column" id="navbar-sidebar">

						<!-- Menu item -->
						<li class="nav-item"><a href="a-admin-dashboard.html"
							class="nav-link">홈</a></li>


						<!-- Menu item -->
						<li class="nav-item"><a class="nav-link"
							data-bs-toggle="collapse" href="#collapsehotel" role="button"
							aria-expanded="false" aria-controls="collapsehotel"> 숙소 관리 </a> <!-- Submenu -->
							<ul class="nav collapse flex-column" id="collapsehotel"
								data-bs-parent="#navbar-sidebar">
								<li class="nav-item"><a class="nav-link "
									href="a-admin-hotel-regist.html">숙소 등록</a></li>
								<li class="nav-item"><a class="nav-link"
									href="a-admin-hotel-roomlist.html">객실 관리</a></li>
							</ul></li>

						<!-- Menu item -->
						<li class="nav-item"><a class="nav-link"
							data-bs-toggle="collapse" href="#collapsebooking" role="button"
							aria-expanded="false" aria-controls="collapsebooking"> 예약 관리
						</a> <!-- Submenu -->
							<ul class="nav collapse flex-column" id="collapsebooking"
								data-bs-parent="#navbar-sidebar">
								<li class="nav-item"><a class="nav-link "
									href="admin-booking-list.html">예약내역 통합검색</a></li>
								<li class="nav-item"><a class="nav-link"
									href="admin-booking-detail.html">예약내역 상세보기</a></li>
							</ul></li>

						<!-- Menu item -->
						<li class="nav-item"><a class="nav-link"
							data-bs-toggle="collapse" href="#collapsepayment" role="button"
							aria-expanded="false" aria-controls="collapsepayment"> 결제 관리
						</a> <!-- Submenu -->
							<ul class="nav collapse flex-column" id="collapsepayment"
								data-bs-parent="#navbar-sidebar">
								<li class="nav-item"><a class="nav-link"
									href="admin-earnings.html">정산 내역</a></li>
							</ul></li>


						<!-- Menu item -->
						<li class="nav-item"><a class="nav-link"
							data-bs-toggle="collapse" href="#collapseguest" role="button"
							aria-expanded="false" aria-controls="collapseguest"> 고객 관리 </a> <!-- Submenu -->
							<ul class="nav collapse flex-column" id="collapseguest"
								data-bs-parent="#navbar-sidebar">
								<li class="nav-item"><a class="nav-link"
									href="admin-reviews.html">후기 관리</a></li>
								<li class="nav-item"><a class="nav-link"
									href="admin-guest-list.html">문의 관리</a></li>
								<li class="nav-item"><a class="nav-link"
									href="a-admin-guest-inquires-details.html">문의 상세 조회</a></li>
							</ul></li>

						<!-- Menu item -->
						<li class="nav-item"><a class="nav-link"
							data-bs-toggle="collapse" href="#collapsestatistics"
							role="button" aria-expanded="false"
							aria-controls="collapsestatistics"> 통계/분석 </a> <!-- Submenu -->
							<ul class="nav collapse flex-column" id="collapsestatistics"
								data-bs-parent="#navbar-sidebar">
								<li class="nav-item"><a class="nav-link" href="#">선택사항</a></li>
							</ul></li>


						<!-- Menu item -->
						<li class="nav-item"><a class="nav-link"
							data-bs-toggle="collapse" href="#collapseauthentication"
							role="button" aria-expanded="false"
							aria-controls="collapseauthentication"> 기타 페이지들 </a> <!-- Submenu -->
							<ul class="nav collapse flex-column" id="collapseauthentication"
								data-bs-parent="#navbar-sidebar">
								<li class="nav-item"><a class="nav-link"
									href="sign-in.html">로그인</a></li>
								<li class="nav-item"><a class="nav-link"
									href="sign-up.html">회원가입</a></li>
								<li class="nav-item"><a class="nav-link"
									href="forgot-password.html">비밀번호 찾기</a></li>
								<li class="nav-item"><a class="nav-link"
									href="a-admin-guest-notice.html">공지사항</a></li>
								<li class="nav-item"><a class="nav-link"
									href="a-admin-mypage.html">마이페이지</a></li>
							</ul></li>
					</ul>
					<!-- Sidebar menu end -->

					<!-- Sidebar footer START -->
					<div
						class="d-flex align-items-center justify-content-between text-primary-hover mt-auto p-3">
						<a class="h6 fw-light mb-0 text-body" href="sign-in.html"
							data-bs-toggle="tooltip" data-bs-placement="top"
							aria-label="Sign out"> <i
							class="fa-solid fa-arrow-right-from-bracket"></i> Log out
						</a> <a class="h6 mb-0 text-body" href="admin-settings.html"
							data-bs-toggle="tooltip" data-bs-placement="top"
							aria-label="Settings"> <i class="bi bi-gear-fill"></i>
						</a>
					</div>
					<!-- Sidebar footer END -->

				</div>
			</div>
		</nav>
		<!-- Sidebar END -->

		<!-- Page content START -->
		<div class="page-content">

			<!-- Top bar START -->
			<nav class="navbar top-bar navbar-light py-0 py-xl-3">
				<div class="container-fluid p-0">
					<div class="d-flex align-items-center w-100">

						<!-- Logo START -->
						<div class="d-flex align-items-center d-xl-none">
							<a class="navbar-brand" href="index.html"> <img
								class="navbar-brand-item h-40px"
								src="assets/images/logo-icon.svg" alt="">
							</a>
						</div>
						<!-- Logo END -->

						<!-- Toggler for sidebar START  =>  작은화면에서 사이드바 펼쳐지도록 하는 햄버거 버튼 -->
						<div class="navbar-expand-xl sidebar-offcanvas-menu">
							<button class="navbar-toggler me-auto p-2" type="button"
								data-bs-toggle="offcanvas" data-bs-target="#offcanvasSidebar"
								aria-controls="offcanvasSidebar" aria-expanded="false"
								aria-label="Toggle navigation" data-bs-auto-close="outside">
								<i class="bi bi-list text-primary fa-fw"
									data-bs-target="#offcanvasMenu"></i>
							</button>
						</div>
						<!-- Toggler for sidebar END -->

						<!-- Top bar left START -->
						<div class="navbar-expand-lg ms-auto ms-xl-0">
							<!-- Toggler for menubar START  =>  작은화면에서 검색창이 돋보기 아이콘으로 축소됨 -->
							<button class="navbar-toggler ms-auto p-0" type="button"
								data-bs-toggle="collapse" data-bs-target="#navbarTopContent"
								aria-controls="navbarTopContent" aria-expanded="false"
								aria-label="Toggle navigation">
								<i class="bi bi-search"></i>
							</button>
							<!-- Toggler for menubar END -->

							<!-- Topbar menu START -->
							<div class="collapse navbar-collapse w-100 z-index-1"
								id="navbarTopContent">
								<!-- Top search START -->
								<div class="nav my-3 my-xl-0 flex-nowrap align-items-center">
									<div class="nav-item w-100">
										<form class="position-relative">
											<input class="form-control bg-light pe-5" type="search"
												placeholder="Search" aria-label="Search">
											<button
												class="bg-transparent px-2 py-0 border-0 position-absolute top-50 end-0 translate-middle-y"
												type="submit">
												<i class="fas fa-search fs-6 text-primary"></i>
											</button>
										</form>
									</div>
								</div>
								<!-- Top search END -->
							</div>
							<!-- Topbar menu END -->
						</div>
						<!-- Top bar left END -->

						<!-- Top bar right START -->
						<ul
							class="nav flex-row align-items-center list-unstyled ms-xl-auto">

							<!-- Notification dropdown START -->
							<li class="nav-item dropdown ms-3">
								<!-- Notification button --> <a
								class="nav-notification btn btn-light p-0 mb-0" href="#"
								role="button" data-bs-toggle="dropdown" aria-expanded="false"
								data-bs-auto-close="outside"> <i class="bi bi-bell fa-fw"></i>
							</a> <!-- Notification dote --> <span
								class="notif-badge animation-blink"></span> <!-- Notification dropdown menu START -->
								<div
									class="dropdown-menu dropdown-animation dropdown-menu-end dropdown-menu-size-md shadow-lg p-0">
									<div class="card bg-transparent">
										<!-- Card header -->
										<div
											class="card-header bg-transparent d-flex justify-content-between align-items-center border-bottom">
											<h6 class="m-0">
												Notifications <span
													class="badge bg-danger bg-opacity-10 text-danger ms-2">4
													new</span>
											</h6>
											<a class="small" href="#">Clear all</a>
										</div>

										<!-- Card body START -->
										<div class="card-body p-0">
											<ul class="list-group list-group-flush list-unstyled p-2">
												<!-- Notification item -->
												<li><a href="#"
													class="list-group-item list-group-item-action rounded notif-unread border-0 mb-1 p-3">
														<h6 class="mb-2">New! Booking flights from New York
															✈️</h6>
														<p class="mb-0 small">Find the flexible ticket on
															flights around the world. Start searching today</p> <span>Wednesday</span>
												</a></li>
												<!-- Notification item -->
												<li><a href="#"
													class="list-group-item list-group-item-action rounded border-0 mb-1 p-3">
														<h6 class="mb-2">Sunshine saving are here 🌞 save 30%
															or more on a stay</h6> <span>15 Nov 2022</span>
												</a></li>
											</ul>
										</div>
										<!-- Card body END -->

										<!-- Card footer -->
										<div class="card-footer bg-transparent text-center border-top">
											<a href="#" class="btn btn-sm btn-link mb-0 p-0">See all
												incoming activity</a>
										</div>
									</div>
								</div> <!-- Notification dropdown menu END -->
							</li>
							<!-- Notification dropdown END -->

							<!-- Profile dropdown START -->
							<li class="nav-item ms-3 dropdown">
								<!-- Avatar --> <a class="avatar avatar-sm p-0" href="#"
								id="profileDropdown" role="button" data-bs-auto-close="outside"
								data-bs-display="static" data-bs-toggle="dropdown"
								aria-expanded="false"> <img class="avatar-img rounded-2"
									src="assets/images/avatar/01.jpg" alt="avatar">
							</a>

								<ul
									class="dropdown-menu dropdown-animation dropdown-menu-end shadow pt-3"
									aria-labelledby="profileDropdown">
									<!-- Profile info -->
									<li class="px-3 mb-3">
										<div class="d-flex align-items-center">
											<!-- Avatar -->
											<div class="avatar me-3">
												<img class="avatar-img rounded-circle shadow"
													src="assets/images/avatar/01.jpg" alt="avatar">
											</div>
											<div>
												<a class="h6 mt-2 mt-sm-0" href="#">Lori Ferguson</a>
												<p class="small m-0">example@gmail.com</p>
											</div>
										</div>
									</li>

									<!-- Links -->
									<li>
										<hr class="dropdown-divider">
									</li>
									<li><a class="dropdown-item" href="#"><i
											class="bi bi-bookmark-check fa-fw me-2"></i>My Bookings</a></li>
									<li><a class="dropdown-item" href="#"><i
											class="bi bi-heart fa-fw me-2"></i>My Wishlist</a></li>
									<li><a class="dropdown-item" href="#"><i
											class="bi bi-gear fa-fw me-2"></i>Settings</a></li>
									<li><a class="dropdown-item" href="#"><i
											class="bi bi-info-circle fa-fw me-2"></i>Help Center</a></li>
									<li><a class="dropdown-item bg-danger-soft-hover" href="#"><i
											class="bi bi-power fa-fw me-2"></i>Sign Out</a></li>
								</ul>
							</li>
							<!-- Profile dropdown END -->
						</ul>
						<!-- Top bar right END -->
					</div>
				</div>
			</nav>
			<!-- Top bar END -->

			<!-- Page main content START -->
			<div class="page-content-wrapper p-xxl-4">

				<!-- Title -->
				<div class="row">
					<div class="col-12 mb-4 mb-sm-5">
						<h1 class="h3 mb-2">마이페이지</h1>
						<span>당신의 정보를 수정.. </span>
					</div>
				</div>


				<!-- 회원 정보 관리 & 업체 정보 관리 감싸는 div-->
				<div class="row g-4">
					<!-- 회원 정보 관리 -->
					<div class="col-lg-6">
						<div class="card shadow">
							<!-- Card header -->
							<div class="card-header border-bottom">
								<h5 class="card-header-title">회원 정보 관리</h5>
							</div>
							<!-- Card body START -->
							<div class="card-body">
								<!-- item -->
								<div class="mb-3">
									<label class="form-label">이름</label> <input type="text"
										class="form-control" value="Jacqueline Miller" disabled>
									<!-- disabled : 수정불가 -->
								</div>
								<!-- item -->
								<div class="mb-3">
									<label class="form-label">아이디</label> <input type="text"
										class="form-control" value="hello123" disabled>
								</div>
								<!-- item -->
								<div class="mb-3">
									<label class="form-label">휴대폰 번호</label> <input type="text"
										class="form-control" value="010-7737-6314"
										placeholder="휴대폰 번호를 입력하세요.">
								</div>


								<!-- Save button -->
								<div class="d-flex justify-content-end mt-4">
									<a href="#" class="btn btn-primary">저장</a>
								</div>
							</div>
							<!-- Card body END -->
						</div>
					</div>

					<!-- 업체 정보 관리 -->
					<div class="col-lg-6">
						<div class="card shadow">
							<!-- Card header -->
							<div class="card-header border-bottom">
								<h5 class="card-header-title">업체 정보 관리</h5>
							</div>

							<!-- Card body START -->
							<div class="card-body">
								<form class="row g-4 align-items-center">

									<!-- item -->
									<div class="col-12">
										<label class="form-label">업체명</label> <input type="email"
											class="form-control" value="ooo호텔" disabled>
									</div>
									<!-- item -->
									<div class="col-12">
										<label class="form-label">사업자등록번호</label> <input type="email"
											class="form-control" value="532-86-2265" disabled>
									</div>

									<!-- item -->
									<div class="col-12">
										<label class="form-label">사업장 주소지</label> <input type="email"
											class="form-control" value="서울특별시 00구 00">
									</div>

									<!-- item -->
									<div class="mb-3">
										<label class="form-label">업체 대표 번호</label> <input type="text"
											class="form-control" value="010-7737-6314"
											placeholder="업체 대표 번호를 입력하세요.">
									</div>

									<!-- item 정산계좌 -->
									<div class="col-lg-4">
										<label class="form-label">정산계좌</label>
										<div
											class="form-border-bottom form-control-transparent form-fs-lg">
											<select class="form-select js-choice">
												<option>우리은행</option>
												<option>카카오뱅크</option>
												<option>기업은행</option>
												<option>국민은행</option>
												<option>하나은행</option>
												<option>신한은행</option>
											</select>
										</div>
									</div>

									<!-- item 정산계좌-->
									<div class="col-lg-8">
										<label class="form-label">계좌번호</label> <input type="email"
											class="form-control" value="1002-352-072937"
											placeholder="계좌번호를 입력하세요.">
									</div>

									<!-- Save button -->
									<div class="d-flex justify-content-end mt-4">
										<a href="#" class="btn btn-primary">저장</a>
									</div>
								</form>
							</div>
							<!-- Card body END -->
						</div>
					</div>


					<!-- 비밀번호 변경 START -->
					<div class="col-lg-6">
						<!-- Change password -->
						<div class="bg-light bor rounded-3 p-4 mb-3">
							<div
								class="d-md-flex justify-content-between align-items-center flex-wrap">
								<!-- Content -->
								<div>
									<h6 class="h5">비밀번호</h6>
									<p class="mb-1 mb-md-0">비밀번호를 변경하여 계정을 보호하세요.</p>
								</div>
								<!-- Button -->
								<div>
									<a href="#" class="btn btn-primary mb-2" data-bs-toggle="modal"
										data-bs-target="#changePassword">비밀번호 변경하기</a>
									<p class="mb-0 small h6">최근 변경 일자: 2024.12.09</p>
								</div>
							</div>
						</div>
					</div>
					<!-- 비밀번호 변경 END -->


					<!-- 비밀번호 변경2 START -->
					<div class="col-lg-6">
						<div class="card shadow mb-3">
							<!-- Card header -->
							<div class="card-header border-bottom">
								<h5 class="card-header-title">비밀번호 변경</h5>
							</div>
							<!-- Card body START -->
							<div class="card-body">
								<!-- item -->
								<div class="mb-3">
									<label class="form-label">기존 비밀번호</label> <input
										class="form-control" type="password"
										placeholder="Enter current password">
								</div>
								<!-- item -->
								<div class="mb-3">
									<label class="form-label"> 새 비밀번호</label>
									<div class="input-group">
										<input class="form-control fakepassword"
											placeholder="Enter new password" type="password"
											id="psw-input"> <span
											class="input-group-text p-0 bg-transparent"> <i
											class="fakepasswordicon fas fa-eye-slash cursor-pointer p-2"></i>
										</span>
									</div>
								</div>
								<!-- item -->
								<div class="mb-3">
									<label class="form-label">새 비밀번호 확인</label> <input
										class="form-control" type="password"
										placeholder="Confirm new password">
								</div>

								<!-- Save button -->
								<div class="d-flex justify-content-end mt-4">
									<a href="#" class="btn btn-primary">변경하기</a>
								</div>
							</div>
							<!-- Card body END -->
						</div>
					</div>
					<!-- 비밀번호 변경2 END -->


				</div>
				<!-- Row END -->
			</div>
			<!-- Page main content END -->
		</div>
		<!-- Page content END -->

	</main>
	<!-- **************** MAIN CONTENT END **************** -->
	<!-- footerScript -->
	<%@ include file="/WEB-INF/views/include/footerScript.jsp"%>

</body>
</html>