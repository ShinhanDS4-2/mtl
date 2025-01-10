<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">

<head>
<title>떠날지도 - 관리자</title>
<%@ include file="/WEB-INF/views/include/headerScript.jsp" %>
</head>

<body>
<main>
	<%@ include file="/WEB-INF/views/include/adminSidebar.jsp"%>

	<div class="page-content">
		<!-- Topbar -->
		<%@ include file="/WEB-INF/views/include/adminTopbar.jsp" %>

		<!-- Page main content START -->
		<div class="page-content-wrapper p-xxl-4">

			<!-- Title -->
			<div class="row">
				<div class="col-12 mb-4 mb-sm-5">
					<h1 class="h3 mb-2">여행지 관리</h1>
					<span>주요 관광 지역의 여행지와 취향 키워드를 등록/관리합니다.</span>
				</div>
			</div>
			<!-- 상단 navbar START -->
			<div class="row g-4 align-items-center border-bottom">
				<!-- 여행지 등록 버튼 클릭 시 <여행지 등록> 모달창 표시 -->
				<div class="col-lg-12 d-flex justify-content-end">
					<button type="button" class="btn btn-primary-soft" data-bs-toggle="modal" data-bs-target="#locationRegistModal">
						<i class="bi bi-plus-lg fa-fw"></i>여행지 등록
					</button>
					<!-- 키워드 등록 버튼 클릭 시 <키워드 목록> 모달창 표시 -->
					<button type="button" class="btn btn-primary-soft ms-2" data-bs-toggle="modal" data-bs-target="#keywordListModal" data-src="locationList" data-act="clickKeywordList">
						<i class="bi bi-plus-lg fa-fw"></i>키워드 등록
					</button>
				</div>				
			</div>
			<!-- 상단 navbar END -->

			<!-- 검색 필터 START -->
			<div class="card shadow mt-4 mb-5">
				<!-- Card header -->
				<div class="card-header border-bottom">
					<h5 class="card-header-title">검색</h5>
				</div>
				<!-- Card body START -->
				<div class="card-body">
					<form class="row g-4 align-items-center">
						<!-- Radio items -->
						<div class="col-12">
							<label class="h6 fw-normal mb-2">여행지 타입</label>
							<div class="d-sm-flex">
								<!-- Radio -->
								<div class="form-check radio-bg-light me-4">
									<input class="form-check-input" type="radio" name="searchLocationType" id="radioType1" value="" checked>
									<label class="form-check-label" for="radioType1">전체</label>
								</div>
								<!-- Radio -->
								<div class="form-check radio-bg-light me-4">
									<input class="form-check-input" type="radio" name="searchLocationType" id="radioType2" value="A">
									<label class="form-check-label" for="radioType2" >관광지</label>
								</div>
								<!-- Radio -->
								<div class="form-check radio-bg-light me-4">
									<input class="form-check-input" type="radio" name="searchLocationType" id="radioType3" value="R">
									<label class="form-check-label" for="radioType3">맛집</label>
								</div>
							</div>
						</div>

						<!-- 검색어 드롭다운 -->
						<div class="col-2">
							<label class="h6 fw-normal mb-0">지역</label>
							<div class="form-border-bottom form-control-transparent form-fs-lg mt-2">
								<select id="searchLocationArea" class="form-select js-choice">
									<option value="" disabled="disabled" selected="selected">전체</option>
									<option value="SEOUL">서울</option>
									<option value="GANGNEUNG">강릉</option>
									<option value="YEOSU">여수</option>
									<option value="BUSAN">부산</option>
									<option value="JEJU">제주</option>
								</select>
							</div>
						</div> 
						<!-- 검색어 입력 input -->
						<div class="col-6">
							<label class="form-label">-</label>
							<input id="searchLocationName" type="text" class="form-control" placeholder="장소명을 입력하세요">
						</div>

						<!-- 초기화/검색 button -->
						<div class="d-sm-flex justify-content-end border-top pt-3">
							<button type="button" class="btn btn-primary-soft mb-0 ms-2" onclick="window.location.reload();">초기화</button>
							<button id="searchButton" type="button" class="btn btn-primary mb-0 ms-2"
							 	data-src="locationList" data-act="clickSearchButton">검색</button>
						</div>  
					</form>    
				</div>
			</div>
			<!-- 검색 필터 설정 END -->

			<!-- 여행지 List 상단 Tab -->
			<div class="row g-4 justify-content-between align-items-center mb-2">
				<div class="col-md-6 col-lg-6">
					<h6 class="mb-1" id="locationListCount">총 00건</h6>  <!-- js에서 값 변경 -->
				</div>
				<!-- 엑셀버튼 제거
				<div class="col-md-6 col-lg-6 d-flex justify-content-end">
					<div class="mb-sm-0 ms-2 d-flex justify-content-center">
						<a href="#" class="btn btn-dark-soft mb-0 border-0"><i class="fa-solid fa-download"></i></a>
					</div>
				</div>
				 -->
			</div>

			<!-- 사용자 List START -->
			<div class="card shadow border">
				<!-- Card body START -->
				<div class="card-body">
					<!-- Table head -->
					<div class="bg-light rounded p-3 d-none d-sm-block">
						<div class="row row-cols-7 g-4">
							<div class="col">
								<h6 class="mb-0">지역</h6>
							</div>
							<div class="col">
								<h6 class="mb-0">분류</h6>
							</div>
							<div class="col">
								<h6 class="mb-0">장소명</h6>
							</div>
							<div class="col">
								<h6 class="mb-0">등록일</h6>
							</div>
							<div class="col">
								<h6 class="mb-0"></h6>
							</div>
						</div>
					</div>
					<div id="locationList"> 
						<!-- Table data (1번째 예약내역 상세 데이터)-->
						<div class="row row-cols-xl-7 g-4 align-items-sm-center border-bottom px-2 py-4">
							<!-- Data item -->
							<div class="col">
								<small class="d-block d-sm-none">지역</small><!-- 작은 화면일때만 보이는 텍스트-->
								<h6 class="ms-1 mb-0 fw-normal">서울</h6>
							</div>
							<!-- Data item -->
							<div class="col">
								<small class="d-block d-sm-none">분류</small>
								<h6 class="ms-1 mb-0 fw-normal">관광지</h6>
							</div>
							<!-- Data item -->
							<div class="col">
								<small class="d-block d-sm-none">장소명</small>
								<h6 class="ms-1 mb-0 fw-normal">동대문 역사문화공원</h6>
							</div>
							<!-- Data item -->
							<div class="col">
								<small class="d-block d-sm-none">등록일</small>
								<h6 class="ms-1 mb-1 fw-light">2024.12.09</h6>
							</div>
	
							<!-- Data item -->
							<div class="col">
								<small class="d-block d-sm-none">상세보기</small>
								<div class="ms-1 col"><a href="admin/location/detail" class="btn btn-sm btn-light mb-0">상세보기</a></div>
							</div>
						</div>
					</div>
					<!-- Table data (1번째 예약내역 상세 데이터) / js에서 반복돌릴 부분-->
					
					
				</div>
				<!-- Card body END -->

				<!-- Card footer START --> 
				<div class="card-footer pt-0">
					<!-- Pagination (페이지 전환 하단 바)-->
					<nav class="mt-4 d-flex justify-content-center" aria-label="navigation">
						<ul id="pagination" class="pagination pagination-primary-soft d-inline-block d-md-flex rounded mb-0">
							<!-- 동적으로 페이지네이션 그려주는 곳 page.drawPage(리스트 총 갯수) -->
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

<!-- 여행지 등록 Modal START -->
<div class="modal fade" id="locationRegistModal" tabindex="-1" aria-labelledby="touristModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="touristModalLabel">여행지 등록</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" data-src="locationList" data-act="clickLocationCancle"></button>
			</div>
			<div class="modal-body">
				<form>
					<!-- 지역 선택 -->
					<div class="mb-3">
						<label class="form-label fw-bold">지역 <span class="text-danger">*</span></label>
						<div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="areaType" id="regionSeoul" value="SEOUL" checked>
								<label class="form-check-label" for="regionSeoul">서울</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="areaType" id="regionGangneung" value="GANGNEUNG">
								<label class="form-check-label" for="regionGangneung">강릉</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="areaType" id="regionYeosu" value="YEOSU">
								<label class="form-check-label" for="regionYeosu">여수</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="areaType" id="regionBusan" value="BUSAN"> 
									<label class="form-check-label" for="regionBusan">부산</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="areaType" id="regionJeju" value="JEJU">
								<label class="form-check-label" for="regionJeju">제주</label>
							</div>
						</div>
					</div>

					<!-- 분류 선택 -->
					<div class="mb-3">
						<label class="form-label fw-bold">분류 <span class="text-danger">*</span></label>
						<div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="categoryType" id="attraction" value="A" checked>
								<label class="form-check-label" for="attraction">관광지</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="categoryType" id="restaurant" value="R">
								<label class="form-check-label" for="restaurant">맛집</label>
							</div>
						</div>
					</div>

					<!-- 장소명 입력 -->
					<div class="mb-3">
						<label for="placeName" class="form-label fw-bold">장소명 <span class="text-danger">*</span></label> 
						<input type="text" class="form-control" id="placeName" placeholder="장소명을 입력해 주세요.">
					</div>

					<!-- 주소 입력 -->
					<div class="mb-3">
						<label class="form-label fw-bold">주소 <span class="text-danger">*</span></label>
						<div class="row">
							<div class="col-10">
								<input type="text" class="form-control" id="address" data-src="locationList" data-act="clickAddress">
								<input type="hidden" class="form-control" id="addressSi">
								<input type="hidden" class="form-control" id="addressDong">
							</div>
							<div class="col-2">
								<div class="d-grid gap-2">
									<input class="btn btn-primary-soft" type="button" id="findAddress" 
										data-src="locationList" data-act="findAddress" value="주소 찾기">
								</div>
							</div>
						</div>
					</div>

					<!-- 상세정보 입력 -->
					<div class="mb-3">
						<label for="details" class="form-label fw-bold">상세정보 <span class="text-danger">*</span></label>
						<textarea class="form-control" id="detailInfo" rows="3" placeholder="상세정보를 입력해 주세요."></textarea>
					</div>

					<!-- 키워드 선택 드롭다운-->
					<div class="mb-3">
						<label for="keyword" class="form-label fw-bold">키워드 <span class="text-danger">*</span></label>
						<div class="mb-1">   
							<div class="row row-cols-4 g-3" id="keywordList">
								<!-- js -->
								<div class="col">
									<div class="form-check">
										<input class="form-check-input" type="checkbox" value="" id="keyword1">
										<label class="form-check-label" for="keyword1">가족여행</label>
									</div>
									<div class="form-check">
										<input class="form-check-input" type="checkbox" value="" id="keyword2">
										<label class="form-check-label" for="keyword2">함께걷기</label>
									</div>
									<div class="form-check"> <!-- name="keywordList" 필수 -->
										<input class="form-check-input" type="checkbox" value="" id="keyword3">
										<label class="form-check-label" for="keyword3">데이트코스</label>
									</div>
								</div>
								<!-- js -->
								<div class="col">
									<div class="form-check">
										<input class="form-check-input" type="checkbox" value="" id="keyword4">
										<label class="form-check-label" for="keyword4">가족여행</label>
									</div>
									<div class="form-check">
										<input class="form-check-input" type="checkbox" value="" id="keyword5">
										<label class="form-check-label" for="keyword5">함께걷기</label>
									</div>
									<div class="form-check">
										<input class="form-check-input" type="checkbox" value="" id="keyword6">
										<label class="form-check-label" for="keyword6">데이트코스</label>
									</div>
								</div>
								
							</div>
						</div> 
					</div>
					<!-- 이미지 업로드 -->
					<div class="mb-3">
						<label class="form-label fw-bold d-block">이미지 <span class="text-danger">*</span></label>
						<!-- 숙소 사진 등록 Card Start -->
						<div class="card border mb-3">
							<div class="card-body">
								<!-- 사진 리스트 -->
								<div class="d-flex gap-3">
									<!-- 업로드 버튼 -->
								<div class="border rounded d-flex justify-content-center align-items-center" style="width: 150px; height: 100px; background-color: #f8f9fa;">
									<label class="text-center" style="cursor: pointer;"> 
										<i class="bi bi-upload"></i><br>숙소 사진 업로드 
										<input type="file" class="d-none" multiple="multiple" data-src="locationList" data-act="changeFile" id="partnerImage">
									</label>
								</div>
								<div id="preview" class="d-flex">
								</div>	
								</div>
							</div>
						</div>
						<!-- 숙소 사진 등록 Card END -->
					</div>
				</form>
			</div>
			<!-- 확인/취소 button -->
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-bs-dismiss="modal" data-src="locationList" data-act="clickLocationCancle" >취소</button>
				<button type="button" class="btn btn-primary" data-src="locationList" data-act="clickLocationRegist">확인</button>
			</div>
		</div>
	</div>
</div>
<!-- 여행지 등록 Modal END -->

<!-- 키워드 목록 Modal START -->
<div class="modal fade" id="keywordListModal" tabindex="-1" aria-labelledby="keywordListModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="keywordListModalLabel">키워드 목록</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<!-- 상단 navbar START -->
				<div class="row g-4">
					<div class="col-12">
						<div class="bg-light pb-0 px-2 px-lg-0">
							<ul class="nav nav-tabs nav-bottom-line nav-responsive border-0 nav-justified" role="tablist">
								<li class="nav-item" data-src="locationList" data-act="clickKeywordTab" data-type="PARTNER">
									<a class="nav-link mb-0 active" data-bs-toggle="tab" href="#tab1">숙소</a>
								</li>
								<li class="nav-item" data-src="locationList" data-act="clickKeywordTab" data-type="LOCATION">
									<a class="nav-link mb-0" data-bs-toggle="tab" href="#tab2">여행지</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
				<!-- 상단 navbar END -->

				<!-- tab-content START -->
				<div class="tab-content">
					<!-- #tab1 / 숙소 Tap START -->
					<div class="tab-pane fade show active" id="tab1">
						<!-- 상단 네비게이션 바를 클릭하면 탭에 따라 콘텐츠가 변경되는 부분-->
						<div class="card">
							<div class="card-body overflow-y-auto h-400px" id="keywordList1">
							</div>
						</div>
					</div>
					<!-- #tab1 / 기본정보 Tap END -->
					<!-- ******************************************** -->

					<!-- #tab2 / 여행지 Tap Start -->
					<div class="tab-pane fade" id="tab2">
						<!-- 상단 네비게이션 바를 클릭하면 탭에 따라 콘텐츠가 변경되는 부분-->
						<div class="card">
							<div class="card-body overflow-y-auto h-400px" id="keywordList2">
							</div>
						</div>
					</div>
					<!-- #tab2 / 관광지 Tap END -->
				</div>
				<!-- tab-content END -->
			</div>
			<div class="modal-footer">
				<!-- 키워드 등록 버튼 클릭 시 <키워드 등록>모달창 표시 -->
				<div class="col-12 d-flex justify-content-between">
					<button type="button" class="btn btn-primary-soft ms-2" data-bs-toggle="modal" data-bs-target="#keywordRegisterModal">
						<i class="bi bi-plus-lg fa-fw"></i>키워드 등록
					</button>
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 키워드 목록 Modal END -->

<!-- 키워드 등록 Modal START -->
<div class="modal fade" id="keywordRegisterModal" tabindex="-1" aria-labelledby="keywordRegisterModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="keywordRegisterModalLabel">키워드 등록</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<form>
					<!-- 키워드 선택 & 장소명 입력 -->
					<div class="row mb-3">
						<!-- 분류 -->
						<div class="col-md-3">
							<label for="keyword" class="form-label fw-bold">
								분류 <span class="text-danger">*</span>
							</label>
							<select id="keywordType" class="form-select">
								<option value="" disabled="disabled" selected="selected">선택</option>
								<option value="PARTNER">숙소</option>
								<option value="LOCATION">여행지</option>
							</select>
						</div>
						<!-- 키워드 -->
						<div class="col-md-7">
							<label for="placeName" class="form-label fw-bold">
								키워드 <span class="text-danger">*</span>
							</label>
							<input type="text" class="form-control" id="keyword" placeholder="키워드를 입력해 주세요.">
						</div>
						<div class="col-md-2">
							<label for="placeName" class="form-label fw-bold">
								<span lass="text-danger">*</span>
							</label> 
							<a href="javascript:;" class="d-block btn btn-primary-soft mb-0 border-0" data-src="locationList" data-act="clickDuplication">중복확인</a>
						</div>
					</div>
				</form>
			</div>
			<!-- 확인/취소 button -->
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
				<button type="button" class="btn btn-primary" id="keywordRegistBtn" data-check="0" data-src="locationList" data-act="clickKeywordRegist">등록</button>
			</div>
		</div>
	</div>
</div>
<!-- 키워드 등록 Modal END -->

<!-- footerScript -->
<%@ include file="/WEB-INF/views/include/footerScript.jsp" %>

<script src="js/admin/location/locationList.js"></script>
<script type="text/javascript">
	locationList.init();
</script>
</body>

</html>