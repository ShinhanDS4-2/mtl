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
Search START -->
<section class="py-3 py-sm-0">
	<div class="container">
		<!-- Offcanvas button for search -->
		<button class="btn btn-primary d-sm-none w-100 mb-0" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasEditsearch" aria-controls="offcanvasEditsearch"><i class="bi bi-pencil-square me-2"></i>Edit Search</button>

		<!-- Search with offcanvas START -->
		<div class="offcanvas-sm offcanvas-top" tabindex="-1" id="offcanvasEditsearch" aria-labelledby="offcanvasEditsearchLabel">
			<div class="offcanvas-header">
				<h5 class="offcanvas-title" id="offcanvasEditsearchLabel">일정 검색</h5>
				<button type="button" class="btn-close" data-bs-dismiss="offcanvas" data-bs-target="#offcanvasEditsearch" aria-label="Close"></button>
			</div>
			<div class="offcanvas-body p-2">
				<div class="bg-light p-4 rounded w-100">
					<form class="row g-4">
						<!-- Location -->
						<div class="col-md-6 col-lg-4">
							<div class="form-size-lg form-fs-md">
								<!-- Select input -->
								<label class="form-label">지역</label>
								<select class="form-select js-choice" data-search-enabled="true">
									<option value="">지역 선택</option>
									<option selected>서울</option>
									<option>강릉</option>
									<option>여수</option>
									<option>부산</option>
									<option>제주</option>
								</select>
							</div>
						</div>

						<!-- Check in -->
						<div class="col-md-6 col-lg-3">
							<!-- Date input -->
							<div class="form-fs-md">
								<label class="form-label">체크인 - 체크아웃</label>
								<input type="text" class="form-control form-control-lg flatpickr" data-mode="range" placeholder="Select date">
							</div>
						</div>

						<!-- Guest -->
						<div class="col-md-6 col-lg-3">
							<div class="form-fs-md">
								<!-- Dropdown input -->
								<div class="w-100">
									<label class="form-label">인원</label>
									<div class="dropdown guest-selector me-2">
										<input type="text" class="form-guest-selector form-control form-control-lg selection-result" value="2 명" id="dropdownguest" data-bs-auto-close="outside" data-bs-toggle="dropdown">
									
										<!-- dropdown items -->
										<ul class="dropdown-menu guest-selector-dropdown" aria-labelledby="dropdownguest">
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

						<!-- Button -->
						<div class="col-md-6 col-lg-2 mt-md-auto">
							<a class="btn btn-lg btn-primary w-100 mb-0" href="#"><i class="bi bi-search fa-fw"></i> 검색</a>
						</div>
					</form>
				</div>
			</div>
		</div>
		<!-- Search with offcanvas END -->
	</div>
</section>
<!-- =======================
Search END -->
	
<!-- =======================
Main Title START -->
<section class="py-0 pt-sm-5">
	<div class="container position-relative">
		<!-- Title and button START -->
		<div class="row mb-3">
			<div class="col-12">
				<!-- Meta -->
				<div class="d-lg-flex justify-content-lg-between mb-1">
					<!-- Title -->
					<div class="mb-2 mb-lg-0">
						<h1 class="fs-2" id="partnerName"></h1>
					</div>
				</div>
			</div>
		</div>
		<!-- Title and button END -->
	</div>
</section>
<!-- =======================
Main Title END -->

<!-- =======================
Image gallery START -->
<section class="card-grid pt-0">
	<div class="container">
		<div class="row g-2">
			<!-- Image -->
			<div class="col-md-6">
				<a data-glightbox data-gallery="gallery" href="assets/images/gallery/14.jpg">
					<div class="card card-grid-lg card-element-hover card-overlay-hover overflow-hidden" style="background-image:url(assets/images/gallery/14.jpg); background-position: center left; background-size: cover;">
						<!-- Card hover element -->
						<div class="hover-element position-absolute w-100 h-100">
							<i class="bi bi-fullscreen fs-6 text-white position-absolute top-50 start-50 translate-middle bg-dark rounded-1 p-2 lh-1"></i>
						</div>
					</div>
				</a>
			</div>

			<div class="col-md-6">
				<!-- Card item START -->
				<div class="row g-2"> 
					<!-- Image -->
					<div class="col-12">
						<a data-glightbox data-gallery="gallery" href="assets/images/gallery/13.jpg">
							<div class="card card-grid-sm card-element-hover card-overlay-hover overflow-hidden" style="background-image:url(assets/images/gallery/13.jpg); background-position: center left; background-size: cover;">
								<!-- Card hover element -->
								<div class="hover-element position-absolute w-100 h-100">
									<i class="bi bi-fullscreen fs-6 text-white position-absolute top-50 start-50 translate-middle bg-dark rounded-1 p-2 lh-1"></i>
								</div>
							</div>
						</a>	
					</div>

					<!-- Image -->
					<div class="col-md-6">
						<a data-glightbox data-gallery="gallery" href="assets/images/gallery/12.jpg">
							<div class="card card-grid-sm card-element-hover card-overlay-hover overflow-hidden" style="background-image:url(assets/images/gallery/12.jpg); background-position: center left; background-size: cover;">
								<!-- Card hover element -->
								<div class="hover-element position-absolute w-100 h-100">
									<i class="bi bi-fullscreen fs-6 text-white position-absolute top-50 start-50 translate-middle bg-dark rounded-1 p-2 lh-1"></i>
								</div>
							</div>
						</a>	
					</div>

					<!-- Images -->
					<div class="col-md-6">
						<div class="card card-grid-sm overflow-hidden" style="background-image:url(assets/images/gallery/11.jpg); background-position: center left; background-size: cover;">
							<!-- Background overlay -->
							<div class="bg-overlay bg-dark opacity-7"></div>

							<!-- Popup Images -->
							<a data-glightbox="" data-gallery="gallery" href="assets/images/gallery/11.jpg" class="stretched-link z-index-9"></a>
							<a data-glightbox="" data-gallery="gallery" href="assets/images/gallery/15.jpg"></a>
							<a data-glightbox="" data-gallery="gallery" href="assets/images/gallery/16.jpg"></a>

							<!-- Overlay text -->
							<div class="card-img-overlay d-flex h-100 w-100">
								<h6 class="card-title m-auto fw-light text-decoration-underline"><a href="#" class="text-white">View all</a></h6>
							</div>
						</div>
					</div>
				</div>
				<!-- Card item END -->
			</div>
		</div>
	</div>
</section>
<!-- =======================
Image gallery END -->

<!-- =======================
About hotel START -->
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
							<ul class="list-group list-group-borderless mb-0">
								<li class="list-group-item h6 fw-light d-flex mb-0"><i class="bi bi-patch-check-fill text-success me-2"></i>Every hotel staff to have Proper PPT kit for COVID-19</li>
								<li class="list-group-item h6 fw-light d-flex mb-0"><i class="bi bi-patch-check-fill text-success me-2"></i>Every staff member wears face masks and gloves at all service times.</li>
								<li class="list-group-item h6 fw-light d-flex mb-0"><i class="bi bi-patch-check-fill text-success me-2"></i>Hotel staff ensures to maintain social distancing at all times.</li>
								<li class="list-group-item h6 fw-light d-flex mb-0"><i class="bi bi-patch-check-fill text-success me-2"></i>The hotel has In-Room Dining options available </li>
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
								<!-- Activities -->
								<div class="col-sm-6">
									<h6><i class="fa-solid fa-biking me-2"></i>Activities</h6>
									<!-- List -->
									<ul class="list-group list-group-borderless mt-2 mb-0">
										<li class="list-group-item pb-0">
											<i class="fa-solid fa-check-circle text-success me-2"></i>Swimming pool
										</li>
										<li class="list-group-item pb-0">
											<i class="fa-solid fa-check-circle text-success me-2"></i>Spa
										</li>
										<li class="list-group-item pb-0">
											<i class="fa-solid fa-check-circle text-success me-2"></i>Kids' play area
										</li>
										<li class="list-group-item pb-0">
											<i class="fa-solid fa-check-circle text-success me-2"></i>Gym
										</li>
									</ul>
								</div>
	
								<!-- Payment Method -->
								<div class="col-sm-6">
									<h6><i class="fa-solid fa-credit-card me-2"></i>Payment Method</h6>
									<!-- List -->
									<ul class="list-group list-group-borderless mt-2 mb-0">
										<li class="list-group-item pb-0">
											<i class="fa-solid fa-check-circle text-success me-2"></i>Credit card (Visa, Master card)
										</li>
										<li class="list-group-item pb-0">
											<i class="fa-solid fa-check-circle text-success me-2"></i>Cash
										</li>
										<li class="list-group-item pb-0">
											<i class="fa-solid fa-check-circle text-success me-2"></i>Debit Card
										</li>
									</ul>
								</div>
	
								<!-- Services -->
								<div class="col-sm-6">
									<h6><i class="fa-solid fa-concierge-bell me-2"></i>Services</h6>
									<!-- List -->
									<ul class="list-group list-group-borderless mt-2 mb-0">
										<li class="list-group-item pb-0">
											<i class="fa-solid fa-check-circle text-success me-2"></i>Dry cleaning
										</li>
										<li class="list-group-item pb-0">
											<i class="fa-solid fa-check-circle text-success me-2"></i>Room Service
										</li>
										<li class="list-group-item pb-0">
											<i class="fa-solid fa-check-circle text-success me-2"></i>Special service
										</li>
										<li class="list-group-item pb-0">
											<i class="fa-solid fa-check-circle text-success me-2"></i>Waiting Area
										</li>
										<li class="list-group-item pb-0">
											<i class="fa-solid fa-check-circle text-success me-2"></i>Secrete smoking area
										</li>
										<li class="list-group-item pb-0">
											<i class="fa-solid fa-check-circle text-success me-2"></i>Concierge
										</li>
										<li class="list-group-item pb-0">
											<i class="fa-solid fa-check-circle text-success me-2"></i>Laundry facilities
										</li>
										<li class="list-group-item pb-0">
											<i class="fa-solid fa-check-circle text-success me-2"></i>Ironing Service
										</li>
										<li class="list-group-item pb-0">
											<i class="fa-solid fa-check-circle text-success me-2"></i>Lift
										</li>
									</ul>
								</div>
	
								<!-- Safety & Security -->
								<div class="col-sm-6">
									<h6><i class="bi bi-shield-fill-check me-2"></i>Safety & Security</h6>
									<!-- List -->
									<ul class="list-group list-group-borderless mt-2 mb-4 mb-sm-5">
										<li class="list-group-item pb-0">
											<i class="fa-solid fa-check-circle text-success me-2"></i>Doctor on Call
										</li>
									</ul>
	
									<h6><i class="fa-solid fa-volume-up me-2"></i>Staff Language</h6>
									<!-- List -->
									<ul class="list-group list-group-borderless mt-2 mb-0">
										<li class="list-group-item pb-0">
											<i class="fa-solid fa-check-circle text-success me-2"></i>English
										</li>
										<li class="list-group-item pb-0">
											<i class="fa-solid fa-check-circle text-success me-2"></i>Spanish
										</li>
										<li class="list-group-item pb-0">
											<i class="fa-solid fa-check-circle text-success me-2"></i>Hindi
										</li>
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
							<div class="vstack gap-4">

								<!-- Room item START -->
								<div class="card shadow p-3">
									<div class="row g-4">
										<!-- Card img -->
										<div class="col-md-5 position-relative">
											<!-- Slider START -->
											<div class="tiny-slider arrow-round arrow-xs arrow-dark overflow-hidden rounded-2">
												<div class="tiny-slider-inner" data-autoplay="true" data-arrow="true" data-dots="false" data-items="1">
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

											<!-- Button -->
											<a href="#" class="btn btn-link p-0 mb-0 mt-1 text-primary more-hover" data-bs-toggle="modal" data-bs-target="#roomDetail">
												<i class="bi bi-eye-fill me-1"></i>객실 상세 정보
											</a>
										</div>

										<!-- Card body -->
										<div class="col-md-7">
											<div class="card-body d-flex flex-column h-100 p-0">
					
												<!-- Title -->
												<h5 class="card-title">Luxury Room with Balcony</h5>

												<!-- Amenities -->
												<ul class="nav nav-divider mb-2">
													<li class="nav-item">Air Conditioning</li>
													<li class="nav-item">Wifi</li>
													<li class="nav-item">Kitchen</li>
												</ul>

												<p class="text-success mb-0">Free Cancellation till 7 Jan 2022</p>
												
												<!-- Price and Button -->
												<div class="d-sm-flex justify-content-sm-between align-items-center mt-auto">
													<!-- Price -->
													<div class="d-flex align-items-center">
														<h5 class="fw-bold mb-0 me-1"><i class="fa-solid fa-won-sign"></i> 205,000</h5>
														<span class="mb-0 me-2"> / 일</span>
													</div>
													<!-- Button -->
													<div class="mt-3 mt-sm-0">
														<a href="reservation" class="btn btn-sm btn-primary mb-0">객실 예약</a>    
													</div>          
												</div>
											</div>
										</div>
									</div>
								</div>
								<!-- Room item END -->
	
								<!-- Room item START -->
								<div class="card shadow p-3">
									<div class="row g-4">
										<!-- Card img -->
										<div class="col-md-5 position-relative">
											<!-- Slider START -->
											<div class="tiny-slider arrow-round arrow-xs arrow-dark overflow-hidden rounded-2">
												<div class="tiny-slider-inner" data-autoplay="true" data-arrow="true" data-dots="false" data-items="1">
													<!-- Image item -->
													<div><img src="assets/images/category/hotel/4by3/03.jpg" alt="Card image"></div>

													<!-- Image item -->
													<div><img src="assets/images/category/hotel/4by3/02.jpg" alt="Card image"></div>

													<!-- Image item -->
													<div><img src="assets/images/category/hotel/4by3/04.jpg" alt="Card image"></div>

													<!-- Image item -->
													<div><img src="assets/images/category/hotel/4by3/01.jpg" alt="Card image"></div>
												</div>
											</div>
											<!-- Slider END -->

											<!-- Button -->
											<a href="#" class="btn btn-link p-0 mb-0 mt-1 text-primary more-hover" data-bs-toggle="modal" data-bs-target="#roomDetail">
												<i class="bi bi-eye-fill me-1"></i>객실 상세 정보
											</a>
										</div>

										<!-- Card body -->
										<div class="col-md-7">
											<div class="card-body d-flex flex-column p-0 h-100">
					
												<!-- Title -->
												<h5 class="card-title">Deluxe Pool View with Breakfast</h5>

												<!-- Amenities -->
												<ul class="nav nav-divider mb-2">
													<li class="nav-item">Air Conditioning</li>
													<li class="nav-item">Wifi</li>
													<li class="nav-item">Kitchen</li>
												</ul>

												<p class="text-danger mb-3">Non Refundable</p>
					
												<!-- Price and Button -->
												<div class="d-sm-flex justify-content-sm-between align-items-center mt-auto">
													<!-- Price -->
													<div class="d-flex align-items-center">
														<h5 class="fw-bold mb-0 me-1"><i class="fa-solid fa-won-sign"></i> 205,000</h5>
														<span class="mb-0 me-2"> / 일</span>
													</div>
													<!-- Button -->
													<div class="mt-3 mt-sm-0">
														<a href="reservation" class="btn btn-sm btn-primary mb-0">객실 예약</a>    
													</div>          
												</div>
											</div>
										</div>
									</div>
								</div>
								<!-- Room item END -->
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
						<div class="card-body pt-4 p-0">
							<!-- Progress bar and rating START -->
							<div class="card bg-light p-4 mb-4">
								<div class="row g-4 align-items-center">
									<!-- Rating info -->
									<div class="col-md-4">
										<div class="text-center">
											<!-- Info -->
											<h2 class="mb-0">4.5</h2>
											<!-- Star -->
											<ul class="list-inline mb-0">
												<li class="list-inline-item me-0"><i class="fa-solid fa-star text-warning"></i></li>
												<li class="list-inline-item me-0"><i class="fa-solid fa-star text-warning"></i></li>
												<li class="list-inline-item me-0"><i class="fa-solid fa-star text-warning"></i></li>
												<li class="list-inline-item me-0"><i class="fa-solid fa-star text-warning"></i></li>
												<li class="list-inline-item me-0"><i class="fa-solid fa-star-half-alt text-warning"></i></li>
											</ul>
										</div>
									</div>

									<!-- Progress-bar START -->
									<div class="col-md-8">
										<div class="card-body p-0">
											<div class="row gx-3 g-2 align-items-center">
												<!-- Progress bar and Rating -->
												<div class="col-9 col-sm-10">
													<!-- Progress item -->
													<div class="progress progress-sm bg-warning bg-opacity-15">
														<div class="progress-bar bg-warning" role="progressbar" style="width: 95%" aria-valuenow="95" aria-valuemin="0" aria-valuemax="100">
														</div>
													</div>
												</div>
												<!-- Percentage -->
												<div class="col-3 col-sm-2 text-end">
													<span class="h6 fw-light mb-0">85%</span>
												</div>

												<!-- Progress bar and Rating -->
												<div class="col-9 col-sm-10">
													<!-- Progress item -->
													<div class="progress progress-sm bg-warning bg-opacity-15">
														<div class="progress-bar bg-warning" role="progressbar" style="width: 75%" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100">
														</div>
													</div>
												</div>
												<!-- Percentage -->
												<div class="col-3 col-sm-2 text-end">
													<span class="h6 fw-light mb-0">75%</span>
												</div>

												<!-- Progress bar and Rating -->
												<div class="col-9 col-sm-10">
													<!-- Progress item -->
													<div class="progress progress-sm bg-warning bg-opacity-15">
														<div class="progress-bar bg-warning" role="progressbar" style="width: 60%" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100">
														</div>
													</div>
												</div>
												<!-- Percentage -->
												<div class="col-3 col-sm-2 text-end">
													<span class="h6 fw-light mb-0">60%</span>
												</div>

												<!-- Progress bar and Rating -->
												<div class="col-9 col-sm-10">
													<!-- Progress item -->
													<div class="progress progress-sm bg-warning bg-opacity-15">
														<div class="progress-bar bg-warning" role="progressbar" style="width: 20%" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
														</div>
													</div>
												</div>
												<!-- Percentage -->
												<div class="col-3 col-sm-2 text-end">
													<span class="h6 fw-light mb-0">15%</span>
												</div>
											</div> <!-- Row END -->
										</div>
									</div>
									<!-- Progress-bar END -->

								</div>
							</div>
							<!-- Progress bar and rating END -->

							<!-- Review item START -->
							<div class="d-md-flex my-4">
								<!-- Text -->
								<div>
									<div class="d-flex justify-content-between mt-1 mt-md-0">
										<div>
											<h6 class="me-3 mb-0"><i class="fa-solid fa-user-pen"></i> Jacqueline Miller</h6>
											<!-- Info -->
											<ul class="nav nav-divider small mb-2">
												<li class="nav-item">Stayed 13 Nov 2022</li>
												<li class="nav-item">4 Reviews written</li>
											</ul>
										</div>
										<!-- Review star -->
										<div class="icon-md rounded text-bg-warning fs-6">4.5</div>
									</div>
									
									<p class="mb-2">Handsome met debating sir dwelling age material. As style lived he worse dried. Offered related so visitors we private removed. Moderate do subjects to distance. </p>
									
									<!-- Images -->
									<div class="row g-4">
										<div class="col-4 col-sm-3 col-lg-2">
											<img src="assets/images/category/hotel/4by3/07.jpg" class="rounded" alt="">
										</div>
										<div class="col-4 col-sm-3 col-lg-2">
											<img src="assets/images/category/hotel/4by3/08.jpg" class="rounded" alt="">
										</div>
										<div class="col-4 col-sm-3 col-lg-2">
											<img src="assets/images/category/hotel/4by3/05.jpg" class="rounded" alt="">
										</div>
									</div>
								</div>
							</div>

							<!-- Child review START -->
							<div class="my-4">
								<div class="d-md-flex p-3 bg-light rounded-3">
									<div class="mt-2 mt-md-0">
										<h6 class="mb-1"><i class="fa-solid fa-hotel"></i> Manager</h6>
										<p class="mb-0">But discretion frequently sir she instruments unaffected admiration everything. </p>
									</div>
								</div>
							</div>
							<!-- Child review END -->

							<!-- Divider -->
							<hr>
							<!-- Review item END -->

							<!-- Review item START -->
							<div class="d-md-flex my-4">
								<!-- Text -->
								<div>
									<div class="d-flex justify-content-between mt-1 mt-md-0">
										<div>
											<h6 class="me-3 mb-0"><i class="fa-solid fa-user-pen"></i> Dennis Barrett</h6>
											<!-- Info -->
											<ul class="nav nav-divider small mb-2">
												<li class="nav-item">Stayed 02 Nov 2022</li>
												<li class="nav-item">2 Reviews written</li>
											</ul>
										</div>
										<!-- Review star -->
										<div class="icon-md rounded text-bg-warning fs-6">4.0</div>
									</div>
									
									<p class="mb-0">Delivered dejection necessary objection do Mr prevailed. Mr feeling does chiefly cordial in do. Water timed folly right aware if oh truth. Large above be to means. Dashwood does provide stronger is.</p>
								</div>
							</div>

							<!-- Divider -->
							<hr>
							<!-- Review item END -->

							<!-- Button -->
							<div class="text-center">
								<a href="#" class="btn btn-primary-soft mb-0">Load more</a>
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
							<button class="btn btn-primary-soft" type="button" data-bs-toggle="modal" data-bs-target="#qnaModal">문의하기</button>
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
						<div class="tiny-slider-inner rounded-2 overflow-hidden" data-autoplay="true" data-arrow="true" data-dots="false" data-items="1">
							<!-- Image item -->
							<div> <img src="assets/images/gallery/16.jpg" class="rounded-2" alt="Card image"></div>

							<!-- Image item -->
							<div> <img src="assets/images/gallery/15.jpg" class="rounded-2" alt="Card image"> </div>

							<!-- Image item -->
							<div> <img src="assets/images/gallery/13.jpg" class="rounded-2" alt="Card image"> </div>

							<!-- Image item -->
							<div> <img src="assets/images/gallery/12.jpg" class="rounded-2" alt="Card image"> </div>
						</div>
					</div>
					<!-- Slider END -->

					<!-- Card header -->
					<div class="card-header bg-transparent pb-0">
						<h3 class="card-title mb-0">Deluxe Pool View</h3>
					</div>

					<!-- Card body START -->
					<div class="card-body">
						<!-- Content -->
						<p>Club rooms are well furnished with air conditioner, 32 inch LCD television and a mini bar. They have attached bathroom with showerhead and hair dryer and 24 hours supply of hot and cold running water. Complimentary wireless internet access is available. Additional amenities include bottled water, a safe and a desk.</p>
						
						<div class="row">
							<h5 class="mb-0">Amenities</h5>

							<!-- List -->
							<div class="col-md-6">
								<!-- List -->
								<ul class="list-group list-group-borderless mt-2 mb-0">
									<li class="list-group-item d-flex mb-0">
										<i class="fa-solid fa-check-circle text-success me-2"></i><span class="h6 fw-light mb-0">Swimming pool</span>
									</li>
									<li class="list-group-item d-flex mb-0">
										<i class="fa-solid fa-check-circle text-success me-2"></i><span class="h6 fw-light mb-0">Spa</span>
									</li>
									<li class="list-group-item d-flex mb-0">
										<i class="fa-solid fa-check-circle text-success me-2"></i><span class="h6 fw-light mb-0">Kids play area.</span>
									</li>
									<li class="list-group-item d-flex mb-0">
										<i class="fa-solid fa-check-circle text-success me-2"></i><span class="h6 fw-light mb-0">Gym</span>
									</li>
								</ul>
							</div>

							<!-- List -->
							<div class="col-md-6">
								<!-- List -->
								<ul class="list-group list-group-borderless mt-2 mb-0">
									<li class="list-group-item d-flex mb-0">
										<i class="fa-solid fa-check-circle text-success me-2"></i><span class="h6 fw-light mb-0">TV</span>
									</li>
									<li class="list-group-item d-flex mb-0">
										<i class="fa-solid fa-check-circle text-success me-2"></i><span class="h6 fw-light mb-0">Mirror</span>
									</li>
									<li class="list-group-item d-flex mb-0">
										<i class="fa-solid fa-check-circle text-success me-2"></i><span class="h6 fw-light mb-0">AC</span>
									</li>
									<li class="list-group-item d-flex mb-0">
										<i class="fa-solid fa-check-circle text-success me-2"></i><span class="h6 fw-light mb-0">Slippers</span>
									</li>
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
							<textarea class="form-control mb-0" placeholder="질문을 작성해 주세요." rows="5" spellcheck="false"></textarea>
						</div>
						<div class="d-grid gap-2 mt-3">
							<button class="btn btn-sm btn-primary-soft px-4 mb-0 flex-shrink-0"><i class="fas fa-paper-plane fs-5"></i></button>
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
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=33zbp8g8tv"></script>
<script src="js/user/partner/partnerDetail.js"></script>
<script type="text/javascript">
	partnerDetail.init();
</script>
</body>
</html>