<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>[판매자] 숙소 관리 > 숙소 등록</title>

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
								<li class="nav-item"><a class="nav-link mb-0 active"
									data-bs-toggle="tab" href="#tab1">기본 정보</a></li>
								<li class="nav-item"><a class="nav-link mb-0"
									data-bs-toggle="tab" href="#tab2">이용 안내</a></li>
								<li class="nav-item"><a class="nav-link mb-0"
									data-bs-toggle="tab" href="#tab3">객실 타입</a></li>
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
							<!-- Flex container START -->
							<div class="d-flex">
								<!-- 왼쪽 카드 START -->
								<div class="card-body col-6">
									<div class="mb-3">
										<label class="form-label">숙소명</label> <input type="text"
											class="form-control" value="00호텔" placeholder="Name">
									</div>
									<div class="mb-3">
										<label class="form-label">숙소 주소</label> <input type="text"
											class="form-control" value="222 555 666"
											placeholder="Enter your mobile number">
									</div>
									<div class="mb-3">
										<label class="form-label">체크인 시간</label> <input type="text"
											class="form-control" value="15:00"
											placeholder="Enter your mobile number">
									</div>
									<div class="mb-3">
										<label class="form-label">체크아웃 시간</label> <input type="text"
											class="form-control" value="11:00"
											placeholder="Enter your mobile number">
									</div>
								</div>
								<!-- 왼쪽 카드 END -->

								<!-- 오른쪽 카드 START -->
								<div class="card-body col-6">
									<div class="mb-3">
										<label class="form-label">숙소명</label> <input type="text"
											class="form-control" value="00호텔" placeholder="Name">
									</div>
									<div class="mb-3">
										<label class="form-label">숙소 주소</label> <input type="text"
											class="form-control" value="222 555 666"
											placeholder="Enter your mobile number">
									</div>
									<div class="mb-3">
										<label class="form-label">체크인 시간</label> <input type="text"
											class="form-control" value="15:00"
											placeholder="Enter your mobile number">
									</div>
									<div class="mb-3">
										<label class="form-label">체크아웃 시간</label> <input type="text"
											class="form-control" value="11:00"
											placeholder="Enter your mobile number">
									</div>
									<!-- button -->
									<div class="d-flex justify-content-end mt-4">
										<a href="#" class="btn btn-primary-soft border-0 me-2">초기화</a>
										<a href="#" class="btn btn-primary">저장</a>
									</div>
								</div>
								<!-- 오른쪽 카드 END -->
							</div>
						</div>
						<!-- 숙소 기본정보 등록 Card END -->

						<!-- 숙소 옵션 설정 Card Start -->
						<div class="card border mb-4">
							<div class="card-header border-bottom">
								<h5 class="card-header-title">숙소 옵션 설정</h5>
							</div>
							<div class="card-body">
								<!-- 옵션 체크박스 -->
								<div class="row row-cols-4 g-3">
									<!-- 첫 번째 열 -->
									<div class="col">
										<div class="form-check">
											<input class="form-check-input" type="checkbox" id="fitness"
												checked> <label class="form-check-label"
												for="fitness">피트니스</label>
										</div>
										<div class="form-check">
											<input class="form-check-input" type="checkbox" id="pool">
											<label class="form-check-label" for="pool">수영장</label>
										</div>
										<div class="form-check">
											<input class="form-check-input" type="checkbox"
												id="outdoor-pool" checked> <label
												class="form-check-label" for="outdoor-pool">야외수영장</label>
										</div>
										<div class="form-check">
											<input class="form-check-input" type="checkbox" id="sauna">
											<label class="form-check-label" for="sauna">사우나</label>
										</div>
									</div>
									<!-- 두 번째 열 -->
									<div class="col">
										<div class="form-check">
											<input class="form-check-input" type="checkbox"
												id="meeting-room" checked> <label
												class="form-check-label" for="meeting-room">공용샤워실</label>
										</div>
										<div class="form-check">
											<input class="form-check-input" type="checkbox" id="spa">
											<label class="form-check-label" for="spa">스파</label>
										</div>
										<div class="form-check">
											<input class="form-check-input" type="checkbox"
												id="restaurant"> <label class="form-check-label"
												for="restaurant">레스토랑</label>
										</div>
										<div class="form-check">
											<input class="form-check-input" type="checkbox" id="rooftop">
											<label class="form-check-label" for="rooftop">루프탑</label>
										</div>
									</div>
									<!-- 세 번째 열 -->
									<div class="col">
										<div class="form-check">
											<input class="form-check-input" type="checkbox" id="parking"
												checked> <label class="form-check-label"
												for="parking">무료주차</label>
										</div>
										<div class="form-check">
											<input class="form-check-input" type="checkbox" id="bbq"
												checked> <label class="form-check-label" for="bbq">바베큐</label>
										</div>
										<div class="form-check">
											<input class="form-check-input" type="checkbox" id="elevator">
											<label class="form-check-label" for="elevator">엘리베이터</label>
										</div>
										<div class="form-check">
											<input class="form-check-input" type="checkbox" id="dryer">
											<label class="form-check-label" for="dryer">건조기</label>
										</div>
									</div>
									<!-- 네 번째 열 -->
									<div class="col">
										<div class="form-check">
											<input class="form-check-input" type="checkbox" id="lounge"
												checked> <label class="form-check-label"
												for="lounge">라운지</label>
										</div>
										<div class="form-check">
											<input class="form-check-input" type="checkbox" id="label1"
												checked> <label class="form-check-label"
												for="label1">Label</label>
										</div>
										<div class="form-check">
											<input class="form-check-input" type="checkbox" id="label2"
												checked> <label class="form-check-label"
												for="label2">Label</label>
										</div>
										<div class="form-check">
											<input class="form-check-input" type="checkbox" id="label3"
												checked> <label class="form-check-label"
												for="label3">Label</label>
										</div>
									</div>
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
										<label class="text-center" style="cursor: pointer;"> <i
											class="bi bi-upload"></i><br>숙소 사진 업로드 <input
											type="file" class="d-none">
										</label>
									</div>
								</div>
							</div>
						</div>
						<!-- 숙소 사진 등록 Card END -->
						<div class="d-flex justify-content-end">
							<button class="btn btn-danger-soft px-4 mb-4">등록</button>
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
								<div class="d-grid">
									<a href="#" class="btn btn-primary-soft mb-0"><i
										class="bi bi-plus-lg fa-fw"></i>추가</a>
								</div>
							</div>

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
							<div class="card shadow">
								<!-- Card header START -->
								<div class="card-header">
									<!-- grid/list 버튼 START-->
									<div class="d-flex justify-content-end mt-2 mt-sm-0">
										<ul class="nav nav-pills nav-pills-dark" id="room-pills-tab"
											role="tablist">
											<!-- Tab item -->
											<li class="nav-item">
												<button class="nav-link rounded-start rounded-0 active"
													id="grid-tab" data-bs-toggle="tab"
													data-bs-target="#grid-tab-pane" type="button" role="tab"
													aria-controls="grid-tab-pane" aria-selected="true">
													<i class="bi fa-fw bi-grid-fill"></i>
												</button>
											</li>
											<!-- Tab item -->
											<li class="nav-item">
												<button class="nav-link rounded-end rounded-0" id="list-tab"
													data-bs-toggle="tab" data-bs-target="#list-tab-pane"
													type="button" role="tab" aria-controls="list-tab-pane"
													aria-selected="false">
													<i class="bi fa-fw bi-list-ul"></i>
												</button>
											</li>
										</ul>
									</div>
									<!-- grid/list 버튼 END -->
								</div>
								<!-- Card header END-->

								<!-- Card body -->
								<div class="card-body">
									<!-- Tab content START -->
									<div class="tab-content" id="myTabContent">
										<!-- 그리드 모드로 객실 목록 조회 START -->
										<div class="tab-pane fade show active" id="grid-tab-pane">
											<!-- Rooms START -->
											<div
												class="row row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-xxl-5 g-4">
												<!-- Room item -->
												<div class="col">
													<div class="card shadow h-100">
														<!-- Overlay item -->
														<div class="position-relative">
															<!-- Image -->
															<img src="assets/images/category/hotel/4by3/02.jpg"
																class="card-img-top" alt="Card image">
															<!-- Overlay -->
															<div class="card-img-overlay d-flex flex-column p-3">
																<!-- Card overlay top -->
																<div
																	class="d-flex justify-content-between align-items-center">
																	<div class="badge text-bg-dark">
																		<i class="bi fa-fw bi-star-fill me-2 text-warning"></i>4.5
																	</div>
																	<!-- Buttons -->
																	<div class="list-inline-item dropdown">
																		<!-- Dropdown button -->
																		<a href="#" class="btn btn-sm btn-round btn-light"
																			role="button" id="dropdownAction1"
																			data-bs-toggle="dropdown" aria-expanded="false">
																			<i class="bi bi-three-dots-vertical"></i>
																		</a>
																		<!-- dropdown items -->
																		<ul
																			class="dropdown-menu dropdown-menu-end min-w-auto shadow rounded small"
																			aria-labelledby="dropdownAction1">
																			<li><a class="dropdown-item" href="#"><i
																					class="bi bi-info-circle me-2"></i>Report</a></li>
																			<li><a class="dropdown-item" href="#"><i
																					class="bi bi-slash-circle me-2"></i>Disable</a></li>
																		</ul>
																	</div>
																</div>
															</div>
														</div>

														<!-- Card body START -->
														<div class="card-body px-3">
															<!-- Title -->
															<h5 class="card-title mb-1">
																<a href="admin-booking-detail.html">Deluxe Pool View
																	with Breakfast</a>
															</h5>
															<ul
																class="list-group list-group-borderless small mt-2 mb-0">
																<li class="list-group-item pb-0"><i
																	class="fa-solid fa-building fa-fw me-2"></i>Ground
																	Floor: G5</li>
																<li class="list-group-item pb-0"><i
																	class="fa-solid fa-bed fa-fw me-2"></i>Double Bed</li>
															</ul>
														</div>
														<!-- Card body END -->

														<!-- Card footer START-->
														<div class="card-footer pt-0">
															<!-- Price -->
															<div class="hstack gap-2 mb-2">
																<h6 class="fw-normal mb-0">$1500</h6>
																<small>/per person</small>
															</div>
															<a href="admin-booking-detail.html"
																class="btn btn-sm btn-primary-soft mb-0 w-100">View
																detail</a>
														</div>
													</div>
												</div>

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
																	<div class="badge text-bg-dark">
																		<i class="bi fa-fw bi-star-fill me-2 text-warning"></i>4.0
																	</div>
																	<!-- Buttons -->
																	<div class="list-inline-item dropdown">
																		<!-- Dropdown button -->
																		<a href="#" class="btn btn-sm btn-round btn-light"
																			role="button" id="dropdownAction2"
																			data-bs-toggle="dropdown" aria-expanded="false">
																			<i class="bi bi-three-dots-vertical"></i>
																		</a>
																		<!-- dropdown items -->
																		<ul
																			class="dropdown-menu dropdown-menu-end min-w-auto shadow rounded small"
																			aria-labelledby="dropdownAction2">
																			<li><a class="dropdown-item" href="#"><i
																					class="bi bi-info-circle me-2"></i>Report</a></li>
																			<li><a class="dropdown-item" href="#"><i
																					class="bi bi-slash-circle me-2"></i>Disable</a></li>
																		</ul>
																	</div>
																</div>
															</div>
														</div>

														<!-- Card body START -->
														<div class="card-body px-3">
															<!-- Title -->
															<h5 class="card-title mb-1">
																<a href="admin-booking-detail.html">Premium Room
																	With Balcony</a>
															</h5>
															<ul
																class="list-group list-group-borderless small mt-2 mb-0">
																<li class="list-group-item pb-0"><i
																	class="fa-solid fa-building fa-fw me-2"></i>First
																	Floor: F3</li>
																<li class="list-group-item pb-0"><i
																	class="fa-solid fa-bed fa-fw me-2"></i>Single Bed</li>
															</ul>
														</div>
														<!-- Card body END -->

														<!-- Card footer START-->
														<div class="card-footer pt-0">
															<!-- Price -->
															<div class="hstack gap-2 mb-2">
																<h6 class="fw-normal mb-0">$750</h6>
																<small>/per person</small>
															</div>
															<a href="admin-booking-detail.html"
																class="btn btn-sm btn-primary-soft mb-0 w-100">View
																detail</a>
														</div>
													</div>
												</div>

												<!-- Room item -->
												<div class="col">
													<div class="card shadow h-100">
														<!-- Overlay item -->
														<div class="position-relative">
															<!-- Image -->
															<img src="assets/images/category/hotel/4by3/04.jpg"
																class="card-img-top" alt="Card image">
															<!-- Overlay -->
															<div class="card-img-overlay d-flex flex-column p-3">
																<!-- Card overlay top -->
																<div
																	class="d-flex justify-content-between align-items-center">
																	<div class="badge text-bg-dark">
																		<i class="bi fa-fw bi-star-fill me-2 text-warning"></i>4.2
																	</div>
																	<!-- Buttons -->
																	<div class="list-inline-item dropdown">
																		<!-- Dropdown button -->
																		<a href="#" class="btn btn-sm btn-round btn-light"
																			role="button" id="dropdownAction3"
																			data-bs-toggle="dropdown" aria-expanded="false">
																			<i class="bi bi-three-dots-vertical"></i>
																		</a>
																		<!-- dropdown items -->
																		<ul
																			class="dropdown-menu dropdown-menu-end min-w-auto shadow rounded small"
																			aria-labelledby="dropdownAction3">
																			<li><a class="dropdown-item" href="#"><i
																					class="bi bi-info-circle me-2"></i>Report</a></li>
																			<li><a class="dropdown-item" href="#"><i
																					class="bi bi-slash-circle me-2"></i>Disable</a></li>
																		</ul>
																	</div>
																</div>
															</div>
														</div>

														<!-- Card body START -->
														<div class="card-body px-3">
															<!-- Title -->
															<h5 class="card-title mb-1">
																<a href="admin-booking-detail.html">Deluxe Pool View</a>
															</h5>
															<ul
																class="list-group list-group-borderless small mt-2 mb-0">
																<li class="list-group-item pb-0"><i
																	class="fa-solid fa-building fa-fw me-2"></i>Ground
																	Floor: G3</li>
																<li class="list-group-item pb-0"><i
																	class="fa-solid fa-bed fa-fw me-2"></i>Family Bed</li>
															</ul>
														</div>
														<!-- Card body END -->

														<!-- Card footer START-->
														<div class="card-footer pt-0">
															<!-- Price -->
															<div class="hstack gap-2 mb-2">
																<h6 class="fw-normal mb-0">$895</h6>
																<small>/per person</small>
															</div>
															<a href="admin-booking-detail.html"
																class="btn btn-sm btn-primary-soft mb-0 w-100">View
																detail</a>
														</div>
													</div>
												</div>

												<!-- Room item -->
												<div class="col">
													<div class="card shadow h-100">
														<!-- Overlay item -->
														<div class="position-relative">
															<!-- Image -->
															<img src="assets/images/category/hotel/4by3/05.jpg"
																class="card-img-top" alt="Card image">
															<!-- Overlay -->
															<div class="card-img-overlay d-flex flex-column p-3">
																<!-- Card overlay top -->
																<div
																	class="d-flex justify-content-between align-items-center">
																	<div class="badge text-bg-dark">
																		<i class="bi fa-fw bi-star-fill me-2 text-warning"></i>4.0
																	</div>
																	<!-- Buttons -->
																	<div class="list-inline-item dropdown">
																		<!-- Dropdown button -->
																		<a href="#" class="btn btn-sm btn-round btn-light"
																			role="button" id="dropdownAction4"
																			data-bs-toggle="dropdown" aria-expanded="false">
																			<i class="bi bi-three-dots-vertical"></i>
																		</a>
																		<!-- dropdown items -->
																		<ul
																			class="dropdown-menu dropdown-menu-end min-w-auto shadow rounded small"
																			aria-labelledby="dropdownAction4">
																			<li><a class="dropdown-item" href="#"><i
																					class="bi bi-info-circle me-2"></i>Report</a></li>
																			<li><a class="dropdown-item" href="#"><i
																					class="bi bi-slash-circle me-2"></i>Disable</a></li>
																		</ul>
																	</div>
																</div>
															</div>
														</div>

														<!-- Card body START -->
														<div class="card-body px-3">
															<!-- Title -->
															<h5 class="card-title mb-1">
																<a href="admin-booking-detail.html">Superior Room</a>
															</h5>
															<ul
																class="list-group list-group-borderless small mt-2 mb-0">
																<li class="list-group-item pb-0"><i
																	class="fa-solid fa-building fa-fw me-2"></i>First
																	Floor: F5</li>
																<li class="list-group-item pb-0"><i
																	class="fa-solid fa-bed fa-fw me-2"></i>King Bed</li>
															</ul>
														</div>
														<!-- Card body END -->

														<!-- Card footer START-->
														<div class="card-footer pt-0">
															<!-- Price -->
															<div class="hstack gap-2 mb-2">
																<h6 class="fw-normal mb-0">$750</h6>
																<small>/per person</small>
															</div>
															<a href="admin-booking-detail.html"
																class="btn btn-sm btn-primary-soft mb-0 w-100">View
																detail</a>
														</div>
													</div>
												</div>

												<!-- Room item -->
												<div class="col">
													<div class="card shadow h-100">
														<!-- Overlay item -->
														<div class="position-relative">
															<!-- Image -->
															<img src="assets/images/category/hotel/4by3/06.jpg"
																class="card-img-top" alt="Card image">
															<!-- Overlay -->
															<div class="card-img-overlay d-flex flex-column p-3">
																<!-- Card overlay top -->
																<div
																	class="d-flex justify-content-between align-items-center">
																	<div class="badge text-bg-dark">
																		<i class="bi fa-fw bi-star-fill me-2 text-warning"></i>4.0
																	</div>
																	<!-- Buttons -->
																	<div class="list-inline-item dropdown">
																		<!-- Dropdown button -->
																		<a href="#" class="btn btn-sm btn-round btn-light"
																			role="button" id="dropdownAction5"
																			data-bs-toggle="dropdown" aria-expanded="false">
																			<i class="bi bi-three-dots-vertical"></i>
																		</a>
																		<!-- dropdown items -->
																		<ul
																			class="dropdown-menu dropdown-menu-end min-w-auto shadow rounded small"
																			aria-labelledby="dropdownAction5">
																			<li><a class="dropdown-item" href="#"><i
																					class="bi bi-info-circle me-2"></i>Report</a></li>
																			<li><a class="dropdown-item" href="#"><i
																					class="bi bi-slash-circle me-2"></i>Disable</a></li>
																		</ul>
																	</div>
																</div>
															</div>
														</div>

														<!-- Card body START -->
														<div class="card-body px-3">
															<!-- Title -->
															<h5 class="card-title mb-1">
																<a href="admin-booking-detail.html">Studio Suite
																	King</a>
															</h5>
															<ul
																class="list-group list-group-borderless small mt-2 mb-0">
																<li class="list-group-item pb-0"><i
																	class="fa-solid fa-building fa-fw me-2"></i>Fifth
																	Floor: Ft3</li>
																<li class="list-group-item pb-0"><i
																	class="fa-solid fa-bed fa-fw me-2"></i>Double Bed</li>
															</ul>
														</div>
														<!-- Card body END -->

														<!-- Card footer START-->
														<div class="card-footer pt-0">
															<!-- Price -->
															<div class="hstack gap-2 mb-2">
																<h6 class="fw-normal mb-0">$1458</h6>
																<small>/per person</small>
															</div>
															<a href="admin-booking-detail.html"
																class="btn btn-sm btn-primary-soft mb-0 w-100">View
																detail</a>
														</div>
													</div>
												</div>

												<!-- Room item -->
												<div class="col">
													<div class="card shadow h-100">
														<!-- Overlay item -->
														<div class="position-relative">
															<!-- Image -->
															<img src="assets/images/category/hotel/4by3/08.jpg"
																class="card-img-top" alt="Card image">
															<!-- Overlay -->
															<div class="card-img-overlay d-flex flex-column p-3">
																<!-- Card overlay top -->
																<div
																	class="d-flex justify-content-between align-items-center">
																	<div class="badge text-bg-dark">
																		<i class="bi fa-fw bi-star-fill me-2 text-warning"></i>4.6
																	</div>
																	<!-- Buttons -->
																	<div class="list-inline-item dropdown">
																		<!-- Dropdown button -->
																		<a href="#" class="btn btn-sm btn-round btn-light"
																			role="button" id="dropdownAction6"
																			data-bs-toggle="dropdown" aria-expanded="false">
																			<i class="bi bi-three-dots-vertical"></i>
																		</a>
																		<!-- dropdown items -->
																		<ul
																			class="dropdown-menu dropdown-menu-end min-w-auto shadow rounded small"
																			aria-labelledby="dropdownAction6">
																			<li><a class="dropdown-item" href="#"><i
																					class="bi bi-info-circle me-2"></i>Report</a></li>
																			<li><a class="dropdown-item" href="#"><i
																					class="bi bi-slash-circle me-2"></i>Disable</a></li>
																		</ul>
																	</div>
																</div>
															</div>
														</div>

														<!-- Card body START -->
														<div class="card-body px-3">
															<!-- Title -->
															<h5 class="card-title mb-1">
																<a href="admin-booking-detail.html">Rock Family
																	Suite</a>
															</h5>
															<ul
																class="list-group list-group-borderless small mt-2 mb-0">
																<li class="list-group-item pb-0"><i
																	class="fa-solid fa-building fa-fw me-2"></i>Second
																	Floor: S4</li>
																<li class="list-group-item pb-0"><i
																	class="fa-solid fa-bed fa-fw me-2"></i>Single Bed</li>
															</ul>
														</div>
														<!-- Card body END -->

														<!-- Card footer START-->
														<div class="card-footer pt-0">
															<!-- Price -->
															<div class="hstack gap-2 mb-2">
																<h6 class="fw-normal mb-0">$1020</h6>
																<small>/per person</small>
															</div>
															<a href="admin-booking-detail.html"
																class="btn btn-sm btn-primary-soft mb-0 w-100">View
																detail</a>
														</div>
													</div>
												</div>

												<!-- Room item -->
												<div class="col">
													<div class="card shadow h-100">
														<!-- Overlay item -->
														<div class="position-relative">
															<!-- Image -->
															<img src="assets/images/category/hotel/4by3/09.jpg"
																class="card-img-top" alt="Card image">
															<!-- Overlay -->
															<div class="card-img-overlay d-flex flex-column p-3">
																<!-- Card overlay top -->
																<div
																	class="d-flex justify-content-between align-items-center">
																	<div class="badge text-bg-dark">
																		<i class="bi fa-fw bi-star-fill me-2 text-warning"></i>4.6
																	</div>
																	<!-- Buttons -->
																	<div class="list-inline-item dropdown">
																		<!-- Dropdown button -->
																		<a href="#" class="btn btn-sm btn-round btn-light"
																			role="button" id="dropdownAction7"
																			data-bs-toggle="dropdown" aria-expanded="false">
																			<i class="bi bi-three-dots-vertical"></i>
																		</a>
																		<!-- dropdown items -->
																		<ul
																			class="dropdown-menu dropdown-menu-end min-w-auto shadow rounded small"
																			aria-labelledby="dropdownAction7">
																			<li><a class="dropdown-item" href="#"><i
																					class="bi bi-info-circle me-2"></i>Report</a></li>
																			<li><a class="dropdown-item" href="#"><i
																					class="bi bi-slash-circle me-2"></i>Disable</a></li>
																		</ul>
																	</div>
																</div>
															</div>
														</div>

														<!-- Card body START -->
														<div class="card-body px-3">
															<!-- Title -->
															<h5 class="card-title mb-1">
																<a href="admin-booking-detail.html">Luxury Room with
																	Balcony</a>
															</h5>
															<ul
																class="list-group list-group-borderless small mt-2 mb-0">
																<li class="list-group-item pb-0"><i
																	class="fa-solid fa-building fa-fw me-2"></i>Third
																	Floor: T2</li>
																<li class="list-group-item pb-0"><i
																	class="fa-solid fa-bed fa-fw me-2"></i>Family Bed</li>
															</ul>
														</div>
														<!-- Card body END -->

														<!-- Card footer START-->
														<div class="card-footer pt-0">
															<!-- Price -->
															<div class="hstack gap-2 mb-2">
																<h6 class="fw-normal mb-0">$847</h6>
																<small>/per person</small>
															</div>
															<a href="admin-booking-detail.html"
																class="btn btn-sm btn-primary-soft mb-0 w-100">View
																detail</a>
														</div>
													</div>
												</div>

												<!-- Room item -->
												<div class="col">
													<div class="card shadow h-100">
														<!-- Overlay item -->
														<div class="position-relative">
															<!-- Image -->
															<img src="assets/images/category/hotel/4by3/01.jpg"
																class="card-img-top" alt="Card image">
															<!-- Overlay -->
															<div class="card-img-overlay d-flex flex-column p-3">
																<!-- Card overlay top -->
																<div
																	class="d-flex justify-content-between align-items-center">
																	<div class="badge text-bg-dark">
																		<i class="bi fa-fw bi-star-fill me-2 text-warning"></i>3.9
																	</div>
																	<!-- Buttons -->
																	<div class="list-inline-item dropdown">
																		<!-- Dropdown button -->
																		<a href="#" class="btn btn-sm btn-round btn-light"
																			role="button" id="dropdownAction8"
																			data-bs-toggle="dropdown" aria-expanded="false">
																			<i class="bi bi-three-dots-vertical"></i>
																		</a>
																		<!-- dropdown items -->
																		<ul
																			class="dropdown-menu dropdown-menu-end min-w-auto shadow rounded small"
																			aria-labelledby="dropdownAction8">
																			<li><a class="dropdown-item" href="#"><i
																					class="bi bi-info-circle me-2"></i>Report</a></li>
																			<li><a class="dropdown-item" href="#"><i
																					class="bi bi-slash-circle me-2"></i>Disable</a></li>
																		</ul>
																	</div>
																</div>
															</div>
														</div>

														<!-- Card body START -->
														<div class="card-body px-3">
															<!-- Title -->
															<h5 class="card-title mb-1">
																<a href="admin-booking-detail.html">Premium Room
																	With Balcony</a>
															</h5>
															<ul
																class="list-group list-group-borderless small mt-2 mb-0">
																<li class="list-group-item pb-0"><i
																	class="fa-solid fa-building fa-fw me-2"></i>Third
																	Floor: T4</li>
																<li class="list-group-item pb-0"><i
																	class="fa-solid fa-bed fa-fw me-2"></i>Family Bed</li>
															</ul>
														</div>
														<!-- Card body END -->

														<!-- Card footer START-->
														<div class="card-footer pt-0">
															<!-- Price -->
															<div class="hstack gap-2 mb-2">
																<h6 class="fw-normal mb-0">$995</h6>
																<small>/per person</small>
															</div>
															<a href="admin-booking-detail.html"
																class="btn btn-sm btn-primary-soft mb-0 w-100">View
																detail</a>
														</div>
													</div>
												</div>

												<!-- Room item -->
												<div class="col">
													<div class="card shadow h-100">
														<!-- Overlay item -->
														<div class="position-relative">
															<!-- Image -->
															<img src="assets/images/category/hotel/4by3/11.jpg"
																class="card-img-top" alt="Card image">
															<!-- Overlay -->
															<div class="card-img-overlay d-flex flex-column p-3">
																<!-- Card overlay top -->
																<div
																	class="d-flex justify-content-between align-items-center">
																	<div class="badge text-bg-dark">
																		<i class="bi fa-fw bi-star-fill me-2 text-warning"></i>4.8
																	</div>
																	<!-- Buttons -->
																	<div class="list-inline-item dropdown">
																		<!-- Dropdown button -->
																		<a href="#" class="btn btn-sm btn-round btn-light"
																			role="button" id="dropdownAction9"
																			data-bs-toggle="dropdown" aria-expanded="false">
																			<i class="bi bi-three-dots-vertical"></i>
																		</a>
																		<!-- dropdown items -->
																		<ul
																			class="dropdown-menu dropdown-menu-end min-w-auto shadow rounded small"
																			aria-labelledby="dropdownAction9">
																			<li><a class="dropdown-item" href="#"><i
																					class="bi bi-info-circle me-2"></i>Report</a></li>
																			<li><a class="dropdown-item" href="#"><i
																					class="bi bi-slash-circle me-2"></i>Disable</a></li>
																		</ul>
																	</div>
																</div>
															</div>
														</div>

														<!-- Card body START -->
														<div class="card-body px-3">
															<!-- Title -->
															<h5 class="card-title mb-1">
																<a href="admin-booking-detail.html">Deluxe Room Twin
																	Bed With Balcony</a>
															</h5>
															<ul
																class="list-group list-group-borderless small mt-2 mb-0">
																<li class="list-group-item pb-0"><i
																	class="fa-solid fa-building fa-fw me-2"></i>Fifth
																	Floor: Ft1</li>
																<li class="list-group-item pb-0"><i
																	class="fa-solid fa-bed fa-fw me-2"></i>Double Bed</li>
															</ul>
														</div>
														<!-- Card body END -->

														<!-- Card footer START-->
														<div class="card-footer pt-0">
															<!-- Price -->
															<div class="hstack gap-2 mb-2">
																<h6 class="fw-normal mb-0">$1650</h6>
																<small>/per person</small>
															</div>
															<a href="admin-booking-detail.html"
																class="btn btn-sm btn-primary-soft mb-0 w-100">View
																detail</a>
														</div>
													</div>
												</div>

												<!-- Room item -->
												<div class="col">
													<div class="card shadow h-100">
														<!-- Overlay item -->
														<div class="position-relative">
															<!-- Image -->
															<img src="assets/images/category/hotel/4by3/12.jpg"
																class="card-img-top" alt="Card image">
															<!-- Overlay -->
															<div class="card-img-overlay d-flex flex-column p-3">
																<!-- Card overlay top -->
																<div
																	class="d-flex justify-content-between align-items-center">
																	<div class="badge text-bg-dark">
																		<i class="bi fa-fw bi-star-fill me-2 text-warning"></i>4.6
																	</div>
																	<!-- Buttons -->
																	<div class="list-inline-item dropdown">
																		<!-- Dropdown button -->
																		<a href="#" class="btn btn-sm btn-round btn-light"
																			role="button" id="dropdownAction10"
																			data-bs-toggle="dropdown" aria-expanded="false">
																			<i class="bi bi-three-dots-vertical"></i>
																		</a>
																		<!-- dropdown items -->
																		<ul
																			class="dropdown-menu dropdown-menu-end min-w-auto shadow rounded small"
																			aria-labelledby="dropdownAction10">
																			<li><a class="dropdown-item" href="#"><i
																					class="bi bi-info-circle me-2"></i>Report</a></li>
																			<li><a class="dropdown-item" href="#"><i
																					class="bi bi-slash-circle me-2"></i>Disable</a></li>
																		</ul>
																	</div>
																</div>
															</div>
														</div>

														<!-- Card body START -->
														<div class="card-body px-3">
															<!-- Title -->
															<h5 class="card-title mb-1">
																<a href="admin-booking-detail.html">Rock Family
																	Suite</a>
															</h5>
															<ul
																class="list-group list-group-borderless small mt-2 mb-0">
																<li class="list-group-item pb-0"><i
																	class="fa-solid fa-building fa-fw me-2"></i>Second
																	Floor: S4</li>
																<li class="list-group-item pb-0"><i
																	class="fa-solid fa-bed fa-fw me-2"></i>King Bed</li>
															</ul>
														</div>
														<!-- Card body END -->

														<!-- Card footer START-->
														<div class="card-footer pt-0">
															<!-- Price -->
															<div class="hstack gap-2 mb-2">
																<h6 class="fw-normal mb-0">$120</h6>
																<small>/per person</small>
															</div>
															<a href="admin-booking-detail.html"
																class="btn btn-sm btn-primary-soft mb-0 w-100">View
																detail</a>
														</div>
													</div>
												</div>
											</div>
											<!-- Rooms END -->
										</div>
										<!-- 그리드 모드로 객실 타입조회 END  -->

										<!-- 리스트 모드로 객실 타입조회 START -->
										<div class="tab-pane fade" id="list-tab-pane">
											<!-- Table head -->
											<div class="bg-light rounded p-3 d-none d-xxl-block">
												<div class="row row-cols-6 g-4">
													<div class="col">
														<h6 class="mb-0">Room Name</h6>
													</div>
													<div class="col">
														<h6 class="mb-0">Bed Type</h6>
													</div>
													<div class="col">
														<h6 class="mb-0">Room Floor</h6>
													</div>
													<div class="col">
														<h6 class="mb-0">Amount</h6>
													</div>
													<div class="col">
														<h6 class="mb-0">Rating</h6>
													</div>
													<div class="col">
														<h6 class="mb-0">Action</h6>
													</div>
												</div>
											</div>

											<!-- Table data -->
											<div
												class="row row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-xl-4 row-cols-xxl-6 g-2 g-sm-4 align-items-md-center border-bottom px-2 py-4">
												<!-- Data item -->
												<div class="col">
													<small class="d-block d-xxl-none">Room name:</small>
													<div class="d-flex align-items-center">
														<!-- Image -->
														<div class="w-80px flex-shrink-0">
															<img src="assets/images/category/hotel/4by3/01.jpg"
																class="rounded" alt="">
														</div>
														<!-- Title -->
														<h6 class="mb-0 ms-2">Deluxe Pool View with Breakfast</h6>
													</div>
												</div>

												<!-- Data item -->
												<div class="col">
													<small class="d-block d-xxl-none">Bed Type:</small>
													<h6 class="mb-0 fw-normal">King Size</h6>
												</div>

												<!-- Data item -->
												<div class="col">
													<small class="d-block d-xxl-none">Room Floor:</small>
													<h6 class="mb-0 fw-normal">Ground Floor: G5</h6>
												</div>

												<!-- Data item -->
												<div class="col">
													<small class="d-block d-xxl-none">Amount:</small>
													<h6 class="text-success mb-0">$1025</h6>
												</div>

												<!-- Data item -->
												<div class="col">
													<small class="d-block d-xxl-none">Payment:</small>
													<ul class="list-inline mb-0">
														<li class="list-inline-item me-0 small"><i
															class="fas fa-star text-warning"></i></li>
														<li class="list-inline-item me-0 small"><i
															class="fas fa-star text-warning"></i></li>
														<li class="list-inline-item me-0 small"><i
															class="fas fa-star text-warning"></i></li>
														<li class="list-inline-item me-0 small"><i
															class="fas fa-star text-warning"></i></li>
														<li class="list-inline-item me-0 small"><i
															class="fas fa-star text-warning"></i></li>
													</ul>
												</div>

												<!-- Data item -->
												<div class="col">
													<a href="#" class="btn btn-sm btn-light mb-0">View</a>
												</div>
											</div>

											<!-- Table data -->
											<div
												class="row row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-xl-4 row-cols-xxl-6 g-2 g-sm-4 align-items-md-center border-bottom px-2 py-4">
												<!-- Data item -->
												<div class="col">
													<small class="d-block d-xxl-none">Room name:</small>
													<div class="d-flex align-items-center">
														<!-- Image -->
														<div class="w-80px flex-shrink-0">
															<img src="assets/images/category/hotel/4by3/02.jpg"
																class="rounded" alt="">
														</div>
														<!-- Title -->
														<h6 class="mb-0 ms-2">Premium Room With Balcony</h6>
													</div>
												</div>

												<!-- Data item -->
												<div class="col">
													<small class="d-block d-xxl-none">Bed Type:</small>
													<h6 class="mb-0 fw-normal">Single Bed</h6>
												</div>

												<!-- Data item -->
												<div class="col">
													<small class="d-block d-xxl-none">Room Floor:</small>
													<h6 class="mb-0 fw-normal">First Floor: F3</h6>
												</div>

												<!-- Data item -->
												<div class="col">
													<small class="d-block d-xxl-none">Amount:</small>
													<h6 class="text-success mb-0">$750</h6>
												</div>

												<!-- Data item -->
												<div class="col">
													<small class="d-block d-xxl-none">Payment:</small>
													<ul class="list-inline mb-0">
														<li class="list-inline-item me-0 small"><i
															class="fas fa-star text-warning"></i></li>
														<li class="list-inline-item me-0 small"><i
															class="fas fa-star text-warning"></i></li>
														<li class="list-inline-item me-0 small"><i
															class="fas fa-star text-warning"></i></li>
														<li class="list-inline-item me-0 small"><i
															class="fas fa-star text-warning"></i></li>
														<li class="list-inline-item me-0 small"><i
															class="fas fa-star text-warning"></i></li>
													</ul>
												</div>

												<!-- Data item -->
												<div class="col">
													<a href="#" class="btn btn-sm btn-light mb-0">View</a>
												</div>
											</div>

											<!-- Table data -->
											<div
												class="row row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-xl-4 row-cols-xxl-6 g-2 g-sm-4 align-items-md-center border-bottom px-2 py-4">
												<!-- Data item -->
												<div class="col">
													<small class="d-block d-xxl-none">Room name:</small>
													<div class="d-flex align-items-center">
														<!-- Image -->
														<div class="w-80px flex-shrink-0">
															<img src="assets/images/category/hotel/4by3/03.jpg"
																class="rounded" alt="">
														</div>
														<!-- Title -->
														<h6 class="mb-0 ms-2">Deluxe Pool View</h6>
													</div>
												</div>

												<!-- Data item -->
												<div class="col">
													<small class="d-block d-xxl-none">Bed Type:</small>
													<h6 class="mb-0 fw-normal">Family Bed</h6>
												</div>

												<!-- Data item -->
												<div class="col">
													<small class="d-block d-xxl-none">Room Floor:</small>
													<h6 class="mb-0 fw-normal">Ground Floor: G3</h6>
												</div>

												<!-- Data item -->
												<div class="col">
													<small class="d-block d-xxl-none">Amount:</small>
													<h6 class="text-success mb-0">$895</h6>
												</div>

												<!-- Data item -->
												<div class="col">
													<small class="d-block d-xxl-none">Payment:</small>
													<ul class="list-inline mb-0">
														<li class="list-inline-item me-0 small"><i
															class="fas fa-star text-warning"></i></li>
														<li class="list-inline-item me-0 small"><i
															class="fas fa-star text-warning"></i></li>
														<li class="list-inline-item me-0 small"><i
															class="fas fa-star text-warning"></i></li>
														<li class="list-inline-item me-0 small"><i
															class="fas fa-star text-warning"></i></li>
														<li class="list-inline-item me-0 small"><i
															class="fas fa-star text-warning"></i></li>
													</ul>
												</div>

												<!-- Data item -->
												<div class="col">
													<a href="#" class="btn btn-sm btn-light mb-0">View</a>
												</div>
											</div>
										</div>
										<!-- 리스트 모드로 객실 타입조회 END -->


									</div>
									<!-- Tab content END -->
								</div>
								<!-- Card body END-->
							</div>
						</div>
					</div>
					<!-- #tab3 / 객실 타입 Tap END -->

				</div>
				<!-- tab-content END -->

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