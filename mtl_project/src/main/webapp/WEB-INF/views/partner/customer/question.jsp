<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>[판매자] 고객관리 > 문의관리</title>

<!-- headerScript -->
<%@ include file="/WEB-INF/views/include/headerScript.jsp"%>
</head>

<body>

	<!-- **************** MAIN CONTENT START **************** -->
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
						<span>예약 고객의 1:1 문의를 확인해주세요. </span>
					</div>
				</div>

				<!-- 상단 navbar START -->
				<div class="row g-4 align-items-center border-bottom">
					<!-- Tabs -->
					<div class="col-lg-6">
						<ul class="mb-2 nav nav-pills-primary-soft nav-responsive">
							<li class="nav-item"><a class="nav-link mb-0 active"
								data-bs-toggle="tab" href="#tab-1">전체</a></li>
							<li class="nav-item"><a class="nav-link mb-0"
								data-bs-toggle="tab" href="#tab-2">문의</a></li>
							<li class="nav-item"><a class="nav-link mb-0"
								data-bs-toggle="tab" href="#tab-3">예약</a></li>
							<li class="nav-item"><a class="nav-link mb-0"
								data-bs-toggle="tab" href="#tab-4">환불</a></li>
						</ul>
					</div>
				</div>
				<!-- 상단 navbar END -->

				<!-- 검색 필터 START -->
				<div class="card shadow mt-4 mb-5">
					<!-- Card body START -->
					<div class="card-body">
						<form class="row g-4 align-items-center">

							<!-- 기간(시작일) 설정 -->
							<div class="col-md-6 col-lg-3">
								<label class="h6 fw-normal mb-0"><i
									class="bi bi-calendar text-primary me-1"></i>시작일</label>
								<!-- Input field -->
								<div
									class="form-border-bottom form-control-transparent form-fs-lg mt-2">
									<input type="text" class="form-control flatpickr py-2"
										data-date-format="d M Y" placeholder="시작일">
								</div>
							</div>
							<!-- 기간(종료일) 설정 -->
							<div class="col-md-6 col-lg-3">
								<!--col-md-6: medium화면에서 가로 12칸 중 6칸 차지, col-lg-2: large화면에서 12칸 중 2칸 차지-->
								<label class="h6 fw-normal mb-0"><i
									class="bi bi-calendar text-primary me-1"></i>종료일</label>
								<!-- Input field -->
								<div
									class="form-border-bottom form-control-transparent form-fs-lg mt-2">
									<input type="text" class="form-control flatpickr py-2"
										data-date-format="d M Y" placeholder="종료일">
								</div>
							</div>
							<div class="col-lg-3"></div>
							<div class="col-lg-3"></div>


							<!-- 검색어 드롭다운 -->
							<div class="col-md-6 col-lg-2">
								<label class="h6 fw-normal mb-0">검색어</label>
								<div
									class="form-border-bottom form-control-transparent form-fs-lg mt-2">
									<select class="form-select js-choice">
										<option value="">제목</option>
										<option>작성자</option>
									</select>
								</div>
							</div>
							<!-- 검색어 입력 input -->
							<div class="col-md-6 col-lg-3">
								<input type="text" class="form-control mt-4" placeholder="검색어">
							</div>

							<!-- 초기화/검색 button -->
							<div class="d-sm-flex justify-content-end border-top pt-3">
								<button type="button" class="btn btn-primary-soft mb-0 ms-2">초기화</button>
								<button type="button" class="btn btn-primary mb-0 ms-2">검색</button>
							</div>
						</form>
					</div>
				</div>
				<!-- 검색 필터 설정 END -->



				<!-- 문의 내역 List 상단 Tab -->
				<div class="row g-4 justify-content-between align-items-center mb-2">
					<div class="col-2">
						<h6 class="mb-1">총 101개</h6>
					</div>
					<div class="col-1">
						<form>
							<select class="form-select js-choice"
								aria-label=".form-select-sm">
								<option value="">10개</option>
								<option>20개</option>
								<option>50개</option>
								<option>100개</option>
							</select>
						</form>
					</div>
				</div>
				<!-- 문의 내역 List START -->
				<div class="card shadow">
					<!-- Card body START -->
					<div class="card-body">
						<!-- Table head -->
						<div class="bg-light rounded p-3 d-none d-lg-block">
							<div class="row row-cols-7 g-4">
								<div class="col">
									<h6 class="mb-0">분류</h6>
								</div>
								<div class="col">
									<h6 class="mb-0">제목</h6>
								</div>
								<div class="col">
									<h6 class="mb-0">작성자</h6>
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
						<div
							class="row row-cols-xl-7 align-items-lg-center border-bottom g-4 px-2 py-4">
							<!-- Data item -->
							<div class="col">
								<small class="d-block d-lg-none">분류</small>
								<h6 class="ms-1 mb-0 fw-normal">문의</h6>
							</div>

							<!-- 제목 클릭하면, 문의 상세조회 페이지로 넘어감 -->
							<div class="col">
								<small class="d-block d-lg-none">제목</small>
								<a role="button" href="/mtl/partner/questionreply" class="ms-1 mb-0 fw-bold text-primary">
									우하하
								</a>
							</div>

							<!-- Data item -->
							<div class="col">
								<small class="d-block d-lg-none">작성자</small>
								<h6 class="ms-1 mb-0 fw-normal">test1234</h6>
							</div>
							<!-- Data item -->
							<div class="col">
								<small class="d-block d-lg-none">작성일</small>
								<h6 class="ms-1 mb-0 fw-normal">2024.12.20(금)</h6>
							</div>

							<!-- Data item -->
							<div class="col">
								<small class="d-block d-lg-none">답변상태</small>
								<div class="ms-1 badge bg-success bg-opacity-10 text-success">답변완료</div>
							</div>
						</div>

						<!-- Table data -->
						<div
							class="row row-cols-xl-7 align-items-lg-center border-bottom g-4 px-2 py-4">
							<!-- Data item -->
							<div class="col">
								<small class="d-block d-lg-none">분류</small>
								<h6 class="ms-1 mb-0 fw-normal">환불</h6>
							</div>

							<!-- 제목 클릭하면, 문의 상세조회 페이지로 넘어감 -->
							<div class="col">
								<small class="d-block d-lg-none">제목</small>
								<a role="button" href="/mtl/partner/questionreply" class="ms-1 mb-0 fw-bold text-primary">
									환불해주세요
								</a>
							</div>

							<!-- Data item -->
							<div class="col">
								<small class="d-block d-lg-none">작성자</small>
								<h6 class="ms-1 mb-0 fw-normal">test1234</h6>
							</div>
							<!-- Data item -->
							<div class="col">
								<small class="d-block d-lg-none">작성일</small>
								<h6 class="ms-1 mb-0 fw-normal">2024.12.20(금)</h6>
							</div>

							<!-- Data item -->
							<div class="col">
								<small class="d-block d-lg-none">답변상태</small>
								<div class="ms-1 badge bg-orange bg-opacity-10 text-orange">대기중</div>
							</div>
						</div>

						<!-- Table data -->
						<div
							class="row row-cols-xl-7 align-items-lg-center border-bottom g-4 px-2 py-4">
							<!-- Data item -->
							<div class="col">
								<small class="d-block d-lg-none">분류</small>
								<h6 class="ms-1 mb-0 fw-normal">예약</h6>
							</div>

							<!-- 제목 클릭하면, 문의 상세조회 페이지로 넘어감 -->
							<div class="col">
								<small class="d-block d-lg-none">제목</small>
								<a role="button" href="/mtl/partner/questionreply" class="ms-1 mb-0 fw-bold text-primary">
									일정변경대나요?
								</a>
							</div>

							<!-- Data item -->
							<div class="col">
								<small class="d-block d-lg-none">작성자</small>
								<h6 class="ms-1 mb-0 fw-normal">test1234</h6>
							</div>
							<!-- Data item -->
							<div class="col">
								<small class="d-block d-lg-none">작성일</small>
								<h6 class="ms-1 mb-0 fw-normal">2024.12.20(금)</h6>
							</div>

							<!-- Data item -->
							<div class="col">
								<small class="d-block d-lg-none">답변상태</small>
								<div class="ms-1 badge bg-danger bg-opacity-10 text-danger">대기중</div>
							</div>
						</div>

						<!-- Table data -->
						<div
							class="row row-cols-xl-7 align-items-lg-center border-bottom g-4 px-2 py-4">
							<!-- Data item -->
							<div class="col">
								<small class="d-block d-lg-none">분류</small>
								<h6 class="ms-1 mb-0 fw-normal">환불</h6>
							</div>

							<!-- 제목 클릭하면, 문의 상세조회 페이지로 넘어감 -->
							<div class="col">
								<small class="d-block d-lg-none">제목</small>
								<a role="button" href="/mtl/partner/questionreply" class="ms-1 mb-0 fw-bold text-primary">
									젬ㄱ제목제목
								</a>
							</div>

							<!-- Data item -->
							<div class="col">
								<small class="d-block d-lg-none">작성자</small>
								<h6 class="ms-1 mb-0 fw-normal">test1234</h6>
							</div>
							<!-- Data item -->
							<div class="col">
								<small class="d-block d-lg-none">작성일</small>
								<h6 class="ms-1 mb-0 fw-normal">2024.12.20(금)</h6>
							</div>

							<!-- Data item -->
							<div class="col">
								<small class="d-block d-lg-none">답변상태</small>
								<div class="ms-1 badge bg-danger bg-opacity-10 text-danger">대기중</div>
							</div>
						</div>

					</div>
					<!-- Card body END -->

					<!-- Card footer START -->
					<div class="card-footer pt-0">
						<!-- Pagination (페이지 전환 하단 바)-->
						<nav class="d-flex justify-content-center">
							<ul class="pagination pagination-sm pagination-primary-soft mb-0">
								<li class="page-item disabled">
									<!-- disabled: 버튼 비활성화--> <a class="page-link" href="#"
									tabindex="-1">&lt;</a>
								</li>
								<li class="page-item"><a class="page-link" href="#">1</a></li>
								<li class="page-item active"><a class="page-link" href="#">2</a></li>
								<li class="page-item"><a class="page-link" href="#">3</a></li>
								<li class="page-item"><a class="page-link" href="#">4</a></li>
								<li class="page-item disabled"><a class="page-link"
									href="#">..</a></li>
								<li class="page-item"><a class="page-link" href="#">11</a></li>
								<li class="page-item"><a class="page-link" href="#">12</a></li>
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
	<!-- **************** MAIN CONTENT END **************** -->

	<!-- footerScript -->
	<%@ include file="/WEB-INF/views/include/footerScript.jsp"%>

</body>
</html>