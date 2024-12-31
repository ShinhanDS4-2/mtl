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
						<h1 class="fs-2" id="locationName"></h1>  <!-- 여행지 이름 id="locationName" -->
						<h6 class="text-body mb-0" id="locationAddressSiDong"></h6>  <!-- 여행지 주소 시/동 id="locationAddressSiDong" -->
					</div>
				</div>
			</div>  
		</div>  
  
<!-- 이미지 시작 --> 
<div class="row mt-md-5" id="locationImageList">  
	<div class="col-12"> 
		<!-- 메인 이미지 (크게 표시) / 반복X 1개의 사진만 표시 -->
		<div class="main-image mb-4 img-container">
			<img src="https://mtl-s3-bucket.s3.ap-northeast-2.amazonaws.com/location/1/서울_롯데월드 아쿠아리움_1.jpg" alt="대체텍스트" class="img-fluid rounded w-100">
		</div>
	</div>
	
	<div class="col-12">
		<!-- 작은 이미지들 (아래에 나열) -->
		<div class="row">
		 	<!-- 아래 div 반복 돌리며 사진 리스트 보여줘야 함 -->
			<div class="col-6 col-md-3 mb-3 img-container-small">
				<img src="assets/images/location/서울_가로수길_1.png" alt="대체텍스트" class="img-fluid rounded">
			</div>
		</div>
	</div>
</div>
<!-- 이미지 끝 -->

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
								<p class="mb-5 space" id="locationDescription">  <!-- 여행지 설명 id="locationDescription" -->
								</p> 

								<!-- 키워드 시작-->
								<ul class="list-inline mb-4" id="locationKeywordList">  <!-- 키워드 id="locationKeywordList" -->
									<!-- 아래 li 반복 돌리며 키워드 리스트 출력 -->
									<li class="list-inline-item">
										<h5><span class="badge bg-primary bg-opacity-10 text-primary"><i class="fa-solid fa-hashtag"></i> <!-- 키워드(=data.keyword) 들어갈 부분 --> </span></h5>
									</li>
								</ul>
								<!-- 키워드 끝-->
								
								<!-- 지도 -->
								<div class="card card-body border">
									<!-- Title -->
									<div class="d-sm-flex justify-content-sm-between align-items-center mb-3">
										<div>
											<h5 class="text-primary"><b>위치 정보</b></h5>
											<p class="fw-bold mb-0"><i class="bi bi-geo-alt me-2"></i><span id="locationAddress"></span></p>  <!-- 여행지 주소 id="locationAddress" -->
										</div>
									</div>	
									<div class="w-200px h-400px" id="map">
									</div>	 
								</div> 
								<!-- 지도 --> 
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
	locationDetail.init(${param.location_idx});   
</script>
</body>
</html>