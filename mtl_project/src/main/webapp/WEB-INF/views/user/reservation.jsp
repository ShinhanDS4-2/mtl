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
<!-- =======================
Page content START -->
<section>
	<div class="container">
		<div class="row g-4 g-lg-5">	
			<!-- Left side content START -->
			<div class="col-xl-8 mt-1">
				<div class="vstack gap-5">
					<!-- 숙소 정보 START -->
					<div class="card border">
						<!-- Card header -->
						<div class="card-header p-4 border-bottom">
							<!-- Title -->
							<h3 class="mb-0"><i class="fa-solid fa-hotel me-2"></i>숙소 정보</h3>
						</div>

						<!-- Card body START -->
						<div class="card-body p-4">
							<!-- Card list START -->
							<div class="card mb-4">
								<div class="row align-items-center">
									<!-- Image -->
									<div class="col-sm-6 col-md-3">
										<img src="assets/images/category/hotel/4by3/02.jpg" class="card-img" alt="">
									</div>

									<!-- Card Body -->
									<div class="col-sm-6 col-md-9">
										<div class="card-body pt-3 pt-sm-0 p-0">
											<!-- Title -->
											<h5 class="card-title"><a href="#">Pride moon Village Resort & Spa</a></h5>
											<p class="small mb-2"><i class="bi bi-geo-alt me-2"></i>5855 W Century Blvd, Los Angeles - 90045</p>

											<!-- Rating star -->
											<ul class="list-inline mb-0">
												<li class="list-inline-item me-0 small"><i class="fa-solid fa-star text-success"></i></li>
												<li class="list-inline-item me-0 small"><i class="fa-solid fa-star text-success"></i></li>
												<li class="list-inline-item me-0 small"><i class="fa-solid fa-star text-success"></i></li>
												<li class="list-inline-item me-0 small"><i class="fa-solid fa-star text-success"></i></li>
												<li class="list-inline-item me-0 small"><i class="fa-solid fa-star-half-alt text-success"></i></li>
												<li class="list-inline-item ms-2 h6 small fw-bold mb-0">4.5/5.0</li>
											</ul>
										</div>
									</div>

								</div>
							</div>
							<!-- Card list END -->
							
							<!-- Information START -->
							<div class="row g-4">
								<!-- Item -->
								<div class="col-lg-4">
									<div class="bg-light py-3 px-4 rounded-3">
										<h6 class="fw-light small mb-1">Check-in</h6>
										<h5 class="mb-1">4 March 2022</h5>
										<small><i class="bi bi-alarm me-1"></i>12:30 pm</small>
									</div>
								</div>

								<!-- Item -->
								<div class="col-lg-4">
									<div class="bg-light py-3 px-4 rounded-3">
										<h6 class="fw-light small mb-1">Check out</h6>
										<h5 class="mb-1">8 March 2022</h5>
										<small><i class="bi bi-alarm me-1"></i>4:30 pm</small>
									</div>
								</div>

								<!-- Item -->
								<div class="col-lg-4">
									<div class="bg-light py-3 px-4 rounded-3">
										<h6 class="fw-light small mb-1">Rooms & Guests</h6>
										<h5 class="mb-1">2 G - 1 R</h5>
										<small><i class="bi bi-brightness-high me-1"></i>3 Nights - 4 Days</small>
									</div>
								</div>
							</div>
							<!-- Information END -->

							<!-- Card START -->
							<div class="card border mt-4">
								<!-- Card header -->
								<div class="card-header border-bottom d-md-flex justify-content-md-between">
									<h5 class="card-title mb-0">Deluxe Pool View with Breakfast</h5>
									<a href="#" class="btn btn-link p-0 mb-0">View Cancellation Policy</a>
								</div>

								<!-- Card body -->
								<div class="card-body">
									<h6>Price Included</h6>
									<!-- List -->
									<ul class="list-group list-group-borderless mb-0">
										<li class="list-group-item h6 fw-light d-flex mb-0"><i class="bi bi-patch-check-fill text-success me-2"></i>Free Breakfast and Lunch/Dinner.</li>
										<li class="list-group-item h6 fw-light d-flex mb-0"><i class="bi bi-patch-check-fill text-success me-2"></i>Great Small Breaks.</li>
										<li class="list-group-item h6 fw-light d-flex mb-0"><i class="bi bi-patch-check-fill text-success me-2"></i>Free Stay for Kids Below the age of 12 years.</li>
										<li class="list-group-item h6 fw-light d-flex mb-0"><i class="bi bi-patch-check-fill text-success me-2"></i>On Cancellation, You will not get any refund</li>
									</ul>
								</div>
							</div>
							<!-- Card END -->
						</div>
						<!-- Card body END -->
					</div>
					<!-- 숙소 정보 END -->
				</div>	
			</div>
			<!-- Left side content END -->

			<!-- Right side content START -->
			<aside class="col-xl-4 mt-1">
				<div class="row g-4">
					<!-- 예약자 정보 START -->
					<div class="col-md-6 col-xl-12">
						<div class="card border rounded-2">
							<!-- Card header -->
							<div class="card-header border-bottom">
								<div class="cardt-title">
									<h5 class="mb-0"><i class="bi bi-people-fill me-2"></i>예약자 정보</h5>
								</div>
							</div>
							<!-- Card body -->
							<div class="card-body">
								<ul class="list-group list-group-borderless">
									<li class="list-group-item d-flex justify-content-between align-items-center">
										<div class="col-md-3">
											<label class="form-label">예약자명</label>
										</div>
										<div class="col-md-9">
											<input type="text" class="form-control form-control-lg" placeholder="Enter your name">
										</div>
									</li>
									<li class="list-group-item d-flex justify-content-between align-items-center">
										<div class="col-md-3">
											<label class="form-label">이메일</label>
										</div>
										<div class="col-md-9">
											<input type="text" class="form-control form-control-lg" placeholder="Enter your email">
										</div>
									</li>
									<li class="list-group-item d-flex justify-content-between align-items-center">
										<div class="col-md-3">
											<label class="form-label">연락처</label>
										</div>
										<div class="col-md-9">
											<input type="text" class="form-control form-control-lg" placeholder="Enter your phone number">
										</div>
									</li>
								</ul>
							</div>
						</div>
					</div>
					<!-- 예약자 정보 END -->

					<!-- 결제 정보 START -->
					<div class="col-md-6 col-xl-12">
						<div class="card border">
							<!-- Card header -->
							<div class="card-header border-bottom">
								<div class="cardt-title">
									<h5 class="mb-0"><i class="bi bi-wallet-fill me-2"></i>결제 정보</h5>
								</div>
							</div>
							<!-- Card body -->
							<div class="card-body">
								<!-- Card number -->
								<div class="row">
									<label class="form-label"><span class="h6 fw-normal">결제 수단</span></label>
								</div>

								<!-- Buttons -->
								<div class="row mt-3">
									<div class="d-sm-flex justify-content-sm-between align-items-center">
										<h5><span class="small fs-6">총 결제 금액</span> 205,000<span class="small fs-6">원</span></h5>
									</div>
									<div class="d-grid gap-2">
										<a href="reservationConfirm" class="btn btn-primary btn-sm mb-0">결제하기</a>
									</div>
								</div>
							</div>	
						</div>
					</div>
					<!-- 결제 정보 END -->
				</div>
			</aside>
			<!-- Right side content END -->
		</div> <!-- Row END -->
	</div>
</section>
<!-- =======================
Page content START -->

</main>

<!-- footer -->
<%@ include file="/WEB-INF/views/include/footer.jsp" %>

<!-- footerScript -->
<%@ include file="/WEB-INF/views/include/footerScript.jsp" %>

<!-- page script -->
<script src="js/user/reservation.js"></script>
</body>
</html>