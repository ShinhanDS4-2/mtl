<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>떠날지도  - 관리자</title>
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
					<h1 class="h3 mb-2">자주 묻는 질문 QnA</h1>
					<span>사용자가 자주 문의하는 항목을 관리할 수 있습니다.</span>
				</div>
			</div>

			<!-- 상단 navbar START -->
			<div class="row g-4 border-bottom">
				<!-- 새 질문 등록 버튼 클릭 시 모달창 표시 -->
				<div class="col-lg-12 d-flex justify-content-end">
					<button type="button" class="btn btn-primary-soft" data-bs-toggle="modal" data-bs-target="#qnaRegistModal">
						<i class="bi bi-plus-lg fa-fw"></i>새 질문 등록
					</button>
				</div>
			</div>
			<!-- 상단 navbar END -->

			<!-- 검색 필터 START -->
			<div class="card shadow border mt-4 mb-5">
				<!-- Card header -->
				<div class="card-header border-bottom">
					<h5 class="card-header-title">검색</h5>
				</div>
				<!-- Card body START -->
				<div class="card-body">
					<div class="row g-4 align-items-center mb-3">
						<div class="col-2">
							<label class="form-label">분류</label>
							<select class="form-select js-choice" aria-label=".form-select-sm" id="searchType">
								<option value="" selected="selected">전체</option>
								<option value="SERVICE">서비스</option>
								<option value="RESERVATION">예약/결제</option>
								<option value="USE">이용문의</option>
							</select>
						</div>
						<div class="col-6">
							<label class="form-label">상태</label>
							<div class="d-sm-flex">
								<div class="form-check radio-bg-light me-4">
									<input class="form-check-input" type="radio" name="searchStatus" id="flexRadioDefault1" checked value="">
									<label class="form-check-label" for="flexRadioDefault1">전체</label>
								</div>
								<div class="form-check radio-bg-light me-4">
									<input class="form-check-input" type="radio" name="searchStatus" id="flexRadioDefault2" value="Y">
									<label class="form-check-label" for="flexRadioDefault2">게시중</label>
								</div>
								<div class="form-check radio-bg-light me-4">
									<input class="form-check-input" type="radio" name="searchStatus" id="flexRadioDefault3" value="N">
									<label class="form-check-label" for="flexRadioDefault3">게시중단</label>
								</div>
							</div>
						</div>
					</div>
					<div class="row g-4 align-items-center">
						<!-- 검색어 입력 input -->
						<div class="d-sm-flex">
							<div class="col-2 me-2">
								<label class="form-label">선택</label>
								<select class="form-select js-choice" aria-label=".form-select-sm" id="searchKeyword">
									<option value="title">제목</option>
									<option value="content">내용</option>
								</select>
							</div>
							<div class="col-6">
								<label class="form-label">-</label>
								<input type="text" class="form-control" placeholder="검색어를 입력하세요" id="searchText">
							</div>
						</div>
						<!-- 초기화/검색 button -->
						<div class="d-sm-flex justify-content-end border-top pt-3">
							<button type="button" class="btn btn-primary-soft mb-0 ms-2">초기화</button>
							<button type="button" class="btn btn-primary mb-0 ms-2" data-src="faq" data-act="clickSearch">검색</button>
						</div>
					</div>
				</div>
			</div>
			<!-- 검색 필터 설정 END -->

			<!-- 문의 내역 List 상단 Tab -->
			<div class="row g-4 justify-content-start align-items-center mb-2">
				<div class="col-2">
					<h6 class="mb-1">총 <span id="totalCnt"></span>개</h6>
				</div>
			</div>
			<!-- 문의 내역 List START -->
			<div class="card shadow border">
				<!-- Card body START -->
				<div class="card-body">
					<!-- Table head -->
					<div class="bg-light rounded p-3 d-none d-lg-block">
						<div class="row g-4">
							<div class="col-2">
								<h6 class="mb-0">분류</h6>
							</div>
							<div class="col-6">
								<h6 class="mb-0">제목</h6>
							</div>
							<div class="col-2">
								<h6 class="mb-0">작성일</h6>
							</div>
							<div class="col-2">
								<h6 class="mb-0">상태</h6>
							</div>
						</div>
					</div>
					
					<div id="faqList" class="accordion">
						<div class="row align-items-lg-center border-bottom g-4 px-2 py-4">
							<div class="col-2">
								<small class="d-block d-lg-none">분류</small>
								<h6 class="ms-1 mb-0 fw-normal">서비스</h6>
							</div>
							<div class="col-6">
								<small class="d-block d-lg-none">제목</small>
								<a role="button" class="text-primary fw-bold ms-1 mb-0" data-bs-toggle="collapse" data-bs-target="#collapse-1" aria-expanded="false" aria-controls="collapse-1">sfasdfd</a>
							</div>
							<div class="col-2">
								<small class="d-block d-lg-none">작성일</small>
								<h6 class="ms-1 mb-0 fw-normal">2020-01-01</h6>
							</div>
							<div class="col-2">
								<small class="d-block d-lg-none">상태</small>
								<div class="ms-1 badge bg-opacity-10 bg-success text-success">게시중</div>
							</div>	
						</div>
						<!-- Body -->
						<div id="collapse-1" class="accordion-collapse collapse" aria-labelledby="heading-1" data-bs-parent="#faqList">
							<div class="accordion-body mt-3 border rounded">
								<p class="space">
									내용
									내용
									
									내용
									
									내용
								</p>
							</div>
						</div>
					</div>
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

<!-- 새 질문 등록 모달창 START -->
<div id="qnaRegistModal" class="modal" tabindex="-1" role="dialog">
	<div class="modal-dialog modal-xl modal-dialog-centered" role="document">
		<!-- 제일 큰 모달 -->
		<div class="modal-content">
			<!-- 모달 head -->
			<div class="modal-header">
				<h5 class="modal-title">새 질문 등록</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<!-- 모달 body -->
			<div class="modal-body m-3">
				<h6 class="fw-bold">제목</h6>
				<input type="text" class="form-control" id="questionTitle"
					placeholder="제목을 입력하세요">

				<h6 class="fw-bold mt-4">내용</h6>
				<textarea class="form-control" id="questionContent" rows="15"
					placeholder="내용을 입력하세요"></textarea>

				<!-- 상태 드롭다운 -->
				<div class="col-2 mt-4">
					<form>
						<select class="form-select js-choice"
							aria-label=".form-select-sm">
							<option>게시중</option>
							<option>게시중단</option>
						</select>
					</form>
				</div>
			</div>

			<!-- 확인/취소 button -->
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary"
					data-bs-dismiss="modal">취소</button>
				<button type="button" class="btn btn-primary">확인</button>
			</div>
		</div>
	</div>
</div>
<!-- 새 질문 등록 모달창 END -->

<!-- footerScript -->
<%@ include file="/WEB-INF/views/include/footerScript.jsp"%>
<script src="js/admin/support/faq.js"></script>
<script type="text/javascript">
	faq.init();
</script>
</body>

</html>