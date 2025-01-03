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
	<!-- Bg image -->
	<div class="p-7 pb-5 banner" id="banner" style="background-image: url(assets/images/banner/2.jpg);">
		<!-- Banner title -->
		<div class="container justify-content-between pt-5 pb-0"> 
			<div class="ps-5 pt-5 mb-0 mb-lg-5"> 
				<h1 class="text-white">나만의 맞춤 여행</h1>
				<p class="text-white mb-0">대한민국 대표 여행지로 떠날지도</p>
			</div>
		</div>
	</div>
	<div class="container position-relative">
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
									<select class="form-select js-choice" id="searchArea">
										<option value="" selected>지역 선택</option>
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
						<a  class="icon-lg btn btn-round btn-primary mb-0" href="javascript:;" data-src="home" data-act="clickSearch"><i class="bi bi-search fa-fw"></i></a>
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
		<div class="row g-5">
			<div class="col-1"></div>
			<!-- Card item START -->
			<div class="col-2">
				<div class="card bg-transparent text-center p-1 h-100 area-icon">
					<!-- Image -->
					<img src="assets/images/icon/서울.jpg" class="rounded-circle" alt="">

					<div class="card-body p-0 pt-3">
						<h5 class="card-title"><a href="javascript:;" class="stretched-link" data-src="home" data-act="clickArea" data-value="SEOUL">서울</a></h5>
						<span>Seoul</span>
					</div>
				</div>
			</div>
			<!-- Card item END -->

			<!-- Card item START -->
			<div class="col-2">
				<div class="card bg-transparent text-center p-1 h-100 area-icon">
					<!-- Image -->
					<img src="assets/images/icon/강릉.jpg" class="rounded-circle" alt="">

					<div class="card-body p-0 pt-3">
						<h5 class="card-title"><a href="javascript:;" class="stretched-link" data-src="home" data-act="clickArea" data-value="GANGNEUNG">강릉</a></h5>
						<span>Gangneung</span>
					</div>
				</div>
			</div>
			<!-- Card item END -->

			<!-- Card item START -->
			<div class="col-2">
				<div class="card bg-transparent text-center p-1 h-100 area-icon">
					<!-- Image -->
					<img src="assets/images/icon/여수.jpg" class="rounded-circle" alt="">

					<div class="card-body p-0 pt-3">
						<h5 class="card-title"><a href="javascript:;" class="stretched-link" data-src="home" data-act="clickArea" data-value="YEOSU">여수</a></h5>
						<span>Yeosu</span>
					</div>
				</div>
			</div>
			<!-- Card item END -->

			<!-- Card item START -->
			<div class="col-2">
				<div class="card bg-transparent text-center p-1 h-100 area-icon">
					<!-- Image -->
					<img src="assets/images/icon/부산.jpg" class="rounded-circle" alt="">

					<div class="card-body p-0 pt-3">
						<h5 class="card-title"><a href="javascript:;" class="stretched-link" data-src="home" data-act="clickArea" data-value="BUSAN">부산</a></h5>
						<span>Busan</span>
					</div>
				</div>
			</div>
			<!-- Card item END -->

			<!-- Card item START -->
			<div class="col-2">
				<div class="card bg-transparent text-center p-1 h-100 area-icon">
					<!-- Image -->
					<img src="assets/images/icon/제주.jpg" class="rounded-circle" alt="">

					<div class="card-body p-0 pt-3">
						<h5 class="card-title"><a href="javascript:;" class="stretched-link" data-src="home" data-act="clickArea" data-value="JEJU">제주</a></h5>
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
		<div class="row mb-4 justify-content-between">
			<div class="col-6 text-start">
				<h5 class="mb-0">인기 숙소</h5>
			</div>
		</div>

		<div class="row g-4" id="accomodationList">
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
		<div class="row mb-4 justify-content-between">
			<div class="col-6 text-start">
				<h5 class="mb-0">여행지 추천</h5>
			</div>
		</div>

		<div class="row g-4" id="locationList">
			<!-- Package item -->
			<div class="col-sm-6 col-xl-3">
				<!-- Card START -->
				<div class="card card-img-scale overflow-hidden bg-transparent">
					<div class="card-img-scale-wrapper rounded-3">
						<!-- Card Image -->
						<img src="assets/images/category/tour/04.jpg" class="card-img" alt="">
					</div> 
					
					<!-- Card body -->
					<div class="card-body px-2">
						<!-- Title -->
						<h5 class="card-title"><a href="location/detail" class="stretched-link text-truncate">서울식물원</a></h5>
						<!-- Content -->
						<div class="hstack gap-2">
							<span class="h5 mb-0 text-primary"><i class="fa-solid fa-location-dot"></i> 서울</span>
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
					</div> 
					
					<!-- Card body -->
					<div class="card-body px-2">
						<!-- Title -->
						<h5 class="card-title"><a href="location/detail" class="stretched-link text-truncate">여수 테디베어뮤지엄</a></h5>
						<!-- Content -->
						<div class="hstack gap-2">
							<span class="h5 mb-0 text-primary"><i class="fa-solid fa-location-dot"></i> 여수</span>
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
					</div> 
					
					<!-- Card body -->
					<div class="card-body px-2">
						<!-- Title -->
						<h5 class="card-title"><a href="location/detail" class="stretched-link text-truncate">설악스케치</a></h5>
						<!-- Content -->
						<div class="hstack gap-2">
							<span class="h5 mb-0 text-primary"><i class="fa-solid fa-location-dot"></i> 강릉</span>
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
					</div> 
					
					<!-- Card body -->
					<div class="card-body px-2">
						<!-- Title -->
						<h5 class="card-title"><a href="location/detail" class="stretched-link text-truncate">북촌한옥마을</a></h5>
						<!-- Content -->
						<div class="hstack gap-2">
							<span class="h5 text-primary mb-0"><i class="fa-solid fa-location-dot"></i> 서울</span>
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