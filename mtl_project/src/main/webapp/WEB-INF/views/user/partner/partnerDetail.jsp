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
<section class="py-3 py-sm-0">
	<div class="container">
		<button class="btn btn-primary d-sm-none w-100 mb-0" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasEditsearch" aria-controls="offcanvasEditsearch"><i class="bi bi-pencil-square me-2"></i>Edit Search</button>

		<div class="offcanvas-sm offcanvas-top" tabindex="-1" id="offcanvasEditsearch" aria-labelledby="offcanvasEditsearchLabel">
			<div class="offcanvas-header">
				<h5 class="offcanvas-title" id="offcanvasEditsearchLabel">일정 검색</h5>
				<button type="button" class="btn-close" data-bs-dismiss="offcanvas" data-bs-target="#offcanvasEditsearch" aria-label="Close"></button>
			</div>
			<div class="offcanvas-body p-2">
				<div class="bg-light p-4 rounded w-100">
					<form class="row g-4">
						<!-- 지역 -->
						<div class="col-md-6 col-lg-4">
							<div class="form-size-lg form-fs-md">
								<label class="form-label">지역</label>
								<select class="form-select" id="searchArea" disabled>
									<option value="SEOUL">서울</option>
									<option value="GANGNEUNG">강릉</option>
									<option value="YEOSU">여수</option>
									<option value="BUSAN">부산</option>
									<option value="JEJU">제주</option>
								</select>
							</div>
						</div>

						<!-- 체크인 체크아웃 -->
						<div class="col-md-6 col-lg-3">
							<div class="form-fs-md">
								<label class="form-label">체크인 - 체크아웃</label>
								<input type="text" class="form-control form-control-lg flatpickr" data-mode="range" placeholder="Select date" id="searchDate">
							</div>
						</div>
							
						<!-- 인원 -->
						<div class="col-md-6 col-lg-3">
							<div class="form-fs-md">
								<div class="w-100">
									<label class="form-label">인원</label>
									<div class="dropdown guest-selector me-2">
										<input type="text" class="form-guest-selector form-control form-control-lg selection-result" value="2 명" id="searchGuest" data-bs-auto-close="outside" data-bs-toggle="dropdown">
										<ul class="dropdown-menu guest-selector-dropdown" aria-labelledby="searchGuest">
											<li class="d-flex justify-content-between">
												<div>
													<h6 class="mb-0">인원</h6>
													<small>유아 및 아동도 인원에 포함해 주세요.</small>
												</div>
												<div class="hstack gap-1 align-items-center">
													<button type="button" class="btn btn-link adult-remove p-0 mb-0"><i class="bi bi-dash-circle fs-5 fa-fw"></i></button>
													<h6 class="guest-selector-count mb-0 adults" id="guestText">2</h6>
													<button type="button" class="btn btn-link adult-add p-0 mb-0"><i class="bi bi-plus-circle fs-5 fa-fw"></i></button>
												</div>
											</li>
										</ul>
									</div>
								</div>
							</div>
						</div>

						<!-- 검색 버튼 -->
						<div class="col-md-6 col-lg-2 mt-md-auto">
							<a class="btn btn-lg btn-primary w-100 mb-0" href="javascript:;" data-src="partnerDetail" data-act="clickSearch"><i class="bi bi-search fa-fw"></i> 검색</a>
						</div>
 					</form>
				</div>
			</div>
		</div>
	</div>
</section>

<!-- 숙소명 -->	
<section class="py-0 pt-sm-5">
	<div class="container position-relative">
		<div class="row mb-3">
			<div class="col-12">
				<div class="d-lg-flex justify-content-lg-between mb-1">
					<div class="mb-2 mb-lg-0">
						<h1 class="fs-2" id="partnerName"></h1>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<!-- 숙소 사진 -->
<section class="card-grid pt-0">
	<div class="container">
		<div class="row g-2">
			<!-- Image -->
			<div class="col-md-6">
				<div id="thumbnail" class="card card-grid-lg overflow-hidden" style="background-position: center left; background-size: cover">
				</div>
			</div>

			<div class="col-md-6">
				<div class="row g-2"> 
					<!-- Image -->
					<div class="col-12">
						<div id="rightImage1" class="card card-grid-sm overflow-hidden"style="background-position: center left; background-size: cover">
						</div>
					</div>

					<!-- Image -->
					<div class="col-md-6">
						<div id="rightImage2" class="card card-grid-sm overflow-hidden" style="background-position: center left; background-size: cover">
						</div>
					</div>

					<!-- Images -->
					<div class="col-md-6">
						<div id="rightImage3"  class="card card-grid-sm overflow-hidden" style="background-position: center left; background-size: cover">
						</div>
					</div>
				</div>
				<!-- Card item END -->
			</div>
		</div>
	</div>
</section>

<!-- 숙소 정보 -->
<section class="pt-0">
	<div class="container" data-sticky-container>

		<div class="row g-4 g-xl-5">
			<!-- Content START -->
			<div class="col-xl-7 order-1">
				<div class="vstack gap-5">

					<!-- About hotel START -->
					<div class="card bg-transparent">
						<!-- Card header -->
						<div class="card-header border-bottom bg-transparent px-0 pt-0">
							<h3 class="mb-0">숙소 이용 정보</h3>
						</div>

						<!-- Card body START -->
						<div class="card-body pt-4 p-0">
							<p class="mb-3 space" id="partnerDescription"></p>
							
							<!-- List -->
							<h5 class="fw-light mt-4 mb-2">이용 안내</h5>
							<ul class="list-group list-group-borderless mb-0" id="parterNoticeList">
							</ul>
						</div>
						<!-- Card body END -->
					</div>
					<!-- About hotel START -->

					<!-- Amenities START -->
					<div class="card bg-transparent">
						<!-- Card header -->
						<div class="card-header border-bottom bg-transparent px-0 pt-0">
							<h3 class="card-title mb-0">시설</h3>
						</div>

						<!-- Card body START -->
						<div class="card-body pt-4 p-0">
							<div class="row g-4">
								<!-- Services -->
								<div class="col-sm-6">
									<h6><i class="fa-solid fa-concierge-bell me-2"></i>공통 시설</h6>
									<ul class="list-group list-group-borderless mt-2 mb-0" id="commonFacilitiesList">
									</ul>
								</div>
	
								<div class="col-sm-6">
									<h6><i class="fa-solid fa-concierge-bell me-2"></i>객실 시설</h6>
									<ul class="list-group list-group-borderless mt-2 mb-0" id="roomFacilitiesList">
									</ul>
								</div>
							</div>
						</div>
						<!-- Card body END -->
					</div>
					<!-- Amenities END -->

					<!-- Room START -->
					<div class="card bg-transparent" id="room-options">
						<!-- Card header -->
						<div class="card-header border-bottom bg-transparent px-0 pt-0">
							<div class="d-sm-flex justify-content-sm-between align-items-center">
								<h3 class="mb-2 mb-sm-0">객실</h3>
							</div>
						</div>

						<!-- Card body START -->
						<div class="card-body pt-4 p-0">
							<div class="vstack gap-4" id="roomList">
							</div>
						</div>
						<!-- Card body END -->
					</div>
					<!-- Room END -->

					<!-- Customer Review START -->
					<div class="card bg-transparent">
						<!-- Card header -->
						<div class="card-header border-bottom bg-transparent px-0 pt-0">
							<h3 class="card-title mb-0">고객 리뷰</h3>
						</div>

						<!-- Card body START -->
						<div class="card-body pt-2 p-0">
							<!-- Review item START -->
							<div id="reviewList">
							</div>

							<!-- Button -->
							<div class="text-center">
								<a href="javascript:;" class="btn btn-primary-soft mb-0" data-src="partnerDetail" data-act="clickMore" id="moreBtn">더보기</a>
							</div>
						</div>
						<!-- Card body END -->
					</div>
					<!-- Customer Review END -->
				</div>	
			</div>
			<!-- Content END -->

			<!-- Right side content START -->
			<aside class="col-xl-5 order-xl-2">
				<div data-sticky data-margin-top="100" data-sticky-for="1199">
					<!-- 위치 정보 -->
					<div class="card card-body border">
						<!-- Title -->
						<div class="d-sm-flex justify-content-sm-between align-items-center mb-3">
							<div>
								<h5 class="text-primary"><b>위치 정보</b></h5>
								<p class="fw-bold mb-0"><i class="bi bi-geo-alt me-2"></i><span id="partnerAddress">서울 강남구 테헤란로 521</span></p>
							</div>
						</div>	
						<div class="w-100 h-200px" id="map">
						</div>	
					</div>
					
					<!-- 문의 -->
					<div class="card card-body border mt-2">
						<!-- Title -->
						<div class="d-sm-flex justify-content-sm-between align-items-center mb-3">
							<div>
								<h5 class="text-black"><b>궁금한 정보가 있으신가요?</b></h5>
							</div>
						</div>	
						<div class="d-grid gap-2">
							<button class="btn btn-primary-soft" type="button" data-bs-toggle="modal" data-bs-target="#qnaModal"  data-src="partnerDetail" data-act="clickQnaModal">문의하기</button>
						</div>	
					</div>
				</div>	
			</aside>
		</div> <!-- Row END -->
	</div>
</section>
<!-- =======================
About hotel END -->
</main>

<!-- Room modal START -->
<div class="modal fade" id="roomDetail" tabindex="-1" aria-labelledby="roomDetailLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content p-0">

			<!-- Title -->
			<div class="modal-header p-3">
				<h5 class="modal-title mb-0" id="roomDetailLabel">객실 정보</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>

			<!-- Modal body -->
			<div class="modal-body p-0">

				<!-- Card START -->
				<div class="card bg-transparent p-3">
					<!-- Slider START -->
					<div class="tiny-slider arrow-round arrow-dark overflow-hidden rounded-2">
						<div class="tiny-slider-inner2 rounded-2 overflow-hidden" data-autoplay="true" data-arrow="true" data-dots="false" data-items="1" id="roomImageList">
						</div>
					</div>
					<!-- Slider END -->

					<!-- Card header -->
					<div class="card-header bg-transparent pb-0">
						<h3 class="card-title mb-0" id="roomType"></h3>
					</div>

					<!-- Card body START -->
					<div class="card-body">
						<!-- Content -->
						<p class="space" id="roomDescription"></p>
						
						<div class="row">
							<h5 class="mb-0">객실 시설</h5>

							<!-- List -->
							<div class="col-md-6">
								<!-- List -->
								<ul class="list-group list-group-borderless mt-2 mb-0" id="facilitiesList1">
								</ul>
							</div>

							<!-- List -->
							<div class="col-md-6">
								<!-- List -->
								<ul class="list-group list-group-borderless mt-2 mb-0" id="facilitiesList2">
								</ul>
							</div>
						</div> <!-- Row END -->
					</div>
					<!-- Card body END -->
				</div>
				<!-- Card END -->
			</div>
		</div>
	</div>
</div>
<!-- Room modal END -->

<!-- 1:1 문의 모달 -->
<div class="modal fade" id="qnaModal" tabindex="-1" aria-labelledby="qnaDetailLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content p-0">

			<!-- Title -->
			<div class="modal-header p-3">
				<h5 class="modal-title mb-0" id="qnaDetailLabel">1:1 문의</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>

			<!-- Modal body -->
			<div class="modal-body p-0">
				<div class="card bg-transparent p-3">
					<div class="card-header bg-transparent pb-0">
						<div class="alert alert-secondary" role="alert">
							직접 문의하고 싶으신 경우<br>
							<i class="fa-solid fa-phone"></i> <span id="partnerPhone"></span>으로 연락해 주시기 바랍니다.
						</div>
					</div>
					<div class="card-body pt-2">
						<div class="d-flex mt-1 form-floating">
							<input type="text" class="form-control" id="qnaTitle" placeholder="제목을 작성해 주세요.">
							<label for ="qnaTitle">제목</label>
						</div>
						<div class="d-flex mt-1">
							<textarea class="form-control mb-0" placeholder="질문을 작성해 주세요." rows="5" spellcheck="false" id="qnaContent"></textarea>
						</div>
						<div class="d-grid gap-2 mt-3">
							<button class="btn btn-sm btn-primary-soft px-4 mb-0 flex-shrink-0" data-src="partnerDetail" data-act="clickQuestion"><i class="fas fa-paper-plane"></i> 전송</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- footer -->
<%@ include file="/WEB-INF/views/include/footer.jsp" %>

<!-- footerScript -->
<%@ include file="/WEB-INF/views/include/footerScript.jsp" %>

<!-- page script  https://naveropenapi.apigw.ntruss.com/map-reversegeocode/v2 --> 
<script src="js/user/partner/partnerDetail.js"></script>
<script type="text/javascript">
	partnerDetail.init();
</script>
</body>
</html>