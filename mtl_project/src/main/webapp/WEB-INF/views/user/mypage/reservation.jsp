<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<!-- headerScript -->
<%@ include file="/WEB-INF/views/include/headerScript.jsp" %>
<!-- page css -->
</head>
<body>
<!-- header -->
<%@ include file="/WEB-INF/views/include/header.jsp" %>

<!-- main -->
<main>
<section class="pt-3">
	<div class="container">
		<div class="row">
			<!-- 사이드바 -->
			<%@ include file="/WEB-INF/views/include/mypageSidebar.jsp" %>

			<!-- content -->
			<div class="col-lg-8 col-xl-9">
				<!-- Offcanvas menu button -->
				<div class="d-grid mb-0 d-lg-none w-100">
					<button class="btn btn-primary mb-4" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasSidebar" aria-controls="offcanvasSidebar">
						<i class="fas fa-sliders-h"></i> 메뉴
					</button>
				</div>

				<!-- 예약 내역 -->
				<div class="vstack gap-4">
					<div class="card border">
						<!-- Card header -->
						<div class="card-header border-bottom">
							<h4 class="card-header-title">예약 내역</h4>
						</div>
						
						<!-- Card body START -->
						<div class="card-body vstack gap-4">
							<!-- 예약 내역 -->
							<div class="card shadow p-2">
								<div class="row g-0">
									<!-- Card img -->
									<div class="col-md-3">
										<img src="assets/images/category/hotel/4by3/10.jpg" class="card-img rounded-2" alt="Card image">
									</div>
		
									<!-- Card body -->
									<div class="col-md-9">
										<div class="card-body py-md-2 d-flex flex-column h-100">
											<!-- Title -->
											<h5 class="card-title mb-1"><a href="partner/detail">나인트리 바이 파르나스 서울 명동 II</a></h5>
											<small><i class="bi bi-geo-alt me-2"></i>서울 중구 마른내로 28</small>
											<small class="mt-2">
												<i class="fa-regular fa-calendar me-2"></i>2024-12-15 ~ 2024-12-16
												<i class="fa-solid fa-users ms-3 me-2"></i>2명
											</small>

											<!-- Price and Button -->
											<div class="d-sm-flex justify-content-sm-between align-items-center mt-3 mt-md-auto">
												<!-- Button -->
												<div class="d-flex align-items-center">
													<h5 class="fw-bold mb-0 me-1"><i class="fa-solid fa-won-sign"></i> 200,000</h5>
													<span class="mb-0 me-2"> / 일</span>
												</div>
												<!-- Price -->
												<div class="mt-3 mt-sm-0">
													<a href="javascript:;" class="btn btn-sm btn-primary-soft mb-0">추천 여행지</a>    
													<a href="javascript:;" class="btn btn-sm btn-primary mb-0">상세 정보</a>    
												</div>                  
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="card shadow p-2">
								<div class="row g-0">
									<!-- Card img -->
									<div class="col-md-3">
										<img src="assets/images/category/hotel/4by3/10.jpg" class="card-img rounded-2" alt="Card image">
									</div>
		
									<!-- Card body -->
									<div class="col-md-9">
										<div class="card-body py-md-2 d-flex flex-column h-100">
											<!-- Title -->
											<h5 class="card-title mb-1"><a href="partner/detail">나인트리 바이 파르나스 서울 명동 II</a></h5>
											<small><i class="bi bi-geo-alt me-2"></i>서울 중구 마른내로 28</small>
											<small class="mt-2">
												<i class="fa-regular fa-calendar me-2"></i>2024-12-15 ~ 2024-12-16
												<i class="fa-solid fa-users ms-3 me-2"></i>2명
											</small>
											
											<!-- Price and Button -->
											<div class="d-sm-flex justify-content-sm-between align-items-center mt-3 mt-md-auto">
												<!-- Button -->
												<div class="d-flex align-items-center">
													<h5 class="fw-bold mb-0 me-1"><i class="fa-solid fa-won-sign"></i> 200,000</h5>
													<span class="mb-0 me-2"> / 일</span>
												</div>
												<!-- Price -->
												<div class="mt-3 mt-sm-0">
													<a href="javascript:;" class="btn btn-sm btn-primary w-100 mb-0">상세 정보</a>    
												</div>                  
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- Card body END -->
					</div>
				</div>
			</div>
			<!-- Main content END -->
		</div>
	</div>
</section>
</main>

<!-- footer -->
<%@ include file="/WEB-INF/views/include/footer.jsp" %>

<!-- footerScript -->
<%@ include file="/WEB-INF/views/include/footerScript.jsp" %>

<!-- page script -->
<script src="js/user/mypage/reservation.js"></script>
<script type="text/javascript">
	reservation.init();
</script>
</body>
</html>