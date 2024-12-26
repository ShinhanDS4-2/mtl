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
						<span>QnA를 등록해주세요. </span>
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
								data-bs-toggle="tab" href="#tab-2">예약</a></li>
							<li class="nav-item"><a class="nav-link mb-0"
								data-bs-toggle="tab" href="#tab-3">결제</a></li>
							<li class="nav-item"><a class="nav-link mb-0"
								data-bs-toggle="tab" href="#tab-4">시스템</a></li>
						</ul>
					</div>
					<!-- 새 질문 등록 버튼 클릭 시 모달창 표시 -->
					<div class="col-lg-6 d-flex justify-content-end">
						<button type="button" class="btn btn-primary-soft"
							data-bs-toggle="modal" data-bs-target="#xlargeModal">
							<i class="bi bi-plus-lg fa-fw"></i>새 질문 등록
						</button>
					</div>
				</div>
				<!-- 상단 navbar END -->


				<!-- 모달창 START -->
				<div id="xlargeModal" class="modal" tabindex="-1" role="dialog">
					<div class="modal-dialog modal-xl" role="document">
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

							<!-- 모달 footer -->
							<div class="modal-footer mt-2">
								<button type="button" class="btn btn-primary">출력</button>
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">닫기</button>
							</div>
						</div>
					</div>
				</div>
				<!-- 모달창 END -->
				
				<!-- 검색 필터 START -->
				<div class="card shadow border mt-4 mb-5">
					<!-- Card header -->
					<div class="card-header border-bottom">
						<h5 class="card-header-title">예약내역 상세 검색(예시)</h5>
					</div>
					<!-- Card body START -->
					<div class="card-body">
						<form class="row g-4 align-items-center">
							<!-- 기간(시작일) 설정 -->
							<div class="col-3">
								<label class="h6 fw-normal mb-0"><i
									class="bi bi-calendar text-primary me-1"></i>작성일</label>
								<!-- Input field -->
								<div
									class="form-border-bottom form-control-transparent form-fs-lg mt-2">
									<input type="text" class="form-control flatpickr py-2"
										data-date-format="d M Y" placeholder="시작일">
								</div>
							</div>
							<!-- 기간(종료일) 설정 -->
							<div class="col-3">
								<!--col-md-6: medium화면에서 가로 12칸 중 6칸 차지, col-lg-2: large화면에서 12칸 중 2칸 차지-->
								<label class="h6 fw-normal mb-0"></label>
								<!-- Input field -->
								<div
									class="form-border-bottom form-control-transparent form-fs-lg mt-2">
									<input type="text" class="form-control flatpickr py-2"
										data-date-format="d M Y" placeholder="종료일">
								</div>
							</div>

							<!-- 검색어 입력 input -->
							<div class="col-12">
								<div class="col-6">
									<label class="form-label">제목</label> <input type="text"
										class="form-control" placeholder="내용을 입력하세요">
								</div>
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
					<div class="col-2">
						<form>
							<select class="form-select js-choice"
								aria-label=".form-select-sm">
								<option>게시중</option>
								<option>게시중단</option>
							</select>
						</form>
					</div>
				</div>
				<!-- 문의 내역 List START -->
				<div class="card shadow border">
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
									<h6 class="mb-0">작성일</h6>
								</div>
								<div class="col">
									<h6 class="mb-0">상태</h6>
								</div>
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

							<!-- Data item -->
							<div class="col">
								<small class="d-block d-lg-none">제목</small>
								<h6 class="ms-1 mb-0 fw-normal text-primary">
									<b>우하하</b>
								</h6>
							</div>

							<div class="col">
								<small class="d-block d-lg-none">작성일</small>
								<h6 class="ms-1 mb-0 fw-normal">2024.12.20(금)</h6>
							</div>

							<!-- Data item -->
							<div class="col">
								<small class="d-block d-lg-none">상태</small>
								<div class="ms-1 badge bg-success bg-opacity-10 text-success">게시중</div>
							</div>
						</div>
						<!-- Table data -->
						<div
							class="row row-cols-xl-7 align-items-lg-center border-bottom g-4 px-2 py-4">
							<!-- Data item -->
							<div class="col">
								<small class="d-block d-lg-none">분류</small>
								<h6 class="ms-1 mb-0 fw-normal">결제</h6>
							</div>

							<!-- Data item -->
							<div class="col">
								<small class="d-block d-lg-none">제목</small>
								<h6 class="ms-1 mb-0 fw-normal text-primary">
									<b>제목제목제목제목</b>
								</h6>
							</div>

							<div class="col">
								<small class="d-block d-lg-none">작성일</small>
								<h6 class="ms-1 mb-0 fw-normal">2024.12.20(금)</h6>
							</div>

							<!-- Data item -->
							<div class="col">
								<small class="d-block d-lg-none">상태</small>
								<div class="ms-1 badge bg-danger bg-opacity-10 text-danger">게시중단</div>
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

							<!-- Data item -->
							<div class="col">
								<small class="d-block d-lg-none">제목</small>
								<h6 class="ms-1 mb-0 fw-normal text-primary">
									<b>ㅎㅎㅎㅎㅎㅎㅎㅎ</b>
								</h6>
							</div>

							<div class="col">
								<small class="d-block d-lg-none">작성일</small>
								<h6 class="ms-1 mb-0 fw-normal">2024.12.20(금)</h6>
							</div>

							<!-- Data item -->
							<div class="col">
								<small class="d-block d-lg-none">상태</small>
								<div class="ms-1 badge bg-success bg-opacity-10 text-success">게시중</div>
							</div>
						</div>
						<!-- Table data -->
						<div
							class="row row-cols-xl-7 align-items-lg-center border-bottom g-4 px-2 py-4">
							<!-- Data item -->
							<div class="col">
								<small class="d-block d-lg-none">분류</small>
								<h6 class="ms-1 mb-0 fw-normal">결제</h6>
							</div>

							<!-- Data item -->
							<div class="col">
								<small class="d-block d-lg-none">제목</small>
								<h6 class="ms-1 mb-0 fw-normal text-primary">
									<b>제목제목제목제목</b>
								</h6>
							</div>

							<div class="col">
								<small class="d-block d-lg-none">작성일</small>
								<h6 class="ms-1 mb-0 fw-normal">2024.12.20(금)</h6>
							</div>

							<!-- Data item -->
							<div class="col">
								<small class="d-block d-lg-none">상태</small>
								<div class="ms-1 badge bg-danger bg-opacity-10 text-danger">게시중단</div>
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

							<!-- Data item -->
							<div class="col">
								<small class="d-block d-lg-none">제목</small>
								<h6 class="ms-1 mb-0 fw-normal text-primary">
									<b>ㅁㅁㅁㅁㅁㅁ</b>
								</h6>
							</div>

							<div class="col">
								<small class="d-block d-lg-none">작성일</small>
								<h6 class="ms-1 mb-0 fw-normal">2024.12.20(금)</h6>
							</div>

							<!-- Data item -->
							<div class="col">
								<small class="d-block d-lg-none">상태</small>
								<div class="ms-1 badge bg-success bg-opacity-10 text-success">게시중</div>
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