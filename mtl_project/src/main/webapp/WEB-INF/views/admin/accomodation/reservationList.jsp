<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
   
<head>
<title>떠날지도 - 관리자</title>
         
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
			<%@ include file="/WEB-INF/views/include/adminTopbar.jsp" %>
	

			<!-- Page main content START -->
			<div class="page-content-wrapper p-xxl-4">

				<!-- Title -->
				<div class="row">
					<div class="col-12 mb-4 mb-sm-5">
						<h1 class="h3 mb-2">예약 관리</h1>
						<span>숙소 별 예약 현황을 관리할 수 있습니다.</span>
					</div>
				</div>

				<!-- 검색 필터 START -->
				<div class="card shadow mb-5">
					<!-- Card header -->
					<div class="card-header border-bottom">
						<h5 class="card-header-title">검색</h5>
					</div>
					<!-- Card body START -->
					<div class="card-body">
						<form class="row g-4 align-items-center">
   
							<!-- 기간 설정 -->
							<div class="col-lg-5">
								<div class="d-flex">
									<!-- 날짜 선택 -->
									<div class="form-control-border form-control-transparent form-fs-md">
										<label class="form-label"><i class="bi bi-calendar text-primary me-1"></i> 예약일</label> 
										<input id="searchDate" type="text" class="form-control flatpickr" data-mode="range" placeholder="날짜를 선택하세요." value="">   
									</div> 
								</div>   
							</div>      

							<!-- Radio items -->   
							<div class="col-12">
								<label class="h6 fw-normal mb-2 form-label"> 예약 상태</label>
								<div class="d-sm-flex">
									<!-- Radio -->
									<div class="form-check radio-bg-light me-4">
										<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1" checked>
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
 
							<!-- 검색어 입력 input -->             
							<div class="col-6">
								<label class="h6 fw-normal mb-2 form-label"> 숙소명</label>
								<input id="searchInput" type="text"   
									class="form-control" placeholder="숙소명을 입력하세요">
							</div> 

							<!-- 초기화/검색 button -->
							<div class="d-sm-flex justify-content-end border-top pt-3">
								<button type="button" onclick="window.location.reload()" class="btn btn-primary-soft mb-0 ms-2">초기화</button>
								<button type="button" class="btn btn-primary mb-0 ms-2"
									data-src="ReservationList" data-act="clickSearchButton">검색</button>
							</div>
						</form>
					</div>
				</div>
				<!-- 검색 필터 설정 END -->

				<!-- 예약 내역 List 상단 Tab -->
				<div class="row g-4 justify-content-between align-items-center mb-2">
					<div class="col-md-6 col-lg-6">
						<h6 id="reservationCount" class="mb-1">총 524건</h6>
					</div>     
				</div>
   
				<!-- 예약 내역 List START -->
				<div class="card shadow border">
					<!-- Card header -->
					<div class="card-header border-bottom">   
						<h5 class="card-title mb-1">기간 설정 조건</h5>
						<span id="searchDateRange">예약일 기준 2024.12.09 ~ 2024.12.10</span>  <!-- js -->
					</div>  
					
					<!-- Card body START -->
					<div class="card-body">
						<!-- Table head -->
						<div class="bg-light rounded p-3 d-none d-sm-block">
							<div class="row row-cols-7 g-4">
								<div class="col">
									<h6 class="mb-0">숙소명</h6>
								</div>  
								<div class="col">
									<h6 class="mb-0">사용자 아이디</h6>
								</div>
								<div class="col">
									<h6 class="mb-0">예약일</h6>
								</div>
								<div class="col">
									<h6 class="mb-0">판매가</h6>
								</div>
								<div class="col">
									<h6 class="mb-0">상태</h6>
								</div>
								<div class="col">
									<h6 class="mb-0"></h6>
								</div>
							</div>
						</div>
 						<div id="reservationListData">
							<!-- Table data (1번째 예약내역 상세 데이터) / js에서 반복할 부분 -->
							<div class="row row-cols-xl-7 g-4 align-items-sm-center border-bottom px-2 py-4">
								<!-- Data item -->   
								<div class="col">
									<small class="d-block d-sm-none">숙소명</small>
									<h6 class="ms-1 mb-0 fw-normal">히든베이</h6>
								</div>  
								<!-- Data item -->
								<div class="col">  
									<small class="d-block d-sm-none">고객 아이디</small>
									<h6 class="ms-1 mb-1 fw-light">test0asd</h6>
								</div>
								<!-- Data item -->
								<div class="col">
									<small class="d-block d-sm-none">예약일</small>
									<h6 class="ms-1 mb-1 fw-light">2024.12.09</h6>
								</div>
								<!-- Data item -->
								<div class="col">
									<small class="d-block d-sm-none">판매가</small> 
									<h6 class="ms-1 mb-1 fw-light">425,300원</h6>
								</div> 
								<!-- Data item -->
								<div class="col">
									<small class="d-block d-sm-none">상태</small>
									<div class="badge bg-success bg-opacity-10 text-success">예약완료</div>
								</div>
								<!-- Data item -->  
								<div class="col">
									<small class="d-block d-sm-none">상세보기</small>
									<a id="clickDetailModal" role="button" class="btn btn-sm btn-light mb-0" data-bs-toggle="modal" data-bs-target="detailModal"
										data-src="ReservationList" data-act="clickDetailModal"
										data-reservation-idx="">상세보기 <!-- data-reservation-idx="${data.reservation_idx}" -->
									</a>   
								</div>     
							</div>    
							<!-- Table data (1번째 예약내역 상세 데이터) / js에서 반복할 부분 --> 
						</div>
					</div>
					<!-- Card body END -->      
					
					<!-- 예약 상세보기 모달 START -->
					<div id="detailModal" class="modal" tabindex="-1" role="dialog">
						<div class="modal-dialog modal-xl modal-dialog-centered" role="document">  <!-- 매우 큰 모달 -->
						  	<div class="modal-content">
							<!-- 모달 head -->
								<div class="modal-header">
									<h5 class="modal-title">예약 상세 정보</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
								</div>
								<!-- 모달 body -->
								<div id="modalBody" class="modal-body">
									<!-- 예약번호 -->
									<h6 class="fw-bold">예약일시</h6>
									<div class="mb-3 border p-3">
										<p class="mb-0">2024.12.09</p>
									</div>
				
									<!-- 예약자 정보 -->
									<h6 class="fw-bold">예약자 정보</h6>
									<div class="mb-3 border p-3">       
										<p class="mb-0">아이디: user1234</p>
										<p class="mb-0">이름: 김시온</p>
										<p class="mb-0">연락처: 010-7737-6314</p>
									</div>   
									<!-- 판매자 정보 --> 
									<h6 class="fw-bold">판매자 정보</h6>
									<div class="mb-3 border p-3">       
										<p class="mb-0">아이디: user1234</p>
										<p class="mb-0">숙소명: 히든베이</p>
										<p class="mb-0">숙소유형: 호텔/펜션 type</p>
	     									<p class="mb-0">연락처: 010-7737-6314</p>
										<p class="mb-0">업체주소: address</p>
										
									</div> 
									       
									<!-- 예약 정보 -->
									<h6 class="fw-bold">예약 정보</h6>
									<div class="mb-3 border p-3">
										<p class="mb-0">예약자명: 김미밈</p>
										<p class="mb-0">객실타입: 프리미엄 트윈</p>    
										<p class="mb-0">입실일: 2024.12.09</p>
										<p class="mb-0">퇴실일: 2024.12.11</p>
										<p class="mb-0">예약일: 2024.12.09</p>  
										<p class="mb-0">금액: 120,000원</p>  
									</div>
								</div>	   
			
								<!-- 모달 footer -->
								<div class="modal-footer">   
									<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
								</div>
						    </div>
						</div>
					</div>
					<!-- 예약 상세보기 모달 END -->
   
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
				<!-- 사용자 List END -->
			</div>
			<!-- Page main content END -->
		</div>
		<!-- Page content END -->
	</main>
	<!-- **************** MAIN CONTENT END **************** -->

	<!-- footerScript -->
	<%@ include file="/WEB-INF/views/include/footerScript.jsp"%>
	<script src="js/admin/accomodation/reservationList.js"></script>
	<script type="text/javascript">     
		reservationList.init();
	</script>
</body>

</html>