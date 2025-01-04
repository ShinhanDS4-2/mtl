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
				<!-- form START --> 
						<form id="searchForm" class="row g-4 align-items-center">							
							<!-- 기간 설정 -->
							<div class="col-lg-3">
								<div class="d-flex">
									<!-- 달력 아이콘 -->
									<i class="bi bi-calendar fs-3 me-2 mt-2"></i>
									<!-- 날짜 선택 -->
									<div class="form-control-border form-control-transparent form-fs-md">
										<label class="form-label">시작일 - 종료일</label> 
										<input id="dateRange" type="text" class="form-control flatpickr" data-mode="range"
											placeholder="날짜를 선택하세요." value="">
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
											name="payoutStatus" id="payoutCompleted" value="" checked>
										<label class="form-check-label" for="payoutCompleted"> 전체 </label>
									</div>
									<!-- Radio -->
									<div class="form-check radio-bg-light me-4">
										<input class="form-check-input" type="radio"
											name="payoutStatus" id="payoutCompleted" value="Y">
										<label class="form-check-label" for="payoutCompleted"> 정산완료 </label>
									</div>
									<!-- Radio -->
									<div class="form-check radio-bg-light me-4">
										<input class="form-check-input" type="radio"
											name="payoutStatus" id="payoutPending" value="N"> 
										<label class="form-check-label" for="payoutPending"> 정산대기 </label>
									</div>
								</div>
							</div>

							<!-- 초기화/검색 button -->
							<div class="d-sm-flex justify-content-end border-top pt-3">
								<button type="button" id="resetButton" class="btn btn-primary-soft mb-0 ms-2">초기화</button>
								<button type="button" id="searchButton" class="btn btn-primary mb-0 ms-2">검색</button>
							</div>
						</form>
				<!-- form END -->
					</div>
				</div>
				<!-- 검색 필터 설정 END -->

 
<!-- js에서 동적으로 그려줄 부분 START -->
				<!-- 정산 내역 List 상단 Tab   //  js에서 동적으로 그려줄 부분 START -->
				<div class="row g-4 justify-content-between align-items-center mb-2">
					<div class="col-md-6 col-lg-6">
						<h6 class="mb-1" id="payoutListCount">전체 1654건</h6>  <!-- js에서 동적으로 그려줌 -->
					</div>
					<div class="col-md-6 col-lg-6 d-flex justify-content-end">
						<div class="mb-sm-0 ms-2 d-flex justify-content-center">
							<a href="#" class="btn btn-dark-soft mb-0 border-0"><i
								class="fa-solid fa-download"></i></a>
						</div>
					</div>
				</div>


				<!-- 정산 내역 List START -->
				<div class="card shadow border">
					<!-- Card header -->
					<div class="card-header border-bottom">
						<h5 class="card-title mb-1">기간 설정 조건</h5>
						<span id="calculateDate">정산일 기준 2024.12.09 ~ 2024.12.10</span>  <!-- js에서 동적으로 그려줌 -->
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
						<div id="cardBody"></div>
					</div>
	
					<!-- Table data (정산내역 리스트에서 1줄 데이터) / js에서 내용 추가함(id="cardBody" 아래에 append) -->					



					<!-- Card footer START / 페이징 처리 -->
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
					<!-- Card footer END / 페이징 처리 -->
				</div>
				<!-- 정산 내역 List END -->

				<!-- 정산 상세 내역 Modal START -->
				<div id="payoutDetailModal"class="modal fade" tabindex="-1" aria-labelledby="payoutDetailModalLabel" aria-hidden="true">
					<div class="modal-dialog modal-lg modal-dialog-centered">
						<div class="modal-content">
							<!-- 모달 헤더 -->
							<div class="modal-header">
								<h5 class="modal-title fw-bold" id="payoutDetailModalLabel">정산 상세 내역</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							</div>
						
						<!-- js에서 동적으로 그려줄 부분 START (반복X, 1번만) -->
							<!-- 모달 body -->
							<div id="modalBoby" class="modal-body">

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
							<!-- js에서 동적으로 그려줄 부분 END (반복X, 1번만) -->
							
 
							<!-- 모달 footer -->
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
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
	
	<!-- page script -->
	<script src="js/admin/payoutList.js"></script>
	<script type="text/javascript">
		payout.init();
	</script>
	
</body>
</html>