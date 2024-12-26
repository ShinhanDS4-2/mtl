<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>[관리자] 숙소 관리 > 문의 관리</title>

	<!-- headerScript -->
	<%@ include file="/WEB-INF/views/include/headerScript.jsp" %>
</head>

<body>

	<!-- **************** MAIN CONTENT START **************** -->
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
						<h1 class="h3 mb-2">문의 관리</h1>
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
								<div class="form-border-bottom form-control-transparent form-fs-lg mt-2">
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
								<ul class="nav nav-pills nav-pills-dark" id="pills-tab" role="tablist">
									<li class="nav-item" role="presentation">
										<button class="nav-link rounded-start rounded-0 mb-0 active" id="tab1"
											data-bs-toggle="pill" type="button" role="tab"
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
								<div class="form-border-bottom form-control-transparent form-fs-lg mt-2">
									<input type="text" class="form-control flatpickr py-2" data-date-format="d M Y"
										placeholder="시작일">
								</div>
							</div>
							<!-- 기간(종료일) 설정 -->
							<div class="col-3">
								<!--col-md-6: medium화면에서 가로 12칸 중 6칸 차지, col-lg-2: large화면에서 12칸 중 2칸 차지-->
								<label class="h6 fw-normal mb-0"><i
										class="bi bi-calendar text-primary me-1"></i>종료일</label>
								<!-- Input field -->
								<div class="form-border-bottom form-control-transparent form-fs-lg mt-2">
									<input type="text" class="form-control flatpickr py-2" data-date-format="d M Y"
										placeholder="종료일">
								</div>
							</div>

							<!-- Radio items -->
							<div class="col-12">
								<label class="form-label">예약 상태</label>
								<div class="d-sm-flex">
									<!-- Radio -->
									<div class="form-check radio-bg-light me-4">
										<input class="form-check-input" type="radio" name="flexRadioDefault"
											id="flexRadioDefault1" checked="">
										<label class="form-check-label" for="flexRadioDefault1">
											전체
										</label>
									</div>
									<!-- Radio -->
									<div class="form-check radio-bg-light me-4">
										<input class="form-check-input" type="radio" name="flexRadioDefault"
											id="flexRadioDefault2">
										<label class="form-check-label" for="flexRadioDefault2">
											예약완료
										</label>
									</div>
									<!-- Radio -->
									<div class="form-check radio-bg-light me-4">
										<input class="form-check-input" type="radio" name="flexRadioDefault"
											id="flexRadioDefault3">
										<label class="form-check-label" for="flexRadioDefault3">
											예약취소(고객)
										</label>
									</div>
									<!-- Radio -->
									<div class="form-check radio-bg-light me-4">
										<input class="form-check-input" type="radio" name="flexRadioDefault"
											id="flexRadioDefault4">
										<label class="form-check-label" for="flexRadioDefault4">
											예약취소(관리자)
										</label>
									</div>
								</div>
							</div>

							<!-- 객실 타입 드롭다운 -->
							<div class="col-12">
								<div class="col-4">
									<label class="h6 fw-normal mb-0"><i
											class="fa-solid fa-person-skating text-primary me-1"></i>객실 타입</label>
									<!-- Input field -->
									<div class="form-border-bottom form-control-transparent form-fs-lg mt-2">
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
								<div class="form-border-bottom form-control-transparent form-fs-lg mt-2">
									<select class="form-select js-choice">
										<option value="">예약자명</option>
										<option>예약번호</option>
									</select>
								</div>
							</div>
							<!-- 검색어 입력 input -->
							<div class="col-6">
								<label class="form-label">-</label>
								<input type="text" class="form-control" placeholder="예약자명을 입력하세요">
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
						<h6 class="mb-1">전체 예약 524건</h6>
					</div>
					<div class="col-md-6 col-lg-6 d-flex justify-content-end">
						<div class="mb-sm-0 d-flex justify-content-center"><a href="#"
								class="btn btn-dark-soft mb-0 border-0"><i class="fa-solid fa-download"></i></a></div>
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
									<h6 class="mb-0">숙소명</h6>
								</div>
								<div class="col">
									<h6 class="mb-0">아이디</h6>
								</div>
								<div class="col">
									<h6 class="mb-0">문의 제목</h6>
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
						<div class="row row-cols-xl-7 g-4 align-items-sm-center border-bottom px-2 py-4">
							<!-- Data item -->
							<div class="col">
								<small class="d-block d-sm-none">숙소명</small><!-- 작은 화면일때만 보이는 텍스트-->
								<h6 class="ms-1 mb-0 fw-normal">성심당</h6>
							</div>
							<!-- Data item -->
							<div class="col">
								<small class="d-block d-sm-none">아이디</small>
								<h6 class="ms-1 mb-0 fw-normal">test1234</h6>
							</div>
							<!-- Data item -->
							<div class="col">
								<small class="d-block d-sm-none">문의 제목</small>
								<h6 class="ms-1 mb-0 fw-normal">환불해줘어어어ㅓㅇ</h6>
							</div>
							<!-- Data item -->
							<div class="col">
								<small class="d-block d-sm-none">등록일</small>
								<h6 class="ms-1 mb-1 fw-light">2024.12.09</h6>
							</div>
							<!-- Data item -->
							<div class="col">
								<small class="d-block d-sm-none">답변상태</small>
								<div class="badge bg-success bg-opacity-10 text-success">답변 완료</div>
							</div>
							<!-- Data item -->
							<div class="col">
								<small class="d-block d-sm-none">상세보기</small>
								<div class="ms-1 col"><a href="admin/questionreply" class="btn btn-sm btn-light mb-0">상세보기</a></div>
							</div>
						</div>
						<!-- Table data-->
						<div class="row row-cols-xl-7 g-4 align-items-sm-center border-bottom px-2 py-4">
							<!-- Data item -->
							<div class="col">
								<small class="d-block d-sm-none">숙소명</small><!-- 작은 화면일때만 보이는 텍스트-->
								<h6 class="ms-1 mb-0 fw-normal">히든베이</h6>
							</div>
							<!-- Data item -->
							<div class="col">
								<small class="d-block d-sm-none">아이디</small>
								<h6 class="ms-1 mb-0 fw-normal">testtes</h6>
							</div>
							<!-- Data item -->
							<div class="col">
								<small class="d-block d-sm-none">문의 제목</small>
								<h6 class="ms-1 mb-0 fw-normal">비회원 예약중 결제 오류</h6>
							</div>
							<!-- Data item -->
							<div class="col">
								<small class="d-block d-sm-none">등록일</small>
								<h6 class="ms-1 mb-1 fw-light">2024.12.09</h6>
							</div>
							<!-- Data item -->
							<div class="col">
								<small class="d-block d-sm-none">답변상태</small>
								<div class="badge bg-primary bg-opacity-10 text-primary">대기</div>
							</div>
							<!-- Data item -->
							<div class="col">
								<small class="d-block d-sm-none">상세보기</small>
								<div class="ms-1 col"><a href="admin/questionreply" class="btn btn-sm btn-light mb-0">상세보기</a></div>
							</div>
						</div>


					</div>
					<!-- Card body END -->

					<!-- Card footer START -->
					<div class="card-footer pt-0">
						<!-- Pagination (페이지 전환 하단 바)-->
						<nav class="d-flex justify-content-center">
							<ul class="pagination pagination-sm pagination-primary-soft mb-0">
								<li class="page-item disabled"> <!-- disabled: 버튼 비활성화-->
									<a class="page-link" href="#" tabindex="-1">&lt;</a>
								</li>
								<li class="page-item"><a class="page-link" href="#">1</a></li>
								<li class="page-item active"><a class="page-link" href="#">2</a></li>
								<li class="page-item"><a class="page-link" href="#">3</a></li>
								<li class="page-item disabled"><a class="page-link" href="#">..</a></li>
								<li class="page-item"><a class="page-link" href="#">11</a></li>
								<li class="page-item"><a class="page-link" href="#">12</a></li>
								<li class="page-item">
									<a class="page-link" href="#">&gt;</a>
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
	<%@ include file="/WEB-INF/views/include/footerScript.jsp" %>

</body>
</html>