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
						<h1 class="h3 mb-2">숙소 상세</h1>
						<span>숙소의 상세 정보를 확인합니다.</span>
					</div>
				</div>

				<div class="justify-content-start mb-1">
					<a href="javascript:window.history.back();" class="h6 text-reset">
						<i class="fa-solid fa-circle-chevron-left"></i> 뒤로가기
					</a>
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
							<div id="images" class="row mt-5">
								<div class="col-6">
									<div class="row g-2 g-sm-4">
										<div class="col-6">
											<a data-glightbox data-gallery="gallery" href="assets/images/category/hotel/4by3/02.jpg">
												<div class="card card-element-hover card-overlay-hover overflow-hidden">
													<!-- Image -->
													<img src="" class="rounded-3" alt="">
													<!-- Full screen button -->
													<div class="hover-element w-100 h-100">
														<i class="bi bi-fullscreen fs-6 text-white position-absolute top-50 start-50 translate-middle bg-dark rounded-1 p-2 lh-1"></i>
													</div>
												</div>
											</a>
										</div>
										<div class="col-6">
											<a data-glightbox data-gallery="gallery" href="assets/images/category/hotel/4by3/03.jpg">
												<div class="card card-element-hover card-overlay-hover overflow-hidden">
													<!-- Image -->
													<img src="" class="rounded-3" alt="">
													<!-- Full screen button -->
													<div class="hover-element w-100 h-100">
														<i class="bi bi-fullscreen fs-6 text-white position-absolute top-50 start-50 translate-middle bg-dark rounded-1 p-2 lh-1"></i>
													</div>
												</div>
											</a>
										</div>
										<div class="col-6">
											<a data-glightbox data-gallery="gallery" href="assets/images/category/hotel/4by3/04.jpg">
												<div class="card card-element-hover card-overlay-hover overflow-hidden">
													<!-- Image -->
													<img src="" class="rounded-3" alt="">
													<!-- Full screen button -->
													<div class="hover-element w-100 h-100">
														<i class="bi bi-fullscreen fs-6 text-white position-absolute top-50 start-50 translate-middle bg-dark rounded-1 p-2 lh-1"></i>
													</div>
												</div>
											</a>
										</div>
										<div class="col-6">
											<a data-glightbox data-gallery="gallery" href="javascript:;">
												<div class="card card-element-hover card-overlay-hover overflow-hidden">
													<!-- Image -->
													<img src="" class="rounded-3" alt="">
													<!-- Full screen button -->
													<div class="hover-element w-100 h-100">
														<i class="bi bi-fullscreen fs-6 text-white position-absolute top-50 start-50 translate-middle bg-dark rounded-1 p-2 lh-1"></i>
													</div>
												</div>
											</a>
										</div>
									</div>
								</div>
							</div>
							
							<div id="info">
								<!-- Content -->
								<div class="col-xxl-6 mb-5">
									<h4></h4>
									<p class="mb-2 mb-sm-0">
										<i class="bi bi-geo-alt me-1 text-primary"></i>
									</p>
									<p class="mb-4"></p>		
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
						<div class="bg-light rounded p-3 d-none d-sm-block text-center">
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
									<h6 class="mb-0">평일 가격</h6>
								</div>
								<div class="col">
									<h6 class="mb-0">주말 가격</h6>
								</div>
								
							</div>
						</div>

						<!-- Table data (1번째 예약내역 상세 데이터)-->
						<div id="answerList">
							<div class="row row-cols-xl-7 g-4 align-items-sm-center border-bottom px-2 py-4">
								
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
<script src="js/admin/accomodation/partnerDetail.js"></script>
<script type="text/javascript">
	partnerDetail.init();
</script>
</body>
</html>