<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<title>[관리자] 정산 관리 > 정산 내역</title>

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
						<h1 class="h3 mb-2">정산 내역</h1>
						<span>ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ.</span>
					</div>
				</div>

				<!-- 검색 필터 START -->
				<div class="card shadow mt-4 mb-5">
					<!-- Card header -->
					<div class="card-header border-bottom">
						<h5 class="card-header-title">검색필터(예시)</h5>
					</div>
					<!-- Card body START -->
					<div class="card-body">
						<form class="row g-4 align-items-center">
							<!-- 드롭다운 -->
							<div class="col-2">
								<label class="h6 fw-normal mb-0"><i
									class="bi bi-calendar text-primary me-1"></i>기간</label>
								<!-- Input field -->
								<div
									class="form-border-bottom form-control-transparent form-fs-lg mt-2">
									<select class="form-select js-choice">
										<option value="">입실일</option>
										<option>퇴실일</option>
										<option>예약일</option>
										<option>취소일</option>
									</select>
								</div>
							</div>

							<!-- 기간 설정. 어제/오늘/내일 -->
							<div class="col-2">
								<ul class="nav nav-pills nav-pills-dark" id="pills-tab"
									role="tablist">
									<li class="nav-item" role="presentation">
										<button class="nav-link rounded-start rounded-0 mb-0 active"
											id="tab1" data-bs-toggle="pill" type="button" role="tab"
											aria-selected="true">어제</button>
									</li>
									<li class="nav-item" role="presentation">
										<button class="nav-link rounded-0 rounded-0 mb-0" id="tab2"
											data-bs-toggle="pill" type="button" role="tab"
											aria-selected="false">오늘</button>
									</li>
									<li class="nav-item" role="presentation">
										<button class="nav-link rounded-end rounded-0 mb-0" id="tab3"
											data-bs-toggle="pill" type="button" role="tab"
											aria-selected="false">내일</button>
									</li>
								</ul>
							</div>

							<!-- 기간(시작일) 설정 -->
							<div class="col-3">
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
							<div class="col-3">
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

							<!-- Radio items -->
							<div class="col-12">
								<label class="form-label">예약 상태</label>
								<div class="d-sm-flex">
									<!-- Radio -->
									<div class="form-check radio-bg-light me-4">
										<input class="form-check-input" type="radio"
											name="flexRadioDefault" id="flexRadioDefault1" checked="">
										<label class="form-check-label" for="flexRadioDefault1">
											전체 </label>
									</div>
									<!-- Radio -->
									<div class="form-check radio-bg-light me-4">
										<input class="form-check-input" type="radio"
											name="flexRadioDefault" id="flexRadioDefault2"> <label
											class="form-check-label" for="flexRadioDefault2">
											예약완료 </label>
									</div>
									<!-- Radio -->
									<div class="form-check radio-bg-light me-4">
										<input class="form-check-input" type="radio"
											name="flexRadioDefault" id="flexRadioDefault3"> <label
											class="form-check-label" for="flexRadioDefault3">
											예약취소(고객) </label>
									</div>
									<!-- Radio -->
									<div class="form-check radio-bg-light me-4">
										<input class="form-check-input" type="radio"
											name="flexRadioDefault" id="flexRadioDefault4"> <label
											class="form-check-label" for="flexRadioDefault4">
											예약취소(관리자) </label>
									</div>
								</div>
							</div>

							<!-- 객실 타입 드롭다운 -->
							<div class="col-12">
								<div class="col-4">
									<label class="h6 fw-normal mb-0"><i
										class="fa-solid fa-person-skating text-primary me-1"></i>객실 타입</label>
									<!-- Input field -->
									<div
										class="form-border-bottom form-control-transparent form-fs-lg mt-2">
										<select class="form-select js-choice">
											<option value="">전체</option>
											<option>스탠다드</option>
											<option>디럭스</option>
											<option>트윈룸</option>
											<option>객실타입</option>
										</select>
									</div>
								</div>
							</div>

							<!-- 검색어 드롭다운 -->
							<div class="col-2">
								<label class="h6 fw-normal mb-0">검색어</label>
								<div
									class="form-border-bottom form-control-transparent form-fs-lg mt-2">
									<select class="form-select js-choice">
										<option value="">예약자명</option>
										<option>예약번호</option>
									</select>
								</div>
							</div>
							<!-- 검색어 입력 input -->
							<div class="col-6">
								<label class="form-label">-</label> <input type="text"
									class="form-control" placeholder="예약자명을 입력하세요">
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



				<!-- 예약 내역 List 상단 Tab -->
				<div class="row g-4 justify-content-between align-items-center mb-2">
					<div class="col-md-6 col-lg-6">
						<h6 class="mb-1">전체 1654건</h6>
					</div>
					<div class="col-md-6 col-lg-6 d-flex justify-content-end">
						<a href="#" class="btn btn-dark-soft mb-0 border-0">선택 정산</a> <a
							href="#" class="btn btn-dark-soft mb-0 ms-2 border-0">전체 정산</a>
						<div class="mb-sm-0 ms-2 d-flex justify-content-center">
							<a href="#" class="btn btn-dark-soft mb-0 border-0"><i
								class="fa-solid fa-download"></i></a>
						</div>
					</div>
				</div>

				<!-- 사용자 List START -->
				<div class="card shadow border">
					<!-- Card body START -->
					<div class="card-body">
						<!-- Table head -->
						<div class="bg-light rounded p-3 d-none d-sm-block">
							<div class="row row-cols-7 g-4">
								<div class="col">
									<h6 class="mb-0">판매자명</h6>
								</div>
								<div class="col">
									<h6 class="mb-0">객실타입</h6>
								</div>
								<div class="col">
									<h6 class="mb-0">예약일</h6>
								</div>
								<div class="col">
									<h6 class="mb-0">금액</h6>
								</div>
								<div class="col">
									<h6 class="mb-0">수수료</h6>
								</div>
								<div class="col">
									<h6 class="mb-0">정산액</h6>
								</div>
								<div class="col">
									<h6 class="mb-0">상태</h6>
								</div>
								<div class="col">
									<h6 class="mb-0">정산일</h6>
								</div>
								<div class="col">
									<h6 class="mb-0"></h6>
								</div>
							</div>
						</div>

						<!-- Table data START (정산내역 리스트에서 1줄) / js에서 반복 돌릴 부분 -->
						<div class="row row-cols-xl-7 g-4 align-items-sm-center border-bottom px-2 py-4">
							<!-- Data item -->
							<div class="col">
								<small class="d-block d-sm-none">정산일</small>
								<!-- 작은 화면일때만 보이는 텍스트-->
								<h6 class="ms-1 mb-0 fw-normal">2024.12.09(월)</h6>
								<a role="button" class="payoutDetail mb-0 fw-normal ms-1"
									data-bs-toggle="modal" data-bs-target="#payoutDetailModal"
									data-src="payout" data-calculate-date="2024-12-30">상세보기</a>
							<!-- 
							data-src="payout" : 현재 요소가 "payout(정산)"과 관련된 동작임을 나타냄. 
							data-payout-idx="${data.calculate_date}" : 서버에서 전달받은 '정산일'정보를 동적으로 채우고, 
											 ㄴ 정산 상세보기 클릭 시 서버로 요청할 때 calculate_date를 전달하기 위함
							-->
							</div>

							<!-- Data item -->
							<div class="col">
								<small class="d-block d-sm-none">총 판매 금액</small>
								<h6 class="ms-1 mb-0 fw-normal">65,000원</h6>
							</div>

							<!-- Data item -->
							<div class="col">
								<small class="d-block d-sm-none">총 정산 금액</small>
								<h6 class="ms-1 mb-0 fw-normal">55,000원</h6>
							</div>
							<!-- Data item -->
							<div class="col">
								<small class="d-block d-sm-none">정산 대기</small>
								<h6 class="ms-1 mb-0 fw-normal">0원</h6>
							</div>
							<!-- Data item -->
							<div class="col position-relative">
								<small class="d-block d-sm-none">정산 완료</small>
								<div class="d-flex">
									<h6 class="mb-0 me-2 fw-normal">55,000원</h6>
									<!-- Dropdown icon -->
									<a href="#" class="h6 mb-0" role="button" id="dropdownShare1"
										data-bs-toggle="dropdown" aria-expanded="false"> <i
										class="bi bi-info-circle-fill"></i>
									</a>
									<!-- Dropdown items -->
									<ul
										class="dropdown-menu dropdown-w-sm dropdown-menu-end min-w-auto shadow rounded"
										aria-labelledby="dropdownShare1">
										<li>
											<div class="d-flex justify-content-between">
												<span class="small">판매가</span> <span
													class="h6 mb-0 small ms-2">65,000원</span>
											</div>
											<hr class="my-1"> <!-- Divider -->
										</li>

										<li>
											<div class="d-flex justify-content-between">
												<span class="me-4 small">수수료</span> <span
													class="text-danger small ms-2">-10,000원</span>
											</div>
											<hr class="my-1"> <!-- Divider -->
										</li>
										<li>
											<div class="d-flex justify-content-between">
												<span class="small">정산금액</span> <span
													class="h6 mb-0 small ms-2">55,000원</span>
											</div>
										</li>
									</ul>
								</div>
							</div>
						</div>
					<!-- Table data END (정산내역 리스트에서 1줄) / js에서 반복 돌릴 부분 -->						


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
				<!-- 사용자 List END -->
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