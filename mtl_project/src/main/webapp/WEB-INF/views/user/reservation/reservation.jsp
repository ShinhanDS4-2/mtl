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
										<img class="card-img" alt="" id="partnerImg">
									</div>

									<!-- Card Body -->
									<div class="col-sm-6 col-md-9">
										<div class="card-body pt-3 pt-sm-0 p-0">
											<!-- Title -->
											<h5 class="card-title" id="partnerName"></h5>
											<p class="small mb-2"><i class="bi bi-geo-alt me-2"></i><span id="partnerAddress"></span></p>
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
										<h6 class="fw-light small mb-1">체크인</h6>
										<h5 class="mb-1" id="checkInDate"></h5>
										<!-- <small><i class="bi bi-alarm me-1"></i>12:30 pm</small>  -->
									</div>
								</div>

								<!-- Item -->
								<div class="col-lg-4">
									<div class="bg-light py-3 px-4 rounded-3">
										<h6 class="fw-light small mb-1">체크아웃</h6>
										<h5 class="mb-1" id="checkOutDate"></h5>
										<!-- <small><i class="bi bi-alarm me-1"></i>4:30 pm</small> -->
									</div>
								</div>

								<!-- Item -->
								<div class="col-lg-4">
									<div class="bg-light py-3 px-4 rounded-3">
										<h6 class="fw-light small mb-1">객실 & 인원</h6>
										<h5 class="mb-1"><span id="roomType"></span> - <span id="guest"></span>인</h5>
										<!-- <small><i class="bi bi-brightness-high me-1"></i>3 Nights - 4 Days</small> -->
									</div>
								</div>
							</div>
							<!-- Information END -->
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
											<input type="text" class="form-control form-control-lg" placeholder="예약자명을 입력해 주세요.">
										</div>
									</li>
									<li class="list-group-item d-flex justify-content-between align-items-center">
										<div class="col-md-3">
											<label class="form-label">이메일</label>
										</div>
										<div class="col-md-9">
											<input type="text" class="form-control form-control-lg" placeholder="이메일을 입력해 주세요.">
										</div>
									</li>
									<li class="list-group-item d-flex justify-content-between align-items-center">
										<div class="col-md-3">
											<label class="form-label">연락처</label>
										</div>
										<div class="col-md-9">
											<input type="text" class="form-control form-control-lg" placeholder="연락처를 입력해 주세요.">
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
								<div class="row">
									<div class="col-6">
										<label class="form-label"><span class="h6 fw-normal">결제 수단</span></label>
										<div class="card">
											<div class="bg-primary p-3 rounded-3">
												<div class="d-flex justify-content-start align-items-start mb-2">
													<img class="w-40px me-2" src="assets/images/element/visa.svg">
													<img class="w-40px" src="assets/images/element/mastercard.svg">
												</div>
												<div>
													<span class="text-white mt-4">신용/체크 카드</span>
												</div>
											</div>
										</div>
									</div>
								</div>

								<!-- Buttons -->
								<div class="row mt-3">
									<div class="d-sm-flex justify-content-sm-between align-items-center">
										<h5><span class="small fs-6">1일 금액 </span></h5>
										<h5><span id="onePrice"></span><span class="small fs-6"> 원</span></h5>
									</div>
									<div class="d-sm-flex justify-content-sm-between align-items-center">
										<h5><span class="small fs-6">총 결제 금액 </span></h5>
										<h5><span id="totalPrice"></span><span class="small fs-6"> 원</span></h5>
									</div>
									<div class="d-grid gap-2">
										<a href="javascript:;" class="btn btn-primary btn-sm mb-0" data-src="reservation" data-act="clickPayment">결제하기</a>
									</div>
								</div>
							</div>	
						</div>
					</div>
					<!-- 결제 정보 END -->
				</div>
			</aside>
		</div> <!-- Row END -->
	</div>
</section>
</main>

<!-- footer -->
<%@ include file="/WEB-INF/views/include/footer.jsp" %>

<!-- footerScript -->
<%@ include file="/WEB-INF/views/include/footerScript.jsp" %>

<!-- page script -->
<script src="js/user/reservation/reservation.js"></script>
<script type="text/javascript">
	reservation.init();
</script>
</body>
</html>