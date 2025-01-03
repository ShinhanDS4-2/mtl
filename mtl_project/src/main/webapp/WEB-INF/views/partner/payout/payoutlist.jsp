<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>[판매자] 결제관리 > 정산내역</title>

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
						<h1 class="h3 mb-2">정산 내역</h1>
						<span>날짜별 정산 금액을 확인할 수 있습니다.</span>
					</div>
				</div>
				<!-- 정산 정보 card START -->
				<div class="col-md-12 col-xxl-12 mb-4">
					<div class="card shadow">
						<!-- Card header -->
						<div class="card-header border-bottom">
							<h5 class="mb-0">정산 정보</h5>
						</div>
						<!-- Card body -->
						<div class="card-body">
							<div class="row">
								<!-- 왼쪽 item -->
								<div class="col-md-6">
									<!-- 12그리드 중 6칸 사용. 박스 반반 나눔 -->
									<ul class="list-group list-group-borderless">
										<li class="list-group-item mb-3"><span>사업자명</span> <span
											class="h6 fw-normal ms-4 mb-0">sion</span> <!--fw-normal: 폰트 굵기, ms-4: 글자 간격, mb-0: 아래여백 -->
										</li>

										<li class="list-group-item mb-3"><span>정산유형</span> <span
											class="h6 fw-normal ms-4 mb-0">판매가 기준 수수료율 계산</span></li>

										<li class="list-group-item mb-3"><span>대금 지급 방식</span> <span
											class="h6 fw-normal ms-4 mb-0">계좌이체</span></li>
									</ul>
								</div>

								<!-- 오른쪽 item -->
								<div class="col-md-6">
									<ul class="list-group list-group-borderless">
										<li class="list-group-item mb-3"><span>사업자 등록번호</span> <span
											class="h6 fw-normal ms-4 mb-0">123456789</span></li>

										<li class="list-group-item mb-3"><span>정산 주기</span> <span
											class="h6 fw-normal ms-4 mb-0">월정산</span></li>

										<li class="list-group-item mb-3"><span>정산 계좌 정보</span> <span
											class="h6 fw-normal ms-4 mb-0">우리은행 1002-352-072937</span></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- 정산 정보 card END -->

				<!-- 검색 필터 설정 START -->
				<div class="card shadow mb-4">
					<!-- Card header -->
					<div class="card-header border-bottom">
						<h5 class="card-header-title">검색 필터</h5>
					</div>

					<!-- Card body START -->
					<div class="card-body">
						<form class="row g-4 align-items-center">

							<!-- 기간 설정 -->
							<div class="col-lg-4">
								<div class="d-flex">
									<!-- 달력 아이콘 -->
									<i class="bi bi-calendar fs-3 me-2 mt-2"></i>
									<!-- 날짜 선택 -->
									<div
										class="form-control-border form-control-transparent form-fs-md">
										<label class="form-label">시작일 - 종료일</label> <input type="text"
											class="form-control flatpickr" data-mode="range"
											placeholder="Select date" value="19 Sep to 28 Sep">
									</div>
								</div>
							</div>

							<!-- 기간 설정. 어제/오늘/내일 -->
							<div class="col-lg-6">
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


							<!-- Input item -->
							<div class="col-xl-6">
								<label class="form-label">검색어</label> <input type="text"
									class="form-control" placeholder="검색어를 입력하세요">
							</div>

							<!-- Input item -->
							<div class="col-xl-6">
								<label class="form-label">ㅇㅇㅇ</label> <input type="text"
									class="form-control" placeholder="ㅇㅇㅇㅇㅇ">
							</div>

							<!-- Input item -->
							<div class="col-12">
								<label class="form-label">ㅁㅁㅁ</label> <input type="email"
									class="form-control" placeholder="ㅁㅁㅁㅁ">
							</div>

							<!-- Radio items -->
							<div class="col-lg-12">
								<label class="form-label">정산 상태</label>
								<div class="d-sm-flex">
									<!-- Radio -->
									<div class="form-check radio-bg-light me-4">
										<input class="form-check-input" type="radio"
											name="flexRadioDefault" id="flexRadioDefault1" checked="">
										<label class="form-check-label" for="flexRadioDefault1">
											정산완료 </label>
									</div>
									<!-- Radio -->
									<div class="form-check radio-bg-light me-4">
										<input class="form-check-input" type="radio"
											name="flexRadioDefault" id="flexRadioDefault2"> <label
											class="form-check-label" for="flexRadioDefault2">
											정산대기 </label>
									</div>

								</div>
							</div>

							<!-- 초기화/검색 button -->
							<div class="d-sm-flex justify-content-end border-top pt-3">
								<button type="button" class="btn btn-primary-soft mb-0 ms-2">초기화</button>
								<button type="button" class="btn btn-primary mb-0 ms-2">검색</button>
							</div>

						</form>
					</div>
					<!-- 검색 필터 설정 END -->
				</div>

				<!-- 정산 상세 내역 Modal START -->
				<div class="modal fade" id="payoutDetailModal" tabindex="-1"
					aria-labelledby="payoutDetailModalLabel" aria-hidden="true">
					<div class="modal-dialog modal-lg modal-dialog-centered">
						<div class="modal-content">
							<!-- 모달 헤더 -->
							<div class="modal-header">
								<h5 class="modal-title fw-bold" id="payoutDetailModalLabel">정산
									상세 내역</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<!-- 모달 본문 -->
							<div class="modal-body">
								<!-- 정산일 -->
								<h6 class="fw-bold">정산일</h6>
								<div class="mb-3 border p-3">
									<p class="mb-0">2024.12.09 (월)</p>
								</div>

								<!-- 정산 내역 -->
								<h6 class="fw-bold">정산 내역</h6>
								<div class="table-responsive">
									<table class="table border">
										<thead class="table-light">
											<tr>
												<th>예약번호</th>
												<th>객실 타입</th>
												<th>판매금액</th>
												<th>정산금액</th>
												<th>정산여부</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>240123</td>
												<td>프리미엄 트윈</td>
												<td>55,000원</td>
												<td>45,000원</td>
												<td>정산완료</td>
											</tr>
											<tr>
												<td>242255</td>
												<td>스탠다드</td>
												<td>85,000원</td>
												<td>75,000원</td>
												<td>정산완료</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>

							<!-- 모달 푸터 -->
							<div class="modal-footer">
								<button type="button" class="btn btn-primary">출력</button>
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">닫기</button>
							</div>
						</div>
					</div>
				</div>
				<!-- 정산 상세 내역 Modal END -->



				<!-- 정산 내역 List 상단 Tab -->
				<div
					class="row g-4 justify-content-between align-items-center mb-2 mt-2">
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
				<!-- 정산 내역 List START -->
				<!-- 정산 내역 START -->
				<div class="card shadow">
					<!-- Card header -->
					<div
						class="card-header border-bottom d-sm-flex justify-content-sm-between align-items-sm-center">
						<!--수평으로 정렬. 작은 화면에서는 flexbox를 사용하여 중앙 정렬, 더 큰 화면에서는 양 끝으로 정렬-->
						<div class="mb-1 mb-sm-0 text-center text-sm-start">
							<!--작은 화면에서는 중앙 정렬, 더 큰 화면에서는 왼쪽 정렬-->
							<h5 class="card-title mb-1">정산 내역</h5>
							<span>정산일 기준 2024.12.08(일) ~ 2024.12.14(토)</span>
						</div>
						<a href="#" class="btn btn-dark-soft mb-0 border-0"> <i
							class="fa-solid fa-download"></i></a>

					</div>

					<!-- Card body START -->
					<div class="card-body">
						<!-- Table head (테이블 카테고리)-->
						<div class="bg-light rounded p-3 d-none d-sm-block">
							<div class="row row-cols-7 g-4">
								<div class="col">
									<h6 class="mb-0">정산일</h6>
								</div>
								<div class="col">
									<h6 class="mb-0">총 판매 금액</h6>
								</div>
								<div class="col">
									<h6 class="mb-0">총 정산 금액</h6>
								</div>
								<div class="col">
									<h6 class="mb-0">정산 대기</h6>
								</div>
								<div class="col">
									<h6 class="mb-0">정산 완료</h6>
								</div>
							</div>
						</div>

						<!-- Table data (첫번째 정산내역 상세 데이터)-->
						<div
							class="row row-cols-xl-7 g-4 align-items-sm-center border-bottom px-2 py-4">
							<!-- Data item -->
							<div class="col">
								<small class="d-block d-sm-none">정산일</small>
								<!-- 작은 화면일때만 보이는 텍스트-->
								<h6 class="ms-1 mb-0 fw-normal">2024.12.09(월)</h6>
								<a role="button" class="mb-0 fw-normal ms-1"
									data-bs-toggle="modal" data-bs-target="#payoutDetailModal">상세보기</a>
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

						<!-- Table data (두번째 정산내역 상세 데이터)-->
						<div
							class="row row-cols-xl-7 g-4 align-items-sm-center border-bottom px-2 py-4">
							<!-- Data item -->
							<div class="col">
								<small class="d-block d-sm-none">정산일</small>
								<!-- 작은 화면일때만 보이는 텍스트-->
								<h6 class="ms-1 mb-0 fw-normal">2024.12.09(월)</h6>
								<a role="button" class="mb-0 fw-normal ms-1"
									data-bs-toggle="modal" data-bs-target="#payoutDetailModal">상세보기</a>
							</div>

							<!-- Data item -->
							<div class="col">
								<small class="d-block d-sm-none">총 판매 금액</small>
								<h6 class="ms-1 mb-0 fw-normal">125,000원</h6>
							</div>

							<!-- Data item -->
							<div class="col">
								<small class="d-block d-sm-none">총 정산 금액</small>
								<h6 class="ms-1 mb-0 fw-normal">115,000원</h6>
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
									<h6 class="mb-0 me-2 fw-normal">115,000원</h6>
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

						<!-- Table data (세번째 정산내역 상세 데이터)-->
						<div
							class="row row-cols-xl-7 g-4 align-items-sm-center border-bottom px-2 py-4">
							<!-- Data item -->
							<div class="col">
								<small class="d-block d-sm-none">정산일</small>
								<!-- 작은 화면일때만 보이는 텍스트-->
								<h6 class="ms-1 mb-0 fw-normal">2024.12.09(월)</h6>
								<a role="button" class="mb-0 fw-normal ms-1"
									data-bs-toggle="modal" data-bs-target="#payoutDetailModal">상세보기</a>
							</div>

							<!-- Data item -->
							<div class="col">
								<small class="d-block d-sm-none">총 판매 금액</small>
								<h6 class="ms-1 mb-0 fw-normal">125,000원</h6>
							</div>

							<!-- Data item -->
							<div class="col">
								<small class="d-block d-sm-none">총 정산 금액</small>
								<h6 class="ms-1 mb-0 fw-normal">115,000원</h6>
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
									<h6 class="mb-0 me-2 fw-normal">115,000원</h6>
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
				<!-- 정산 내역 END -->
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