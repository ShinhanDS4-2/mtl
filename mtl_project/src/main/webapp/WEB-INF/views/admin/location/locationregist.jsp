<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>[판매자] 예약관리 > 예약내역 상세보기</title>

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
						<h1 class="h3 mb-2">여행지 등록 모달창 모음</h1>
						<span>ㅁㅇㅁ</span>
					</div>
				</div>

				<!-- 모달 열기 버튼 -->
				<button type="button" class="btn btn-primary" data-bs-toggle="modal"
					data-bs-target="#touristModal">관광지 등록 모달</button>
				<button type="button" class="btn btn-primary" data-bs-toggle="modal"
					data-bs-target="#keywordRegisterModal">키워드 등록 모달</button>
				<button type="button" class="btn btn-primary" data-bs-toggle="modal"
					data-bs-target="#keywordListModal">키워드 목록 모달</button>

				<!-- 관광지 등록 Modal START -->
				<div class="modal fade" id="touristModal" tabindex="-1"
					aria-labelledby="touristModalLabel" aria-hidden="true">
					<div class="modal-dialog modal-lg">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="touristModalLabel">관광지 등록</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<form>
									<!-- 지역 선택 -->
									<div class="mb-3">
										<label class="form-label fw-bold">지역 <span
											class="text-danger">*</span></label>
										<div>
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="region"
													id="regionSeoul" value="서울" checked> <label
													class="form-check-label" for="regionSeoul">서울</label>
											</div>
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="region"
													id="regionGangneung" value="강릉"> <label
													class="form-check-label" for="regionGangneung">강릉</label>
											</div>
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="region"
													id="regionYeosu" value="여수"> <label
													class="form-check-label" for="regionYeosu">여수</label>
											</div>
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="region"
													id="regionBusan" value="부산"> <label
													class="form-check-label" for="regionBusan">부산</label>
											</div>
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="region"
													id="regionJeju" value="제주"> <label
													class="form-check-label" for="regionJeju">제주</label>
											</div>
										</div>
									</div>

									<!-- 분류 선택 -->
									<div class="mb-3">
										<label class="form-label fw-bold">분류 <span
											class="text-danger">*</span></label>
										<div>
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="category"
													id="categoryTour" value="관광지" checked> <label
													class="form-check-label" for="categoryTour">관광지</label>
											</div>
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="category"
													id="categoryFood" value="맛집"> <label
													class="form-check-label" for="categoryFood">맛집</label>
											</div>
										</div>
									</div>

									<!-- 장소명 입력 -->
									<div class="mb-3">
										<label for="placeName" class="form-label fw-bold">장소명
											<span class="text-danger">*</span>
										</label> <input type="text" class="form-control" id="placeName"
											placeholder="장소명을 입력해 주세요.">
									</div>

									<!-- 주소 입력 -->
									<div class="mb-3">
										<label class="form-label fw-bold">주소 <span
											class="text-danger">*</span></label> <input type="text"
											class="form-control mb-2" placeholder="주소"> <input
											type="text" class="form-control" placeholder="상세주소">
									</div>

									<!-- 상세정보 입력 -->
									<div class="mb-3">
										<label for="details" class="form-label fw-bold">상세정보 <span
											class="text-danger">*</span></label>
										<textarea class="form-control" id="details" rows="3"
											placeholder="상세정보를 입력해 주세요."></textarea>
									</div>

									<!-- 키워드 선택 드롭다운-->
									<div class="mb-3">
										<label for="keyword" class="form-label fw-bold">키워드 <span
											class="text-danger">*</span></label>
										<div class="col-3 mb-1">
											<form class="col-3">
												<select id="keyword" class="form-select js-choice"
													aria-label=".form-select-sm">
													<option value="">선택</option>
													<option value="가족여행">가족여행</option>
													<option value="함께걷기">함께걷기</option>
													<option value="데이트코스">데이트코스</option>
													<option value="생태관광지">생태관광지</option>
												</select>
											</form>
										</div>
										<div>
											<span class="tag">#가족여행
												<button class="btn-close btn-sm"></button>
											</span> <span class="tag">#함께걷기
												<button class="btn-close btn-sm"></button>
											</span>
										</div>
									</div>

									<!-- 이미지 업로드 -->
									<div class="mb-3">
										<label class="form-label fw-bold d-block">이미지 <span
											class="text-danger">*</span></label>
										<!-- 숙소 사진 등록 Card Start -->
										<div class="card border mb-3">
											<div class="card-body">
												<!-- 사진 리스트 -->
												<div class="d-flex gap-3">
													<!-- 이미지 1 -->
													<div class="position-relative">
														<img src="https://via.placeholder.com/150" alt="사진 1"
															class="rounded border"
															style="width: 150px; height: 100px; object-fit: cover;">
													</div>
													<!-- 이미지 2 -->
													<div class="position-relative">
														<img src="https://via.placeholder.com/150" alt="사진 2"
															class="rounded border"
															style="width: 150px; height: 100px; object-fit: cover;">
													</div>
													<!-- 이미지 3 -->
													<div class="position-relative">
														<img src="https://via.placeholder.com/150" alt="사진 3"
															class="rounded border"
															style="width: 150px; height: 100px; object-fit: cover;">
													</div>
													<!-- 업로드 버튼 -->
													<div
														class="border rounded d-flex justify-content-center align-items-center"
														style="width: 150px; height: 100px; background-color: #f8f9fa;">
														<label class="text-center" style="cursor: pointer;">
															<i class="bi bi-upload"></i><br>사진 업로드 <input
															type="file" class="d-none">
														</label>
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
				<!-- 관광지 등록 Modal END -->



				<!-- 키워드 등록 Modal START -->
				<div class="modal fade" id="keywordRegisterModal" tabindex="-1"
					aria-labelledby="keywordRegisterModalLabel" aria-hidden="true">
					<div class="modal-dialog modal-lg">
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
				<!-- 관광지 등록 Modal END -->

				<!-- 키워드 목록 Modal START -->
				<div class="modal fade" id="keywordListModal" tabindex="-1"
					aria-labelledby="keywordListModalLabel" aria-hidden="true">
					<div class="modal-dialog">
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
								<!-- 새 질문 등록 버튼 클릭 시 모달창 표시 -->
								<div class="col-12 d-flex justify-content-between">
									<button type="button" class="btn btn-primary-soft ms-2"
										data-bs-toggle="modal" data-bs-target="#xlargeModal">
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