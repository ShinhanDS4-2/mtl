<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>[판매자] 예약관리 > 예약내역 통합검색</title>

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
						<h1 class="h3 mb-2">예약내역 통합검색</h1>
						<span>예약 고객의 예약정보를 일자별 & 상세 조건별로 조회할 수 있습니다.</span>
					</div>
				</div>

				<!-- 1주일간 예약현황 Card START -->
				<div class="col-md-12 col-xxl-12">
					<div class="card shadow">
						<!-- Card header -->
						<div class="card-header">
							<h5 class="mb-0">1주일 간의 예약 현황</h5>
						</div>
						<!-- Card body -->
						<div class="card-body">
							<!-- 1주일 간의 예약 현황 리스트-->
							<div class="row row-cols-7 g-3">
								<!-- row-cols-7: 각 행에 7개열 배치, g-3: 열 간격 설정-->
								<!-- 예약 카드 예시 -->
								<div class="col">
									<div class="border rounded p-3 text-center">
										<span>2024.12</span>
										<h5 class="fw-bold">
											9<span class="fs-6"> 월</span>
										</h5>
										<hr class="my-2">
										<span>숙박</span>
										<h6 class="fw-bold mb-0">0</h6>
									</div>
								</div>
								<div class="col">
									<div class="border rounded p-3 text-center">
										<span>2024.12</span>
										<h5 class="fw-bold">
											10<span class="fs-6"> 화</span>
										</h5>
										<hr class="my-2">
										<span>숙박</span>
										<h6 class="fw-bold mb-0">6</h6>
									</div>
								</div>
								<div class="col">
									<div class="border rounded p-3 text-center">
										<span>2024.12</span>
										<h5 class="fw-bold">
											11<span class="fs-6"> 수</span>
										</h5>
										<hr class="my-2">
										<span>숙박</span>
										<h6 class="fw-bold mb-0">3</h6>
									</div>
								</div>
								<div class="col">
									<div class="border rounded p-3 text-center">
										<span>2024.12</span>
										<h5 class="fw-bold">
											12<span class="fs-6"> 목</span>
										</h5>
										<hr class="my-2">
										<span>숙박</span>
										<h6 class="fw-bold mb-0">0</h6>
									</div>
								</div>
								<div class="col">
									<div class="border rounded p-3 text-center">
										<span>2024.12</span>
										<h5 class="fw-bold">
											13<span class="fs-6"> 금</span>
										</h5>
										<hr class="my-2">
										<span>숙박</span>
										<h6 class="fw-bold mb-0">1</h6>
									</div>
								</div>
								<div class="col">
									<div class="border rounded p-3 text-center">
										<span>2024.12</span>
										<h5 class="fw-bold">
											14<span class="fs-6"> 토</span>
										</h5>
										<hr class="my-2">
										<span>숙박</span>
										<h6 class="fw-bold mb-0">8</h6>
									</div>
								</div>
								<div class="col">
									<div class="border rounded p-3 text-center">
										<span>2024.12</span>
										<h5 class="fw-bold">
											15<span class="fs-6"> 일</span>
										</h5>
										<hr class="my-2">
										<span>숙박</span>
										<h6 class="fw-bold mb-0">3</h6>
									</div>
								</div>
							</div>
							<div
								class="d-flex justify-content-between align-items-center mb-3 mt-3">
								<!-- 오늘 날짜 버튼 -->
								<button type="button" class="btn btn-dark-soft">오늘</button>
								<!-- 이전/다음 화살표 -->
								<div>
									<button class="btn btn-outline-secondary me-1">&lt;</button>
									<button class="btn btn-outline-secondary">&gt;</button>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- 1주일간 예약현황 Card END -->


				<!-- 검색 필터 START -->
				<div class="card shadow mt-4 mb-5">
					<!-- Card header -->
					<div class="card-header border-bottom">
						<h5 class="card-header-title">예약내역 상세 검색</h5>
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
										<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1" checked="">
										<label class="form-check-label" for="flexRadioDefault1" value=""> 전체 </label>
									</div>
									<!-- Radio -->
									<div class="form-check radio-bg-light me-4">
										<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault2"> 
										<label class="form-check-label" for="flexRadioDefault2" value="P"> 예약완료 </label>
									</div>
									<!-- Radio -->
									<div class="form-check radio-bg-light me-4">
										<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault3"> 
										<label class="form-check-label" for="flexRadioDefault3" value="R"> 예약취소 </label>
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


				<!-- 예약내역 상세보기 Moadl START -->
				<div id="bookingDetailModal" class="modal" tabindex="-1"
					role="dialog">
					<div class="modal-dialog modal-lg modal-dialog-centered"
						role="document">
						<!-- 큰 모달-->
						<div class="modal-content">
							<!-- 모달 head -->
							<div class="modal-header">
								<h5 class="modal-title">예약 상세 정보</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<!-- 모달 body -->
							<div class="modal-body">
								<!-- 예약번호 -->
								<h6 class="fw-bold">예약번호</h6>
								<div class="mb-3 border p-3">
									<p class="mb-0">240123</p>
								</div>

								<!-- 예약자 정보 -->
								<h6 class="fw-bold">예약자 정보</h6>
								<div class="mb-3 border p-3">
									<p class="mb-0">예약자명: 김시온</p>
									<p class="mb-0">연락처: 010-7737-6314</p>
								</div>

								<!-- 예약 정보 -->
								<h6 class="fw-bold">예약 정보</h6>
								<div class="mb-3 border p-3">
									<p class="mb-0">객실타입: 프리미엄 트윈</p>
									<p class="mb-0">입실일시: 2024.12.09(월) 17:00</p>
									<p class="mb-0">퇴실일시: 2024.12.11(수) 12:00</p>
									<p class="mb-0">예약일시: 2024.12.09(월) 20:08:25</p>
									<p class="mb-0">예약상태: 프리미엄 트윈</p>
								</div>

								<!-- 금액 정보 -->
								<h6 class="fw-bold">금액 정보</h6>
								<div class="mb-3 border p-3">
									<p class="mb-0">판매가: 120,000원</p>
									<p class="mb-0">정상가: 110,000원</p>
								</div>
							</div>

							<!-- 모달 footer -->
							<div class="modal-footer">
								<button type="button" class="btn btn-primary">출력</button>
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">닫기</button>
							</div>
						</div>
					</div>
				</div>
				<!-- 예약내역 상세보기 Moadl END -->

				<!-- 예약 내역 List 상단 Tab -->
				<div class="row g-4 justify-content-between align-items-center mb-2">
					<div class="col-lg-9">
						<h6 class="mb-1">총 120개</h6>
					</div>
					<div class="col-md-4 col-lg-2">
						<form>
							<select class="form-select js-choice"
								aria-label=".form-select-sm">
								<option value="">최근 예약일순</option>
								<option>과거 예약일순</option>
								<option>최근 입실일순</option>
								<option>과거 입실일순</option>
							</select>
						</form>
					</div>
					<div class="col-md-2 col-lg-1">
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

				<!-- 예약 내역 List START -->
				<div class="card shadow">
					<!-- Card header -->
					<div class="card-header border-bottom">
						<h5 class="card-title mb-1">기간 설정 조건</h5>
						<span>입실일 기준 2024.12.09(월) ~ 2024.12.10(화)</span>
					</div>

					<!-- Card body START -->
					<div class="card-body">
						<!-- Table head -->
						<div class="bg-light rounded p-3 d-none d-sm-block">
							<div class="row row-cols-7 g-4">
								<div class="col">
									<h6 class="mb-0">예약번호</h6>
								</div>
								<div class="col">
									<h6 class="mb-0">예약자명</h6>
								</div>
								<div class="col">
									<h6 class="mb-0">객실타입</h6>
								</div>
								<div class="col">
									<h6 class="mb-0">입실/퇴실일시</h6>
								</div>
								<div class="col">
									<h6 class="mb-0">예약일시</h6>
								</div>
								<div class="col">
									<h6 class="mb-0">예약상태</h6>
								</div>
								<div class="col">
									<h6 class="mb-0">판매가</h6>
								</div>
							</div>
						</div>

						<!-- Table data (1번째 예약내역 상세 데이터)-->
						<div
							class="row row-cols-xl-7 g-4 align-items-sm-center border-bottom px-2 py-4">
							<!-- Data item -->
							<div class="col">
								<small class="d-block d-sm-none">예약번호</small>
								<!-- 작은 화면일때만 보이는 텍스트-->
								<h6 class="ms-1 mb-0 fw-normal">240123</h6>
								<a role="button" class="mb-0 fw-normal ms-1" data-bs-toggle="modal"
									data-bs-target="#bookingDetailModal">상세보기</a>
							</div>

							<!-- Data item -->
							<div class="col">
								<small class="d-block d-sm-none">예약자명</small>
								<h6 class="ms-1 mb-0 fw-normal">김시온</h6>
							</div>

							<!-- Data item -->
							<div class="col">
								<small class="d-block d-sm-none">객실타입</small>
								<h6 class="ms-1 mb-0 fw-normal">프리미엄 트윈</h6>
							</div>

							<!-- Data item -->
							<div class="col">
								<small class="d-block d-sm-none">입실/퇴실일시</small>
								<h6 class="ms-1 mb-1 fw-light">2024.12.08(월) 17:00</h6>
								<h6 class="ms-1 mb-0 fw-light">2024.12.09(수) 12:00</h6>
							</div>

							<!-- Data item -->
							<div class="col">
								<small class="d-block d-sm-none">예약일시</small>
								<h6 class="ms-1 mb-1 fw-light">2024.12.09(수)</h6>
								<h6 class="ms-1 mb-0 fw-light">20:08:25</h6>
							</div>

							<!-- Data item -->
							<div class="col">
								<small class="d-block d-sm-none">예약상태</small>
								<div class="badge bg-success bg-opacity-10 text-success">예약완료</div>
							</div>

							<!-- Data item -->
							<div class="col">
								<small class="d-block d-sm-none">판매가</small>
								<h6 class="ms-1 mb-0 fw-light">120,000원</h6>
							</div>
						</div>

						<!-- Table data (2번째 예약내역 상세 데이터)-->
						<div
							class="row row-cols-xl-7 g-4 align-items-sm-center border-bottom px-2 py-4">
							<!-- Data item -->
							<div class="col">
								<small class="d-block d-sm-none">예약번호</small>
								<!-- 작은 화면일때만 보이는 텍스트-->
								<h6 class="ms-1 mb-0 fw-normal">240123</h6>
								<a role="button" class="mb-0 fw-normal ms-1" data-bs-toggle="modal"
									data-bs-target="#bookingDetailModal">상세보기</a>
							</div>

							<!-- Data item -->
							<div class="col">
								<small class="d-block d-sm-none">예약자명</small>
								<h6 class="ms-1 mb-0 fw-normal">김시온</h6>
							</div>

							<!-- Data item -->
							<div class="col">
								<small class="d-block d-sm-none">객실타입</small>
								<h6 class="ms-1 mb-0 fw-normal">프리미엄 트윈</h6>
							</div>

							<!-- Data item -->
							<div class="col">
								<small class="d-block d-sm-none">입실/퇴실일시</small>
								<h6 class="ms-1 mb-1 fw-light">2024.12.08(월) 17:00</h6>
								<h6 class="ms-1 mb-0 fw-light">2024.12.09(수) 12:00</h6>
							</div>

							<!-- Data item -->
							<div class="col">
								<small class="d-block d-sm-none">예약일시</small>
								<h6 class="ms-1 mb-1 fw-light">2024.12.09(수)</h6>
								<h6 class="ms-1 mb-0 fw-light">20:08:25</h6>
							</div>

							<!-- Data item -->
							<div class="col">
								<small class="d-block d-sm-none">예약상태</small>
								<div class="badge bg-success bg-opacity-10 text-success">예약완료</div>
							</div>

							<!-- Data item -->
							<div class="col">
								<small class="d-block d-sm-none">판매가</small>
								<h6 class="ms-1 mb-0 fw-light">90,000원</h6>
							</div>
						</div>

						<!-- Table data (3번째 예약내역 상세 데이터)-->
						<div
							class="row row-cols-xl-7 g-4 align-items-sm-center border-bottom px-2 py-4">
							<!-- Data item -->
							<div class="col">
								<small class="d-block d-sm-none">예약번호</small>
								<!-- 작은 화면일때만 보이는 텍스트-->
								<h6 class="ms-1 mb-0 fw-normal">240123</h6>
								<a role="button" class="mb-0 fw-normal ms-1" data-bs-toggle="modal"
									data-bs-target="#bookingDetailModal">상세보기</a>
							</div>

							<!-- Data item -->
							<div class="col">
								<small class="d-block d-sm-none">예약자명</small>
								<h6 class="ms-1 mb-0 fw-normal">시온김</h6>
							</div>

							<!-- Data item -->
							<div class="col">
								<small class="d-block d-sm-none">객실타입</small>
								<h6 class="ms-1 mb-0 fw-normal">스탠다드 온돌</h6>
							</div>

							<!-- Data item -->
							<div class="col">
								<small class="d-block d-sm-none">입실/퇴실일시</small>
								<h6 class="ms-1 mb-1 fw-light">2024.12.08(월) 17:00</h6>
								<h6 class="ms-1 mb-0 fw-light">2024.12.09(수) 12:00</h6>
							</div>

							<!-- Data item -->
							<div class="col">
								<small class="d-block d-sm-none">예약일시</small>
								<h6 class="ms-1 mb-1 fw-light">2024.12.09(수)</h6>
								<h6 class="ms-1 mb-0 fw-light">20:08:25</h6>
							</div>

							<!-- Data item -->
							<div class="col">
								<small class="d-block d-sm-none">예약상태</small>
								<div class="badge bg-danger bg-opacity-10 text-danger">취소됨</div>
							</div>

							<!-- Data item -->
							<div class="col">
								<small class="d-block d-sm-none">판매가</small>
								<h6 class="ms-1 mb-0 fw-light">100,000원</h6>
							</div>
						</div>

						<!-- Table data (4번째 예약내역 상세 데이터)-->
						<div
							class="row row-cols-xl-7 g-4 align-items-sm-center border-bottom px-2 py-4">
							<!-- Data item -->
							<div class="col">
								<small class="d-block d-sm-none">예약번호</small>
								<!-- 작은 화면일때만 보이는 텍스트-->
								<h6 class="ms-1 mb-0 fw-normal">240123</h6>
								<a role="button" class="mb-0 fw-normal ms-1" data-bs-toggle="modal"
									data-bs-target="#bookingDetailModal">상세보기</a>
							</div>

							<!-- Data item -->
							<div class="col">
								<small class="d-block d-sm-none">예약자명</small>
								<h6 class="ms-1 mb-0 fw-normal">시온김</h6>
							</div>

							<!-- Data item -->
							<div class="col">
								<small class="d-block d-sm-none">객실타입</small>
								<h6 class="ms-1 mb-0 fw-normal">스탠다드 온돌</h6>
							</div>

							<!-- Data item -->
							<div class="col">
								<small class="d-block d-sm-none">입실/퇴실일시</small>
								<h6 class="ms-1 mb-1 fw-light">2024.12.08(월) 17:00</h6>
								<h6 class="ms-1 mb-0 fw-light">2024.12.09(수) 12:00</h6>
							</div>

							<!-- Data item -->
							<div class="col">
								<small class="d-block d-sm-none">예약일시</small>
								<h6 class="ms-1 mb-1 fw-light">2024.12.09(수)</h6>
								<h6 class="ms-1 mb-0 fw-light">20:08:25</h6>
							</div>

							<!-- Data item -->
							<div class="col">
								<small class="d-block d-sm-none">예약상태</small>
								<div class="badge bg-danger bg-opacity-10 text-danger">취소됨</div>
							</div>

							<!-- Data item -->
							<div class="col">
								<small class="d-block d-sm-none">판매가</small>
								<h6 class="ms-1 mb-0 fw-light">100,000원</h6>
							</div>
						</div>

					</div>
					<!-- Card body END -->

					<!-- Card footer START -->
					<div class="card-footer pt-0">
						<!-- Pagination (페이지 전환 하단 바)-->
						<nav class="d-flex justify-content-center">
							<ul class="pagination pagination-sm pagination-primary-soft mb-0">
								<li class="page-item disabled"><a class="page-link"
									href="#" tabindex="-1">&lt;</a></li>
								<li class="page-item"><a class="page-link" href="#">1</a></li>
								<li class="page-item active"><a class="page-link" href="#">2</a></li>
								<li class="page-item disabled"><a class="page-link"
									href="#">..</a></li>
								<li class="page-item"><a class="page-link" href="#">15</a></li>
								<li class="page-item"><a class="page-link" href="#">&gt;</a>
								</li>
							</ul>
						</nav>

					</div>
					<!-- Card footer END -->
				</div>
				<!-- 예약 내역 List END -->
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