<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>떠날지도 - 파트너센터</title>
<%@ include file="/WEB-INF/views/include/headerScript.jsp"%>
</head>

<body>
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
					<h1 class="h3 mb-2">숙소 정보 등록</h1>
					<span>숙소 기본정보를 등록/수정할 수 있습니다.</span>
				</div>
			</div>

			<!-- 상단 navbar START -->
			<div class="row g-4 mb-4">
				<div class="col-12">
					<div class="bg-light pb-0 px-2 px-lg-0">
						<ul
							class="nav nav-tabs nav-bottom-line nav-responsive border-0 nav-justified"
							role="tablist">
							<li class="nav-item">
								<a class="nav-link mb-0 active" data-bs-toggle="tab" href="#tab1">기본 정보</a>
							</li>
							<li class="nav-item">
								<a class="nav-link mb-0" data-bs-toggle="tab" href="#tab2">이용 안내</a>
							</li>
							<li class="nav-item">
								<a class="nav-link mb-0" data-bs-toggle="tab" href="#tab3">객실 타입</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<!-- 상단 navbar END -->

			<!-- tab-content START -->
			<div class="tab-content">
				<!-- #tab1 / 기본정보 Tap START -->
				<div class="tab-pane fade show active" id="tab1">
					<!-- 상단 네비게이션 바를 클릭하면 탭에 따라 콘텐츠가 변경되는 부분-->
					<!-- 숙소 기본정보 등록 Card START -->
					<div class="card border mb-4">
						<div class="card-header border-bottom">
							<h5 class="card-header-title">숙소 기본정보</h5>
						</div>
						<div class="d-flex">
							<div class="card-body col-6 pb-0">
								<div class="mb-3">
									<label class="form-label">숙소명</label>
									<input type="text" class="form-control" id="partnerName" disabled="disabled">
								</div>
								<div class="mb-3">
									<label class="form-label">사업자 연락처</label>
									<input type="text" class="form-control" id="businessPhone" disabled="disabled">
								</div>
								<div class="mb-3">
									<label class="form-label">체크인 시간</label>
									<input type="text" class="form-control" id="partnerCheckInTime">
								</div>
							</div>
							<div class="card-body col-6 pb-0">
								<div class="mb-3 col-3">
									<label class="h6 fw-normal mb-0 form-label">숙소 유형</label>
									<div class="mt-2">
										<select class="form-select" id="partnerType">
											<option value="" selected disabled="disabled">선택</option>
											<option value="HOTEL">호텔</option>
											<option value="MOTEL">모텔</option>
											<option value="GUESTHOUSE">게스트하우스</option>
											<option value="PENSION">펜션</option>
											<option value="GLAMPING">글램핑</option>
										</select>
									</div>
								</div>

								<div class="mb-3">
									<label class="form-label">숙소 연락처</label>
									<input type="text" class="form-control"  id="partnerPhone" disabled="disabled">
								</div>
								<div>
									<label class="form-label">체크아웃 시간</label> 
									<input type="text" class="form-control" id="partnerCheckOutTime">
								</div>
							</div>
						</div>
						<div class="card-body pt-0 mb-2">
							<label class="form-label">숙소 주소</label> 
							<div class="row">
								<div class="col-10">
									<input type="text" class="form-control" id="address" data-src="regist" data-act="clickAddress">
									<input type="hidden" class="form-control" id="addressSi">
									<input type="hidden" class="form-control" id="addressDong">
								</div>
								<div class="col-2">
									<div class="d-grid gap-2">
										<input class="btn btn-primary-soft" type="button" id="findAddress" data-src="regist" data-act="findAddress" value="주소 찾기">
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- 숙소 기본정보 등록 Card END -->
					
					<div class="card border mb-4">
						<!-- Title -->
						<div class="card-header border-bottom">
							<h5 class="card-header-title">숙소 소개</h5>
						</div>

						<div class="card-body">
							<!-- items -->
							<div class="d-flex justify-content-between align-items-center mb-3">
								<textarea class="w-100 form-control" rows="5" placeholder="숙소 소개를 작성해 주세요." id="partnerDescription"></textarea>
							</div>
						</div>
					</div>

					<!-- 숙소 옵션 설정 Card Start -->
					<div class="card border mb-4">
						<div class="card-header border-bottom">
							<h5 class="card-header-title">숙소 옵션 설정</h5>
						</div>
						<div class="card-body">
							<!-- 옵션 체크박스 -->
							<div class="row row-cols-4 g-3" id="facilitiesList">
							</div>
						</div>
					</div>
					<!-- 숙소 옵션 설정 Card END -->

					<!-- 숙소 사진 등록 Card Start -->
					<div class="card border mb-3">
						<div class="card-header border-bottom">
							<h5 class="card-header-title">숙소 사진 등록</h5>
						</div>
						<div class="card-body">
							<!-- 사진 리스트 -->
							<div class="d-flex gap-3">
								<!-- 업로드 버튼 -->
								<div class="border rounded d-flex justify-content-center align-items-center" style="width: 150px; height: 100px; background-color: #f8f9fa;">
									<label class="text-center" style="cursor: pointer;"> 
										<i class="bi bi-upload"></i><br>숙소 사진 업로드 
										<input type="file" class="d-none" multiple="multiple" data-src="regist" data-act="changeFile" id="partnerImage">
									</label>
								</div>
								<div id="preview" class="d-flex">
								</div>
							</div>
						</div>
					</div>
					<!-- 숙소 사진 등록 Card END -->
					<div class="d-flex justify-content-end">
						<a href="javascript:;" class="btn btn-primary" data-src="regist" data-act="clickInfoSave">저장</a>
					</div>
				</div>
				<!-- #tab1 / 기본정보 Tap END -->
				<!-- ******************************************** -->

				<!-- #tab2 / 이용 안내 Tap Start -->
				<div class="tab-pane fade" id="tab2">
					<!-- 상단 네비게이션 바를 클릭하면 탭에 따라 콘텐츠가 변경되는 부분-->
					<div class="card border mb-4">
						<!-- Title -->
						<div
							class="card-header border-bottom d-sm-flex justify-content-between align-items-center">
							<h5 class="card-header-title">이용 안내</h5>
							<button type="button"
								class="btn btn-sm btn btn-primary-soft mb-0"
								data-bs-toggle="modal" data-bs-target="#addGuideModal">
								<i class="bi bi-plus-lg fa-fw"></i>이용안내 추가
							</button>
						</div>

						<!-- 이용안내 추가 모달창 START -->
						<div id="addGuideModal" class="modal" tabindex="-1" role="dialog">
							<div class="modal-dialog modal-dialog-centered" role="document">
								<!-- 제일 큰 모달 -->
								<div class="modal-content">
									<!-- 모달 head -->
									<div class="modal-header">
										<h5 class="modal-title">이용안내 추가</h5>
										<button type="button" class="btn-close"
											data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<!-- 모달 body -->
									<div class="modal-body m-3">
										<h6 class="fw-bold">제목</h6>
										<input type="text" class="form-control" id="questionTitle"
											placeholder="제목을 입력하세요">

										<h6 class="fw-bold mt-4">내용</h6>
										<textarea class="form-control" id="questionContent" rows="6"
											placeholder="내용을 입력하세요"></textarea>

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
						<!-- 이용안내 추가 모달창 END -->

						<div class="card-body">
							<!-- items -->
							<div
								class="d-flex justify-content-between align-items-center mb-3 border p-3 bg-light">
								<div>
									<strong>일회용품 줄이기 캠페인</strong><br> 자원절약을 위해 일회용 어메니티가 무료로
									제공되지 않습니다.
								</div>
								<div>
									<button
										class="btn btn-sm btn-outline-secondary btn-secondary-soft me-1">수정</button>
									<button class="btn btn-sm btn-outline-danger btn-danger-soft">삭제</button>
								</div>
							</div>

							<!-- items -->
							<div
								class="d-flex justify-content-between align-items-center mb-3 border p-3">
								<div>
									<strong>일회용품 줄이기 캠페인</strong><br> 자원절약을 위해 일회용 어메니티가 무료로
									제공되지 않습니다.
								</div>
								<div>
									<button class="btn btn-sm btn-outline-secondary me-1">수정</button>
									<button class="btn btn-sm btn-outline-danger">삭제</button>
								</div>
							</div>

							<!-- items -->
							<div
								class="d-flex justify-content-between align-items-center mb-3 border p-3 bg-light">
								<div>
									<strong>일회용품 줄이기 캠페인</strong><br> 자원절약을 위해 일회용 어메니티가 무료로
									제공되지 않습니다.
								</div>
								<div>
									<button
										class="btn btn-sm btn-outline-secondary btn-secondary-soft me-1">수정</button>
									<button class="btn btn-sm btn-outline-danger btn-danger-soft">삭제</button>
								</div>
							</div>
							<!-- items -->
							<div
								class="d-flex justify-content-between align-items-center mb-3 border p-3">
								<div>
									<strong>일회용품 줄이기 캠페인</strong><br> 자원절약을 위해 일회용 어메니티가 무료로
									제공되지 않습니다.
								</div>
								<div>
									<button class="btn btn-sm btn-outline-secondary me-1">수정</button>
									<button class="btn btn-sm btn-outline-danger">삭제</button>
								</div>
							</div>

							<!-- items -->
							<div
								class="d-flex justify-content-between align-items-center mb-3 border p-3 bg-light">
								<div>
									<strong>일회용품 줄이기 캠페인</strong><br> 자원절약을 위해 일회용 어메니티가 무료로
									제공되지 않습니다.
								</div>
								<div>
									<button
										class="btn btn-sm btn-outline-secondary btn-secondary-soft me-1">수정</button>
									<button class="btn btn-sm btn-outline-danger btn-danger-soft">삭제</button>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- #tab2 / 이용 안내 Tap END -->

				<!-- #tab3 / 객실 타입 Tap Start -->
				<div class="tab-pane fade" id="tab3">
					<div class="col-md-12 col-xxl-12">
						<div class="card border">

							<!-- Card body -->
							<div class="card-body">

								<!-- Rooms START -->
								<div
									class="row row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-xxl-5 g-4">
									<!-- Room item -->
									<div class="col">
										<div class="card shadow h-100">
											<!-- Overlay item -->
											<div class="position-relative">
												<!-- Image -->
												<img src="assets/images/category/hotel/4by3/03.jpg"
													class="card-img-top" alt="Card image">
												<!-- Overlay -->
												<div class="card-img-overlay d-flex flex-column p-3">
													<!-- Card overlay top -->
													<div
														class="d-flex justify-content-between align-items-center">
													</div>
												</div>
											</div>

											<!-- Card body START -->
											<div class="card-body px-3">
												<!-- Title -->
												<h5 class="card-title mb-1">
													<a href="admin-booking-detail.html">프리미엄 스탠다드</a>
												</h5>
												<ul
													class="list-group list-group-borderless small mt-2 mb-0">
													<li class="list-group-item pb-0"><i
														class="fa-solid fa-building fa-fw me-2"></i>First Floor:
														F3</li>
													<li class="list-group-item pb-0"><i
														class="fa-solid fa-bed fa-fw me-2"></i>Single Bed</li>
												</ul>
											</div>
											<!-- Card body END -->

											<!-- Card footer START-->
											<div class="card-footer pt-0">
												<!-- Price -->
												<div class="hstack gap-2 mb-2">
													<h6 class="fw-normal mb-0">25,000원</h6>
												</div>
												<div class="hstack gap-2 mb-2">
													<a role="button" class="btn btn-sm btn-primary-soft mb-0 w-100">상세보기</a>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</main>

<!-- footerScript -->
<%@ include file="/WEB-INF/views/include/footerScript.jsp"%>

<script src="js/partner/accomodation/regist.js"></script>
<script type="text/javascript">
	regist.init();
</script>

</body>
</html>