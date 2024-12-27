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
Main Banner START -->
<section class="pt-0">
	<div class="container">
		<!-- Background image -->
		<div class="rounded-3 p-3 p-sm-5 banner" id="banner" style="background-image: url(assets/images/banner/7.jpg);">
			<!-- Banner title -->
			<div class="row my-2 my-xl-5"> 
				<div class="col-md-8 mx-auto"> 
					<h1 class="text-center text-white">뭔가 쓰고 싶은데</h1>
				</div>
			</div>

			<!-- Booking from START -->
			<form class="bg-mode shadow rounded-3 position-relative p-4 pe-md-5 pb-5 pb-md-4 mb-4">
				<div class="row g-4 align-items-center">
					<!-- Location -->
					<div class="col-lg-4">
						<div class="form-control-border form-control-transparent form-fs-md d-flex">
							<!-- Icon -->
							<i class="bi bi-geo-alt fs-3 me-2 mt-2"></i>
							<!-- Select input -->
							<div class="flex-grow-1">
								<label class="form-label">지역</label>
								<select class="form-select js-choice text-reset" id="searchArea">
									<option value="" disabled="disabled">지역 선택</option>
									<option value="SEOUL">서울</option>
									<option value="GANGNEUNG">강릉</option>
									<option value="YEOSU">여수</option>
									<option value="BUSAN">부산</option>
									<option value="JEJU">제주</option>
								</select>
							</div>
						</div>
					</div>

					<!-- Check in -->
					<div class="col-lg-4">
						<div class="d-flex">
							<!-- Icon -->
							<i class="bi bi-calendar fs-3 me-2 mt-2"></i>
							<!-- Date input -->
							<div class="form-control-border form-control-transparent form-fs-md">
								<label class="form-label">체크인 - 체크아웃</label>
								<input type="text" class="form-control flatpickr" data-mode="range" placeholder="Select date" id="searchDate">
							</div>
						</div>
					</div>

					<!-- Guest -->
					<div class="col-lg-4">
						<div class="form-control-border form-control-transparent form-fs-md d-flex">
							<!-- Icon -->
							<i class="bi bi-person fs-3 me-2 mt-2"></i>
							<!-- Dropdown input -->
							<div class="w-100">
								<label class="form-label">인원</label>
								<div class="dropdown guest-selector me-2">
									<input type="text" class="form-guest-selector form-control selection-result" value="2 명" id="searchGuest" data-bs-auto-close="outside" data-bs-toggle="dropdown">
								
									<!-- dropdown items -->
									<ul class="dropdown-menu guest-selector-dropdown" aria-labelledby="searchGuest">
										<!-- Adult -->
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
				<!-- Button -->
				<div class="btn-position-md-middle">
					<button class="icon-lg btn btn-round btn-primary mb-0" id="searchBtn" data-src="partnerList" data-act="clickSearchBtn"><i class="bi bi-search fa-fw"></i></button>
				</div>
			</form>
			<!-- Booking from END -->
		</div>
	</div>
</section>
<!-- =======================
Main Banner END -->

<!-- =======================
Hotel list START -->
<section class="pt-0">
	<div class="container">
		<div class="row">
			<!-- Left sidebar START -->
			<aside class="col-xl-4 col-xxl-3">
				<!-- Responsive offcanvas body START -->
				<div class="offcanvas-xl offcanvas-end" tabindex="-1" id="offcanvasSidebar" aria-labelledby="offcanvasSidebarLabel">
					<div class="offcanvas-body flex-column p-3 p-xl-0">
						<form class="rounded-3 shadow">
							<!-- 숙소 유형 -->
							<div class="card card-body rounded-0 rounded-top p-4">
								<!-- Title -->
								<h6 class="mb-2">숙소 유형</h6>
								<!-- Hotel Type group -->
								<div class="col-12">
									<!-- Checkbox -->
									<div class="form-check">
										<input class="form-check-input" type="checkbox" value="" id="hotelType1">
										<label class="form-check-label" for="hotelType1">All</label>
									</div>
									<!-- Checkbox -->
									<div class="form-check">
										<input class="form-check-input" type="checkbox" value="" id="hotelType2">
										<label class="form-check-label" for="hotelType2">호텔</label>
									</div>
									<!-- Checkbox -->
									<div class="form-check">
										<input class="form-check-input" type="checkbox" value="" id="hotelType3">
										<label class="form-check-label" for="hotelType3">모텔</label>
									</div>
									<!-- Checkbox -->
									<div class="form-check">
										<input class="form-check-input" type="checkbox" value="" id="hotelType4">
										<label class="form-check-label" for="hotelType4">펜션</label>
									</div>
									<!-- Checkbox -->
									<div class="form-check">
										<input class="form-check-input" type="checkbox" value="" id="hotelType5">
										<label class="form-check-label" for="hotelType5">게스트하우스</label>
									</div>
									<!-- Checkbox -->
									<div class="form-check">
										<input class="form-check-input" type="checkbox" value="" id="hotelType6">
										<label class="form-check-label" for="hotelType6">글램핑</label>
									</div>
								</div>
							</div>

							<hr class="my-0"> <!-- Divider -->

							<!-- 가격 -->
							<div class="card card-body rounded-0 p-4">
								<!-- Title -->
								<h6 class="mb-2">가격</h6>
								<!-- Price group -->
								<div class="position-relative">
									<div class="noui-wrapper">
										<div class="d-flex justify-content-between">
											<input type="text" class="text-body input-with-range-min">
											<input type="text" class="text-body input-with-range-max">
										</div>
										<div class="noui-slider-range mt-2" data-range-min="10000" data-range-max="2000000" data-range-selected-min="50000" data-range-selected-max="500000" data-step="10000"></div>
									</div>
								</div>
							</div>

							<hr class="my-0"> <!-- Divider -->

							<!-- 키워드 -->
							<div class="card card-body rounded-0 p-4">
								<!-- Title -->
								<h6 class="mb-3">취향</h6>
								<!-- Rating Star group -->
								<ul class="list-inline mb-0 g-3">
									<!-- Item -->
									<li class="list-inline-item mb-0 me-0">
										<input type="checkbox" class="btn-check" id="btn-check-1">
										<label class="btn btn-xm btn-light btn-success-soft-check" for="btn-check-1"><i class="fa-solid fa-hashtag"></i> 가족여행</label>
									</li>
									<!-- Item -->
									<li class="list-inline-item mb-0 me-0">
										<input type="checkbox" class="btn-check" id="btn-check-2">
										<label class="btn btn-xm btn-light btn-success-soft-check" for="btn-check-2"><i class="fa-solid fa-hashtag"></i> 파티룸</label>
									</li>
									<!-- Item -->
									<li class="list-inline-item mb-0 me-0">
										<input type="checkbox" class="btn-check" id="btn-check-3">
										<label class="btn btn-xm btn-light btn-success-soft-check" for="btn-check-3"><i class="fa-solid fa-hashtag"></i> 스파</label>
									</li>
									<!-- Item -->
									<li class="list-inline-item mb-0 me-0">
										<input type="checkbox" class="btn-check" id="btn-check-4">
										<label class="btn btn-xm btn-light btn-success-soft-check" for="btn-check-4"><i class="fa-solid fa-hashtag"></i> OTT</label>
									</li>
									<!-- Item -->
									<li class="list-inline-item mb-0 me-0">
										<input type="checkbox" class="btn-check" id="btn-check-5">
										<label class="btn btn-xm btn-light btn-success-soft-check" for="btn-check-5"><i class="fa-solid fa-hashtag"></i> 연인</label>
									</li>
									<!-- Item -->
									<li class="list-inline-item mb-0 me-0">
										<input type="checkbox" class="btn-check" id="btn-check-6">
										<label class="btn btn-xm btn-light btn-success-soft-check" for="btn-check-6"><i class="fa-solid fa-hashtag"></i> 감성숙소</label>
									</li>
									<!-- Item -->
									<li class="list-inline-item mb-0 me-0">
										<input type="checkbox" class="btn-check" id="btn-check-7">
										<label class="btn btn-xm btn-light btn-success-soft-check" for="btn-check-7"><i class="fa-solid fa-hashtag"></i> 반려견</label>
									</li>
								</ul>
							</div>

							<hr class="my-0"> <!-- Divider -->

							<!-- 시설 -->
							<div class="card card-body rounded-0 rounded-bottom p-4">
								<h6 class="mb-3">시설</h6>
								<!-- 공용 시설 -->
								<span class="h7 mb-1 text-reset">공용 시설</span>
								<ul class="list-inline mb-0 g-3">
									<li class="list-inline-item mb-0 me-0">
										<input type="checkbox" class="btn-check" id="amenities1">
										<label class="btn btn-xm btn-light btn-success-soft-check" for="amenities1">피트니스</label>
									</li>
									<li class="list-inline-item mb-0 me-0">
										<input type="checkbox" class="btn-check" id="amenities2">
										<label class="btn btn-xm btn-light btn-success-soft-check" for="amenities2">수영장</label>
									</li>
									<li class="list-inline-item mb-0 me-0">
										<input type="checkbox" class="btn-check" id="amenities3">
										<label class="btn btn-xm btn-light btn-success-soft-check" for="amenities3">레스토랑</label>
									</li>
									<li class="list-inline-item mb-0 me-0">
										<input type="checkbox" class="btn-check" id="amenities4">
										<label class="btn btn-xm btn-light btn-success-soft-check" for="amenities4">무료주차</label>
									</li>
									<li class="list-inline-item mb-0 me-0">
										<input type="checkbox" class="btn-check" id="amenities5">
										<label class="btn btn-xm btn-light btn-success-soft-check" for="amenities5">엘리베이터</label>
									</li>
								</ul>
								<div class="multi-collapse collapse" id="amenitiesCollapes">
									<ul class="list-inline mb-0 g-3">
										<li class="list-inline-item mb-0 me-0">
											<input type="checkbox" class="btn-check" id="amenities6">
											<label class="btn btn-xm btn-light btn-success-soft-check" for="amenities6">야외수영장</label>
										</li>
										<li class="list-inline-item mb-0 me-0">
											<input type="checkbox" class="btn-check" id="amenities7">
											<label class="btn btn-xm btn-light btn-success-soft-check" for="amenities7">사우나</label>
										</li>
										<li class="list-inline-item mb-0 me-0">
											<input type="checkbox" class="btn-check" id="amenities8">
											<label class="btn btn-xm btn-light btn-success-soft-check" for="amenities8">라운지</label>
										</li>
										<li class="list-inline-item mb-0 me-0">
											<input type="checkbox" class="btn-check" id="amenities9">
											<label class="btn btn-xm btn-light btn-success-soft-check" for="amenities9">건조기</label>
										</li>
										<li class="list-inline-item mb-0 me-0">
											<input type="checkbox" class="btn-check" id="amenities10">
											<label class="btn btn-xm btn-light btn-success-soft-check" for="amenities10">바베큐</label>
										</li>
									</ul>
								</div>
								<!-- Collapse button -->
								<a class="p-0 mb-0 mt-2 btn-more d-flex align-items-center collapsed more-hover" data-bs-toggle="collapse" href="#amenitiesCollapes" role="button" aria-expanded="false" aria-controls="amenitiesCollapes">
									<span class="see-more ms-1 h7">더 보기</span><span class="see-less ms-1 h7">접기</span><i class="fa-solid fa-angle-down ms-2"></i>
								</a>
								
								<!-- 객실 내 시설 -->
								<span class="h7 mt-4 mb-1 text-reset">객실 내 시설</span>
								<ul class="list-inline mb-0 g-3">
									<li class="list-inline-item mb-0 me-0">
										<input type="checkbox" class="btn-check" id="amenities11">
										<label class="btn btn-xm btn-light btn-success-soft-check" for="amenities11">샤워실</label>
									</li>
									<li class="list-inline-item mb-0 me-0">
										<input type="checkbox" class="btn-check" id="amenities12">
										<label class="btn btn-xm btn-light btn-success-soft-check" for="amenities12">욕조</label>
									</li>
									<li class="list-inline-item mb-0 me-0">
										<input type="checkbox" class="btn-check" id="amenities13">
										<label class="btn btn-xm btn-light btn-success-soft-check" for="amenities13">미니바</label>
									</li>
									<li class="list-inline-item mb-0 me-0">
										<input type="checkbox" class="btn-check" id="amenities14">
										<label class="btn btn-xm btn-light btn-success-soft-check" for="amenities14">드라이기</label>
									</li>
									<li class="list-inline-item mb-0 me-0">
										<input type="checkbox" class="btn-check" id="amenities15">
										<label class="btn btn-xm btn-light btn-success-soft-check" for="amenities15">와이파이</label>
									</li>
								</ul>
								<div class="multi-collapse collapse" id="amenitiesCollapes2">
									<ul class="list-inline mb-0 g-3">
										<li class="list-inline-item mb-0 me-0">
											<input type="checkbox" class="btn-check" id="amenities16">
											<label class="btn btn-xm btn-light btn-success-soft-check" for="amenities16">TV</label>
										</li>
										<li class="list-inline-item mb-0 me-0">
											<input type="checkbox" class="btn-check" id="amenities17">
											<label class="btn btn-xm btn-light btn-success-soft-check" for="amenities17">금고</label>
										</li>
										<li class="list-inline-item mb-0 me-0">
											<input type="checkbox" class="btn-check" id="amenities18">
											<label class="btn btn-xm btn-light btn-success-soft-check" for="amenities18">커피머신</label>
										</li>
										<li class="list-inline-item mb-0 me-0">
											<input type="checkbox" class="btn-check" id="amenities19">
											<label class="btn btn-xm btn-light btn-success-soft-check" for="amenities19">PC</label>
										</li>
										<li class="list-inline-item mb-0 me-0">
											<input type="checkbox" class="btn-check" id="amenities20">
											<label class="btn btn-xm btn-light btn-success-soft-check" for="amenities20">어메니티</label>
										</li>
									</ul>
								</div>
								<!-- Collapse button -->
								<a class="p-0 mb-0 mt-2 btn-more d-flex align-items-center collapsed more-hover" data-bs-toggle="collapse" href="#amenitiesCollapes2" role="button" aria-expanded="false" aria-controls="amenitiesCollapes">
									<span class="see-more ms-1 h7">더 보기</span><span class="see-less ms-1 h7">접기</span><i class="fa-solid fa-angle-down ms-2"></i>
								</a>
								
								<!-- 기타 시설 -->
								<span class="h7 mt-4 mb-1 text-reset">기타 시설</span>
								<ul class="list-inline mb-0 g-3">
									<li class="list-inline-item mb-0 me-0">
										<input type="checkbox" class="btn-check" id="amenities21">
										<label class="btn btn-xm btn-light btn-success-soft-check" for="amenities21">장애인편의</label>
									</li>
									<li class="list-inline-item mb-0 me-0">
										<input type="checkbox" class="btn-check" id="amenities22">
										<label class="btn btn-xm btn-light btn-success-soft-check" for="amenities22">금연</label>
									</li>
									<li class="list-inline-item mb-0 me-0">
										<input type="checkbox" class="btn-check" id="amenities23">
										<label class="btn btn-xm btn-light btn-success-soft-check" for="amenities23">짐보관가능</label>
									</li>
									<li class="list-inline-item mb-0 me-0">
										<input type="checkbox" class="btn-check" id="amenities24">
										<label class="btn btn-xm btn-light btn-success-soft-check" for="amenities24">반려견동반</label>
									</li>
									<li class="list-inline-item mb-0 me-0">
										<input type="checkbox" class="btn-check" id="amenities25">
										<label class="btn btn-xm btn-light btn-success-soft-check" for="amenities25">조식제공</label>
									</li>
								</ul>
								<div class="multi-collapse collapse" id="amenitiesCollapes3">
									<ul class="list-inline mb-0 g-3">
										<li class="list-inline-item mb-0 me-0">
											<input type="checkbox" class="btn-check" id="amenities26">
											<label class="btn btn-xm btn-light btn-success-soft-check" for="amenities26">개인사물함</label>
										</li>
										<li class="list-inline-item mb-0 me-0">
											<input type="checkbox" class="btn-check" id="amenities27">
											<label class="btn btn-xm btn-light btn-success-soft-check" for="amenities27">픽업서비스</label>
										</li>
										<li class="list-inline-item mb-0 me-0">
											<input type="checkbox" class="btn-check" id="amenities28">
											<label class="btn btn-xm btn-light btn-success-soft-check" for="amenities28">객실내취사</label>
										</li>
										<li class="list-inline-item mb-0 me-0">
											<input type="checkbox" class="btn-check" id="amenities29">
											<label class="btn btn-xm btn-light btn-success-soft-check" for="amenities29">캠프파이어</label>
										</li>
									</ul>
								</div>
								<!-- Collapse button -->
								<a class="p-0 mb-0 mt-2 btn-more d-flex align-items-center collapsed more-hover" data-bs-toggle="collapse" href="#amenitiesCollapes3" role="button" aria-expanded="false" aria-controls="amenitiesCollapes">
									<span class="see-more ms-1 h7">더 보기</span><span class="see-less ms-1 h7">접기</span><i class="fa-solid fa-angle-down ms-2"></i>
								</a>
							</div>
							<!-- Amenities END -->
						</form><!-- Form End -->
					</div>
					<!-- Buttons -->
					<div class="d-flex justify-content-end p-2 p-xl-0 mt-xl-4">
						<button class="btn btn-link p-0 mb-0">초기화</button>
					</div>
				</div>
				<!-- Responsive offcanvas body END -->
			</aside>
			<!-- Left sidebar END -->

			<!-- Main content START -->
			<div class="col-xl-8 col-xxl-9">
				<div class="vstack gap-4" id="partnerList">

					<!-- Card item START -->
					<div class="card shadow p-2">
						<div class="row g-0">
							<!-- Card img -->
							<div class="col-md-5 position-relative">

								<!-- Slider START -->
								<div class="tiny-slider arrow-round arrow-xs arrow-dark overflow-hidden rounded-2 card-z-top">
									<div class="tiny-slider-inner" data-autoplay="false" data-arrow="true" data-dots="false" data-items="1">
										<!-- Image item -->
										<div><img src="assets/images/category/hotel/4by3/04.jpg" alt="Card image"></div>

										<!-- Image item -->
										<div><img src="assets/images/category/hotel/4by3/02.jpg" alt="Card image"></div>

										<!-- Image item -->
										<div><img src="assets/images/category/hotel/4by3/03.jpg" alt="Card image"></div>

										<!-- Image item -->
										<div><img src="assets/images/category/hotel/4by3/01.jpg" alt="Card image"></div>
									</div>
								</div>
								<!-- Slider END -->
							</div>

							<!-- Card body -->
							<div class="col-md-7 partner-card" data-src="partnerList" data-act="clickPartner">
								<div class="card-body py-md-2 d-flex flex-column h-100 position-relative">

									<!-- Rating and buttons -->
									<div class="d-flex justify-content-between align-items-center">
										<ul class="list-inline mb-0">
											<li class="list-inline-item me-0 small"><i class="fa-solid fa-star text-warning"></i></li>
											<li class="list-inline-item me-0 small"><i class="fa-solid fa-star text-warning"></i></li>
											<li class="list-inline-item me-0 small"><i class="fa-solid fa-star text-warning"></i></li>
											<li class="list-inline-item me-0 small"><i class="fa-solid fa-star text-warning"></i></li>
											<li class="list-inline-item me-0 small"><i class="fa-solid fa-star-half-alt text-warning"></i></li>
										</ul>
										
										<span class="badge bg-primary bg-opacity-10 text-primary">호텔</span>
									</div>

									<!-- Title -->
									<h5 class="card-title mt-2 mb-1"><a href="javascript:;">그랜드 인터컨티넨탈 서울 파르나스 </a></h5>
									<small><i class="bi bi-geo-alt me-2"></i>서울 강남구 테헤란로 521</small>
									<!-- Amenities -->
									<ul class="nav nav-divider mt-3">
										<li class="nav-item">수영장</li>
										<li class="nav-item">Wifi</li>
										<li class="nav-item">무료주차</li>
									</ul>

									<!-- Price and Button -->
									<div class="d-sm-flex justify-content-sm-between align-items-center mt-3 mt-md-auto">
										<!-- Button -->
										<div class="d-flex align-items-center">
										</div>
										<!-- Price -->
										<div class="d-flex align-items-center">
											<h5 class="fw-bold mb-0 me-1"><i class="fa-solid fa-won-sign"></i> 205,000</h5>
											<span class="mb-0 me-2"> / 일</span>
										</div>                  
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- Card item END -->

					<!-- Card item START -->
					<div class="card shadow p-2">
						<div class="row g-0">
							<!-- Card img -->
							<div class="col-md-5">
								<img src="assets/images/category/hotel/4by3/10.jpg" class="card-img rounded-2" alt="Card image">
							</div>

							<!-- Card body -->
							<div class="col-md-7 partner-card" data-src="partnerList" data-act="clickPartner">
								<div class="card-body py-md-2 d-flex flex-column h-100 position-relative">

									<!-- Rating and buttons -->
									<div class="d-flex justify-content-between align-items-center">
										<ul class="list-inline mb-0">
											<li class="list-inline-item me-0 small"><i class="fa-solid fa-star text-warning"></i></li>
											<li class="list-inline-item me-0 small"><i class="fa-solid fa-star text-warning"></i></li>
											<li class="list-inline-item me-0 small"><i class="fa-solid fa-star text-warning"></i></li>
											<li class="list-inline-item me-0 small"><i class="fa-solid fa-star text-warning"></i></li>
											<li class="list-inline-item me-0 small"><i class="fa-solid fa-star-half-alt text-warning"></i></li>
										</ul>
										
										<span class="badge bg-primary bg-opacity-10 text-primary">호텔</span>
									</div>

									<!-- Title -->
									<h5 class="card-title mt-2 mb-1"><a href="javascript:;">그랜드 인터컨티넨탈 서울 파르나스 </a></h5>
									<small><i class="bi bi-geo-alt me-2"></i>서울 강남구 테헤란로 521</small>
									<!-- Amenities -->
									<ul class="nav nav-divider mt-3">
										<li class="nav-item">수영장</li>
										<li class="nav-item">Wifi</li>
										<li class="nav-item">무료주차</li>
									</ul>

									<!-- Price and Button -->
									<div class="d-sm-flex justify-content-sm-between align-items-center mt-3 mt-md-auto">
										<!-- Button -->
										<div class="d-flex align-items-center">
										</div>
										<!-- Price -->
										<div class="d-flex align-items-center">
											<h5 class="fw-bold mb-0 me-1"><i class="fa-solid fa-won-sign"></i> 205,000</h5>
											<span class="mb-0 me-2"> / 일</span>
										</div>                 
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- Card item END -->

					<!-- Card item START -->
					<div class="card shadow p-2">
						<div class="row g-0">
							<!-- Card img -->
							<div class="col-md-5">
								<img src="assets/images/category/hotel/4by3/11.jpg" class="card-img rounded-2" alt="Card image">
							</div>

							<!-- Card body -->
							<div class="col-md-7 partner-card" data-src="partnerList" data-act="clickPartner">
								<div class="card-body py-md-2 d-flex flex-column h-100 position-relative">

									<!-- Rating and buttons -->
									<div class="d-flex justify-content-between align-items-center">
										<ul class="list-inline mb-0">
											<li class="list-inline-item me-0 small"><i class="fa-solid fa-star text-warning"></i></li>
											<li class="list-inline-item me-0 small"><i class="fa-solid fa-star text-warning"></i></li>
											<li class="list-inline-item me-0 small"><i class="fa-solid fa-star text-warning"></i></li>
											<li class="list-inline-item me-0 small"><i class="fa-solid fa-star text-warning"></i></li>
											<li class="list-inline-item me-0 small"><i class="fa-solid fa-star-half-alt text-warning"></i></li>
										</ul>
										
										<span class="badge bg-primary bg-opacity-10 text-primary">호텔</span>
									</div>

									<!-- Title -->
									<h5 class="card-title mt-2 mb-1"><a href="javascript:;">그랜드 인터컨티넨탈 서울 파르나스 </a></h5>
									<small><i class="bi bi-geo-alt me-2"></i>서울 강남구 테헤란로 521</small>
									<!-- Amenities -->
									<ul class="nav nav-divider mt-3">
										<li class="nav-item">수영장</li>
										<li class="nav-item">Wifi</li>
										<li class="nav-item">무료주차</li>
									</ul>

									<!-- List -->
									<ul class="list-group list-group-borderless small mb-0 mt-2">
										<li class="list-group-item d-flex text-success p-0">
											<i class="bi bi-patch-check-fill me-2"></i>조식 제공
										</li>
									</ul>
									
									<!-- Price and Button -->
									<div class="d-sm-flex justify-content-sm-between align-items-center mt-3 mt-md-auto">
										<!-- Button -->
										<div class="d-flex align-items-center">
										</div>
										<!-- Price -->
										<div class="d-flex align-items-center">
											<h5 class="fw-bold mb-0 me-1"><i class="fa-solid fa-won-sign"></i> 205,000</h5>
											<span class="mb-0 me-2"> / 일</span>
										</div>                 
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- Card item END -->

					<!-- Card item START -->
					<div class="card shadow p-2">
						<div class="row g-0">
							<!-- Card img -->
							<div class="col-md-5 position-relative">

								<!-- Slider START -->
								<div class="tiny-slider arrow-round arrow-xs arrow-dark overflow-hidden rounded-2">
									<div class="tiny-slider-inner" data-autoplay="false" data-arrow="true" data-dots="false" data-items="1">
										<!-- Image item -->
										<div><img src="assets/images/category/hotel/4by3/08.jpg" alt="Card image"></div>

										<!-- Image item -->
										<div><img src="assets/images/category/hotel/4by3/02.jpg" alt="Card image"></div>

										<!-- Image item -->
										<div><img src="assets/images/category/hotel/4by3/03.jpg" alt="Card image"></div>

										<!-- Image item -->
										<div><img src="assets/images/category/hotel/4by3/06.jpg" alt="Card image"></div>
									</div>
								</div>
								<!-- Slider END -->
							</div>

							<!-- Card body -->
							<div class="col-md-7 partner-card" data-src="partnerList" data-act="clickPartner">
								<div class="card-body py-md-2 d-flex flex-column h-100 position-relative">

									<!-- Rating and buttons -->
									<div class="d-flex justify-content-between align-items-center">
										<ul class="list-inline mb-0">
											<li class="list-inline-item me-0 small"><i class="fa-solid fa-star text-warning"></i></li>
											<li class="list-inline-item me-0 small"><i class="fa-solid fa-star text-warning"></i></li>
											<li class="list-inline-item me-0 small"><i class="fa-solid fa-star text-warning"></i></li>
											<li class="list-inline-item me-0 small"><i class="fa-solid fa-star text-warning"></i></li>
											<li class="list-inline-item me-0 small"><i class="fa-solid fa-star-half-alt text-warning"></i></li>
										</ul>
										
										<span class="badge bg-primary bg-opacity-10 text-primary">호텔</span>
									</div>

									<!-- Title -->
									<h5 class="card-title mt-2 mb-1"><a href="javascript:;">그랜드 인터컨티넨탈 서울 파르나스 </a></h5>
									<small><i class="bi bi-geo-alt me-2"></i>서울 강남구 테헤란로 521</small>
									<!-- Amenities -->
									<ul class="nav nav-divider mt-3">
										<li class="nav-item">수영장</li>
										<li class="nav-item">Wifi</li>
										<li class="nav-item">무료주차</li>
									</ul>

									<!-- List -->
									<ul class="list-group list-group-borderless small mb-0 mt-2">
										<li class="list-group-item d-flex text-success p-0">
											<i class="bi bi-patch-check-fill me-2"></i>조식 제공
										</li>
									</ul>
									
									<!-- Price and Button -->
									<div class="d-sm-flex justify-content-sm-between align-items-center mt-3 mt-md-auto">
										<!-- Button -->
										<div class="d-flex align-items-center">
										</div>
										<!-- Price -->
										<div class="d-flex align-items-center">
											<h5 class="fw-bold mb-0 me-1"><i class="fa-solid fa-won-sign"></i> 205,000</h5>
											<span class="mb-0 me-2"> / 일</span>
										</div>             
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- Card item END -->

					<!-- Card item START -->
					<div class="card shadow p-2 partner-card">
						<div class="row g-0">
							<!-- Card img -->
							<div class="col-md-5">
								<img src="assets/images/category/hotel/4by3/10.jpg" class="card-img rounded-2" alt="Card image">
							</div>

							<!-- Card body -->
							<div class="col-md-7 partner-card" data-src="partnerList" data-act="clickPartner">
								<div class="card-body py-md-2 d-flex flex-column h-100 position-relative">

									<!-- Rating and buttons -->
									<div class="d-flex justify-content-between align-items-center">
										<ul class="list-inline mb-0">
											<li class="list-inline-item me-0 small"><i class="fa-solid fa-star text-warning"></i></li>
											<li class="list-inline-item me-0 small"><i class="fa-solid fa-star text-warning"></i></li>
											<li class="list-inline-item me-0 small"><i class="fa-solid fa-star text-warning"></i></li>
											<li class="list-inline-item me-0 small"><i class="fa-solid fa-star text-warning"></i></li>
											<li class="list-inline-item me-0 small"><i class="fa-solid fa-star-half-alt text-warning"></i></li>
										</ul>
										
										<span class="badge bg-primary bg-opacity-10 text-primary">호텔</span>
									</div>

									<!-- Title -->
									<h5 class="card-title mt-2 mb-1"><a href="javascript:;">그랜드 인터컨티넨탈 서울 파르나스 </a></h5>
									<small><i class="bi bi-geo-alt me-2"></i>서울 강남구 테헤란로 521</small>
									<!-- Amenities -->
									<ul class="nav nav-divider mt-3">
										<li class="nav-item">수영장</li>
										<li class="nav-item">Wifi</li>
										<li class="nav-item">무료주차</li>
									</ul>

									<!-- List -->
									<ul class="list-group list-group-borderless small mb-0 mt-2">
										<li class="list-group-item d-flex text-success p-0">
											<i class="bi bi-patch-check-fill me-2"></i>조식 제공
										</li>
									</ul>
									
									<!-- Price and Button -->
									<div class="d-sm-flex justify-content-sm-between align-items-center mt-3 mt-md-auto">
										<!-- Button -->
										<div class="d-flex align-items-center">
										</div>
										<!-- Price -->
										<div class="d-flex align-items-center">
											<h5 class="fw-bold mb-0 me-1"><i class="fa-solid fa-won-sign"></i> 205,000</h5>
											<span class="mb-0 me-2"> / 일</span>
										</div>                 
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- Card item END -->

					<!-- Pagination -->
					<nav class="d-flex justify-content-center" aria-label="navigation">
						<ul class="pagination pagination-primary-soft d-inline-block d-md-flex rounded mb-0" id="pagination">
						</ul>
					</nav>

				</div>
			</div>
			<!-- Main content END -->
		</div> <!-- Row END -->
	</div>
</section>
<!-- =======================
Hotel list END -->

</main>

<!-- footer -->
<%@ include file="/WEB-INF/views/include/footer.jsp" %>

<!-- footerScript -->
<%@ include file="/WEB-INF/views/include/footerScript.jsp" %>

<!-- page script -->
<script src="js/user/partnerList.js"></script>
<script type="text/javascript">
	partnerList.init();
</script>
</body>
</html>