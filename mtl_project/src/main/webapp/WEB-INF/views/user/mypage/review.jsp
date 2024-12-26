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
							<h4 class="card-header-title">내가 쓴 후기</h4>
						</div>
						
						<!-- Review item -->
						<div class="card-body">
							<div class="row">
								<div class="col-md-4 col-xxl-3">
									<div class="d-flex align-items-center">
										<!-- Info -->
										<div class="ms-2">
											<h5 class="mb-1">서울 시그니엘</h5>
											<p class="mb-0 small">2024-12-01 ~ 2024-12-15</p>
										</div>
									</div>
								</div>
			
								<div class="col-md-8 col-xxl-9">
									<!-- 후기 별점 -->
									<div class="d-flex justify-content-between align-items-center">
										<div class="me-4">
											<span>친절도</span>
											<ul class="list-inline mb-2">
												<li class="list-inline-item me-0"><i class="fas fa-star text-warning"></i></li>
												<li class="list-inline-item me-0"><i class="fas fa-star text-warning"></i></li>
												<li class="list-inline-item me-0"><i class="fas fa-star text-warning"></i></li>
												<li class="list-inline-item me-0"><i class="fas fa-star text-warning"></i></li>
												<li class="list-inline-item me-0"><i class="far fa-star text-warning"></i></li>
											</ul>
										</div>
										<div class="me-4">
											<span>청결도</span>
											<ul class="list-inline mb-2">
												<li class="list-inline-item me-0"><i class="fas fa-star text-warning"></i></li>
												<li class="list-inline-item me-0"><i class="fas fa-star text-warning"></i></li>
												<li class="list-inline-item me-0"><i class="fas fa-star text-warning"></i></li>
												<li class="list-inline-item me-0"><i class="fas fa-star text-warning"></i></li>
												<li class="list-inline-item me-0"><i class="far fa-star text-warning"></i></li>
											</ul>
										</div>
										<div class="me-4">
											<span>서비스</span>
											<ul class="list-inline mb-2">
												<li class="list-inline-item me-0"><i class="fas fa-star text-warning"></i></li>
												<li class="list-inline-item me-0"><i class="fas fa-star text-warning"></i></li>
												<li class="list-inline-item me-0"><i class="fas fa-star text-warning"></i></li>
												<li class="list-inline-item me-0"><i class="fas fa-star text-warning"></i></li>
												<li class="list-inline-item me-0"><i class="far fa-star text-warning"></i></li>
											</ul>
										</div>
										<div class="me-4">
											<span>위치</span>
											<ul class="list-inline mb-2">
												<li class="list-inline-item me-0"><i class="fas fa-star text-warning"></i></li>
												<li class="list-inline-item me-0"><i class="fas fa-star text-warning"></i></li>
												<li class="list-inline-item me-0"><i class="fas fa-star text-warning"></i></li>
												<li class="list-inline-item me-0"><i class="fas fa-star text-warning"></i></li>
												<li class="list-inline-item me-0"><i class="far fa-star text-warning"></i></li>
											</ul>
										</div>
									</div>
									<!-- 후기 내용 -->
									<p class="space mt-2">Far advanced settling say finished raillery. Offered chiefly farther Satisfied conveying a dependent contented he gentleman agreeable do be. Warrant private blushes removed and in equally totally if. Delivered dejection necessary objection do Mr prevailed. Mr feeling chiefly cordial in doing.</p>
									<!-- 후기 이미지 -->
									<div class="d-flex align-items-center">
										<div class="w-80px flex-shrink-0 me-2">
											<img src="assets/images/서울_시그니엘서울.jpg" class="rounded">									
										</div>
										<div class="w-80px flex-shrink-0 me-2">
											<img src="assets/images/서울_시그니엘서울.jpg" class="rounded">									
										</div>
										<div class="w-80px flex-shrink-0 me-2">
											<img src="assets/images/서울_시그니엘서울.jpg" class="rounded">									
										</div>
									</div>
									<!-- 후기 답변 -->
									<div class="d-flex mt-4 speech-balloon">
										<p class="space">판매자의 후기 답변</p>
									</div>
								</div>
							</div>

							<hr class="m-0 mt-4 mb-4"> <!-- Divider -->

							<div class="row">
								<div class="col-md-4 col-xxl-3">
									<div class="d-flex align-items-center">
										<!-- Info -->
										<div class="ms-2">
											<h5 class="mb-1">서울 시그니엘</h5>
											<p class="mb-0 small">2024-12-01 ~ 2024-12-15</p>
										</div>
									</div>
								</div>
			
								<div class="col-md-8 col-xxl-9">
									<!-- 후기 별점 -->
									<div class="d-flex justify-content-between align-items-center">
										<div class="me-4">
											<span>친절도</span>
											<ul class="list-inline mb-2">
												<li class="list-inline-item me-0"><i class="fas fa-star text-warning"></i></li>
												<li class="list-inline-item me-0"><i class="fas fa-star text-warning"></i></li>
												<li class="list-inline-item me-0"><i class="fas fa-star text-warning"></i></li>
												<li class="list-inline-item me-0"><i class="fas fa-star text-warning"></i></li>
												<li class="list-inline-item me-0"><i class="far fa-star text-warning"></i></li>
											</ul>
										</div>
										<div class="me-4">
											<span>청결도</span>
											<ul class="list-inline mb-2">
												<li class="list-inline-item me-0"><i class="fas fa-star text-warning"></i></li>
												<li class="list-inline-item me-0"><i class="fas fa-star text-warning"></i></li>
												<li class="list-inline-item me-0"><i class="fas fa-star text-warning"></i></li>
												<li class="list-inline-item me-0"><i class="fas fa-star text-warning"></i></li>
												<li class="list-inline-item me-0"><i class="far fa-star text-warning"></i></li>
											</ul>
										</div>
										<div class="me-4">
											<span>서비스</span>
											<ul class="list-inline mb-2">
												<li class="list-inline-item me-0"><i class="fas fa-star text-warning"></i></li>
												<li class="list-inline-item me-0"><i class="fas fa-star text-warning"></i></li>
												<li class="list-inline-item me-0"><i class="fas fa-star text-warning"></i></li>
												<li class="list-inline-item me-0"><i class="fas fa-star text-warning"></i></li>
												<li class="list-inline-item me-0"><i class="far fa-star text-warning"></i></li>
											</ul>
										</div>
										<div class="me-4">
											<span>위치</span>
											<ul class="list-inline mb-2">
												<li class="list-inline-item me-0"><i class="fas fa-star text-warning"></i></li>
												<li class="list-inline-item me-0"><i class="fas fa-star text-warning"></i></li>
												<li class="list-inline-item me-0"><i class="fas fa-star text-warning"></i></li>
												<li class="list-inline-item me-0"><i class="fas fa-star text-warning"></i></li>
												<li class="list-inline-item me-0"><i class="far fa-star text-warning"></i></li>
											</ul>
										</div>
									</div>
									<!-- 후기 내용 -->
									<p class="space mt-2">Far advanced settling say finished raillery. Offered chiefly farther Satisfied conveying a dependent contented he gentleman agreeable do be. Warrant private blushes removed and in equally totally if. Delivered dejection necessary objection do Mr prevailed. Mr feeling chiefly cordial in doing.</p>
									<!-- 후기 이미지 -->
									<div class="d-flex align-items-center">
										<div class="w-80px flex-shrink-0 me-2">
											<img src="assets/images/서울_시그니엘서울.jpg" class="rounded">									
										</div>
										<div class="w-80px flex-shrink-0 me-2">
											<img src="assets/images/서울_시그니엘서울.jpg" class="rounded">									
										</div>
										<div class="w-80px flex-shrink-0 me-2">
											<img src="assets/images/서울_시그니엘서울.jpg" class="rounded">									
										</div>
									</div>
									<!-- 후기 답변 -->
									<div class="d-flex mt-4 speech-balloon">
										<p class="space">판매자의 후기 답변</p>
									</div>
								</div>
							</div>
						</div>
						
						<!-- 페이지네이션 -->
						<div class="card-footer pt-0">
							<div class="d-sm-flex justify-content-sm-center align-items-sm-center">
								<nav class="mb-sm-0 d-flex justify-content-center" aria-label="navigation">
									<ul class="pagination pagination-sm pagination-primary-soft d-inline-block d-md-flex rounded mb-0">
										<li class="page-item mb-0"><a class="page-link" href="#" tabindex="-1"><i class="fa-solid fa-angle-left"></i></a></li>
										<li class="page-item mb-0"><a class="page-link" href="#">1</a></li>
										<li class="page-item mb-0 active"><a class="page-link" href="#">2</a></li>
										<li class="page-item mb-0"><a class="page-link" href="#">3</a></li>
										<li class="page-item mb-0"><a class="page-link" href="#">4</a></li>
										<li class="page-item mb-0"><a class="page-link" href="#">5</a></li>
										<li class="page-item mb-0"><a class="page-link" href="#"><i class="fa-solid fa-angle-right"></i></a></li>
									</ul>
								</nav>
							</div>
						</div>
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
<script src="js/user/mypage/review.js"></script>
<script type="text/javascript">
	review.init();
</script>
</body>
</html>