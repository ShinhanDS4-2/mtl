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
							<!-- 기간 설정 -->
							<div class="col-lg-3">
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
				</div>
				<!-- 검색 필터 설정 END -->



				<!-- 예약 내역 List 상단 Tab -->
				<div class="row g-4 justify-content-between align-items-center mb-2">
					<div class="col-md-6 col-lg-6">
						<h6 class="mb-1">전체 1654건</h6>
					</div>
					<div class="col-md-6 col-lg-6 d-flex justify-content-end">
						<div class="mb-sm-0 ms-2 d-flex justify-content-center">
							<a href="#" class="btn btn-dark-soft mb-0 border-0"><i
								class="fa-solid fa-download"></i></a>
						</div>
					</div>
				</div>


				<!-- 사용자 List START -->
				<div class="card shadow border">
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
									<h6 class="mb-0">정산일</h6>
								</div>
								<div class="col">
									<h6 class="mb-0">판매자명</h6>
								</div>
								<div class="col">
									<h6 class="mb-0">판매금액</h6>
								</div>
								<div class="col">
									<h6 class="mb-0">정산금액</h6>
								</div>
								<div class="col">
									<h6 class="mb-0">정산상태</h6>
								</div>
								<div class="col">
									<h6 class="mb-0"></h6>
								</div>
								
							</div>
						</div>
	

					<!-- Table data START (정산내역 리스트에서 1줄) / js에서 반복 돌릴 부분 -->
						<div
							class="row row-cols-xl-7 g-4 align-items-sm-center border-bottom px-2 py-4">
							<!-- Data item -->
							<div class="col">
								<small class="d-block d-sm-none">정산일</small>
								<!-- 작은 화면일때만 보이는 텍스트-->
								<h6 class="ms-1 mb-0 fw-normal">2024.12.09(월)</h6>
								<a role="button" class="payoutDetail mb-0 fw-normal ms-1"
									data-bs-toggle="modal" data-bs-target="#payoutDetailModal"
									data-src="payout" data-calculate-date="?">상세보기</a>
									<!-- 
							data-src="payout" : 현재 요소가 "payout(정산)"과 관련된 동작임을 나타냄. 
							data-payout-idx="${data.calculate_date}" : 서버에서 전달받은 '정산일'정보를 동적으로 채우고, 
											 ㄴ 정산 상세보기 클릭 시 서버로 요청할 때 calculate_date를 전달하기 위함
							-->
							</div>
							<!-- Data item -->
							<div class="col">
								<small class="d-block d-sm-none">판매자명</small>
								<h6 class="ms-1 mb-0 fw-normal">00호텔</h6>
							</div>

							<!-- Data item -->
							<div class="col">
								<small class="d-block d-sm-none">판매금액</small>
								<h6 class="ms-1 mb-0 fw-normal">55,000원</h6>
							</div>

							<!-- Data item -->
							<div class="col">
								<small class="d-block d-sm-none">정산금액</small>
								<h6 class="ms-1 mb-1 fw-light">0원</h6>
							</div>

							<!-- Data item -->
							<div class="col">
								<small class="d-block d-sm-none">정산상태</small>
								<div class="badge bg-success bg-opacity-10 text-success">완료</div>or
								<div class="badge bg-danger bg-opacity-10 text-danger">대기</div>
							</div>

							<!-- Data item -->
							<div class="col">
								<small class="d-block d-sm-none">정산</small>
								<div class="ms-1 col">
									<a href="정산하기 버튼 누르면 정산이 되어야함" class="btn btn-sm btn-light mb-0">정산하기</a>
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

				<!-- 정산 상세 내역 Modal START -->
				<div id="payoutDetailModal"class="modal fade" tabindex="-1" aria-labelledby="payoutDetailModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-lg modal-dialog-centered">
					<div class="modal-content">
						<!-- 모달 헤더 -->
						<div class="modal-header">
							<h5 class="modal-title fw-bold" id="payoutDetailModalLabel">정산
								상세 내역</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
							<!-- 모달 body -->
							<div class="modal-body">

								<!-- 판매자 정보 -->
								<h6 class="fw-bold">판매자 정보</h6> 
								<div class="mb-3 border p-3">
									<p class="mb-0">판매자명: 김시온</p>
									<p class="mb-0">연락처: 010-7737-6314</p>
									<p class="mb-0">이메일: </p>
									<p class="mb-0">숙소명: </p>
									<p class="mb-0">사업자명: </p>
									<p class="mb-0">사업자 등록번호: </p>
									<p class="mb-0">정산 계좌 정보: 예금주명, 은행, 계좌번호 순으로</p>
								</div>

								<!-- 예약자 정보 -->
								<h6 class="fw-bold">예약자 정보</h6>
								<div class="mb-3 border p-3">
									<p class="mb-0">사용자 관리번호: 사용자idx </p>
									<p class="mb-0">객실타입: 프리미엄 트윈</p>
									<p class="mb-0">입실일시: 2024.12.09(월) 17:00</p>
									<p class="mb-0">퇴실일시: 2024.12.11(수) 12:00</p>
									<p class="mb-0">예약일시: 2024.12.09(월) 20:08:25</p>
									<p class="mb-0">결제상태: (P:결제 완료 R:환불)</p>
								</div>

								<!-- 정산 정보 -->
								<h6 class="fw-bold">정산 정보</h6>
								<div class="mb-3 border p-3">
									<p class="mb-0">숙소idx: d</p>
									<p class="mb-0">객실요금: 110,000원</p>
									<p class="mb-0">수수료율: </p>
									<p class="mb-0">정산 상태(Y/N): </p>
									<p class="mb-0">정산 금액: </p>
									<p class="mb-0">정산일: </p>
									<p class="mb-0">정산 계좌정보:  (은행, 예금주명, 계좌번호)</p>
								</div>
							</div>

							<!-- 모달 footer -->
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">닫기</button>
							</div>
						</div>
					</div>
				</div>
				<!-- 정산 상세 내역 Modal END -->

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