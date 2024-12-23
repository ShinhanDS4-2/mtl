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
Main content START -->
<section class="pt-4">
	<div class="container">
		<div class="row">
			<div class="col-md-10 col-xl-8 mx-auto">

				<div class="card shadow">
					<!-- Image -->
					<img src="assets/images/gallery/04.jpg" class="rounded-top" alt="">

					<!-- Card body -->
					<div class="card-body text-center p-4">
						<!-- Title -->
						<h1 class="card-title fs-3 text-success"><i class="fa-regular fa-circle-check"></i></h1>
						<p class="lead mb-3 text-black">예약을 완료했어요!</p>

						<!-- Second title -->
						<h6 class="text-success mb-5">설레는 여행 같이 준비해봐요!</h6>

						<!-- List -->
						<div class="row justify-content-between text-start mb-4">
							<div class="col-lg-5">
								<ul class="list-group list-group-borderless">
									<li class="list-group-item d-sm-flex justify-content-between align-items-center">
										<span class="mb-0"><i class="bi bi-person fa-fw me-2"></i>예약자명 :</span>
										<span class="h6 fw-normal mb-0">Frances Guerrero</span>
									</li>
									<li class="list-group-item d-sm-flex justify-content-between align-items-center">
										<span class="mb-0"><i class="bi bi-wallet2 fa-fw me-2"></i>결제 수단:</span>
										<span class="h6 fw-normal mb-0">신용/체크 카드</span>
									</li>
									<li class="list-group-item d-sm-flex justify-content-between align-items-center">
										<span class="mb-0"><i class="fa-solid fa-won-sign fa-fw me-2"></i>총 결제 금액:</span>
										<span class="h6 fw-normal mb-0">205,000원</span>
									</li>
								</ul>
							</div>

							<div class="col-lg-5">
								<ul class="list-group list-group-borderless">
									<li class="list-group-item d-sm-flex justify-content-between align-items-center">
										<span class="mb-0"><i class="bi bi-calendar fa-fw me-2"></i>체크인:</span>
										<span class="h6 fw-normal mb-0">2024-12-05</span>
									</li>
									<li class="list-group-item d-sm-flex justify-content-between align-items-center">
										<span class="mb-0"><i class="bi bi-calendar fa-fw me-2"></i>체크아웃:</span>
										<span class="h6 fw-normal mb-0">2024-12-16</span>
									</li>
									<li class="list-group-item d-sm-flex justify-content-between align-items-center">
										<span class="mb-0"><i class="bi bi-people fa-fw me-2"></i>인원:</span>
										<span class="h6 fw-normal mb-0">3</span>
									</li>
								</ul>
							</div>
						</div>

						<!-- Button -->
						<div class="d-sm-flex justify-content-sm-end d-grid mt-5">
							<div class="col-6 d-grid gap-2 me-1">
								<button class="btn btn-primary-soft" type="button">예약내역</button>
							</div>
							<div class="col-6 d-grid gap-2">
								<button class="btn btn-primary" type="button">여행지 추천</button>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
</section>
<!-- =======================
Main content START -->
</main>

<!-- footer -->
<%@ include file="/WEB-INF/views/include/footer.jsp" %>

<!-- footerScript -->
<%@ include file="/WEB-INF/views/include/footerScript.jsp" %>

<!-- page script -->
<script src="js/user/reservationConfirm.js"></script>
</body>
</html>