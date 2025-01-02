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
<section class="pt-4">
	<div class="container">
		<div class="row">
			<div class="col-md-10 col-xl-8 mx-auto">

				<div class="card shadow">
					<!-- Image -->
					<img src="" class="rounded-top" alt="" id="partnerImage">

					<!-- Card body -->
					<div class="card-body text-center p-4">
						<h1 class="card-title fs-3 text-success"><i class="fa-regular fa-circle-check"></i></h1>
						<p class="lead mb-3 text-black">예약을 완료했어요!</p>

						<h6 class="text-success mb-5">설레는 여행 같이 준비해봐요!</h6>

						<div class="row justify-content-between text-start mb-4">
							<div class="col-lg-6">
								<ul class="list-group list-group-borderless">
									<li class="list-group-item d-sm-flex justify-content-between align-items-center">
										<span class="mb-0"><i class="bi bi-person fa-fw me-2"></i>예약자명 :</span>
										<span class="h6 fw-normal mb-0" id="buyerName"></span>
									</li>
									<li class="list-group-item d-sm-flex justify-content-between align-items-center">
										<span class="mb-0"><i class="bi bi-wallet2 fa-fw me-2"></i>결제 수단:</span>
										<span class="h6 fw-normal mb-0">신용/체크 카드</span>
									</li>
									<li class="list-group-item d-sm-flex justify-content-between align-items-center">
										<span class="mb-0"><i class="fa-solid fa-won-sign fa-fw me-2"></i>총 결제 금액:</span>
										<span class="h6 fw-normal mb-0" id="totalPrice"></span>
									</li>
								</ul>
							</div>

							<div class="col-lg-6">
								<ul class="list-group list-group-borderless">
									<li class="list-group-item d-sm-flex justify-content-between align-items-center">
										<span class="mb-0"><i class="bi bi-calendar fa-fw me-2"></i>체크인:</span>
										<span class="h6 fw-normal mb-0" id="checkInDate"></span>
									</li>
									<li class="list-group-item d-sm-flex justify-content-between align-items-center">
										<span class="mb-0"><i class="bi bi-calendar fa-fw me-2"></i>체크아웃:</span>
										<span class="h6 fw-normal mb-0" id="checkOutDate"></span>
									</li>
									<li class="list-group-item d-sm-flex justify-content-between align-items-center">
										<span class="mb-0"><i class="bi bi-people fa-fw me-2"></i>인원:</span>
										<span class="h6 fw-normal mb-0" id="guest"></span>
									</li>
								</ul>
							</div>
						</div>

						<!-- Button -->
						<div class="d-sm-flex justify-content-sm-end d-grid mt-5">
							<div class="col-6 d-grid gap-2 me-1">
								<button class="btn btn-primary-soft" type="button" data-src="reservationConfirm" data-act="clickMypage">예약내역</button>
							</div>
							<div class="col-6 d-grid gap-2">
								<button class="btn btn-primary" type="button" data-src="reservationConfirm" data-act="clickCustom">여행지 추천</button>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
</section>
</main>

<!-- footer -->
<%@ include file="/WEB-INF/views/include/footer.jsp" %>

<!-- footerScript -->
<%@ include file="/WEB-INF/views/include/footerScript.jsp" %>

<!-- page script -->
<script src="js/user/reservation/reservationConfirm.js"></script>
<script type="text/javascript">
	reservationConfirm.init();
</script>
</body>
</html>