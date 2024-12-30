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
<!-- 배너 및 검색 -->
<section class="pt-0">
	<div class="container">
		<!-- 배너 -->
		<div class="rounded-3 p-3 p-sm-5 banner" id="banner" style="background-image: url(assets/images/banner/7.jpg);">
			<div class="row my-2 my-xl-5"> 
				<div class="col-md-8 mx-auto"> 
					<h1 class="text-center text-white">뭔가 쓰고 싶은데</h1>
				</div>
			</div>

			<!-- 숙소 검색 폼 -->
			<form class="bg-mode shadow rounded-3 position-relative p-4 pe-md-5 pb-5 pb-md-4 mb-4">
				<div class="row g-4 align-items-center">
					<!-- 지역 -->
					<div class="col-lg-4">
						<div class="form-control-border form-control-transparent form-fs-md d-flex">
							<i class="bi bi-geo-alt fs-3 me-2 mt-2"></i>
							<div class="flex-grow-1">
								<label class="form-label">지역</label>
								<select class="form-select js-choice text-reset" id="searchArea">
									<option value="" disabled="disabled">지역 선택</option>
									<option value="" selected>전체</option>
									<option value="SEOUL">서울</option>
									<option value="GANGNEUNG">강릉</option>
									<option value="YEOSU">여수</option>
									<option value="BUSAN">부산</option>
									<option value="JEJU">제주</option>
								</select>
							</div>
						</div>
					</div>

					<!-- 일정 -->
					<div class="col-lg-4">
						<div class="d-flex">
							<i class="bi bi-calendar fs-3 me-2 mt-2"></i>
							<div class="form-control-border form-control-transparent form-fs-md">
								<label class="form-label">체크인 - 체크아웃</label>
								<input type="text" class="form-control flatpickr" data-mode="range" placeholder="Select date" id="searchDate">
							</div>
						</div>
					</div>

					<!-- 인원 -->
					<div class="col-lg-4">
						<div class="form-control-border form-control-transparent form-fs-md d-flex">
							<i class="bi bi-person fs-3 me-2 mt-2"></i>
							<div class="w-100">
								<label class="form-label">인원</label>
								<div class="dropdown guest-selector me-2">
									<input type="text" class="form-guest-selector form-control selection-result" value="2 명" id="searchGuest" data-bs-auto-close="outside" data-bs-toggle="dropdown">
								
									<ul class="dropdown-menu guest-selector-dropdown" aria-labelledby="searchGuest">
										<li class="d-flex justify-content-between">
											<div>
												<h6 class="mb-0">인원</h6>
												<small>유아 및 아동도 인원에 포함해 주세요.</small>
											</div>

											<div class="hstack gap-1 align-items-center">
												<button type="button" class="btn btn-link adult-remove p-0 mb-0"><i class="bi bi-dash-circle fs-5 fa-fw"></i></button>
												<h6 class="guest-selector-count mb-0 adults">2</h6>
												<button type="button" class="btn btn-link adult-add p-0 mb-0"><i class="bi bi-plus-circle fs-5 fa-fw"></i></button>
											</div>
										</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- 검색 버튼 -->
				<div class="btn-position-md-middle">
					<button type="button" class="icon-lg btn btn-round btn-primary mb-0" data-src="partnerList" data-act="clickSearchBtn"><i class="bi bi-search fa-fw"></i></button>
				</div>
			</form>
		</div>
	</div>
</section>

<!-- 옵션 및 숙소 리스트 -->
<section class="pt-0">
	<div class="container">
		<div class="row">
			<!-- 옵션 사이드바 -->
			<aside class="col-xl-4 col-xxl-3">
				<div class="offcanvas-xl offcanvas-end" tabindex="-1" id="offcanvasSidebar" aria-labelledby="offcanvasSidebarLabel">
					<div class="offcanvas-body flex-column p-3 p-xl-0">
						<form class="rounded-3 shadow">
							<!-- 숙소 유형 -->
							<div class="card card-body rounded-0 rounded-top p-4">
								<h6 class="mb-2">숙소 유형</h6>
								<div class="col-12" id="partnerTypeOption">
									<div class="form-check">
										<input class="form-check-input" type="checkbox" value="" id="hotelType1" data-src="partnerList" data-act="changeAllCheck">
										<label class="form-check-label" for="hotelType1">All</label>
									</div>
									<div class="form-check">
										<input class="form-check-input" type="checkbox" value="HOTEL" id="hotelType2" data-src="partnerList" data-act="changeType">
										<label class="form-check-label" for="hotelType2">호텔</label>
									</div>
									<div class="form-check">
										<input class="form-check-input" type="checkbox" value="MOTEL" id="hotelType3" data-src="partnerList" data-act="changeType">
										<label class="form-check-label" for="hotelType3">모텔</label>
									</div>
									<div class="form-check">
										<input class="form-check-input" type="checkbox" value="PENSION" id="hotelType4" data-src="partnerList" data-act="changeType">
										<label class="form-check-label" for="hotelType4">펜션</label>
									</div>
									<div class="form-check">
										<input class="form-check-input" type="checkbox" value="GUESTHOUSE" id="hotelType5" data-src="partnerList" data-act="changeType">
										<label class="form-check-label" for="hotelType5">게스트하우스</label>
									</div>
									<div class="form-check">
										<input class="form-check-input" type="checkbox" value="GLAMPING" id="hotelType6" data-src="partnerList" data-act="changeType">
										<label class="form-check-label" for="hotelType6">글램핑</label>
									</div>
								</div>
							</div>

							<hr class="my-0"> <!-- 구분선 -->

							<!-- 가격 -->
							<div class="card card-body rounded-0 p-4">
								<h6 class="mb-2">가격</h6>
								<div class="position-relative">
									<div class="noui-wrapper">
										<div class="d-flex justify-content-between">
											<input type="text" class="text-body input-with-range-min" id="minPrice" data-src="partnerList" data-act="changeOption">
											<input type="text" class="text-body input-with-range-max" id="maxPrice" data-src="partnerList" data-act="changeOption">
										</div>
										<div class="noui-slider-range mt-2" data-range-min="0" data-range-max="2000000" data-range-selected-min="50000" data-range-selected-max="500000" data-step="50000"></div>
									</div>
								</div>
							</div>

							<hr class="my-0"> <!-- 구분선 -->

							<!-- 키워드 -->
							<div class="card card-body rounded-0 p-4">
								<h6 class="mb-3">취향</h6>
								<ul class="list-inline mb-0 g-3" id="keywordList">
								</ul>
							</div>

							<hr class="my-0"> <!-- 구분선 -->

							<!-- 시설 -->
							<div class="card card-body rounded-0 rounded-bottom p-4">
								<h6 class="mb-3">시설</h6>
								<!-- 공용 시설 -->
								<span class="h7 mb-1 text-reset">공용 시설</span>
								<ul class="list-inline mb-0 g-3 commonList" id="commonList1">
								</ul>
								<div class="multi-collapse collapse" id="commonCollapes">
									<ul class="list-inline mb-0 g-3 commonList" id="commonList2">
									</ul>
								</div>
								<!-- 공용시설 더보기 -->
								<a class="p-0 mb-0 mt-2 btn-more d-flex align-items-center collapsed more-hover" data-bs-toggle="collapse" href="#commonCollapes" role="button" aria-expanded="false" aria-controls="amenitiesCollapes">
									<span class="see-more ms-1 h7">더 보기</span><span class="see-less ms-1 h7">접기</span><i class="fa-solid fa-angle-down ms-2"></i>
								</a>
								
								<!-- 객실 내 시설 -->
								<span class="h7 mt-4 mb-1 text-reset">객실 내 시설</span>
								<ul class="list-inline mb-0 g-3 roomList" id="roomList1">
								</ul>
								<div class="multi-collapse collapse" id="roomCollapes">
									<ul class="list-inline mb-0 g-3 roomList" id="roomList2">
									</ul>
								</div>
								<!-- 객실 내 시설 더보기 -->
								<a class="p-0 mb-0 mt-2 btn-more d-flex align-items-center collapsed more-hover" data-bs-toggle="collapse" href="#roomCollapes" role="button" aria-expanded="false" aria-controls="amenitiesCollapes">
									<span class="see-more ms-1 h7">더 보기</span><span class="see-less ms-1 h7">접기</span><i class="fa-solid fa-angle-down ms-2"></i>
								</a>
							</div>
						</form>
					</div>
					<!-- 옵션 초기화 버튼 -->
					<div class="d-flex justify-content-end p-2 p-xl-0 mt-xl-4">
						<button class="btn btn-link p-0 mb-0">초기화</button>
					</div>
				</div>
			</aside>

			<!-- 숙소 리스트 -->
			<div class="col-xl-8 col-xxl-9">
				<div class="vstack gap-4" id="partnerList">

				</div>
				<!-- Pagination -->
				<nav class="d-flex justify-content-center mt-5" aria-label="navigation">
					<ul class="pagination pagination-primary-soft d-inline-block d-md-flex rounded mb-0" id="pagination">
					</ul>
				</nav>
			</div>
			<!-- Main content END -->
		</div> <!-- Row END -->
	</div>
</section>
</main>

<!-- footer -->
<%@ include file="/WEB-INF/views/include/footer.jsp" %>

<!-- footerScript -->
<%@ include file="/WEB-INF/views/include/footerScript.jsp" %>

<!-- page script -->
<script src="js/user/partner/partnerList.js"></script>
<script type="text/javascript">
	partnerList.init();
</script>
</body>
</html>