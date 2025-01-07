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
						</div>
						<!-- Card body END -->
						
						<!-- 페이징 처리 START -->
						<div class="card-footer pt-0">
							<div class="d-sm-flex justify-content-sm-center align-items-sm-center">
								<nav class="mb-sm-0 d-flex justify-content-center" aria-label="navigation">
									<ul class="pagination pagination-sm pagination-primary-soft d-inline-block d-md-flex rounded mb-0" id="pagination">
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
								<div class="me-3 mb-2 d-flex">
									<span class="me-2">친절도</span>
									<label for="rating1" class="rating-label" data-src="reservation" data-act="hover" role="button">
										<input type="radio" name="rating_1" id="rating1" class="rating-input" value="1">
										<span class="star-icon"></span>
									</label>
									<label for="rating2" class="rating-label"  data-src="reservation" data-act="hover" role="button">
										<input type="radio" name="rating_1" id="rating2" class="rating-input" value="2">
										<span class="star-icon"></span>
									</label>
									<label for="rating3" class="rating-label"  data-src="reservation" data-act="hover" role="button">
										<input type="radio" name="rating_1" id="rating3" class="rating-input" value="3">
										<span class="star-icon"></span>
									</label>
									<label for="rating4" class="rating-label"  data-src="reservation" data-act="hover" role="button">
										<input type="radio" name="rating_1" id="rating4" class="rating-input" value="4">
										<span class="star-icon"></span>
									</label>
									<label for="rating5" class="rating-label"  data-src="reservation" data-act="hover" role="button">
										<input type="radio" name="rating_1" id="rating5" class="rating-input" value="5">
										<span class="star-icon"></span>
									</label>
								</div>
								<div class="me-3 mb-2 d-flex">
									<span class="me-2">청결도</span>
									<label for="rating6" class="rating-label" data-src="reservation" data-act="hover" role="button">
										<input type="radio" name="rating_2" id="rating6" class="rating-input" value="1">
										<span class="star-icon"></span>
									</label>
									<label for="rating7" class="rating-label" data-src="reservation" data-act="hover" role="button">
										<input type="radio" name="rating_2" id="rating7" class="rating-input" value="2">
										<span class="star-icon"></span>
									</label>
									<label for="rating8" class="rating-label" data-src="reservation" data-act="hover" role="button">
										<input type="radio" name="rating_2" id="rating8" class="rating-input" value="3">
										<span class="star-icon"></span>
									</label>
									<label for="rating9" class="rating-label" data-src="reservation" data-act="hover" role="button">
										<input type="radio" name="rating_2" id="rating9" class="rating-input" value="4">
										<span class="star-icon"></span>
									</label>
									<label for="rating10" class="rating-label" data-src="reservation" data-act="hover" role="button">
										<input type="radio" name="rating_2" id="rating10" class="rating-input" value="5">
										<span class="star-icon"></span>
									</label>
								</div>
								<div class="me-3 mb-2 d-flex">
									<span class="me-2">편의성</span>
									<label for="rating11" class="rating-label" data-src="reservation" data-act="hover" role="button">
										<input type="radio" name="rating_3" id="rating11" class="rating-input" value="1">
										<span class="star-icon"></span>
									</label>
									<label for="rating2" class="rating-label" data-src="reservation" data-act="hover" role="button">
										<input type="radio" name="rating_3" id="rating12" class="rating-input" value="2">
										<span class="star-icon"></span>
									</label>
									<label for="rating13" class="rating-label" data-src="reservation" data-act="hover" role="button">
										<input type="radio" name="rating_3" id="rating13" class="rating-input" value="3">
										<span class="star-icon"></span>
									</label>
									<label for="rating14" class="rating-label" data-src="reservation" data-act="hover" role="button">
										<input type="radio" name="rating_3" id="rating14" class="rating-input" value="4">
										<span class="star-icon"></span>
									</label>
									<label for="rating15" class="rating-label" data-src="reservation" data-act="hover" role="button">
										<input type="radio" name="rating_3" id="rating15" class="rating-input" value="5">
										<span class="star-icon"></span>
									</label>
								</div>
								<div class="mb-2 d-flex">
									<span class="me-2">위치</span>
									<label for="rating16" class="rating-label" data-src="reservation" data-act="hover" role="button">
										<input type="radio" name="rating_4" id="rating16" class="rating-input" value="1">
										<span class="star-icon"></span>
									</label>
									<label for="rating17" class="rating-label" data-src="reservation" data-act="hover" role="button">
										<input type="radio" name="rating_4" id="rating17" class="rating-input" value="2">
										<span class="star-icon"></span>
									</label>
									<label for="rating18" class="rating-label" data-src="reservation" data-act="hover" role="button">
										<input type="radio" name="rating_4" id="rating18" class="rating-input" value="3">
										<span class="star-icon"></span>
									</label>
									<label for="rating19" class="rating-label" data-src="reservation" data-act="hover" role="button">
										<input type="radio" name="rating_4" id="rating19" class="rating-input" value="4">
										<span class="star-icon"></span>
									</label>
									<label for="rating20" class="rating-label" data-src="reservation" data-act="hover" role="button">
										<input type="radio" name="rating_4" id="rating20" class="rating-input" value="5">
										<span class="star-icon"></span>
									</label>
								</div>
							</div>
							<!-- 후기 답변 -->
							<div class="d-flex mt-1 mb-3">
								<textarea rows="5" class="form-control" placeholder="이용 후기를 작성해 주세요." id="reviewContent"></textarea>
							</div>
						</div>
						<!-- 후기 사진 등록 Card Start -->
						<div class="card-body border rounded mt-2">
							<!-- 사진 리스트 -->
							<div class="d-flex gap-3">
								<!-- 업로드 버튼 -->
								<div class="border rounded d-flex justify-content-center align-items-center" style="width: 150px; height: 100px; background-color: #f8f9fa;">
									<label class="text-center" style="cursor: pointer;"> 
										<i class="bi bi-upload"></i><br>후기 사진 업로드 
										<input type="file" class="d-none" multiple="multiple" data-src="reservation" data-act="changeFile" id="reviewImage">
									</label>
								</div>
								<div id="preview" class="d-flex">
								</div>
							</div>
						</div>
					</div>
					<!-- Card body END -->
					<div class="card-footer">
						<div class="d-flex mt-3 justify-content-center">
							<button class="btn btn-primary" data-src="reservation" data-act="clickReviewRegist" id="reviewBtn">등록</button>
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