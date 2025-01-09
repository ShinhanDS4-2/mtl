<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>떠날지도 - 파트너센터</title>
<!-- headerScript -->
<%@ include file="/WEB-INF/views/include/headerScript.jsp"%>
</head>
<body>
<main>
	<!-- Sidebar -->
	<%@ include file="/WEB-INF/views/include/partnerSidebar.jsp"%>
	<!-- Page content START -->
	<div class="page-content">
		<!-- Topbar -->
		<%@ include file="/WEB-INF/views/include/partnerTopbar.jsp"%>
		<!-- Page main content START -->
		<div class="page-content-wrapper p-xxl-4">
			<!-- Title -->
			<div class="row">
				<div class="col-12 mb-4 mb-sm-5">
					<h1 class="h3 mb-2">고객 문의 관리</h1>
					<span>고객의 1:1 문의를 확인해주세요. </span>
				</div>
			</div>

			<!-- 검색 필터 START -->
			<div class="card shadow mt-4 mb-5">
				<!-- Card body START -->
				<div class="card-body">
					<div class="row g-4 align-items-center mb-2">
						<div class="col-6">
							<label class="form-label">상태</label>
							<div class="d-sm-flex">
								<div class="form-check radio-bg-light me-4">
									<input class="form-check-input" type="radio" name="searchStatus" id="flexRadioDefault1" checked value="">
									<label class="form-check-label" for="flexRadioDefault1">전체</label>
								</div>
								<div class="form-check radio-bg-light me-4">
									<input class="form-check-input" type="radio" name="searchStatus" id="flexRadioDefault2" value="Y">
									<label class="form-check-label" for="flexRadioDefault2">답변완료</label>
								</div>
								<div class="form-check radio-bg-light me-4">
									<input class="form-check-input" type="radio" name="searchStatus" id="flexRadioDefault3" value="N">
									<label class="form-check-label" for="flexRadioDefault3">답변대기</label>
								</div>
							</div>
						</div>			
					</div>
					<div class="row g-4 align-items-center">
						<!-- 검색어 드롭다운 -->
						<div class="col-md-2">
							<label class="h6 fw-normal mb-0 form-label">검색어</label>
							<div class="form-border-bottom form-control-transparent form-fs-lg mt-2">
								<select class="form-select js-choice" id="searchType">
									<option value="title">제목</option>
									<option value="content">내용</option>
									<option value="user">작성자</option>
								</select>
							</div>
						</div>
						<!-- 검색어 입력 input -->
						<div class="col-md-6">
							<label class="h6 fw-normal mb-0 form-label">-</label>
							<input type="text" class="form-control mt-4" placeholder="검색어">
						</div>

						<!-- 초기화/검색 button -->
						<div class="d-sm-flex justify-content-end border-top pt-3">
							<button type="button" class="btn btn-primary-soft mb-0 ms-2" onclick="window.location.reload()">초기화</button>
							<button type="button" class="btn btn-primary mb-0 ms-2">검색</button>
						</div>
					</div>
				</div>
			</div>
			<!-- 검색 필터 설정 END -->

			<!-- 문의 내역 List 상단 Tab -->
			<div class="row g-4 justify-content-start align-items-center mb-2">
				<div class="col-2">
					<h6 class="mb-1">총 <span id="totalCnt">101</span>개</h6>
				</div>
			</div>
			<!-- 문의 내역 List START -->
			<div class="card shadow">
				<!-- Card body START -->
				<div class="card-body">
					<!-- Table head -->
					<div class="bg-light rounded p-3 d-none d-lg-block">
						<div class="row row-cols-4 g-4">
							<div class="col">
								<h6 class="mb-0">제목</h6>
							</div>
							<div class="col">
								<h6 class="mb-0">작성자 이메일</h6>
							</div>
							<div class="col">
								<h6 class="mb-0">작성일</h6>
							</div>
							<div class="col">
								<h6 class="mb-0">답변상태</h6>
							</div>
						</div>
					</div>

					<!-- Table data -->
					<div class="row row-cols-xl-4 align-items-lg-center border-bottom g-4 px-2 py-4">

						<!-- 제목 클릭하면, 문의 상세조회 페이지로 넘어감 -->
						<div class="col">
							<small class="d-block d-lg-none">제목</small>
							<a role="button" href="/mtl/partner/question/reply?idx=" class="ms-1 mb-0 fw-bold text-primary">
								우하하
							</a>
						</div>

						<!-- Data item -->
						<div class="col">
							<small class="d-block d-lg-none">작성자</small>
							<h6 class="ms-1 mb-0 fw-normal">test1234@gmail.com</h6>
						</div>
						<!-- Data item -->
						<div class="col">
							<small class="d-block d-lg-none">작성일</small>
							<h6 class="ms-1 mb-0 fw-normal">2024.12.20</h6>
						</div>

						<!-- Data item -->
						<div class="col">
							<small class="d-block d-lg-none">답변상태</small>
							<div class="ms-1 badge bg-success bg-opacity-10 text-success">답변완료</div>
						</div>
					</div>

					<!-- Table data -->
					<div class="row row-cols-xl-7 align-items-lg-center border-bottom g-4 px-2 py-4">
						<!-- 제목 클릭하면, 문의 상세조회 페이지로 넘어감 -->
						<div class="col">
							<small class="d-block d-lg-none">제목</small>
							<a role="button" href="/mtl/partner/question/reply?idx=" class="ms-1 mb-0 fw-bold text-primary">
								환불해주세요
							</a>
						</div>

						<!-- Data item -->
						<div class="col">
							<small class="d-block d-lg-none">작성자</small>
							<h6 class="ms-1 mb-0 fw-normal">test1234@gmail.com</h6>
						</div>
						<!-- Data item -->
						<div class="col">
							<small class="d-block d-lg-none">작성일</small>
							<h6 class="ms-1 mb-0 fw-normal">2024.12.20</h6>
						</div>

						<!-- Data item -->
						<div class="col">
							<small class="d-block d-lg-none">답변상태</small>
							<div class="ms-1 badge bg-danger bg-opacity-10 text-danger">답변완료</div>
						</div>
					</div>

					<!-- Table data -->
					<div class="row row-cols-xl-7 align-items-lg-center border-bottom g-4 px-2 py-4">
						<!-- 제목 클릭하면, 문의 상세조회 페이지로 넘어감 -->
						<div class="col">
							<small class="d-block d-lg-none">제목</small>
							<a role="button" href="/mtl/partner/question/reply?idx=" class="ms-1 mb-0 fw-bold text-primary">
								일정변경대나요?
							</a>
						</div>

						<!-- Data item -->
						<div class="col">
							<small class="d-block d-lg-none">작성자</small>
							<h6 class="ms-1 mb-0 fw-normal">test1234@gmail.com</h6>
						</div>
						<!-- Data item -->
						<div class="col">
							<small class="d-block d-lg-none">작성일</small>
							<h6 class="ms-1 mb-0 fw-normal">2024.12.20</h6>
						</div>

						<!-- Data item -->
						<div class="col">
							<small class="d-block d-lg-none">답변상태</small>
							<div class="ms-1 badge bg-danger bg-opacity-10 text-danger">답변완료</div>
						</div>
					</div>

					<!-- Table data -->
					<div
						class="row row-cols-xl-7 align-items-lg-center border-bottom g-4 px-2 py-4">
						<!-- 제목 클릭하면, 문의 상세조회 페이지로 넘어감 -->
						<div class="col">
							<small class="d-block d-lg-none">제목</small>
							<a role="button" href="/mtl/partner/question/reply?idx=" class="ms-1 mb-0 fw-bold text-primary">
								젬ㄱ제목제목
							</a>
						</div>

						<!-- Data item -->
						<div class="col">
							<small class="d-block d-lg-none">작성자</small>
							<h6 class="ms-1 mb-0 fw-normal">test1234@gmail.com</h6>
						</div>
						<!-- Data item -->
						<div class="col">
							<small class="d-block d-lg-none">작성일</small>
							<h6 class="ms-1 mb-0 fw-normal">2024.12.20</h6>
						</div>

						<!-- Data item -->
						<div class="col">
							<small class="d-block d-lg-none">답변상태</small>
							<div class="ms-1 badge bg-danger bg-opacity-10 text-danger">답변완료</div>
						</div>
					</div>

				</div>
				<!-- Card body END -->

				<!-- Card footer START -->
				<div class="card-footer pt-0">
					<!-- Pagination (페이지 전환 하단 바)-->
					<nav class="d-flex justify-content-center">
						<ul class="pagination pagination-sm pagination-primary-soft mb-0" id="pagination">
							<li class="page-item disabled">
								<!-- disabled: 버튼 비활성화--> <a class="page-link" href="#"
								tabindex="-1">&lt;</a>
							</li>
							<li class="page-item"><a class="page-link" href="#">1</a></li>
							<li class="page-item active"><a class="page-link" href="#">2</a></li>
							<li class="page-item"><a class="page-link" href="#">3</a></li>
							<li class="page-item"><a class="page-link" href="#">4</a></li>
							<li class="page-item"><a class="page-link" href="#">5</a></li>
							<li class="page-item"><a class="page-link" href="#">&gt;</a>
							</li>
						</ul>
					</nav>

				</div>
				<!-- Card footer END -->
			</div>
			<!-- 문의 내역 List END -->
		</div>
		<!-- Page main content END -->
	</div>
	<!-- Page content END -->
</main>
	<!-- footerScript -->
	<%@ include file="/WEB-INF/views/include/footerScript.jsp"%>

</body>
</html>