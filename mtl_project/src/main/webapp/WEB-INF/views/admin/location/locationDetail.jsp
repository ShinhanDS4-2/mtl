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
					<div class="col-12 mb-3">
						<h1 class="h3 mb-2">여행지 상세조회</h1>
						<span>설명설명설명설명설명설명설명설명</span>
					</div>
				</div> 

				<!-- Button -->
				<div class="d-sm-flex justify-content-end align-items-center">
					<a role="button" class="btn btn-primary-soft text-nowrap mb-0" 
						data-bs-toggle="modal" data-bs-target="#touristEditModal"
						data-src="locationDetail" data-act="clickLocationUpdate"> 
						<i class="bi bi-pencil-square fa-fw"></i>수정하기
					</a>
					<a role="button" class="btn btn-danger-soft text-nowrap ms-1 mb-0"
						data-src="locationDetail" data-act="clickLocationDelete">삭제하기</a>
				</div>
				<!-- 여행지 수정 Modal START -->
				<div class="modal fade" id="touristEditModal" tabindex="-1"
					aria-labelledby="touristModalLabel" aria-hidden="true">
					<div class="modal-dialog modal-lg modal-dialog-centered">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="touristModalLabel">여행지 등록</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close" data-src="locationList"
									data-act="clickLocationCancle"></button>
							</div>
							<div class="modal-body">
								<form>
									<!-- 지역 선택 -->
									<div class="mb-3">
										<label class="form-label fw-bold">지역 <span
											class="text-danger">*</span></label>
										<div>
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="areaType"
													id="regionSeoul" value="SEOUL" checked> <label
													class="form-check-label" for="regionSeoul">서울</label>
											</div>
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="areaType"
													id="regionGangneung" value="GANGNEUNG"> <label
													class="form-check-label" for="regionGangneung">강릉</label>
											</div>
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="areaType"
													id="regionYeosu" value="YEOSU"> <label
													class="form-check-label" for="regionYeosu">여수</label>
											</div>
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="areaType"
													id="regionBusan" value="BUSAN"> <label
													class="form-check-label" for="regionBusan">부산</label>
											</div>
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="areaType"
													id="regionJeju" value="JEJU"> <label
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
												<input class="form-check-input" type="radio"
													name="categoryType" id="attraction" value="A" checked>
												<label class="form-check-label" for="attraction">관광지</label>
											</div>
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio"
													name="categoryType" id="restaurant" value="R"> <label
													class="form-check-label" for=""restaurant"">맛집</label>
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
											class="text-danger">*</span></label>
										<div class="row">
											<div class="col-10">
												<input type="text" class="form-control" id="address"
													data-src="locationList" data-act="clickAddress"> <input
													type="hidden" class="form-control" id="addressSi">
												<input type="hidden" class="form-control" id="addressDong">
											</div>
											<div class="col-2">
												<div class="d-grid gap-2">
													<input class="btn btn-primary-soft" type="button"
														id="findAddress" data-src="locationList"
														data-act="findAddress" value="주소 찾기">
												</div>
											</div>
										</div>
									</div>

									<!-- 상세정보 입력 -->
									<div class="mb-3">
										<label for="details" class="form-label fw-bold">상세정보 <span
											class="text-danger">*</span></label>
										<textarea class="form-control" id="detailInfo" rows="3"
											placeholder="상세정보를 입력해 주세요."></textarea>
									</div>

									<!-- 키워드 선택 드롭다운-->
									<div class="mb-3">
										<label for="keyword" class="form-label fw-bold">키워드 <span
											class="text-danger">*</span></label>
										<div class="mb-1">
											<div class="row row-cols-4 g-3" id="keywordList">
												<!-- js -->
												<div class="col">
													<div class="form-check">
														<input class="form-check-input" type="checkbox" value=""
															id="keyword1"> <label class="form-check-label"
															for="keyword1">가족여행</label>
													</div>
													<div class="form-check">
														<input class="form-check-input" type="checkbox" value=""
															id="keyword2"> <label class="form-check-label"
															for="keyword2">함께걷기</label>
													</div>
													<div class="form-check">
														<!-- name="keywordList" 필수 -->
														<input class="form-check-input" type="checkbox" value=""
															id="keyword3"> <label class="form-check-label"
															for="keyword3">데이트코스</label>
													</div>
												</div>
												<!-- js -->
												<div class="col">
													<div class="form-check">
														<input class="form-check-input" type="checkbox" value=""
															id="keyword4"> <label class="form-check-label"
															for="keyword4">가족여행</label>
													</div>
													<div class="form-check">
														<input class="form-check-input" type="checkbox" value=""
															id="keyword5"> <label class="form-check-label"
															for="keyword5">함께걷기</label>
													</div>
													<div class="form-check">
														<input class="form-check-input" type="checkbox" value=""
															id="keyword6"> <label class="form-check-label"
															for="keyword6">데이트코스</label>
													</div>
												</div>

											</div>
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
													<!-- 업로드 버튼 -->
													<div
														class="border rounded d-flex justify-content-center align-items-center"
														style="width: 150px; height: 100px; background-color: #f8f9fa;">
														<label class="text-center" style="cursor: pointer;">
															<i class="bi bi-upload"></i><br>숙소 사진 업로드 <input
															type="file" class="d-none" multiple="multiple"
															data-src="locationList" data-act="changeFile"
															id="partnerImage">
														</label>
													</div>
													<div id="preview" class="d-flex"></div>
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
									data-bs-dismiss="modal" data-src="locationList"
									data-act="clickLocationCancle">취소</button>
								<button type="button" class="btn btn-primary"
									data-src="locationList" data-act="clickLocationRegist">확인</button>
							</div>
						</div>
					</div>
				</div>
				<!-- 여행지 수정 Modal END -->

				<!-- 여행지 상세보기 Card START -->
				<div class="card shadow border mt-2 mb-3 p-3">
					<div class="card-body">
						<!-- 숙소 detail START -->
						<div class="row g-4 g-xl-5">
							<div class="col mb-5">
								<!-- Card Title START -->
								<div class="card bg-light p-0 pb-0 mb-5">
									<div class="card-body d-flex justify-content-between flex-wrap">
										<div>
											<h1 class="h3 mt-2 mb-1" id="locationName">여행지 이름오는 곳</h1> <!-- js -->
											<p class="mb-2 mb-sm-0" id="locationAddressSiDong"><i class="bi bi-geo-alt me-1 text-primary"></i> 
											여행지 주소 시군구동 오는 곳 </p> <!-- js -->
										</div>
									</div>
								</div>
								<!-- Card Title END -->

								<!-- Card 내용 START -->
								<section class="pt-0">
									<div class="tab-content mb-0" id="tour-pills-tabContent">
										<div class="tab-pane fade show active" id="tab-1"
											role="tabpanel" aria-labelledby="tab-1">
											<div class="row g-4 g-lg-5">
												<!-- Left side START -->
												<div class="col-lg-7 col-xl-8">
													<!-- 설명 Card START -->
													<div class="card bg-transparent mb-4">
														<div
															class="card-header bg-transparent border-bottom px-0 pt-0">
															<h4 class="mb-0">설명</h4>
														</div>
														<div class="card-body px-0 pb-0">
															<p class="mb-3" id="locationDescription">상세설명 들어올 부분</p> <!-- js -->
														</div>
													</div>

													<!-- 관광지 이미지 Card START -->
													<div class="card bg-transparent">
														<div class="card-header bg-transparent border-bottom px-0">
															<h4 class="mb-0">관광지 이미지</h4>
														</div>
														<div class="card-body px-0 pb-0">
															<div class="row g-4" id="locationImgList">
																<!-- 이미지 1장 데이터 / js반복돌려야함 -->
																<div class="col-md-4">
																	<a class="w-100 h-100" data-glightbox data-gallery="gallery"
																		href="assets/images/category/directory/03.jpg">
																		<div class="card card-element-hover card-overlay-hover overflow-hidden">
																			<img src="assets/images/category/directory/03.jpg" class="card-img" alt="">
																			<div class="hover-element w-100 h-100">
																				<i class="bi bi-fullscreen fs-6 text-white position-absolute top-50 start-50 translate-middle bg-dark rounded-1 p-2 lh-1"></i>
																			</div>
																		</div>
																	</a>
																</div>
																<!-- 이미지 1장 데이터 / js반복돌려야함 -->
															</div>
														</div>
													</div>
												</div>

												<!-- Right side START -->
												<div class="col-lg-5 col-xl-4">
													<!-- 정보 Card START -->
													<div class="card shadow mb-4">
														<div class="card-header border-bottom">
															<h5 class="mb-0">정보</h5>
														</div>
														<div class="card-body">
															<ul class="list-group list-group-borderless mb-0">
																<li class="list-group-item d-flex justify-content-between">
																	<span>지역</span> 
																	<span id="locationArea">서울/강릉/여수/부산/제주 택1 js에서 출력</span><!-- js -->
																</li>
																<li class="list-group-item py-0"><hr class="my-1"></li>
																<li class="list-group-item d-flex justify-content-between">
																	<span>분류</span> 
																	<span id="locationType">관광지/맛집 택1 js에서 출력</span><!-- js -->
																</li>
																<li class="list-group-item py-0"><hr class="my-1"></li>
																<li class="list-group-item d-flex justify-content-between">
																	<span>키워드</span> 
																	<span id="locationKeword">#가족여행 #호캉스 #000 ... </span><!-- js -->
																</li>
															</ul>
														</div>
													</div> 

													<!-- 위치 Card START -->
													<div class="card shadow mb-1">
														<div class="card-header border-bottom">
															<h5 class="mb-0">위치</h5>
														</div> 
														<div class="card-body">
															<!-- 지도 --> 
															<div class="w-200px h-400px" id="map"></div>
															<p class="list-group list-group-borderless my-3">
																<span class="h6 fw-normal mb-0 mt-1" id="locationAddress"><!-- js -->							
																<i class="bi fa-fw bi-geo-alt me-2"></i>js로 주소 입력해주는 곳!!</span> 
															</p> 
														</div>
													</div>   
												</div>
											</div>
										</div>
									</div> 
								</section>
								<!-- Card 내용 END -->
							</div>
						</div>
					</div>
				</div>
				<!-- 여행지 상세보기 Card END -->

			</div>
		</div>
		<!-- Page main content END -->
		</div>

	</main>

	<!-- footerScript -->
	<%@ include file="/WEB-INF/views/include/footerScript.jsp"%>
	<script src="js/admin/location/locationDetail.js"></script>
	<script type="text/javascript">
		locationDetail.init();
	</script>

</body>
</html>