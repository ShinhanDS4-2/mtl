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
				<div class="col-2">
					<div class="card bg-transparent text-center p-1 h-100 area-icon">
						<!-- Image -->
						<img src="assets/images/icon/서울.jpg" class="rounded-circle" alt="">
	
			 			<div class="card-body p-0 pt-3">
							<h5 class="card-title"><a href="javascript:;" class="stretched-link" data-src="areaList" data-act="clickArea" data-value="ALL">전체</a></h5>
							<span>All</span>
						</div>
					</div>
				</div>
				<div class="col-2">
					<div class="card bg-transparent text-center p-1 h-100 area-icon">
						<!-- Image -->
						<img src="assets/images/icon/서울.jpg" class="rounded-circle" alt="">
	
						<div class="card-body p-0 pt-3">
							<h5 class="card-title"><a href="javascript:;" class="stretched-link" data-src="areaList" data-act="clickArea" data-value="SEOUL">서울</a></h5>
							<span>Seoul</span>
						</div>
					</div>
				</div>
				<div class="col-2">
					<div class="card bg-transparent text-center p-1 h-100 area-icon">
						<!-- Image -->
						<img src="assets/images/icon/강릉.jpg" class="rounded-circle" alt="">
	
						<div class="card-body p-0 pt-3">
							<h5 class="card-title"><a href="javascript:;" class="stretched-link" data-src="areaList" data-act="clickArea" data-value="GANGNEUNG">강릉</a></h5>
							<span>Gangneung</span>
						</div>
					</div>
				</div>
				<div class="col-2">
					<div class="card bg-transparent text-center p-1 h-100 area-icon">
						<!-- Image -->
						<img src="assets/images/icon/여수.jpg" class="rounded-circle" alt="">
	
						<div class="card-body p-0 pt-3">
							<h5 class="card-title"><a href="javascript:;" class="stretched-link" data-src="areaList" data-act="clickArea" data-value="YEOSU">여수</a></h5>
							<span>Yeosu</span>
						</div>
					</div>
				</div>
				<div class="col-2">
					<div class="card bg-transparent text-center p-1 h-100 area-icon">
						<!-- Image -->
						<img src="assets/images/icon/부산.jpg" class="rounded-circle" alt="">
	
						<div class="card-body p-0 pt-3">
							<h5 class="card-title"><a href="javascript:;" class="stretched-link" data-src="areaList" data-act="clickArea" data-value="BUSAN">부산</a></h5>
							<span>Busan</span>
						</div>
					</div>
				</div>
				<div class="col-2">
					<div class="card bg-transparent text-center p-1 h-100 area-icon">
						<!-- Image -->
						<img src="assets/images/icon/제주.jpg" class="rounded-circle" alt="">
	
						<div class="card-body p-0 pt-3">
							<h5 class="card-title"><a href="javascript:;" class="stretched-link" data-src="areaList" data-act="clickArea" data-value="JEJU">제주</a></h5>
							<span>Jeju</span>
						</div>
					</div>
				</div>
			</div>
			<div class="col-2"></div>
		</div> <!-- Row END -->
	</div>
</section>

<section class="pt-4">
	<div class="container">
		<!-- tab line -->
		<ul class="nav nav-tabs nav-bottom-line mb-3">
			<li class="nav-item"> <a class="nav-link active" data-bs-toggle="tab" href="#tab1" data-src="areaList" data-act="clickAttration"> 관광지 </a> </li>
			<li class="nav-item"> <a class="nav-link" data-bs-toggle="tab" href="#tab2" data-src="areaList" data-act="clickRestaurang"> 맛집 </a> </li>
		</ul>
		<div class="tab-content">	 
			<!-- 관광지 탭 START (디폴트) -->
			<div class="tab-pane show active" id="tab1">
			</div>
			<!-- 관광지 탭 END -->
			
			<!-- 맛집 탭 START -->
			<div class="tab-pane" id="tab2">
			</div>
			<!-- 맛집 탭 END -->
		</div>

		<!-- 페이징 처리 START -->
		<div class="row">
			<div class="col-12">
				<nav class="mt-4 d-flex justify-content-center" aria-label="navigation">
					<ul id="pagination" class="pagination pagination-primary-soft d-inline-block d-md-flex rounded mb-0">  <!-- id="pagination" -->
					</ul>
				</nav>
			</div>
		</div>
		<!-- 페이징 처리 END -->
		
	</div>
</section>
</main>

<!-- footer -->
<%@ include file="/WEB-INF/views/include/footer.jsp" %>

<!-- footerScript -->
<%@ include file="/WEB-INF/views/include/footerScript.jsp" %>

<!-- page script -->
<script src="js/user/location/areaList.js"></script>
<script type="text/javascript">
	areaList.init();
</script>
</body>
</html>