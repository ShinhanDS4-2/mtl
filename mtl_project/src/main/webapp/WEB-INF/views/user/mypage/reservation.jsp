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
						<i class="far fa-sliders-h"></i> 메뉴
					</button>
				</div> 

				<!-- 예약 내역 -->
				<div class="vstack gap-4">
					<div class="card border">
						<!-- Card header -->
						<div class="card-header border-bottom">
							<h4 class="card-header-title">예약 내역</h4>
						</div>
						
						<!-- Card body START --> <!-- 여기서 부터 예약내역 리스트 시작, js에서 동적으로 그려줘야함 / id="reservCard" -->
						<div id="reservCard" class="card-body vstack gap-4">
							<!-- 예약 내역 card 1개, 여기서부터 js에서 반복 돌려서 출력해야함-->
							<div class="card shadow p-2">
								<div class="row g-0">
								
							<!-- 예약내역 리스트에서 1개의 예약내역 card 그려지는 곳. js에서 user_idx 받아서 동적으로 그려줌 -->
								<!-- Card img -->
								<!-- <div class="col-md-3">
										<img src="assets/images/category/hotel/4by3/10.jpg" class="card-img rounded-2" alt="Card image">
									</div>
								 -->
									<!-- Card body -->
								<!-- <div class="col-md-9">
										<div class="card-body py-md-2 d-flex flex-column h-100">
											<h5 class="card-title mb-1"><a href="partner/detail">나인트리 바이 파르나스 서울 명동 II</a></h5>
											<small><i class="bi bi-geo-alt me-2"></i>서울 중구 마른내로 28</small> 
											<small class="mt-2">
												<i class="fa-regular fa-calendar me-2"></i>2024-12-15 ~ 2024-12-16
												<i class="fa-solid fa-users ms-3 me-2"></i>2명
											</small>

											<div class="d-sm-flex justify-content-sm-between align-items-center mt-3 mt-md-auto">
												<div class="d-flex align-items-center">
													<h5 class="fw-bold mb-0 me-1"><i class="fa-solid fa-won-sign"></i> 200,000</h5>
												</div>
												<div class="mt-3 mt-sm-0">
													<a href="javascript:;" class="btn btn-sm btn-primary-soft mb-0">추천 여행지</a>    
													<a href="javascript:;" class="btn btn-sm btn-primary-soft mb-0"  data-bs-toggle="modal" data-bs-target="#reviewModal">후기 작성</a>    
													<a href="javascript:;" class="btn btn-sm btn-primary mb-0 reservDetail" data-bs-toggle="modal" data-bs-target="#reservationDetail"
													data-src="reservation" data-act="clickDeatilModal" data-reservation-idx="1">상세 정보</a>    
												</div>                  
											</div>
										</div>
									</div>
								-->
								<!-- 
									data-src="reservation" : 현재 요소가 "reservation(예약)"과 관련된 동작임을 나타냄. 
									data-act="clickDeatilModal" : 이 요소가 클릭되었을 때 실행할 동작을 정의 (JavaScript에서 clickDeatilModal이라는 특정 이벤트 핸들러를 실행하도록 매핑하기 위해 사용)
									data-reservation-idx="${data.reservation_idx}" : 서버에서 전달받은 예약idx를 동적으로 채우고, 이는 클릭 이벤트에서 특정 예약 데이터를 식별하기 위해 사용한다. 
										 ㄴ 예약 상세 정보를 서버로 요청할 때 reservation_idx를 전달하기 위함
								-->
									
								</div>
							</div>
							
						</div>
						<!-- Card body END -->
						
						<!-- 페이징 처리 START -->
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
						<!-- 페이징 처리 END -->
					</div>
				</div>
			</div>
			<!-- Main content END -->
		</div>
	</div>
</section>
</main>

<!-- 예약 상세 정보 모달 -->
<div class="modal fade" id="reservationDetail" tabindex="-1" aria-labelledby="reservationDetailLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content p-0">

			<!-- Title -->
			<div class="modal-header p-3">
				<h5 class="modal-title mb-0" id="reservationDetailLabel">예약 정보</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			
<!-- 여기서 부터 예약상세정보 데이터 시작, js에서 그려줘야함 / id="reservDetailModal" -->
			<!-- Modal body START-->
			<div id="reservDetailModal" class="modal-body p-0">
				<!-- 예약내역 상세정보 그려지는 곳. js에서 예약idx 받아서 동적으로 그려줌 -->
				<!-- 
				<div class="card bg-transparent m-3 border">
					<div class="card-body">
						<div class="col-12">
							<div class="mb-2">
								<img src="assets/images/서울_시그니엘서울.jpg" class="rounded">
							</div>
							<ul class="list-group list-group-borderless">
								<li class="list-group-item">
									<span class="h6 mb-0 me-1">객실 :</span>
									<span class="h6 fw-light mb-0">스탠다드</span>
								</li>
								<li class="list-group-item">
									<span class="h6 mb-0 me-1">체크인 : </span>
									<span class="h6 fw-light mb-0">2024-12-01</span>
								</li>
								<li class="list-group-item">
									<span class="h6 mb-0 me-1">체크아웃 : </span>
									<span class="h6 fw-light mb-0">2024-12-02</span>
								</li>
								<li class="list-group-item">
									<span class="h6 mb-0 me-1">인원 : </span>
									<span class="h6 fw-light mb-0">2인</span>
								</li>
								<li class="list-group-item">
									<span class="h6 mb-0 me-1">총 금액</span>
									<span class="h6 fw-light mb-0">200,000</span>
								</li>
							</ul>
						</div>
					</div>
				</div>
				-->
			</div>
			<!-- Modal body END-->
		</div>
	</div>
</div>

<!-- 후기 작성 모달 -->
<div class="modal fade" id="reviewModal" tabindex="-1" aria-labelledby="reviewLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered modal-lg">
		<div class="modal-content p-0">

			<!-- Title -->
			<div class="modal-header p-3">
				<h5 class="modal-title mb-0" id="reviewLabel">후기 작성</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>

			<!-- Modal body -->
			<div class="modal-body p-0">
				<!-- Card START -->
				<div class="card bg-transparent m-3 border">
					<!-- Card body START -->
					<div class="card-body">
						<div class="col-12">
							<!-- 후기 별점 -->
							<div class="d-flex justify-content-between align-items-center">
								<div class="me-4">
									<span>친절도</span>
									<ul class="list-inline mb-2">
										<li class="list-inline-item me-0 star-item"><i class="far fa-star text-warning"></i></li>
										<li class="list-inline-item me-0 star-item"><i class="far fa-star text-warning"></i></li>
										<li class="list-inline-item me-0 star-item"><i class="far fa-star text-warning"></i></li>
										<li class="list-inline-item me-0 star-item"><i class="far fa-star text-warning"></i></li>
										<li class="list-inline-item me-0 star-item"><i class="far fa-star text-warning"></i></li>
									</ul>
								</div>
								<div class="me-4">
									<span>청결도</span>
									<ul class="list-inline mb-2">
										<li class="list-inline-item me-0 star-item"><i class="far fa-star text-warning"></i></li>
										<li class="list-inline-item me-0 star-item"><i class="far fa-star text-warning"></i></li>
										<li class="list-inline-item me-0 star-item"><i class="far fa-star text-warning"></i></li>
										<li class="list-inline-item me-0 star-item"><i class="far fa-star text-warning"></i></li>
										<li class="list-inline-item me-0 star-item"><i class="far fa-star text-warning"></i></li>
									</ul>
								</div>
								<div class="me-4">
									<span>서비스</span>
									<ul class="list-inline mb-2">
										<li class="list-inline-item me-0 star-item"><i class="far fa-star text-warning"></i></li>
										<li class="list-inline-item me-0 star-item"><i class="far fa-star text-warning"></i></li>
										<li class="list-inline-item me-0 star-item"><i class="far fa-star text-warning"></i></li>
										<li class="list-inline-item me-0 star-item"><i class="far fa-star text-warning"></i></li>
										<li class="list-inline-item me-0 star-item"><i class="far fa-star text-warning"></i></li>
									</ul>
								</div>
								<div class="me-4">
									<span>위치</span>
									<ul class="list-inline mb-2">
										<li class="list-inline-item me-0 star-item"><i class="far fa-star text-warning"></i></li>
										<li class="list-inline-item me-0 star-item"><i class="far fa-star text-warning"></i></li>
										<li class="list-inline-item me-0 star-item"><i class="far fa-star text-warning"></i></li>
										<li class="list-inline-item me-0 star-item"><i class="far fa-star text-warning"></i></li>
										<li class="list-inline-item me-0 star-item"><i class="far fa-star text-warning"></i></li>
									</ul>
								</div>
							</div>
							<!-- 후기 답변 -->
							<div class="d-flex mt-1 mb-3">
								<textarea rows="5" class="form-control" placeholder="이용 후기를 작성해 주세요."></textarea>
							</div>
							<!-- 후기 이미지 -->
							<div class="d-flex align-items-center">
								<div
									class="border rounded d-flex justify-content-center align-items-center"
									style="width: 150px; height: 100px; background-color: #f8f9fa;">
									<label class="text-center" style="cursor: pointer;"> 
										<i class="bi bi-upload"></i><br>숙소 사진 업로드 
										<input type="file" class="d-none">
									</label>
								</div>
							</div>
						</div>
					</div>
					<!-- Card body END -->
					<div class="card-footer">
						<div class="d-flex mt-3 justify-content-center">
							<button class="btn btn-primary">등록</button>
						</div>
					</div>
				</div>
				<!-- Card END -->
			</div>
		</div>
	</div>
</div>

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