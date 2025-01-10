<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>떠날지도 - 관리자</title>
<!-- headerScript -->
<%@ include file="/WEB-INF/views/include/headerScript.jsp"%>
</head>
<body>
<main>
	<!-- Sidebar -->
	<%@ include file="/WEB-INF/views/include/adminSidebar.jsp"%>
	<!-- Page content START -->
	<div class="page-content">
		<!-- Topbar -->
		<%@ include file="/WEB-INF/views/include/adminTopbar.jsp"%>
		<!-- Page main content START -->
		<div class="page-content-wrapper p-xxl-4">

			<!-- Title -->
			<div class="row">
				<div class="col-12 mb-4 mb-sm-5">
					<div class="d-sm-flex justify-content-between align-items-center">
						<h1 class="h3 mb-2 mb-sm-0">대시보드</h1>
					</div>
				</div>
			</div>

			<!-- Counter boxes START -->
			<div class="row g-4 mb-5">
				<!-- Counter item -->
				<div class="col-md-6 col-xxl-3">
					<div
						class="card card-body bg-primary bg-opacity-10 border border-primary border-opacity-25 p-4 h-100">
						<div class="d-flex justify-content-between align-items-center">
							<!-- Digit -->
							<div>
								<span class="h6 fw-light mb-2">사용자</span>
								<h4 class="mb-0">5 / 225</h4>
								<span class="h6 fw-light mb-0">오늘 가입 / 전체</span>
							</div>
							<!-- Icon -->
							<div class="icon-lg rounded-circle bg-primary text-white mb-0">
								<i class="fa-solid fa-hotel fa-fw"></i>
							</div>
						</div>
					</div>
				</div>

				<!-- Counter item -->
				<div class="col-md-6 col-xxl-3">
					<div
						class="card card-body bg-success bg-opacity-10 border border-success border-opacity-25 p-4 h-100">
						<div class="d-flex justify-content-between align-items-center">
							<!-- Digit -->
							<div>
								<span class="h6 fw-light mb-0">판매자</span>
								<h4 class="mb-0">2 / 300</h4>
								<span class="h6 fw-light mb-0">오늘 가입 / 전체</span>
							</div>
							<!-- Icon -->
							<div class="icon-lg rounded-circle bg-success text-white mb-0">
								<i class="fa-solid fa-hand-holding-dollar fa-fw"></i>
							</div>
						</div>
					</div>
				</div>

				<!-- Counter item -->
				<div class="col-md-6 col-xxl-3">
					<div
						class="card card-body bg-primary bg-opacity-10 border border-primary border-opacity-25 p-4 h-100">
						<div class="d-flex justify-content-between align-items-center">
							<!-- Digit -->
							<div>
								<span class="h6 fw-light mb-0">1:1 문의</span>
								<h4 class="mb-0">245</h4>
								<span class="h6 fw-light mb-0">미답변</span>
							</div>
							<!-- Icon -->
							<div class="icon-lg rounded-circle bg-primary text-white mb-0">
								<i class="fa-solid fa-bed fa-fw"></i>
							</div>
						</div>
					</div>
				</div>

				<!-- Counter item -->
				<div class="col-md-6 col-xxl-3">
					<div
						class="card card-body bg-success bg-opacity-10 border border-success border-opacity-25 p-4 h-100">
						<div class="d-flex justify-content-between align-items-center">
							<!-- Digit -->
							<div>
								<span class="h6 fw-light mb-0">최근 7일 예약 현황</span>
								<h4 class="mb-0">13 / 147</h4>
								<span class="h6 fw-light mb-0">예약 취소 / 전체</span>
							</div>
							<!-- Icon -->
							<div class="icon-lg rounded-circle bg-success text-white mb-0">
								<i class="fa-solid fa-building-circle-check fa-fw"></i>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- Counter boxes END -->

			<!-- Hotel grid START -->
			<div class="row g-4 mb-5">
				<!-- Title -->
				<div class="col-12">
					<div class="d-flex justify-content-start">
						<h4 class="mb-0">최근 가입 숙소</h4>
					</div>
				</div>

				<!-- Hotel item -->
				<div class="col-lg-4">
					<div class="card shadow p-3">
						<div class="row g-4">
							<!-- Card img -->
							<div class="col-md-3">
								<img src="assets/images/category/hotel/4by3/08.jpg" class="rounded-2" alt="Card image">
							</div>

							<!-- Card body -->
							<div class="col-md-9">
								<div class="card-body position-relative d-flex flex-column p-0 h-100">

									<!-- Title -->
									<h5 class="card-title mb-0 me-5">
										<a href="hotel-detail.html">Courtyard by Marriott New York</a>
									</h5>
									<small><i class="bi bi-geo-alt me-2"></i>258 W jimmy Street, New york - 24578</small>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- Hotel item -->
				<div class="col-lg-4">
					<div class="card shadow p-3">
						<div class="row g-4">
							<!-- Card img -->
							<div class="col-md-3">
								<img src="assets/images/category/hotel/4by3/08.jpg" class="rounded-2" alt="Card image">
							</div>

							<!-- Card body -->
							<div class="col-md-9">
								<div class="card-body position-relative d-flex flex-column p-0 h-100">

									<!-- Title -->
									<h5 class="card-title mb-0 me-5">
										<a href="hotel-detail.html">Courtyard by Marriott New York</a>
									</h5>
									<small><i class="bi bi-geo-alt me-2"></i>258 W jimmy Street, New york - 24578</small>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- Hotel item -->
				<div class="col-lg-4">
					<div class="card shadow p-3">
						<div class="row g-4">
							<!-- Card img -->
							<div class="col-md-3">
								<img src="assets/images/category/hotel/4by3/08.jpg" class="rounded-2" alt="Card image">
							</div>

							<!-- Card body -->
							<div class="col-md-9">
								<div class="card-body position-relative d-flex flex-column p-0 h-100">

									<!-- Title -->
									<h5 class="card-title mb-0 me-5">
										<a href="hotel-detail.html">Courtyard by Marriott New York</a>
									</h5>
									<small><i class="bi bi-geo-alt me-2"></i>258 W jimmy Street, New york - 24578</small>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- Hotel grid END -->
	
			<div class="row g-4 mb-5">
				<div class="col-6">
					<div class="d-flex justify-content-start">
						<h4 class="mb-0">지역 별 숙소</h4>
					</div>
				</div>
				<div class="col-6">
					<div class="d-flex justify-content-start">
						<h4 class="mb-0">지역 별 여행지</h4>
					</div>
				</div>
				<div class="col-md-6">
					<!-- 공지사항 Card START -->
					<div class="card shadow border-1">
						<div class="card-body">
							<div class="item d-flex justify-content-between border-bottom mt-4 mb-4">
								<h6>시스템 점검 안내</h6>
								<p>2024.12.24(월)</p>
							</div>
							<div class="item d-flex justify-content-between border-bottom mt-2 mb-4">
								<h6>시스템 점검 안내</h6>
								<p>2024.12.24(월)</p>
							</div>
							<div class="item d-flex justify-content-between border-bottom mt-2 mb-4">
								<h6>시스템 점검 안내</h6>
								<p>2024.12.24(월)</p>
							</div>
							<div class="item d-flex justify-content-between border-bottom mt-2 mb-4">
								<h6>시스템 점검 안내</h6>
								<p>2024.12.24(월)</p>
							</div>
							<div class="item d-flex justify-content-between mt-2">
								<h6>시스템 점검 안내</h6>
								<p>2024.12.24(월)</p>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<!-- 공지사항 Card START -->
					<div class="card shadow border-1">
						<div class="card-body">
							<div class="item d-flex justify-content-between border-bottom mt-4 mb-4">
								<h6>시스템 점검 안내</h6>
								<p>2024.12.24(월)</p>
							</div>
							<div class="item d-flex justify-content-between border-bottom mt-2 mb-4">
								<h6>시스템 점검 안내</h6>
								<p>2024.12.24(월)</p>
							</div>
							<div class="item d-flex justify-content-between border-bottom mt-2 mb-4">
								<h6>시스템 점검 안내</h6>
								<p>2024.12.24(월)</p>
							</div>
							<div class="item d-flex justify-content-between border-bottom mt-2 mb-4">
								<h6>시스템 점검 안내</h6>
								<p>2024.12.24(월)</p>
							</div>
							<div class="item d-flex justify-content-between mt-2">
								<h6>시스템 점검 안내</h6>
								<p>2024.12.24(월)</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</main>
<!-- footerScript -->
<%@ include file="/WEB-INF/views/include/footerScript.jsp"%>
</body>
</html>