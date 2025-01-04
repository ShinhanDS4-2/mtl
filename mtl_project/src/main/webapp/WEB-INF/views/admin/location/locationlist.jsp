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
					<span>ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ.</span>
				</div>
			</div>
			<!-- 상단 navbar START -->
			<div class="row g-4 align-items-center border-bottom">
				<!-- Tabs -->
				<div class="col-lg-6">
					<ul class="mb-2 nav nav-pills-primary-soft nav-responsive">
						<li class="nav-item">
							<a class="nav-link mb-0 active" data-bs-toggle="tab" href="#tab-1">전체</a>
						</li>
						<li class="nav-item">
							<a class="nav-link mb-0" data-bs-toggle="tab" href="#tab-2">관광지</a>
						</li>
						<li class="nav-item">
							<a class="nav-link mb-0" data-bs-toggle="tab" href="#tab-3">맛집</a>
						</li>
					</ul>
				</div>
				<!-- 여행지 등록 버튼 클릭 시 <여행지 등록> 모달창 표시 -->
				<div class="col-lg-6 d-flex justify-content-end">
					<button type="button" class="btn btn-primary-soft" data-bs-toggle="modal" data-bs-target="#touristModal">
						<i class="bi bi-plus-lg fa-fw"></i>여행지 등록
					</button>
					<!-- 키워드 등록 버튼 클릭 시 <키워드 목록> 모달창 표시 -->
					<button type="button" class="btn btn-primary-soft ms-2" data-bs-toggle="modal" data-bs-target="#keywordListModal">
						<i class="bi bi-plus-lg fa-fw"></i>키워드 등록
					</button>
				</div>				
			</div>
			<!-- 상단 navbar END -->

			<!-- 여행지 등록 Modal START -->
			<div class="modal fade" id="touristModal" tabindex="-1"
				aria-labelledby="touristModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-lg modal-dialog-centered">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="touristModalLabel">여행지 등록</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<form>
								<!-- 지역 선택 -->
								<div class="mb-3">
									<label class="form-label fw-bold">지역 <span class="text-danger">*</span></label>
									<div>
										<div class="form-check form-check-inline">
											<input class="form-check-input" type="radio" name="region" id="regionSeoul" value="서울" checked>
											<label class="form-check-label" for="regionSeoul">서울</label>
										</div>
										<div class="form-check form-check-inline">
											<input class="form-check-input" type="radio" name="region" id="regionGangneung" value="강릉">
											<label class="form-check-label" for="regionGangneung">강릉</label>
										</div>
										<div class="form-check form-check-inline">
											<input class="form-check-input" type="radio" name="region" id="regionYeosu" value="여수">
											<label class="form-check-label" for="regionYeosu">여수</label>
										</div>
										<div class="form-check form-check-inline">
											<input class="form-check-input" type="radio" name="region" id="regionBusan" value="부산"> 
												<label class="form-check-label" for="regionBusan">부산</label>
										</div>
										<div class="form-check form-check-inline">
											<input class="form-check-input" type="radio" name="region" id="regionJeju" value="제주">
											<label class="form-check-label" for="regionJeju">제주</label>
										</div>
									</div>
								</div>

								<!-- 분류 선택 -->
								<div class="mb-3">
									<label class="form-label fw-bold">분류 <span class="text-danger">*</span></label>
									<div>
										<div class="form-check form-check-inline">
											<input class="form-check-input" type="radio" name="category" id="categoryTour" value="관광지" checked>
											<label class="form-check-label" for="categoryTour">관광지</label>
										</div>
										<div class="form-check form-check-inline">
											<input class="form-check-input" type="radio" name="category" id="categoryFood" value="맛집">
											<label class="form-check-label" for="categoryFood">맛집</label>
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
												<input class="btn btn-primary-soft" type="button" id="findAddress" data-src="locationList" data-act="findAddress" value="주소 찾기">
											</div>
										</div>
									</div>
								</div>

								<!-- 상세정보 입력 -->
								<div class="mb-3">
									<label for="details" class="form-label fw-bold">상세정보 <span class="text-danger">*</span></label>
									<textarea class="form-control" id="details" rows="3" placeholder="상세정보를 입력해 주세요."></textarea>
								</div>

								<!-- 키워드 선택 드롭다운-->
								<div class="mb-3">
									<label for="keyword" class="form-label fw-bold">키워드 <span class="text-danger">*</span></label>
									<div class="mb-1">
										<div class="row row-cols-4 g-3" id="keywordList">
											<div class="col">
												<div class="form-check">
													<input class="form-check-input" type="checkbox" value="" id="keyword1">
													<label class="form-check-label" for="keyword1">가족여행</label>
												</div>
												<div class="form-check">
													<input class="form-check-input" type="checkbox" value="" id="keyword2">
													<label class="form-check-label" for="keyword2">함께걷기</label>
												</div>
												<div class="form-check">
													<input class="form-check-input" type="checkbox" value="" id="keyword3">
													<label class="form-check-label" for="keyword3">데이트코스</label>
												</div>
											</div>
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
											<div class="col">
												<div class="form-check">
													<input class="form-check-input" type="checkbox" value="" id="keyword7">
													<label class="form-check-label" for="keyword7">가족여행</label>
												</div>
												<div class="form-check">
													<input class="form-check-input" type="checkbox" value="" id="keyword8">
													<label class="form-check-label" for="keyword8">함께걷기</label>
												</div>
												<div class="form-check">
													<input class="form-check-input" type="checkbox" value="" id="keyword9">
													<label class="form-check-label" for="keyword9">데이트코스</label>
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
														<i class="bi bi-upload"></i><br>사진 업로드
														<input type="file" class="d-none">
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
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">취소</button>
							<button type="button" class="btn btn-primary">확인</button>
						</div>
					</div>
				</div>
			</div>
			<!-- 여행지 등록 Modal END -->
			
			<!-- 키워드 목록 Modal START -->
			<div class="modal fade" id="keywordListModal" tabindex="-1"
				aria-labelledby="keywordListModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="keywordListModalLabel">키워드 목록</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<!-- 상단 navbar START -->
							<div class="row g-4">
								<div class="col-12">
									<div class="bg-light pb-0 px-2 px-lg-0">
										<ul
											class="nav nav-tabs nav-bottom-line nav-responsive border-0 nav-justified"
											role="tablist">
											<li class="nav-item"><a class="nav-link mb-0 active"
												data-bs-toggle="tab" href="#tab1">숙소</a></li>
											<li class="nav-item"><a class="nav-link mb-0"
												data-bs-toggle="tab" href="#tab2">관광지</a></li>
											<li class="nav-item"><a class="nav-link mb-0"
												data-bs-toggle="tab" href="#tab3">맛집</a></li>
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
										<div class="card-body overflow-y-auto h-400px">
											<!-- overflow-y-auto h-400px 스크롤 생성-->
											<!-- items -->
											<div class="border-bottom text-center p-2">
												<strong># OOOOOO</strong><br>
											</div>
											<div class="border-bottom text-center p-2">
												<strong># OOOOOO</strong><br>
											</div>
											<div class="border-bottom text-center p-2">
												<strong># OOOOOO</strong><br>
											</div>
											<div class="border-bottom text-center p-2">
												<strong># OOOOOO</strong><br>
											</div>
											<div class="border-bottom text-center p-2">
												<strong># OOOOOO</strong><br>
											</div>
											<div class="border-bottom text-center p-2">
												<strong># OOOOOO</strong><br>
											</div>
											<div class="border-bottom text-center p-2">
												<strong># OOOOOO</strong><br>
											</div>
											<div class="border-bottom text-center p-2">
												<strong># OOOOOO</strong><br>
											</div>
											<div class="border-bottom text-center p-2">
												<strong># OOOOOO</strong><br>
											</div>
											<div class="border-bottom text-center p-2">
												<strong># OOOOOO</strong><br>
											</div>
											<div class="border-bottom text-center p-2">
												<strong># OOOOOO</strong><br>
											</div>
											<div class="border-bottom text-center p-2">
												<strong># OOOOOO</strong><br>
											</div>
										</div>
									</div>
								</div>
								<!-- #tab1 / 기본정보 Tap END -->
								<!-- ******************************************** -->

								<!-- #tab2 / 관광지 Tap Start -->
								<div class="tab-pane fade" id="tab2">
									<!-- 상단 네비게이션 바를 클릭하면 탭에 따라 콘텐츠가 변경되는 부분-->
									<div class="card">
										<div class="card-body overflow-y-auto h-400px">
											<!-- overflow-y-auto h-400px 스크롤 생성-->
											<!-- items -->
											<div class="border-bottom text-center p-2">
												<strong># OOOOOO</strong><br>
											</div>
											<div class="border-bottom text-center p-2">
												<strong># OOOOOO</strong><br>
											</div>
											<div class="border-bottom text-center p-2">
												<strong># OOOOOO</strong><br>
											</div>
											<div class="border-bottom text-center p-2">
												<strong># OOOOOO</strong><br>
											</div>
											<div class="border-bottom text-center p-2">
												<strong># OOOOOO</strong><br>
											</div>
											<div class="border-bottom text-center p-2">
												<strong># OOOOOO</strong><br>
											</div>
											<div class="border-bottom text-center p-2">
												<strong># OOOOOO</strong><br>
											</div>
											<div class="border-bottom text-center p-2">
												<strong># OOOOOO</strong><br>
											</div>
											<div class="border-bottom text-center p-2">
												<strong># OOOOOO</strong><br>
											</div>
											<div class="border-bottom text-center p-2">
												<strong># OOOOOO</strong><br>
											</div>
											<div class="border-bottom text-center p-2">
												<strong># OOOOOO</strong><br>
											</div>
											<div class="border-bottom text-center p-2">
												<strong># OOOOOO</strong><br>
											</div>
										</div>
									</div>
								</div>
								<!-- #tab2 / 관광지 Tap END -->

								<!-- #tab3 / 맛집 Tap Start -->
								<div class="tab-pane fade" id="tab3">
									<!-- 상단 네비게이션 바를 클릭하면 탭에 따라 콘텐츠가 변경되는 부분-->
									<div class="card">
										<div class="card-body overflow-y-auto h-400px">
											<!-- overflow-y-auto h-400px 스크롤 생성-->
											<!-- items -->
											<div class="border-bottom text-center p-2">
												<strong># OOOOOO</strong><br>
											</div>
											<div class="border-bottom text-center p-2">
												<strong># OOOOOO</strong><br>
											</div>
											<div class="border-bottom text-center p-2">
												<strong># OOOOOO</strong><br>
											</div>
											<div class="border-bottom text-center p-2">
												<strong># OOOOOO</strong><br>
											</div>
											<div class="border-bottom text-center p-2">
												<strong># OOOOOO</strong><br>
											</div>
											<div class="border-bottom text-center p-2">
												<strong># OOOOOO</strong><br>
											</div>
											<div class="border-bottom text-center p-2">
												<strong># OOOOOO</strong><br>
											</div>
											<div class="border-bottom text-center p-2">
												<strong># OOOOOO</strong><br>
											</div>
											<div class="border-bottom text-center p-2">
												<strong># OOOOOO</strong><br>
											</div>
											<div class="border-bottom text-center p-2">
												<strong># OOOOOO</strong><br>
											</div>
											<div class="border-bottom text-center p-2">
												<strong># OOOOOO</strong><br>
											</div>
											<div class="border-bottom text-center p-2">
												<strong># OOOOOO</strong><br>
											</div>
										</div>
									</div>
								</div>
								<!-- #tab3 / 맛집 Tap END -->
							</div>
							<!-- tab-content END -->
						</div>
						<div class="modal-footer">
							<!-- 키워드 등록 버튼 클릭 시 <키워드 등록>모달창 표시 -->
							<div class="col-12 d-flex justify-content-between">
								<button type="button" class="btn btn-primary-soft ms-2"
									data-bs-toggle="modal" data-bs-target="#keywordRegisterModal">
									<i class="bi bi-plus-lg fa-fw"></i>키워드 등록
								</button>
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">닫기</button>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 키워드 목록 Modal END -->
			
			<!-- 키워드 등록 Modal START -->
			<div class="modal fade" id="keywordRegisterModal" tabindex="-1"
				aria-labelledby="keywordRegisterModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-lg modal-dialog-centered">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="keywordRegisterModalLabel">키워드
								등록</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<form>
								<!-- 키워드 선택 & 장소명 입력 -->
								<div class="row mb-3">
									<!-- 분류 -->
									<div class="col-md-3">
										<label for="keyword" class="form-label fw-bold">분류 <span
											class="text-danger">*</span></label> <select id="keyword"
											class="form-select">
											<option value="">선택</option>
											<option value="가족여행">가족여행</option>
											<option value="함께걷기">함께걷기</option>
											<option value="데이트코스">데이트코스</option>
											<option value="생태관광지">생태관광지</option>
										</select>
									</div>
									<!-- 키워드 -->
									<div class="col-md-7">
										<label for="placeName" class="form-label fw-bold">키워드
											<span class="text-danger">*</span>
										</label> <input type="text" class="form-control" id="placeName"
											placeholder="장소명을 입력해 주세요.">
									</div>
									<div class="col-md-2">
										<label for="placeName" class="form-label fw-bold"> <span
											class="text-danger">*</span></label> <a href="#"
											class="d-block btn btn-dark-soft mb-0 border-0">중복확인</a>
									</div>
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
			<!-- 키워드 등록 Modal END -->
			
			<!-- 검색 필터 START -->
			<div class="card shadow mt-4 mb-5">
				<!-- Card header -->
				<div class="card-header border-bottom">
					<h5 class="card-header-title">검색필터(예시)</h5>
				</div>
				<!-- Card body START -->
				<div class="card-body">
					<form class="row g-4 align-items-center">

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
					<h6 class="mb-1">전체 1654건</h6>
				</div>
				<div class="col-md-6 col-lg-6 d-flex justify-content-end">
					<div class="mb-sm-0 ms-2 d-flex justify-content-center"><a href="#"
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
							<div class="ms-1 col"><a href="admin/locationdetail" class="btn btn-sm btn-light mb-0">상세보기</a></div>
						</div>
					</div>

					<!-- Table data (2번째 예약내역 상세 데이터)-->
					<div class="row row-cols-xl-7 g-4 align-items-sm-center border-bottom px-2 py-4">
						<!-- Data item -->
						<div class="col">
							<small class="d-block d-sm-none">지역</small><!-- 작은 화면일때만 보이는 텍스트-->
							<h6 class="ms-1 mb-0 fw-normal">부산</h6>
						</div>
						<!-- Data item -->
						<div class="col">
							<small class="d-block d-sm-none">분류</small>
							<h6 class="ms-1 mb-0 fw-normal">맛집</h6>
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
							<div class="ms-1 col"><a href="admin/locationdetail" class="btn btn-sm btn-light mb-0">상세보기</a></div>
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

<!-- footerScript -->
<%@ include file="/WEB-INF/views/include/footerScript.jsp" %>
</body>

</html>