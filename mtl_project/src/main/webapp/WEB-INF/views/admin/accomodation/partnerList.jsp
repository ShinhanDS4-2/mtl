<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<title>떠날지도 - 관리자</title>

<!-- headerScript -->
<%@ include file="/WEB-INF/views/include/headerScript.jsp"%>
</head>
<body>
	<main>
		<!-- Sidebar -->
		<%@ include file="/WEB-INF/views/include/adminSidebar.jsp"%>

		<!-- Page content START -->
		<div class="page-content">
			<!-- Topbar -->
			<%@ include file="/WEB-INF/views/include/adminTopbar.jsp"%>
			<!-- Page main content START -->
			<div class="page-content-wrapper p-xxl-4">

				<!-- Title -->
				<div class="row">
					<div class="col-12 mb-4 mb-sm-5">
						<h1 class="h3 mb-2">숙소 관리</h1>
						<span>승인 받은 숙소의 상세 정보를 확인할 수 있습니다.</span>
					</div>
				</div>

				<!-- 검색 필터 START -->
				<div class="card shadow mb-5">
					<!-- Card header -->
					<div class="card-header border-bottom">
						<h5 class="card-header-title">검색</h5>
					</div>
					<!-- Card body START -->
					<div class="card-body">
						<form class="row g-4 align-items-center">
							<!-- Radio items -->
							<div class="col-12">
								<label class="form-label">지역</label>
								<div class="d-sm-flex" id="areaCheck">
									<!-- Radio -->
									<div class="form-check radio-bg-light me-4">
										<input class="form-check-input" type="checkbox" name="flexRadioDefault" id="flexRadioDefault1" checked value="">
										<label class="form-check-label" for="flexRadioDefault1">전체</label>
									</div>
									<!-- Radio -->
									<div class="form-check radio-bg-light me-4">
										<input class="form-check-input" type="checkbox" name="flexRadioDefault" id="flexRadioDefault2" value="seoul">
										<label class="form-check-label" for="flexRadioDefault2">서울</label>
									</div>
									<!-- Radio -->
									<div class="form-check radio-bg-light me-4">
										<input class="form-check-input" type="checkbox" name="flexRadioDefault" id="flexRadioDefault3" value="gangneung">
										<label class="form-check-label" for="flexRadioDefault3">강릉</label>
									</div>
									<!-- Radio -->
									<div class="form-check radio-bg-light me-4">
										<input class="form-check-input" type="checkbox" name="flexRadioDefault" id="flexRadioDefault4" value="yeosu">
										<label class="form-check-label" for="flexRadioDefault4">여수</label>
									</div>
									<!-- Radio -->
									<div class="form-check radio-bg-light me-4">
										<input class="form-check-input" type="checkbox" name="flexRadioDefault" id="flexRadioDefault5" value="busan">
										<label class="form-check-label" for="flexRadioDefault5">부산</label>
									</div>
									<!-- Radio -->
									<div class="form-check radio-bg-light me-4">
										<input class="form-check-input" type="checkbox" name="flexRadioDefault" id="flexRadioDefault6" value="jeju">
										<label class="form-check-label" for="flexRadioDefault6">제주</label>
									</div>
								</div>
							</div>

							<!-- 검색어 입력 input -->
							<div class="col-6 mb-2">
								<label class="form-label">숙소명</label>
								<input type="text" class="form-control" placeholder="숙소명을 입력하세요" name="searchText">
							</div>

							<!-- 초기화/검색 button -->
							<div class="d-sm-flex justify-content-end border-top pt-3">
								<button type="button" id="resetButton"class="btn btn-primary-soft mb-0 ms-2">초기화</button>
								<button type="button" id="searchButton" class="btn btn-primary mb-0 ms-2">검색</button>
							</div>
						</form>
					</div>
				</div>
				<!-- 검색 필터 설정 END -->

				<!-- 예약 내역 List 상단 Tab -->
				<div class="row g-4 justify-content-between align-items-center mb-2">
					<div class="col-md-6 col-lg-6">
						<h6 class="mb-1">전체 숙소 <span id="totalCnt">50</span>개</h6>
					</div>
				</div>

				<!-- 사용자 List START -->
				<div class="card shadow border">
					<!-- Card body START -->
					<div class="card-body">
						<!-- Table head -->
						<div class="bg-light rounded p-3 d-none d-sm-block">
							<div class="row row-cols-7 g-4 text-center">
								<div class="col">
									<h6 class="mb-0">지역</h6>
								</div>
								<div class="col">
									<h6 class="mb-0">숙소명</h6>
								</div>
								<div class="col">
									<h6 class="mb-0">객실수</h6>
								</div>
								<div class="col">
									<h6 class="mb-0">등록일</h6>
								</div>
								<div class="col">
									<h6 class="mb-0"></h6>
								</div>
							</div>
						</div>

						<!-- Table data (1번째 예약내역 상세 데이터)-->
						
						<!-- Table data (4번째 예약내역 상세 데이터)-->
						<div id="answerList">
							<div class="row row-cols-xl-7 g-4 align-items-sm-center border-bottom px-2 py-4 text-center">
								
							</div>
						</div>
					</div>
					<!-- Card body END -->

					<!-- Card footer START -->
					<div class="card-footer pt-4">
						<!-- Pagination (페이지 전환 하단 바)-->
						<nav class="d-flex justify-content-center">
							<ul class="pagination pagination-sm pagination-primary-soft mb-0" id="pagination">
							</ul>
						</nav>

					</div>
					<!-- Card footer END -->
				</div>
				<!-- 사용자 List END -->
			</div>
			<!-- Page main content END -->
		</div>
		<!-- Page content END -->
	</main>
	<!-- **************** MAIN CONTENT END **************** -->

	<!-- footerScript -->
	<%@ include file="/WEB-INF/views/include/footerScript.jsp"%>
<!-- page script -->
<script src="js/admin/accomodation/partnerList.js"></script>
<script type="text/javascript">
	partnerList.init();
</script>

</body>
</html>