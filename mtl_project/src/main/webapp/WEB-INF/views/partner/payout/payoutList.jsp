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
										<li class="list-group-item mb-3">
											<span>사업자명</span> 
											<span id="business_name" class="h6 fw-normal ms-4 mb-0">sion</span> <!--js-->
										</li>
										<li class="list-group-item mb-3">
											<span>정산유형</span> 
											<span class="h6 fw-normal ms-4 mb-0">판매가 기준 수수료율 계산</span>
										</li>
										<li class="list-group-item mb-3">
											<span>대금 지급 방식</span> 
											<span class="h6 fw-normal ms-4 mb-0">계좌이체</span>
										</li>
									</ul>
								</div>

								<!-- 오른쪽 item -->
								<div class="col-md-6">
									<ul class="list-group list-group-borderless">
										<li class="list-group-item mb-3">
											<span>사업자 등록번호</span> 
											<span id="business_number" class="h6 fw-normal ms-4 mb-0">123456789</span> <!--js-->
										</li>
										<li class="list-group-item mb-3">
											<span>정산 주기</span> 
											<span class="h6 fw-normal ms-4 mb-0">월정산</span>
										</li>
										<li class="list-group-item mb-3">
											<span>정산 계좌 정보</span> 
											<span id="account_number" class="h6 fw-normal ms-4 mb-0">우리은행 1002-352-072937</span> <!--js-->
										</li>
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

							<!-- 기간 설정. 어제/오늘/내일 --> 
							<div class="col-lg-7">
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

							<!-- Radio items -->
							<div class="col-lg-12">
								<label class="form-label">정산 상태</label>
								<div class="d-sm-flex"> 
									<!-- Radio -->
									<div class="form-check radio-bg-light me-4">  
										<input class="form-check-input" type="radio"
											name="payoutStatus" id="payoutAll" value="" checked>
										<label class="form-check-label" for="payoutAll"> 전체 </label>
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
								<button type="reset" class="btn btn-primary-soft mb-0 ms-2">초기화</button>
								<button type="button" id="searchButton" class="btn btn-primary mb-0 ms-2">검색</button>
							</div>
						</form>
					<!-- form END -->
					</div>
				</div>
				<!-- 검색 필터 설정 END -->

				<!-- 정산 내역 List 상단 Tab   //  js에서 동적으로 그려줄 부분 START-->
				<div class="row g-4 justify-content-between align-items-center mb-2 mt-2">
					<div class="col-2">
						<h6 class="mb-1" id="payoutListCount">총 101개</h6>  <!--js-->
					</div>
					<div class="col-1">
						<form>
							<select class="form-select js-choice"
								aria-label=".form-select-sm">
								<option>10개</option>
								<option>30개</option>
								<option>50개</option>
							</select>
						</form>
					</div> 
				</div>
				<!-- 정산 내역 List START -->
				<div class="card shadow">	
					<!-- Card header -->
					<div class="card-header border-bottom d-sm-flex justify-content-sm-between align-items-sm-center">
						<div class="mb-1 mb-sm-0 text-center text-sm-start">
							<h5 class="card-title mb-1">정산 내역</h5>
							<span id="settlementDateLabel">정산일 기준 2024.12.08(일) ~ 2024.12.14(토)</span>  <!--js변경-->
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
						<div id="cardData">
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
 						 </div>
						  
   
					</div>
					<!-- Card body END -->

					<!-- Card footer START -->
					 <!-- 페이징 처리 START -->
					<div class="row">
						<div class="col-12">
							<nav class="mt-4 d-flex justify-content-center" aria-label="navigation">
								<ul id="pagination" class="pagination pagination-primary-soft d-inline-block d-md-flex rounded mb-0">  <!-- id="pagination" -->
								</ul>
							</nav>
						</div>
					</div>
					<!-- 페이징 처리 END -->
					<!-- Card footer END -->
				</div>
				<!-- 정산 내역 List END -->
				
				
				<!-- 정산 상세 내역 Modal START -->
				<div id="payoutDetailModal"class="modal fade" tabindex="-1"
					aria-labelledby="payoutDetailModalLabel" aria-hidden="true">
					<div class="modal-dialog modal-lg modal-dialog-centered">
						<div class="modal-content">
							<!-- 모달 헤더 -->
							<div class="modal-header">
								<h5 class="modal-title fw-bold">정산
									상세 내역</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<!-- 모달 본문 --> 
							<div class="modal-body">
								<!-- 정산일 -->
								<h6 class="fw-bold">정산일</h6>
								<div class="mb-3 border p-3">
									<p class="mb-0" id="modalCalculateDate">2024.12.09 (월)</p> <!--js-->
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
										<tbody id="modalTBody"> 
										<!-- Table data START (정산내역 리스트에서 1줄) / js에서 반복 돌릴 부분 -->
											<tr>
												<td>240123</td>
												<td>프리미엄 트윈</td>
							  					<td>55,000원</td>
												<td>45,000원</td>
												<td>정산완료</td> 
											</tr>
										<!-- Table data END (정산내역 리스트에서 1줄) / js에서 반복 돌릴 부분 -->
										</tbody>
									</table>     
								</div> 
							</div>       
          
							<!-- 모달 푸터 -->
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
	
	<!-- page script -->
<script src="js/partner/payout/payoutList.js"></script>
<script type="text/javascript">
	payout.init();
</script>

</body>
</html>