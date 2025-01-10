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

	<!-- **************** MAIN CONTENT START **************** -->
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
					<div class="col-12 mb-4 mb-sm-4">
						<h1 class="h3 mb-2">숙소 상세 조회</h1>
						<span>설명설명설명설명설명설명설명설명</span>
					</div>
				</div>

				<!-- 숙소 상세보기 Crad START -->
				<div class="card shadow border mt-2 mb-3">
					<!-- Card header -->
					<div class="card-header border-bottom">
						<h5 class="card-header-title">숙소 정보</h5>
					</div>
					<div class="card-body p-4">
						<!-- 숙소 detail START -->
						<div class="row g-4 g-xl-5">
							<!-- Image -->
							<div class="col-xxl-6">
								<div class="row g-2 g-sm-4">
									<div class="col-6">
										<a data-glightbox data-gallery="gallery"
											href="assets/images/category/hotel/4by3/02.jpg">
											<div
												class="card card-element-hover card-overlay-hover overflow-hidden">
												<!-- Image -->
												<img src="assets/images/category/hotel/4by3/02.jpg"
													class="rounded-3" alt="">
												<!-- Full screen button -->
												<div class="hover-element w-100 h-100">
													<i
														class="bi bi-fullscreen fs-6 text-white position-absolute top-50 start-50 translate-middle bg-dark rounded-1 p-2 lh-1"></i>
												</div>
											</div>
										</a>
									</div>
									<div class="col-6">
										<a data-glightbox data-gallery="gallery"
											href="assets/images/category/hotel/4by3/03.jpg">
											<div
												class="card card-element-hover card-overlay-hover overflow-hidden">
												<!-- Image -->
												<img src="assets/images/category/hotel/4by3/03.jpg"
													class="rounded-3" alt="">
												<!-- Full screen button -->
												<div class="hover-element w-100 h-100">
													<i
														class="bi bi-fullscreen fs-6 text-white position-absolute top-50 start-50 translate-middle bg-dark rounded-1 p-2 lh-1"></i>
												</div>
											</div>
										</a>
									</div>
									<div class="col-6">
										<a data-glightbox data-gallery="gallery"
											href="assets/images/category/hotel/4by3/04.jpg">
											<div
												class="card card-element-hover card-overlay-hover overflow-hidden">
												<!-- Image -->
												<img src="assets/images/category/hotel/4by3/04.jpg"
													class="rounded-3" alt="">
												<!-- Full screen button -->
												<div class="hover-element w-100 h-100">
													<i
														class="bi bi-fullscreen fs-6 text-white position-absolute top-50 start-50 translate-middle bg-dark rounded-1 p-2 lh-1"></i>
												</div>
											</div>
										</a>
									</div>
									<div class="col-6">
										<a data-glightbox data-gallery="gallery"
											href="assets/images/category/hotel/4by3/05.jpg">
											<div
												class="card card-element-hover card-overlay-hover overflow-hidden">
												<!-- Image -->
												<img src="assets/images/category/hotel/4by3/05.jpg"
													class="rounded-3" alt="">
												<!-- Full screen button -->
												<div class="hover-element w-100 h-100">
													<i
														class="bi bi-fullscreen fs-6 text-white position-absolute top-50 start-50 translate-middle bg-dark rounded-1 p-2 lh-1"></i>
												</div>
											</div>
										</a>
									</div>
								</div>
							</div>

							<!-- Content -->
							<div class="col-xxl-6 mb-5">
								<h4>히든베이 호텔</h4>
								<p class="mb-2 mb-sm-0">
									<i class="bi bi-geo-alt me-1 text-primary"></i>서울특별시 홍대 구로
								</p>
								<p class="mb-4">숙소설명. er ask own. Praise effect wishes to
									change way and any wanted. Lively use looked latter regard had.
									Does he part last</p>

								<!-- Feature -->
								<div class="row g-4">
									<div class="col-sm-6 col-md-4">
										<div class="d-flex align-items-center">
											<div
												class="icon-lg bg-primary bg-opacity-10 text-primary rounded-2">
												<i class="fa-solid fa-bed"></i>
											</div>
											<div class="ms-2">
												<small>침대</small>
												<h6 class="mb-0 mt-1">킹사이즈</h6>
											</div>
										</div>
									</div>

									<div class="col-sm-6 col-md-4">
										<div class="d-flex align-items-center">
											<div
												class="icon-lg bg-primary bg-opacity-10 text-primary rounded-2">
												<i class="fa-solid fa-arrow-right-arrow-left"></i>
											</div>
											<div class="ms-2">
												<small>옵션</small>
												<h6 class="mb-0 mt-1">030</h6>
											</div>
										</div>
									</div>

									<div class="col-sm-6 col-md-4">
										<div class="d-flex align-items-center">
											<div
												class="icon-lg bg-primary bg-opacity-10 text-primary rounded-2">
												<i class="fa-solid fa-stairs"></i>
											</div>
											<div class="ms-2">
												<small>층</small>
												<h6 class="mb-0 mt-1">21층</h6>
											</div>
										</div>
									</div>

									<div class="col-sm-6 col-md-4">
										<div class="d-flex align-items-center">
											<div
												class="icon-lg bg-primary bg-opacity-10 text-primary rounded-2">
												<i class="fa-solid fa-mountain-sun"></i>
											</div>
											<div class="ms-2">
												<small>View</small>
												<h6 class="mb-0 mt-1">오션뷰</h6>
											</div>
										</div>
									</div>

									<div class="col-sm-6 col-md-4">
										<div class="d-flex align-items-center">
											<div
												class="icon-lg bg-primary bg-opacity-10 text-primary rounded-2">
												<i class="fa-regular fa-clone"></i>
											</div>
											<div class="ms-2">
												<small>방 크기</small>
												<h6 class="mb-0 mt-1">10평</h6>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- 숙소 detail END -->
					</div>
				</div>
				<!-- 숙소 상세보기 Card END -->
				
				<!-- 객실 정보 Card START -->
				<div class="card shadow border">
					<!-- Card header -->
					<div class="card-header border-bottom">
						<h5 class="card-header-title">객실 정보</h5>
					</div>
					<!-- Card body START -->
					<div class="card-body">
						<!-- Table head -->
						<div class="bg-light rounded p-3 d-none d-sm-block">
							<div class="row row-cols-7 g-4">
								<div class="col">
									<h6 class="mb-0">No</h6>
								</div>
								<div class="col">
									<h6 class="mb-0">객실명</h6>
								</div>
								<div class="col">
									<h6 class="mb-0">기준 인원</h6>
								</div>
								<div class="col">
									<h6 class="mb-0">최대 인원</h6>
								</div>
								<div class="col">
									<h6 class="mb-0">가격</h6>
								</div>
								
							</div>
						</div>

						<!-- Table data (1번째 예약내역 상세 데이터)-->
						<div
							class="row row-cols-xl-7 g-4 align-items-sm-center border-bottom px-2 py-4">
							<!-- Data item -->
							<div class="col">
								<small class="d-block d-sm-none">No</small>
								<!-- 작은 화면일때만 보이는 텍스트-->
								<h6 class="ms-1 mb-0 fw-normal">1</h6>
							</div>
							<!-- Data item -->
							<div class="col">
								<small class="d-block d-sm-none">객실명</small>
								<h6 class="ms-1 mb-0 fw-normal">디럭스 트윈</h6>
							</div>
							<!-- Data item -->
							<div class="col">
								<small class="d-block d-sm-none">기준 인원</small>
								<h6 class="ms-1 mb-0 fw-normal">2인</h6>
							</div>
							<!-- Data item -->
							<div class="col">
								<small class="d-block d-sm-none">최대 인원</small>
								<h6 class="ms-1 mb-1 fw-light">3인</h6>
							</div>
							<!-- Data item -->
							<div class="col">
								<small class="d-block d-sm-none">가격</small>
								<h6 class="ms-1 mb-1 fw-light">92,000원</h6>
							</div>
						</div>
						<!-- Table data (2번째 예약내역 상세 데이터)-->
						<div
							class="row row-cols-xl-7 g-4 align-items-sm-center border-bottom px-2 py-4">
							<!-- Data item -->
							<div class="col">
								<small class="d-block d-sm-none">No</small>
								<!-- 작은 화면일때만 보이는 텍스트-->
								<h6 class="ms-1 mb-0 fw-normal">1</h6>
							</div>
							<!-- Data item -->
							<div class="col">
								<small class="d-block d-sm-none">객실명</small>
								<h6 class="ms-1 mb-0 fw-normal">디럭스 트윈</h6>
							</div>
							<!-- Data item -->
							<div class="col">
								<small class="d-block d-sm-none">기준 인원</small>
								<h6 class="ms-1 mb-0 fw-normal">2인</h6>
							</div>
							<!-- Data item -->
							<div class="col">
								<small class="d-block d-sm-none">최대 인원</small>
								<h6 class="ms-1 mb-1 fw-light">3인</h6>
							</div>
							<!-- Data item -->
							<div class="col">
								<small class="d-block d-sm-none">가격</small>
								<h6 class="ms-1 mb-1 fw-light">92,000원</h6>
							</div>
						</div>
						<!-- Table data (3번째 예약내역 상세 데이터)-->
						<div
							class="row row-cols-xl-7 g-4 align-items-sm-center border-bottom px-2 py-4">
							<!-- Data item -->
							<div class="col">
								<small class="d-block d-sm-none">No</small>
								<!-- 작은 화면일때만 보이는 텍스트-->
								<h6 class="ms-1 mb-0 fw-normal">1</h6>
							</div>
							<!-- Data item -->
							<div class="col">
								<small class="d-block d-sm-none">객실명</small>
								<h6 class="ms-1 mb-0 fw-normal">디럭스 트윈</h6>
							</div>
							<!-- Data item -->
							<div class="col">
								<small class="d-block d-sm-none">기준 인원</small>
								<h6 class="ms-1 mb-0 fw-normal">2인</h6>
							</div>
							<!-- Data item -->
							<div class="col">
								<small class="d-block d-sm-none">최대 인원</small>
								<h6 class="ms-1 mb-1 fw-light">3인</h6>
							</div>
							<!-- Data item -->
							<div class="col">
								<small class="d-block d-sm-none">가격</small>
								<h6 class="ms-1 mb-1 fw-light">92,000원</h6>
							</div>
						</div>
						<!-- Table data (4번째 예약내역 상세 데이터)-->
						<div
							class="row row-cols-xl-7 g-4 align-items-sm-center border-bottom px-2 py-4">
							<!-- Data item -->
							<div class="col">
								<small class="d-block d-sm-none">No</small>
								<!-- 작은 화면일때만 보이는 텍스트-->
								<h6 class="ms-1 mb-0 fw-normal">1</h6>
							</div>
							<!-- Data item -->
							<div class="col">
								<small class="d-block d-sm-none">객실명</small>
								<h6 class="ms-1 mb-0 fw-normal">디럭스 트윈</h6>
							</div>
							<!-- Data item -->
							<div class="col">
								<small class="d-block d-sm-none">기준 인원</small>
								<h6 class="ms-1 mb-0 fw-normal">2인</h6>
							</div>
							<!-- Data item -->
							<div class="col">
								<small class="d-block d-sm-none">최대 인원</small>
								<h6 class="ms-1 mb-1 fw-light">3인</h6>
							</div>
							<!-- Data item -->
							<div class="col">
								<small class="d-block d-sm-none">가격</small>
								<h6 class="ms-1 mb-1 fw-light">92,000원</h6>
							</div>
						</div>
					</div>
					<!-- Card body END -->
				</div>
				<!-- 객실 정보 Card END -->

			</div>
			<!-- Page main content END -->
		</div>
		<!-- Page content END -->

	</main>
	<!-- **************** MAIN CONTENT END **************** -->

	<!-- footerScript -->
	<%@ include file="/WEB-INF/views/include/footerScript.jsp"%>
<!-- page script -->
<script src="js/admin/partnerList.js"></script>
<script type="text/javascript">
	partnerList.init();
</script>
</body>
</html>