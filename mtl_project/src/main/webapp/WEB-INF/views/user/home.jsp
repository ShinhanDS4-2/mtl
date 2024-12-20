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
	<div class="container position-relative">
		<!-- Bg image -->
		<div class="rounded-3 p-4 p-sm-5" style="background-image: url(assets/images/bg/02.jpg); background-position: center center; background-repeat: no-repeat; background-size: cover;">
			<!-- Banner title -->
			<div class="row justify-content-between pt-0 pb-5"> 
				<div class="col-md-7 col-lg-8 col-xxl-7 pb-5 mb-0 mb-lg-5"> 
					<h1 class="text-white">Life Is Adventure Make The Best Of It</h1>
					<p class="text-white mb-0">Planning for a trip? we will organize your best trip with the best destination and within the best budgets!</p>
				</div>
			</div>
		</div>

		<!-- Search START -->
		<div class="row mt-n7">
			<div class="col-11 mx-auto">				
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
						</div>
	
						<!-- Check in -->
						<div class="col-lg-4">
							<div class="d-flex">
								<!-- Icon -->
								<i class="bi bi-calendar fs-3 me-2 mt-2"></i>
								<!-- Date input -->
								<div class="form-control-border form-control-transparent form-fs-md">
									<label class="form-label">체크인 - 체크아웃</label>
									<input type="text" class="form-control flatpickr" data-mode="range" placeholder="Select date" value="19 Sep to 28 Sep">
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
										<input type="text" class="form-guest-selector form-control selection-result" value="2 명" id="dropdownGuest" data-bs-auto-close="outside" data-bs-toggle="dropdown">
									
										<!-- dropdown items -->
										<ul class="dropdown-menu guest-selector-dropdown" aria-labelledby="dropdownGuest">
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
						<a  class="icon-lg btn btn-round btn-primary mb-0" href="#"><i class="bi bi-search fa-fw"></i></a>
					</div>
				</form>
			</div>
		</div>
		<!-- Search END -->
	</div>
</section>
<!-- =======================
Main Banner END -->

<!-- 지역 아이콘 -->
<section class="pt-0">
	<div class="container">
		<!-- Title -->
		<div class="row mb-4">
			<div class="col-12 text-center">
				<h2 class="mb-0">Explore Nearby</h2>
			</div>
		</div>
		<div class="row g-5">
			<div class="col-1"></div>
			<!-- Card item START -->
			<div class="col-2">
				<div class="card bg-transparent text-center p-1 h-100">
					<!-- Image -->
					<img src="assets/images/category/hotel/nearby/01.jpg" class="rounded-circle" alt="">

					<div class="card-body p-0 pt-3">
						<h5 class="card-title"><a href="#" class="stretched-link">서울</a></h5>
						<span>Seoul</span>
					</div>
				</div>
			</div>
			<!-- Card item END -->

			<!-- Card item START -->
			<div class="col-2">
				<div class="card bg-transparent text-center p-1 h-100">
					<!-- Image -->
					<img src="assets/images/category/hotel/nearby/02.jpg" class="rounded-circle" alt="">

					<div class="card-body p-0 pt-3">
						<h5 class="card-title"><a href="#" class="stretched-link">강릉</a></h5>
						<span>Gangneung</span>
					</div>
				</div>
			</div>
			<!-- Card item END -->

			<!-- Card item START -->
			<div class="col-2">
				<div class="card bg-transparent text-center p-1 h-100">
					<!-- Image -->
					<img src="assets/images/category/hotel/nearby/03.jpg" class="rounded-circle" alt="">

					<div class="card-body p-0 pt-3">
						<h5 class="card-title"><a href="#" class="stretched-link">여수</a></h5>
						<span>Yeosu</span>
					</div>
				</div>
			</div>
			<!-- Card item END -->

			<!-- Card item START -->
			<div class="col-2">
				<div class="card bg-transparent text-center p-1 h-100">
					<!-- Image -->
					<img src="assets/images/category/hotel/nearby/04.jpg" class="rounded-circle" alt="">

					<div class="card-body p-0 pt-3">
						<h5 class="card-title"><a href="#" class="stretched-link">부산</a></h5>
						<span>Busan</span>
					</div>
				</div>
			</div>
			<!-- Card item END -->

			<!-- Card item START -->
			<div class="col-2">
				<div class="card bg-transparent text-center p-1 h-100">
					<!-- Image -->
					<img src="assets/images/category/hotel/nearby/05.jpg" class="rounded-circle" alt="">

					<div class="card-body p-0 pt-3">
						<h5 class="card-title"><a href="#" class="stretched-link">제주</a></h5>
						<span>Jeju</span>
					</div>
				</div>
			</div>
			<!-- Card item END -->
			<div class="col-1"></div>
		</div> <!-- Row END -->
	</div>
</section>

<!-- =======================
인기 리스트 1 START -->
<section class="pt-0 pt-md-5">
	<div class="container">
		<!-- Title -->
		<div class="row mb-4">
			<div class="col-12 text-start">
				<h5 class="mb-0">인기 숙소</h5>
			</div>
		</div>

		<div class="row g-4">
			<!-- Package item -->
			<div class="col-sm-6 col-xl-3">
				<!-- Card START -->
				<div class="card card-img-scale overflow-hidden bg-transparent">
					<div class="card-img-scale-wrapper rounded-3">
						<!-- Card Image -->
						<img src="assets/images/category/tour/04.jpg" class="card-img" alt="">
						<!-- Overlay -->
						<div class="card-img-overlay d-flex flex-column z-index-1 p-4">
							<!-- Card overlay top -->
							<div class="d-flex justify-content-between">
								<span class="badge text-bg-dark">Adventure</span>
								<span class="badge text-bg-white"><i class="fa-solid fa-star text-warning me-2"></i>4.3</span>
							</div>
							<!-- Card overlay bottom -->
							<div class="w-100 mt-auto">
								<!-- Card category -->
								<span class="badge text-bg-white fs-6">6 days / 5 nights</span>
							</div>
						</div>
					</div> 
					
					<!-- Card body -->
					<div class="card-body px-2">
						<!-- Title -->
						<h5 class="card-title"><a href="tour-grid.html" class="stretched-link">Lombok, Indonesia</a></h5>
						<!-- Content -->
						<div class="hstack gap-2">
							<span class="h5 mb-0 text-success">$1385</span>
							<small>Starting price</small>
						</div>
					</div>
				</div>
				<!-- Card END -->
			</div>

			<!-- Package item -->
			<div class="col-sm-6 col-xl-3">
				<!-- Card START -->
				<div class="card card-img-scale overflow-hidden bg-transparent">
					<div class="card-img-scale-wrapper rounded-3">
						<!-- Card Image -->
						<img src="assets/images/category/tour/02.jpg" class="card-img" alt="">
						<!-- Overlay -->
						<div class="card-img-overlay d-flex flex-column z-index-1 p-4">
							<!-- Card overlay top -->
							<div class="d-flex justify-content-between">
								<span class="badge text-bg-dark">History</span>
								<span class="badge text-bg-white"><i class="fa-solid fa-star text-warning me-2"></i>4.5</span>
							</div>
							<!-- Card overlay bottom -->
							<div class="w-100 mt-auto">
								<!-- Card category -->
								<span class="badge text-bg-white fs-6">8 days / 7 nights</span>
							</div>
						</div>
					</div> 
					
					<!-- Card body -->
					<div class="card-body px-2">
						<!-- Title -->
						<h5 class="card-title"><a href="tour-grid.html" class="stretched-link">Northern Lights Escape</a></h5>
						<!-- Content -->
						<div class="hstack gap-2">
							<span class="h5 mb-0 text-success">$2569</span>
							<small>Starting price</small>
						</div>
					</div>
				</div>
				<!-- Card END -->
			</div>

			<!-- Package item -->
			<div class="col-sm-6 col-xl-3">
				<div class="card card-img-scale overflow-hidden bg-transparent">
					<div class="card-img-scale-wrapper rounded-3">
						<!-- Card Image -->
						<img src="assets/images/category/tour/03.jpg" class="card-img" alt="">
						<!-- Overlay -->
						<div class="card-img-overlay d-flex flex-column z-index-1 p-4">
							<!-- Card overlay top -->
							<div class="d-flex justify-content-between">
								<span class="badge text-bg-dark">Desert</span>
								<span class="badge text-bg-white"><i class="fa-solid fa-star text-warning me-2"></i>4.2</span>
							</div>
							<!-- Card overlay bottom -->
							<div class="w-100 mt-auto">
								<!-- Card category -->
								<span class="badge text-bg-white fs-6">9 days / 8 nights</span>
							</div>
						</div>
					</div> 
					
					<!-- Card body -->
					<div class="card-body px-2">
						<!-- Title -->
						<h5 class="card-title"><a href="tour-grid.html" class="stretched-link">Essential Egypt</a></h5>
						<!-- Content -->
						<div class="hstack gap-2">
							<span class="h5 mb-0 text-success">$1885</span>
							<small>Starting price</small>
						</div>
					</div>
				</div>
			</div>

			<!-- Package item -->
			<div class="col-sm-6 col-xl-3">
				<div class="card card-img-scale overflow-hidden bg-transparent">
					<div class="card-img-scale-wrapper rounded-3">
						<!-- Card Image -->
						<img src="assets/images/category/tour/01.jpg" class="card-img" alt="">
						<!-- Overlay -->
						<div class="card-img-overlay d-flex flex-column z-index-1 p-4">
							<!-- Card overlay top -->
							<div class="d-flex justify-content-between">
								<span class="badge text-bg-dark">Beach</span>
								<span class="badge text-bg-white"><i class="fa-solid fa-star text-warning me-2"></i>4.6</span>
							</div>
							<!-- Card overlay bottom -->
							<div class="w-100 mt-auto">
								<!-- Card category -->
								<span class="badge text-bg-white fs-6">9 days / 8 nights</span>
							</div>
						</div>
					</div> 
					
					<!-- Card body -->
					<div class="card-body px-2">
						<!-- Title -->
						<h5 class="card-title"><a href="tour-grid.html" class="stretched-link">Phi Phi Islands</a></h5>
						<!-- Content -->
						<div class="hstack gap-2">
							<span class="h5 text-success mb-0">$3585</span>
							<small>Starting price</small>
						</div>
					</div>
				</div>
			</div>
		</div> <!-- Row END -->
	</div>
</section>
<!-- =======================
인기 리스트 1 END -->

<!-- =======================
인기 리스트 2 START -->
<section class="pt-0 pt-md-5">
	<div class="container">
		<!-- Title -->
		<div class="row mb-4">
			<div class="col-12 text-start">
				<h5 class="mb-0">인기 여행지</h5>
			</div>
		</div>

		<div class="row g-4">
			<!-- Package item -->
			<div class="col-sm-6 col-xl-3">
				<!-- Card START -->
				<div class="card card-img-scale overflow-hidden bg-transparent">
					<div class="card-img-scale-wrapper rounded-3">
						<!-- Card Image -->
						<img src="assets/images/category/tour/04.jpg" class="card-img" alt="">
						<!-- Overlay -->
						<div class="card-img-overlay d-flex flex-column z-index-1 p-4">
							<!-- Card overlay top -->
							<div class="d-flex justify-content-between">
								<span class="badge text-bg-dark">Adventure</span>
								<span class="badge text-bg-white"><i class="fa-solid fa-star text-warning me-2"></i>4.3</span>
							</div>
							<!-- Card overlay bottom -->
							<div class="w-100 mt-auto">
								<!-- Card category -->
								<span class="badge text-bg-white fs-6">6 days / 5 nights</span>
							</div>
						</div>
					</div> 
					
					<!-- Card body -->
					<div class="card-body px-2">
						<!-- Title -->
						<h5 class="card-title"><a href="tour-grid.html" class="stretched-link">Lombok, Indonesia</a></h5>
						<!-- Content -->
						<div class="hstack gap-2">
							<span class="h5 mb-0 text-success">$1385</span>
							<small>Starting price</small>
						</div>
					</div>
				</div>
				<!-- Card END -->
			</div>

			<!-- Package item -->
			<div class="col-sm-6 col-xl-3">
				<!-- Card START -->
				<div class="card card-img-scale overflow-hidden bg-transparent">
					<div class="card-img-scale-wrapper rounded-3">
						<!-- Card Image -->
						<img src="assets/images/category/tour/02.jpg" class="card-img" alt="">
						<!-- Overlay -->
						<div class="card-img-overlay d-flex flex-column z-index-1 p-4">
							<!-- Card overlay top -->
							<div class="d-flex justify-content-between">
								<span class="badge text-bg-dark">History</span>
								<span class="badge text-bg-white"><i class="fa-solid fa-star text-warning me-2"></i>4.5</span>
							</div>
							<!-- Card overlay bottom -->
							<div class="w-100 mt-auto">
								<!-- Card category -->
								<span class="badge text-bg-white fs-6">8 days / 7 nights</span>
							</div>
						</div>
					</div> 
					
					<!-- Card body -->
					<div class="card-body px-2">
						<!-- Title -->
						<h5 class="card-title"><a href="tour-grid.html" class="stretched-link">Northern Lights Escape</a></h5>
						<!-- Content -->
						<div class="hstack gap-2">
							<span class="h5 mb-0 text-success">$2569</span>
							<small>Starting price</small>
						</div>
					</div>
				</div>
				<!-- Card END -->
			</div>

			<!-- Package item -->
			<div class="col-sm-6 col-xl-3">
				<div class="card card-img-scale overflow-hidden bg-transparent">
					<div class="card-img-scale-wrapper rounded-3">
						<!-- Card Image -->
						<img src="assets/images/category/tour/03.jpg" class="card-img" alt="">
						<!-- Overlay -->
						<div class="card-img-overlay d-flex flex-column z-index-1 p-4">
							<!-- Card overlay top -->
							<div class="d-flex justify-content-between">
								<span class="badge text-bg-dark">Desert</span>
								<span class="badge text-bg-white"><i class="fa-solid fa-star text-warning me-2"></i>4.2</span>
							</div>
							<!-- Card overlay bottom -->
							<div class="w-100 mt-auto">
								<!-- Card category -->
								<span class="badge text-bg-white fs-6">9 days / 8 nights</span>
							</div>
						</div>
					</div> 
					
					<!-- Card body -->
					<div class="card-body px-2">
						<!-- Title -->
						<h5 class="card-title"><a href="tour-grid.html" class="stretched-link">Essential Egypt</a></h5>
						<!-- Content -->
						<div class="hstack gap-2">
							<span class="h5 mb-0 text-success">$1885</span>
							<small>Starting price</small>
						</div>
					</div>
				</div>
			</div>

			<!-- Package item -->
			<div class="col-sm-6 col-xl-3">
				<div class="card card-img-scale overflow-hidden bg-transparent">
					<div class="card-img-scale-wrapper rounded-3">
						<!-- Card Image -->
						<img src="assets/images/category/tour/01.jpg" class="card-img" alt="">
						<!-- Overlay -->
						<div class="card-img-overlay d-flex flex-column z-index-1 p-4">
							<!-- Card overlay top -->
							<div class="d-flex justify-content-between">
								<span class="badge text-bg-dark">Beach</span>
								<span class="badge text-bg-white"><i class="fa-solid fa-star text-warning me-2"></i>4.6</span>
							</div>
							<!-- Card overlay bottom -->
							<div class="w-100 mt-auto">
								<!-- Card category -->
								<span class="badge text-bg-white fs-6">9 days / 8 nights</span>
							</div>
						</div>
					</div> 
					
					<!-- Card body -->
					<div class="card-body px-2">
						<!-- Title -->
						<h5 class="card-title"><a href="tour-grid.html" class="stretched-link">Phi Phi Islands</a></h5>
						<!-- Content -->
						<div class="hstack gap-2">
							<span class="h5 text-success mb-0">$3585</span>
							<small id="t">Starting price</small>
						</div>
					</div>
				</div>
			</div>
		</div> <!-- Row END -->
	</div>
</section>
<!-- =======================
인기 리스트 2 END -->
</main>

<!-- footer -->
<%@ include file="/WEB-INF/views/include/footer.jsp" %>

<!-- footerScript -->
<%@ include file="/WEB-INF/views/include/footerScript.jsp" %>

<!-- page script -->
<script src="js/user/home.js"></script>
<script type="text/javascript">
	home.init();
</script>
</body>
</html>