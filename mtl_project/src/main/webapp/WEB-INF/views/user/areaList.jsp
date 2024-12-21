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
<!-- 지역 아이콘 -->
<section class="pt-5 pb-4 mb-3 bg-i">
	<div class="container">
		<div class="row g-3 place-center">
			<div class="col-2"></div>
			<div class="col-8 row">
				<div class="col-1"></div>
				<div class="col-2">
					<div class="card bg-transparent text-center p-1 h-100 area-icon">
						<!-- Image -->
						<img src="assets/images/icon/서울.jpg" class="rounded-circle" alt="">
	
						<div class="card-body p-0 pt-3">
							<h5 class="card-title"><a href="#" class="stretched-link">서울</a></h5>
							<span>Seoul</span>
						</div>
					</div>
				</div>
				<div class="col-2">
					<div class="card bg-transparent text-center p-1 h-100 area-icon">
						<!-- Image -->
						<img src="assets/images/icon/강릉.jpg" class="rounded-circle" alt="">
	
						<div class="card-body p-0 pt-3">
							<h5 class="card-title"><a href="#" class="stretched-link">강릉</a></h5>
							<span>Gangneung</span>
						</div>
					</div>
				</div>
				<div class="col-2">
					<div class="card bg-transparent text-center p-1 h-100 area-icon">
						<!-- Image -->
						<img src="assets/images/icon/여수.jpg" class="rounded-circle" alt="">
	
						<div class="card-body p-0 pt-3">
							<h5 class="card-title"><a href="#" class="stretched-link">여수</a></h5>
							<span>Yeosu</span>
						</div>
					</div>
				</div>
				<div class="col-2">
					<div class="card bg-transparent text-center p-1 h-100 area-icon">
						<!-- Image -->
						<img src="assets/images/icon/부산.jpg" class="rounded-circle" alt="">
	
						<div class="card-body p-0 pt-3">
							<h5 class="card-title"><a href="#" class="stretched-link">부산</a></h5>
							<span>Busan</span>
						</div>
					</div>
				</div>
				<div class="col-2">
					<div class="card bg-transparent text-center p-1 h-100 area-icon">
						<!-- Image -->
						<img src="assets/images/icon/제주.jpg" class="rounded-circle" alt="">
	
						<div class="card-body p-0 pt-3">
							<h5 class="card-title"><a href="#" class="stretched-link">제주</a></h5>
							<span>Jeju</span>
						</div>
					</div>
				</div>
				<div class="col-1"></div>
			</div>
			<div class="col-2"></div>
		</div> <!-- Row END -->
	</div>
</section>

<section class="pt-4">
	<div class="container">
		<!-- tab line -->
		<ul class="nav nav-tabs nav-bottom-line mb-3">
			<li class="nav-item"> <a class="nav-link active" data-bs-toggle="tab" href="#tab-3-1"> 숙소 </a> </li>
			<li class="nav-item"> <a class="nav-link" data-bs-toggle="tab" href="#tab-3-2"> 관광지 </a> </li>
			<li class="nav-item"> <a class="nav-link" data-bs-toggle="tab" href="#tab-3-3"> 맛집 </a> </li>
		</ul>
		<div class="tab-content">
			<div class="tab-pane show active" id="tab-3-1">
				<div class="row g-4">
					<!-- Card item START -->
					<div class="col-md-3">
						<div class="card shadow p-2 pb-0 h-350px">
							<!-- Image -->
							<img src="assets/images/category/hotel/4by3/10.jpg" class="rounded-2" alt="Card image">
		
							<!-- Card body START -->
							<div class="card-body px-3 pb-0">
								<!-- Title -->
								<h5 class="card-title mb-0"><a href="partnerDetail">시그니엘 서울</a></h5>
								<small><i class="fa-solid fa-location-dot"></i> 서울특별시 신천동</small>
							</div>
							<!-- Card body END -->
		
							<!-- Card footer START-->
							<div class="card-footer pt-1">
								<span class="badge bg-primary bg-opacity-10 text-primary"><i class="fa-solid fa-hashtag"></i> 키워드</span>
								<span class="badge bg-primary bg-opacity-10 text-primary"><i class="fa-solid fa-hashtag"></i> 키워드</span>
							</div>
						</div>
					</div>
					<!-- Card item END -->
					
					<!-- Card item START -->
					<div class="col-md-3">
						<div class="card shadow p-2 pb-0 h-350px">
							<!-- Image -->
							<img src="assets/images/category/hotel/4by3/10.jpg" class="rounded-2" alt="Card image">
		
							<!-- Card body START -->
							<div class="card-body px-3 pb-0">
								<!-- Title -->
								<h5 class="card-title mb-0"><a href="partnerDetail">시그니엘 서울</a></h5>
								<small><i class="fa-solid fa-location-dot"></i> 서울특별시 신천동</small>
							</div>
							<!-- Card body END -->
		
							<!-- Card footer START-->
							<div class="card-footer pt-1">
								<span class="badge bg-primary bg-opacity-10 text-primary"><i class="fa-solid fa-hashtag"></i> 키워드</span>
								<span class="badge bg-primary bg-opacity-10 text-primary"><i class="fa-solid fa-hashtag"></i> 키워드</span>
								<span class="badge bg-primary bg-opacity-10 text-primary"><i class="fa-solid fa-hashtag"></i> 키워드</span>
							</div>
						</div>
					</div>
					<!-- Card item END -->
		
					<!-- Card item START -->
					<div class="col-md-3">
						<div class="card shadow p-2 pb-0 h-350px">
							<!-- Image -->
							<img src="assets/images/category/hotel/4by3/10.jpg" class="rounded-2" alt="Card image">
		
							<!-- Card body START -->
							<div class="card-body px-3 pb-0">
								<!-- Title -->
								<h5 class="card-title mb-0"><a href="partnerDetail">시그니엘 서울</a></h5>
								<small><i class="fa-solid fa-location-dot"></i> 서울특별시 신천동</small>
							</div>
							<!-- Card body END -->
		
							<!-- Card footer START-->
							<div class="card-footer pt-1">
								<span class="badge bg-primary bg-opacity-10 text-primary"><i class="fa-solid fa-hashtag"></i> 키워드</span>
								<span class="badge bg-primary bg-opacity-10 text-primary"><i class="fa-solid fa-hashtag"></i> 키워드</span>
							</div>
						</div>
					</div>
					<!-- Card item END -->
					
					<!-- Card item START -->
					<div class="col-md-3">
						<div class="card shadow p-2 pb-0 h-350px">
							<!-- Image -->
							<img src="assets/images/category/hotel/4by3/10.jpg" class="rounded-2" alt="Card image">
		
							<!-- Card body START -->
							<div class="card-body px-3 pb-0">
								<!-- Title -->
								<h5 class="card-title mb-0"><a href="partnerDetail">시그니엘 서울</a></h5>
								<small><i class="fa-solid fa-location-dot"></i> 서울특별시 신천동</small>
							</div>
							<!-- Card body END -->
		
							<!-- Card footer START-->
							<div class="card-footer pt-1">
								<span class="badge bg-primary bg-opacity-10 text-primary"><i class="fa-solid fa-hashtag"></i> 키워드</span>
								<span class="badge bg-primary bg-opacity-10 text-primary"><i class="fa-solid fa-hashtag"></i> 키워드</span>
								<span class="badge bg-primary bg-opacity-10 text-primary"><i class="fa-solid fa-hashtag"></i> 키워드</span>
							</div>
						</div>
					</div>
					<!-- Card item END -->
		
					<!-- Card item START -->
					<div class="col-md-3">
						<div class="card shadow p-2 pb-0 h-350px">
							<!-- Image -->
							<img src="assets/images/category/hotel/4by3/10.jpg" class="rounded-2" alt="Card image">
		
							<!-- Card body START -->
							<div class="card-body px-3 pb-0">
								<!-- Title -->
								<h5 class="card-title mb-0"><a href="partnerDetail">시그니엘 서울</a></h5>
								<small><i class="fa-solid fa-location-dot"></i> 서울특별시 신천동</small>
							</div>
							<!-- Card body END -->
		
							<!-- Card footer START-->
							<div class="card-footer pt-1">
								<span class="badge bg-primary bg-opacity-10 text-primary"><i class="fa-solid fa-hashtag"></i> 키워드</span>
								<span class="badge bg-primary bg-opacity-10 text-primary"><i class="fa-solid fa-hashtag"></i> 키워드</span>
							</div>
						</div>
					</div>
					<!-- Card item END -->
					
					<!-- Card item START -->
					<div class="col-md-3">
						<div class="card shadow p-2 pb-0 h-350px">
							<!-- Image -->
							<img src="assets/images/category/hotel/4by3/10.jpg" class="rounded-2" alt="Card image">
		
							<!-- Card body START -->
							<div class="card-body px-3 pb-0">
								<!-- Title -->
								<h5 class="card-title mb-0"><a href="partnerDetail">시그니엘 서울</a></h5>
								<small><i class="fa-solid fa-location-dot"></i> 서울특별시 신천동</small>
							</div>
							<!-- Card body END -->
		
							<!-- Card footer START-->
							<div class="card-footer pt-1">
								<span class="badge bg-primary bg-opacity-10 text-primary"><i class="fa-solid fa-hashtag"></i> 키워드</span>
								<span class="badge bg-primary bg-opacity-10 text-primary"><i class="fa-solid fa-hashtag"></i> 키워드</span>
								<span class="badge bg-primary bg-opacity-10 text-primary"><i class="fa-solid fa-hashtag"></i> 키워드</span>
							</div>
						</div>
					</div>
					<!-- Card item END -->
		
					<!-- Card item START -->
					<div class="col-md-3">
						<div class="card shadow p-2 pb-0 h-350px">
							<!-- Image -->
							<img src="assets/images/category/hotel/4by3/10.jpg" class="rounded-2" alt="Card image">
		
							<!-- Card body START -->
							<div class="card-body px-3 pb-0">
								<!-- Title -->
								<h5 class="card-title mb-0"><a href="partnerDetail">시그니엘 서울</a></h5>
								<small><i class="fa-solid fa-location-dot"></i> 서울특별시 신천동</small>
							</div>
							<!-- Card body END -->
		
							<!-- Card footer START-->
							<div class="card-footer pt-1">
								<span class="badge bg-primary bg-opacity-10 text-primary"><i class="fa-solid fa-hashtag"></i> 키워드</span>
								<span class="badge bg-primary bg-opacity-10 text-primary"><i class="fa-solid fa-hashtag"></i> 키워드</span>
							</div>
						</div>
					</div>
					<!-- Card item END -->
					
					<!-- Card item START -->
					<div class="col-md-3">
						<div class="card shadow p-2 pb-0 h-350px">
							<!-- Image -->
							<img src="assets/images/category/hotel/4by3/10.jpg" class="rounded-2" alt="Card image">
		
							<!-- Card body START -->
							<div class="card-body px-3 pb-0">
								<!-- Title -->
								<h5 class="card-title mb-0"><a href="partnerDetail">시그니엘 서울</a></h5>
								<small><i class="fa-solid fa-location-dot"></i> 서울특별시 신천동</small>
							</div>
							<!-- Card body END -->
		
							<!-- Card footer START-->
							<div class="card-footer pt-1">
								<span class="badge bg-primary bg-opacity-10 text-primary"><i class="fa-solid fa-hashtag"></i> 키워드</span>
								<span class="badge bg-primary bg-opacity-10 text-primary"><i class="fa-solid fa-hashtag"></i> 키워드</span>
								<span class="badge bg-primary bg-opacity-10 text-primary"><i class="fa-solid fa-hashtag"></i> 키워드</span>
							</div>
						</div>
					</div>
					<!-- Card item END -->
				</div> <!-- Row END -->

			</div>
			<div class="tab-pane show active" id="tab-3-2">

			</div>
			<div class="tab-pane" id="tab-3-3">

			</div>
		</div>



		<!-- Pagination -->
		<div class="row">
			<div class="col-12">
				<nav class="mt-4 d-flex justify-content-center" aria-label="navigation">
					<ul class="pagination pagination-primary-soft d-inline-block d-md-flex rounded mb-0">
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
	</div>
</section>
</main>

<!-- footer -->
<%@ include file="/WEB-INF/views/include/footer.jsp" %>

<!-- footerScript -->
<%@ include file="/WEB-INF/views/include/footerScript.jsp" %>

<!-- page script -->
<script src="js/user/areaList.js"></script>
<script type="text/javascript">
	areaList.init();
</script>
</body>
</html>