<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<title>[관리자] 회원관리 > 사용자 관리</title>

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
						<h1 class="h3 mb-2">사용자 관리</h1>
						<span>ㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎ.</span>
					</div>
				</div>

				<!-- 상단 navbar START -->

				<!-- 관리자 등록 button 클릭 시 <관리자 등록>모달창 표시 -->
				<div class="d-flex justify-content-end mb-2">
					<button type="button" class="btn btn-primary-soft"
						data-bs-toggle="modal" data-bs-target="#adminRegisterModal">
						<i class="bi bi-plus-lg fa-fw"></i>관리자 등록
					</button>
				</div>

				<!-- 관리자 등록 Modal START -->
				<div class="modal fade" id="adminRegisterModal" tabindex="-1"
					aria-labelledby="adminRegisterModalLabel" aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="adminRegisterModalLabel">관리자 등록</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<form>
									<!-- 1번째 행 -->
									<div class="row mb-3 align-items-center">
										<!-- 이메일 Label -->
										<label for="email" class="form-label fw-bold">이메일 <span
											class="text-danger">*</span></label>


										<!-- 이메일 앞 입력 -->
										<div class="col-md-4">
											<input type="text" class="form-control" id="email"
												placeholder="test001">
										</div>
										@

										<!-- 이메일 뒤 선택 -->
										<div class="col-md-4">
											<select class="form-select" id="emailDomain">
												<option value="naver.com">naver.com</option>
												<option value="gmail.com">gmail.com</option>
												<option value="daum.net">daum.net</option>
												<option value="kakao.com">kakao.com</option>
											</select>
										</div>

										<!-- 중복확인 버튼 -->
										<div class="col-auto">
											<button type="button" class="btn btn-secondary">중복
												확인</button>
										</div>
									</div>

									<!-- 이름 입력 -->
									<div class="mb-3">
										<label for="placeName" class="form-label fw-bold">이름 <span
											class="text-danger">*</span>
										</label> <input type="text" class="form-control" id="placeName"
											placeholder="이름을 입력해 주세요.">
									</div>
									<!-- 비밀번호 입력 -->
									<div class="mb-3">
										<label for="placeName" class="form-label fw-bold">비밀번호
											<span class="text-danger">*</span>
										</label> <input type="text" class="form-control" id="pwd"
											placeholder="비밀번호를 입력해 주세요.">
									</div>
								</form>
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
				<!-- 관리자 등록 Modal END -->

				<!-- 검색 필터 START -->
				<div class="card shadow mb-5">
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
						<h6 class="mb-1">전체 사용자 50명</h6>
					</div>
					<div class="col-md-6 col-lg-6 d-flex justify-content-end">
						<div class="mb-sm-0 d-flex justify-content-center">
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
									<h6 class="mb-0">아이디</h6>
								</div>
								<div class="col">
									<h6 class="mb-0">이름</h6>
								</div>
								<div class="col">
									<h6 class="mb-0">이메일</h6>
								</div>
								<div class="col">
									<h6 class="mb-0">연락처</h6>
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

						<!-- Table data (1번째 예약내역 상세 데이터)-->
						<div
							class="row row-cols-xl-7 g-4 align-items-sm-center border-bottom px-2 py-4">
							<!-- Data item -->
							<div class="col">
								<small class="d-block d-sm-none">아이디</small>
								<!-- 작은 화면일때만 보이는 텍스트-->
								<h6 class="ms-1 mb-0 fw-normal">admin123</h6>
							</div>
							<!-- Data item -->
							<div class="col">
								<small class="d-block d-sm-none">이름</small>
								<h6 class="ms-1 mb-0 fw-normal">김시온</h6>
							</div>
							<!-- Data item -->
							<div class="col">
								<small class="d-block d-sm-none">이메일</small>
								<h6 class="ms-1 mb-0 fw-normal">cion@naver.com</h6>
							</div>
							<!-- Data item -->
							<div class="col">
								<small class="d-block d-sm-none">연락처</small>
								<h6 class="ms-1 mb-1 fw-light">010-7737-6314</h6>
							</div>
							<!-- Data item -->
							<div class="col">
								<small class="d-block d-sm-none">가입일</small>
								<h6 class="ms-1 mb-1 fw-light">2024.12.09(수)</h6>
							</div>
							<!-- Data item -->
							<div class="col">
								<small class="d-block d-sm-none">상태</small>
								<div class="badge bg-success bg-opacity-10 text-success">정상</div>
							</div>
							<!-- Data item -->
							<div class="col">
								<small class="d-block d-sm-none">상세보기</small>
								<div class="ms-1 col">
									<a href="#" class="btn btn-sm btn-light mb-0">상세보기</a>
								</div>
							</div>
						</div>

						<!-- Table data (2번째 예약내역 상세 데이터)-->
						<div
							class="row row-cols-xl-7 g-4 align-items-sm-center border-bottom px-2 py-4">
							<!-- Data item -->
							<div class="col">
								<small class="d-block d-sm-none">아이디</small>
								<!-- 작은 화면일때만 보이는 텍스트-->
								<h6 class="ms-1 mb-0 fw-normal">admin45683</h6>
							</div>
							<!-- Data item -->
							<div class="col">
								<small class="d-block d-sm-none">이름</small>
								<h6 class="ms-1 mb-0 fw-normal">홍홍홍</h6>
							</div>
							<!-- Data item -->
							<div class="col">
								<small class="d-block d-sm-none">이메일</small>
								<h6 class="ms-1 mb-0 fw-normal">csdsis@naver.com</h6>
							</div>
							<!-- Data item -->
							<div class="col">
								<small class="d-block d-sm-none">연락처</small>
								<h6 class="ms-1 mb-1 fw-light">010-1234-6314</h6>
							</div>
							<!-- Data item -->
							<div class="col">
								<small class="d-block d-sm-none">가입일</small>
								<h6 class="ms-1 mb-1 fw-light">2024.12.09(수)</h6>
							</div>
							<!-- Data item -->
							<div class="col">
								<small class="d-block d-sm-none">상태</small>
								<div class="badge bg-danger bg-opacity-10 text-danger">탈퇴</div>
							</div>
							<!-- Data item -->
							<div class="col">
								<small class="d-block d-sm-none">상세보기</small>
								<div class="ms-1 col">
									<a href="#" class="btn btn-sm btn-light mb-0">상세보기</a>
								</div>
							</div>
						</div>
						<!-- Table data (3번째 예약내역 상세 데이터)-->
						<div
							class="row row-cols-xl-7 g-4 align-items-sm-center border-bottom px-2 py-4">
							<!-- Data item -->
							<div class="col">
								<small class="d-block d-sm-none">아이디</small>
								<!-- 작은 화면일때만 보이는 텍스트-->
								<h6 class="ms-1 mb-0 fw-normal">admin45683</h6>
							</div>
							<!-- Data item -->
							<div class="col">
								<small class="d-block d-sm-none">이름</small>
								<h6 class="ms-1 mb-0 fw-normal">가나다</h6>
							</div>
							<!-- Data item -->
							<div class="col">
								<small class="d-block d-sm-none">이메일</small>
								<h6 class="ms-1 mb-0 fw-normal">csdsis@naver.com</h6>
							</div>
							<!-- Data item -->
							<div class="col">
								<small class="d-block d-sm-none">연락처</small>
								<h6 class="ms-1 mb-1 fw-light">010-1234-6314</h6>
							</div>
							<!-- Data item -->
							<div class="col">
								<small class="d-block d-sm-none">가입일</small>
								<h6 class="ms-1 mb-1 fw-light">2024.12.09(수)</h6>
							</div>
							<!-- Data item -->
							<div class="col">
								<small class="d-block d-sm-none">상태</small>
								<div class="badge bg-danger bg-opacity-10 text-danger">탈퇴</div>
							</div>
							<!-- Data item -->
							<div class="col">
								<small class="d-block d-sm-none">상세보기</small>
								<div class="ms-1 col">
									<a href="#" class="btn btn-sm btn-light mb-0">상세보기</a>
								</div>
							</div>
						</div>
						<!-- Table data (4번째 예약내역 상세 데이터)-->
						<div
							class="row row-cols-xl-7 g-4 align-items-sm-center border-bottom px-2 py-4">
							<!-- Data item -->
							<div class="col">
								<small class="d-block d-sm-none">아이디</small>
								<!-- 작은 화면일때만 보이는 텍스트-->
								<h6 class="ms-1 mb-0 fw-normal">admin45683</h6>
							</div>
							<!-- Data item -->
							<div class="col">
								<small class="d-block d-sm-none">이름</small>
								<h6 class="ms-1 mb-0 fw-normal">홍홍홍</h6>
							</div>
							<!-- Data item -->
							<div class="col">
								<small class="d-block d-sm-none">이메일</small>
								<h6 class="ms-1 mb-0 fw-normal">csdsis@naver.com</h6>
							</div>
							<!-- Data item -->
							<div class="col">
								<small class="d-block d-sm-none">연락처</small>
								<h6 class="ms-1 mb-1 fw-light">010-1234-6314</h6>
							</div>
							<!-- Data item -->
							<div class="col">
								<small class="d-block d-sm-none">가입일</small>
								<h6 class="ms-1 mb-1 fw-light">2024.12.09(수)</h6>
							</div>
							<!-- Data item -->
							<div class="col">
								<small class="d-block d-sm-none">상태</small>
								<div class="badge bg-success bg-opacity-10 text-success">정상</div>
							</div>
							<!-- Data item -->
							<div class="col">
								<small class="d-block d-sm-none">상세보기</small>
								<div class="ms-1 col">
									<a href="#" class="btn btn-sm btn-light mb-0">상세보기</a>
								</div>
							</div>
						</div>
						<!-- Table data (5번째 예약내역 상세 데이터)-->
						<div
							class="row row-cols-xl-7 g-4 align-items-sm-center border-bottom px-2 py-4">
							<!-- Data item -->
							<div class="col">
								<small class="d-block d-sm-none">아이디</small>
								<!-- 작은 화면일때만 보이는 텍스트-->
								<h6 class="ms-1 mb-0 fw-normal">admin45683</h6>
							</div>
							<!-- Data item -->
							<div class="col">
								<small class="d-block d-sm-none">이름</small>
								<h6 class="ms-1 mb-0 fw-normal">홍홍홍</h6>
							</div>
							<!-- Data item -->
							<div class="col">
								<small class="d-block d-sm-none">이메일</small>
								<h6 class="ms-1 mb-0 fw-normal">csdsis@naver.com</h6>
							</div>
							<!-- Data item -->
							<div class="col">
								<small class="d-block d-sm-none">연락처</small>
								<h6 class="ms-1 mb-1 fw-light">010-1234-6314</h6>
							</div>
							<!-- Data item -->
							<div class="col">
								<small class="d-block d-sm-none">가입일</small>
								<h6 class="ms-1 mb-1 fw-light">2024.12.09(수)</h6>
							</div>
							<!-- Data item -->
							<div class="col">
								<small class="d-block d-sm-none">상태</small>
								<div class="badge bg-success bg-opacity-10 text-success">정상</div>
							</div>
							<!-- Data item -->
							<div class="col">
								<small class="d-block d-sm-none">상세보기</small>
								<div class="ms-1 col">
									<a href="#" class="btn btn-sm btn-light mb-0">상세보기</a>
								</div>
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