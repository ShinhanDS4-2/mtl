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
					<a href="/mtl/admin/user/list">
						<div class="card card-body bg-primary bg-opacity-10 border border-primary border-opacity-25 p-4 h-100">
							<div class="d-flex justify-content-between align-items-center">
								<!-- Digit -->
								<div>
									<span class="h6 fw-light mb-2">사용자</span>
									<h4 class="mb-0" id="user"></h4>
									<span class="h6 fw-light mb-0">오늘 가입 / 전체</span>
								</div>
								<!-- Icon -->
								<div class="icon-lg rounded-circle bg-primary text-white mb-0">
									<i class="fa-solid fa-user-plus fa-fw"></i>
								</div>
							</div>
						</div>
					</a>
				</div>

				<!-- Counter item -->
				<div class="col-md-6 col-xxl-3">
					<a href="/mtl/admin/partner/list">
						<div class="card card-body bg-success bg-opacity-10 border border-success border-opacity-25 p-4 h-100">
							<div class="d-flex justify-content-between align-items-center">
								<!-- Digit -->
								<div>
									<span class="h6 fw-light mb-0">판매자</span>
									<h4 class="mb-0" id="partner"></h4>
									<span class="h6 fw-light mb-0">오늘 가입 / 전체</span>
								</div>
								<!-- Icon -->
								<div class="icon-lg rounded-circle bg-success text-white mb-0">
									<i class="fa-solid fa-hotel fa-fw"></i>
								</div>
							</div>
						</div>
					</a>
				</div>

				<!-- Counter item -->
				<div class="col-md-6 col-xxl-3">
					<a href="/mtl/admin/question">
						<div class="card card-body bg-primary bg-opacity-10 border border-primary border-opacity-25 p-4 h-100">
							<div class="d-flex justify-content-between align-items-center">
								<!-- Digit -->
								<div>
									<span class="h6 fw-light mb-0">1:1 문의</span>
									<h4 class="mb-0" id="question"></h4>
									<span class="h6 fw-light mb-0">미답변</span>
								</div>
								<!-- Icon -->
								<div class="icon-lg rounded-circle bg-primary text-white mb-0">
									<i class="fa-regular fa-circle-question fa-fw"></i>
								</div>
							</div>
						</div>
					</a>
				</div>

				<!-- Counter item -->
				<div class="col-md-6 col-xxl-3">
					<a href="/mtl/admin/accomodation/reservation/list">
						<div class="card card-body bg-success bg-opacity-10 border border-success border-opacity-25 p-4 h-100">
							<div class="d-flex justify-content-between align-items-center">
								<!-- Digit -->
								<div>
									<span class="h6 fw-light mb-0">최근 7일 예약 현황</span>
									<h4 class="mb-0" id="reservation"></h4>
									<span class="h6 fw-light mb-0">예약 취소 / 전체</span>
								</div>
								<!-- Icon -->
								<div class="icon-lg rounded-circle bg-success text-white mb-0">
									<i class="fa-regular fa-calendar-check fa-fw"></i>
								</div>
							</div>
						</div>
					</a>
				</div>
			</div>
			<!-- Counter boxes END -->

			<!-- Hotel grid START -->
			<div class="row g-4 mb-5">
				<!-- Title -->
				<div class="col-12">
					<div class="d-flex justify-content-between">
						<h4 class="mb-0">최근 가입 숙소</h4>
						<a href="/mtl/admin/accomodation/list" class="mt-2 small text-reset">
							전체보기<i class="fa-solid fa-angle-right ms-1"></i>
						</a>
					</div>
				</div>

				<!-- Hotel item -->
				<div class="row d-flex mt-4" id="recentPartnerList">
				</div>
			</div>
			<!-- Hotel grid END -->
	
			<div class="row g-4 mb-5">
				<div class="col-6">
					<div class="d-flex justify-content-between">
						<h4 class="mb-0">지역 별 숙소</h4>
						<a href="/mtl/admin/accomodation/list" class="mt-2 small text-reset">
							전체보기<i class="fa-solid fa-angle-right ms-1"></i>
						</a>
					</div>
				</div>
				<div class="col-6">
					<div class="d-flex justify-content-between">
						<h4 class="mb-0">지역 별 여행지</h4>
						<a href="/mtl/admin/location/list" class="mt-2 small text-reset">
							전체보기<i class="fa-solid fa-angle-right ms-1"></i>
						</a>
					</div>
				</div>
				<div class="col-md-6">
					<!-- 공지사항 Card START -->
					<div class="card shadow border-1">
						<div class="card-body">
							<div class="item d-flex justify-content-between border-bottom mt-4 mb-4">
								<h6 id="partner1">서울</h6>
								<p id="partner1_count"></p>
							</div>
							<div class="item d-flex justify-content-between border-bottom mt-2 mb-4">
								<h6 id="partner2">강릉</h6>
								<p id="partner2_count"></p>
							</div>
							<div class="item d-flex justify-content-between border-bottom mt-2 mb-4">
								<h6 id="partner3">여수</h6>
								<p id="partner3_count"></p>
							</div>
							<div class="item d-flex justify-content-between border-bottom mt-2 mb-4">
								<h6 id="partner4">부산</h6>
								<p id="partner4_count"></p>
							</div>
							<div class="item d-flex justify-content-between mt-2">
								<h6 id="partner5">제주</h6>
								<p id="partner5_count"></p>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<!-- 공지사항 Card START -->
					<div class="card shadow border-1">
						<div class="card-body">
							<div class="item d-flex justify-content-between border-bottom mt-4 mb-4">
								<h6 id="location1">서울</h6>
								<p id="location1_count"></p>
							</div>
							<div class="item d-flex justify-content-between border-bottom mt-2 mb-4">
								<h6 id="location2">강릉</h6>
								<p id="location2_count"></p>
							</div>
							<div class="item d-flex justify-content-between border-bottom mt-2 mb-4">
								<h6 id="location3">여수</h6>
								<p id="location3_count"></p>
							</div>
							<div class="item d-flex justify-content-between border-bottom mt-2 mb-4">
								<h6 id="location4">부산</h6>
								<p id="location4_count"></p>
							</div>
							<div class="item d-flex justify-content-between mt-2">
								<h6 id="location5">제주</h6>
								<p id="location5_count"></p>
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
<script src="js/admin/home/dashboard.js"></script>
<script type="text/javascript">
	dashboard.init();
</script>
</body>
</html>