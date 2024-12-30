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
<main class="pe-9 ps-9">
<section class="pt-4 pt-lg-5">
	<div class="container position-relative">
		<div class="justify-content-start">
			<a href="javascript:window.history.back();" class="h6 text-reset">
				<i class="fa-solid fa-circle-chevron-left"></i> 뒤로가기
			</a>
		</div>
		<div class="row">
			<div class="col-12">
				<!-- 여행지명 -->
				<div class="d-md-flex justify-content-center">
					<div class="text-center">
						<h1 class="fs-2">가로수길</h1>
						<h6 class="text-body mb-0">서울특별시 신사동</h6>
					</div>
				</div>
			</div>
		</div>

		<!-- 이미지 -->
		<div class="row mt-md-5">
			<div class="col-12">
				<!-- Primary image -->
				<div class="splide splide-main mb-3">
					<div class="splide__track">
						<ul class="splide__list">
							<li class="splide__slide rounded"><img src="assets/images/location/서울_가로수길_1.png" alt="">
								<a href="assets/images/location/서울_가로수길_1.png" class="stretched-link" data-glightbox="" data-gallery="banner"></a>
							</li>
							<li class="splide__slide rounded"><img src="assets/images/location/서울_가로수길_2.png" alt="">
								<a href="assets/images/location/서울_가로수길_2.png" class="stretched-link" data-glightbox="" data-gallery="banner"></a>
							</li>
							<li class="splide__slide rounded"><img src="assets/images/location/서울_가로수길_3.png" alt="">
								<a href="assets/images/location/서울_가로수길_3.png" class="stretched-link" data-glightbox="" data-gallery="banner"></a>
							</li>
							<li class="splide__slide rounded"><img src="assets/images/location/서울_가로수길_4.png" alt="">
								<a href="assets/images/location/서울_가로수길_4.png" class="stretched-link" data-glightbox="" data-gallery="banner"></a>
							</li>
						</ul>
					</div>
				</div>
				<!-- Secondary image -->
				<div class="splide splide-thumb">
					<div class="splide__track">
						<ul class="splide__list">
							<li class="splide__slide"><img src="assets/images/location/서울_가로수길_1.png" alt=""></li>
							<li class="splide__slide"><img src="assets/images/location/서울_가로수길_2.png" alt=""></li>
							<li class="splide__slide"><img src="assets/images/location/서울_가로수길_3.png" alt=""></li>
							<li class="splide__slide"><img src="assets/images/location/서울_가로수길_4.png" alt=""></li>
						</ul>
					</div>
					<!-- Arrows -->
					<div class="splide__arrows">
						<button class="splide__arrow  splide__arrow--prev p-splide__arrow--prev bg-primary"><span class="spi-angle-left text-white"><i class="fa-solid fa-fw fa-angle-left"></i></span></button>
						<button class="splide__arrow splide__arrow--next p-splide__arrow--next bg-primary"><span class="spi-angle-right text-white"><i class="fa-solid fa-fw fa-angle-right"></i></span></button>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<section class="pt-2">
	<div class="container">
		<div class="row g-4 g-md-5">
			<!-- Tabs Content START -->
			<div class="col-xl-12">
				<!-- Outer tabs contents START -->
				<div class="tab-content mb-0" id="tour-pills-tabContent">

					<!-- Content item START -->
					<div class="tab-pane fade show active" id="tour-pills-tab1" role="tabpanel" aria-labelledby="tour-pills-tab-1">
						<div class="card bg-transparent p-0">
							<!-- Card header -->
							<div class="card-header bg-transparent border-bottom p-0 pb-3">
								<h3 class="mb-0">소개</h3>
							</div>

							<!-- Card body START -->
							<div class="card-body p-0 pt-3">
								<p class="mb-5 space">
									가로수길은 서울 신사동에 위치한 인기 있는 거리로, 이름처럼 양쪽에 큰 가로수가 늘어서 있어 산책하기 좋은 분위기를 자랑합니다.
									
									이 길은 패션, 음식, 문화가 어우러진 트렌디한 명소로, 젊은층과 외국인 관광객들 사이에서 매우 인기가 높습니다.
									
									현대 고등학교 앞 사거리에서 신사역 동쪽 도산대로와 삼거리까지 뻗은 도로를 이르며, 서울 강남구 대표 상권 중 한 곳입니다.
									신사동 가로수길 주위로는 아기자기한 커피숍과 맛집, 디자이너들의 옷 매장들이 즐비해 있어 이국적인 분위기를 연출합니다. 
								</p>

								<!-- 키워드 -->
								<ul class="list-inline mb-4">
									<li class="list-inline-item">
										<h5><span class="badge bg-primary bg-opacity-10 text-primary"><i class="fa-solid fa-hashtag"></i> 가족여행</span></h5>
									</li>
									<li class="list-inline-item">
										<h5><span class="badge bg-primary bg-opacity-10 text-primary"><i class="fa-solid fa-hashtag"></i> 관광지</span></h5>
									</li>
									<li class="list-inline-item">
										<h5><span class="badge bg-primary bg-opacity-10 text-primary"><i class="fa-solid fa-hashtag"></i> 데이트코스</span></h5>
									</li>
									<li class="list-inline-item">
										<h5><span class="badge bg-primary bg-opacity-10 text-primary"><i class="fa-solid fa-hashtag"></i> 산책</span></h5>
									</li>
									<li class="list-inline-item">
										<h5><span class="badge bg-primary bg-opacity-10 text-primary"><i class="fa-solid fa-hashtag"></i> 쇼핑</span></h5>
									</li>
								</ul>
								
								<!-- 지도 -->
								<div class="modal-body p-0">
									<iframe class="w-100" height="300" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3151.8354345093873!2d127.022879!3d37.521510!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca2b3f1d43923%3A0x4cba3f5077ad6e9d!2sSeoul%20City!5e0!3m2!1sen!2sin!4v1695734121594!5m2!1sen!2sin" style="border:0;" aria-hidden="false" tabindex="0"></iframe>	
								</div>
							</div>
							<!-- Card body END -->
						</div>
					</div>		
					<!-- Content item END -->
				</div>	
			</div>
			<!-- Tabs Content END -->
		</div> <!-- Row END -->
	</div>
</section>
<!-- =======================
Tabs-content END -->

</main>

<!-- footer -->
<%@ include file="/WEB-INF/views/include/footer.jsp" %>

<!-- footerScript -->
<%@ include file="/WEB-INF/views/include/footerScript.jsp" %>

<!-- page script -->
<script src="js/user/location/locationDetail.js"></script>
<script type="text/javascript">
	locationDetail.init();
</script>
</body>
</html>