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

				<!-- Produce item START -->
				<div class="col-md-5 col-lg-4 col-xl-3 mb-3 mb-sm-0">
					<div class="card shadow p-2 pb-0">
						<!-- Offer badge -->
						<div class="position-absolute top-0 start-0 mt-n3 ms-n3 z-index-9">
							<img src="assets/images/element/05.svg" class="position-relative h-70px" alt="">
							<span class="h5 text-white position-absolute top-50 start-50 translate-middle">40%</span>
						</div>

						<div class="rounded-3 overflow-hidden position-relative">
							<!-- Image -->
							<img src="assets/images/category/tour/05.jpg" class="card-img" alt="">
							<!-- Overlay -->
							<div class="bg-overlay bg-dark opacity-4"></div>
							
							<!-- Hover element -->
							<div class="card-img-overlay d-flex">
								<h6 class="text-white fw-normal mt-auto mb-0">5 Days / 4 Nights</h6>
							</div>
						</div>
						<!-- Card body -->
						<div class="card-body px-2">
							<!-- Badge and Rating -->
							<div class="d-flex justify-content-between align-items-center mb-2">
								<a href="#" class="badge bg-primary bg-opacity-10 text-primary">Adventure</a>
								<!-- Rating -->
								<h6 class="fw-light m-0"><i class="fa-solid fa-star text-warning me-2"></i>4.5</h6>
							</div>

							<!-- Title -->
							<h6 class="card-title"><a href="#">Maldives Sightseeing & Adventure Tour</a></h6>
							
							<!-- Badge and Price -->
							<div class="d-flex justify-content-between align-items-center mb-0">
								<!-- Price -->
								<h6 class="text-success mb-0">$385 <span class="fw-light">/person</span></h6>
								<span class="text-decoration-line-through mb-0 text-reset">$682</span>
							</div>
						</div>
					</div>
				</div>
				<!-- Produce item END -->
			</div>
		</div>

		<!-- Search START -->
		<div class="row mt-n7">
			<div class="col-11 mx-auto">				
				<!-- Booking from START -->
				<form class="bg-mode shadow rounded-3 p-4">
					<div class="row g-4 align-items-center">

						<div class="col-xl-10">
							<div class="row g-4">
								<!-- Location -->
								<div class="col-md-6 col-lg-4">
									<label class="h6 fw-normal mb-0"><i class="bi bi-geo-alt text-primary me-1"></i>Location</label>
									<!-- Input field -->
									<div class="form-border-bottom form-control-transparent form-fs-lg mt-2">
										<select class="form-select js-choice" data-search-enabled="true">
											<option value="">Select location</option>
											<option>San Jacinto, USA</option>
											<option>North Dakota, Canada</option>
											<option>West Virginia, Paris</option>
										</select>
									</div>
								</div>

								<!-- Check in -->
								<div class="col-md-6 col-lg-4">
									<label class="h6 fw-normal mb-0"><i class="bi bi-calendar text-primary me-1"></i>Date</label>
									<!-- Input field -->
									<div class="form-border-bottom form-control-transparent form-fs-lg mt-2">
										<input type="text" class="form-control flatpickr py-2" data-date-format="d M Y" placeholder="Choose a date">
									</div>
								</div>

								<!-- Guest -->
								<div class="col-md-6 col-lg-4">
									<label class="h6 fw-normal mb-0"><i class="fa-solid fa-person-skating text-primary me-1"></i>Tour type</label>
									<!-- Input field -->
									<div class="form-border-bottom form-control-transparent form-fs-lg mt-2">
										<select class="form-select js-choice" data-search-enabled="true">
											<option value="">Select type</option>
											<option>Adventure</option>
											<option>Beach</option>
											<option>Desert</option>
											<option>History</option>
										</select>
									</div>
								</div>
							</div>
						</div>

						<!-- Button -->
						<div class="col-xl-2">
							<div class="d-grid">
								<a href="#" class="btn btn-lg btn-dark mb-0">Take a Tour</a>
							</div>
						</div>
					</div>
				</form>
				<!-- Booking from END -->
			</div>
		</div>
		<!-- Search END -->
	</div>
</section>
<!-- =======================
Main Banner END -->

<!-- 지역 아이콘 -->
<section>
	<div class="container">
		<!-- Title -->
		<div class="row mb-4">
			<div class="col-12 text-center">
				<h2 class="mb-0">Explore Nearby</h2>
			</div>
		</div>

		<div class="row g-4 g-md-5">
			<div class="col-1"></div>
			<!-- Card item START -->
			<div class="col-2">
				<div class="card bg-transparent text-center p-1 h-100">
					<!-- Image -->
					<img src="assets/images/category/hotel/nearby/01.jpg" class="rounded-circle" alt="">

					<div class="card-body p-0 pt-3">
						<h5 class="card-title"><a href="#" class="stretched-link">서울</a></h5>
						<span>13 min drive</span>
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
						<span>25 min drive</span>
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
						<span>45 min drive</span>
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
						<span>55 min drive</span>
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
						<span>1-hour drive</span>
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
			<div class="col-12 text-center">
				<h2 class="mb-0">Our Best Packages</h2>
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
			<div class="col-12 text-center">
				<h2 class="mb-0">Our Best Packages</h2>
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