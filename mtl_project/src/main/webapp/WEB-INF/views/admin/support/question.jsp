<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>떠날지도 - 관리자</title>
	<!-- headerScript -->
	<%@ include file="/WEB-INF/views/include/headerScript.jsp" %>
</head>

<body>
	<main>
		<!-- Sidebar -->
		<%@ include file="/WEB-INF/views/include/adminSidebar.jsp"%>

		<!-- Page content START -->
		<div class="page-content">
			<!-- Topbar -->
			<%@ include file="/WEB-INF/views/include/adminTopbar.jsp" %>
		
			<!-- Page main content START -->
			<div class="page-content-wrapper p-xxl-4">

				<!-- Title -->
				<div class="row">
					<div class="col-12 mb-4 mb-sm-5">
						<h1 class="h3 mb-2">숙소 문의 관리</h1>
						<span>숙소 별 1:1 문의 현황을 확인할 수 있습니다.</span>
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
						<!-- Radio items -->
						<div class="col-12">
							<label class="form-label">답변 상태</label>
							<div class="d-sm-flex">
								<!-- Radio -->
								<div class="form-check radio-bg-light me-4">
									<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1" checked value="">
									<label class="form-check-label" for="flexRadioDefault1">전체</label>
								</div>
								<!-- Radio -->
								<div class="form-check radio-bg-light me-4">
									<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault2" value="Y">
									<label class="form-check-label" for="flexRadioDefault2">답변 완료</label>
								</div>
									<!-- Radio -->
								<div class="form-check radio-bg-light me-4">
									<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault3" value="N">
									<label class="form-check-label" for="flexRadioDefault3">답변 대기</label>
								</div>
							</div>
						</div>
					
						<div class="row d-flex mt-2 mb-4">
							<!-- 검색어 드롭다운 -->
							<div class="col-2">
								<label class="h6 fw-normal mb-0 form-label">검색어</label>
								<div class="form-border-bottom form-control-transparent form-fs-lg mt-2">
									<select class="form-select js-choice">
										<option value="" disabled="disabled" selected="selected">선택</option>
										<option value="userName">사용자명</option>
										<option value="content">내용</option>
									</select>
								</div>
							</div>
							
							<!-- 검색어 입력 input -->
							<div class="col-6">
								<label class="form-label">-</label>
								<input type="text" class="form-control" placeholder="검색어를 입력하세요" id="searchText">
							</div>
						</div>
						
						<!-- 초기화/검색 button -->
						<div class="d-sm-flex justify-content-end border-top pt-3">
							<button type="button" id="resetButton" class="btn btn-primary-soft mb-0 ms-2">초기화</button>
							<button type="button" id="searchButton" class="btn btn-primary mb-0 ms-2">검색</button>
						</div>
				</div>
			</div>
			<!-- 검색 필터 설정 END -->

			<!-- 예약 내역 List 상단 Tab -->
			<div class="row g-4 justify-content-between align-items-center mb-2">
				<div class="col-md-6 col-lg-6">
					<h6 class="mb-1">문의 <span id="totalCnt"></span>건</h6>
				</div>
			</div>

			<!-- 사용자 List START -->
			<div class="card shadow border">
				<!-- Card body START -->
				<div class="card-body">
					<!-- Table head -->
					<div class="bg-light rounded p-3 d-none d-sm-block">
						<div class="row row-cols-5 g-4 text-center">
							<div class="col">
								<h6 class="mb-0">제목</h6>
							</div>
							<div class="col">
								<h6 class="mb-0">사용자명</h6>
							</div>
							<div class="col">
								<h6 class="mb-0">등록일</h6>
							</div>
							<div class="col">
								<h6 class="mb-0">답변상태</h6>
							</div>
							<div class="col">
								<h6 class="mb-0"></h6>
							</div>
						</div>
					</div>

					<!-- Table data (1번째 예약내역 상세 데이터)-->
					<div id="answerList" >
						<div class="row row-cols-xl-7 g-4 align-items-sm-center border-bottom px-2 py-4">
							
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
			</div>
		</div>
	</div>
</main>

<!-- 문의 내용 모달 -->
<div id="questionModal" class="modal" tabindex="-1" role="dialog">
	<div class="modal-dialog modal-xl modal-dialog-centered" role="document">
		<!-- 제일 큰 모달 -->
		<div class="modal-content">
			<!-- 모달 head -->
			<div class="modal-header">
				<h5 class="modal-title">숙소 문의 상세</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<!-- 모달 body -->
			<div class="modal-body m-3">
				<h6 class="fw-bold">문의 내용</h6>
				<div class="border rounded p-3">
					<p class="space" id="questionContent"></p>
				</div>

				<h6 class="fw-bold mt-4">숙소 답변</h6>
				<textarea class="form-control" id="replyContent" rows="15" placeholder="내용을 입력하세요"></textarea>
			</div>

			<div class="modal-footer">
				<button type="button" class="btn btn-primary" data-bs-dismiss="modal">확인</button>
			</div>
		</div>
	</div>
</div>
<!-- footerScript -->
<%@ include file="/WEB-INF/views/include/footerScript.jsp" %>
<!-- page script -->
<script src="js/admin/support/question.js"></script>
<script type="text/javascript">
	questionManagement.init();
</script>
</body>
</html>