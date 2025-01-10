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
				<div class="col-12 mb-5">
					<h3>판매자 관리</h3>
					<span>판매자 정보를 확인할 수 있습니다.</span>
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
				<div class="row g-4 align-items-center">
					<!-- Radio items -->
					<div class="col-12">
						<label class="form-label">상태</label>
						<div class="d-sm-flex">
							<!-- Radio -->
							<div class="form-check radio-bg-light me-4">
								<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1" checked value="">
								<label class="form-check-label" for="flexRadioDefault1">전체</label>
							</div>
							<!-- Radio -->
							<div class="form-check radio-bg-light me-4">
								<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault2" value="Y">
								<label class="form-check-label" for="flexRadioDefault2">승인</label>
							</div>
							<!-- Radio -->
							<div class="form-check radio-bg-light me-4">
								<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault3" value="N">
								<label class="form-check-label" for="flexRadioDefault3">미승인</label>
							</div>
						</div>
					</div>

					<!-- 검색어 드롭다운 -->
					<div class="col-2">
						<label class="h6 fw-normal mb-0">검색어</label>
						<div class="form-border-bottom form-control-transparent form-fs-lg mt-2">
							<select class="form-select js-choice" id="searchType">
								<option value="name">숙소명</option>
								<option value="email">이메일</option>
							</select>
						</div>
					</div>
					<!-- 검색어 입력 input -->
					<div class="col-6">
						<label class="form-label"></label> 
						<input type="text" class="form-control" id="searchKeyword" placeholder="검색어를 입력하세요">
					</div>

					<!-- 초기화/검색 button -->
					<div class="d-sm-flex justify-content-end border-top pt-3">
						<button type="button" class="btn btn-primary-soft mb-0 ms-2" onclick="window.location.reload()">초기화</button>
						<button type="button" class="btn btn-primary mb-0 ms-2" id="searchButton">검색</button>
					</div>
				</div>
			</div>
		</div>
		<!-- 검색 필터 설정 END -->

			<!-- 예약 내역 List 상단 Tab -->
			<div class="row g-4 justify-content-start align-items-center mb-2">
				<div class="col-md-6 col-lg-6">
					<h6 class="mb-1">전체 판매자 <span class="totalCount"></span>명</h6>
				</div>
			</div>

			<!-- 사용자 List START -->
			<div class="card shadow border">
				<!-- Card body START -->
				<div class="card-body">
					<!-- Table head -->
					<div class="bg-light rounded p-3 d-none d-sm-block">
						<div class="row row-cols-6 g-4">
							<div class="col">
								<h6 class="mb-0">숙소명</h6>
							</div>
							<div class="col">
								<h6 class="mb-0">이메일</h6>
							</div>
							<div class="col">
								<h6 class="mb-0">업체 연락처</h6>
							</div>
							<div class="col">
								<h6 class="mb-0">가입일</h6>
							</div>
							<div class="col">
								<h6 class="mb-0">상태</h6>
							</div>
							<div class="col">
								<h6 class="mb-0"></h6>
							</div>
						</div>
					</div>

					<div id="partnerList">
					</div>
					
					
					
				<!-- Card body END -->

				<!-- Card footer START -->
				<div class="card-footer pt-0">
					<!-- Pagination (페이지 전환 하단 바)-->
					<nav class="d-flex justify-content-center">
						<ul class="pagination pagination-sm pagination-primary-soft mb-0" id="pagination">
						</ul>
					</nav>
				</div>
			</div>
		</div>
	</div>
</main>

<!-- footerScript -->
<%@ include file="/WEB-INF/views/include/footerScript.jsp"%>

<!-- page script -->
<script src="/mtl/js/admin/partnerList.js"></script>
<script type="text/javascript">
	partnerList.init();
</script>


</body>
</html>