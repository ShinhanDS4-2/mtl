<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>[판매자] 숙소 관리 > 객실관리</title>

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
						<h1 class="h3 mb-2">객실 관리</h1>
						<span>객실 기본정보를 등록/수정할 수 있습니다.</span>
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
									data-bs-toggle="tab" href="#tab1">객실목록</a></li>
								<li class="nav-item"><a class="nav-link mb-0"
									data-bs-toggle="tab" href="#tab2">객실추가</a></li>
							</ul>
						</div>
					</div>
				</div>
				<!-- 상단 navbar END -->


				<!-- 객실 수정 모달창 START -->
				<div id="roomRegistModal" class="modal" tabindex="-1" role="dialog">
					<div class="modal-dialog modal-xl modal-dialog-centered"
						role="document">
						<!-- 제일 큰 모달 -->
						<div class="modal-content">
							<!-- 모달 head -->
							<div class="modal-header">
								<h5 class="modal-title">객실 수정</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>


							<!-- 모달 body -->
							<div class="modal-body m-3">
								<!-- 객실 기본정보 등록 Card START -->
								<div class="card border mb-4">
									<div class="card-header border-bottom">
										<h5 class="card-header-title">객실 기본정보</h5>
									</div>
									<!-- Flex container START -->
									<div class="d-flex">
										<!-- 왼쪽 카드 START -->
										<div class="card-body col-6">
											<div class="mb-3">
												<label class="form-label">객실타입명</label> <input type="text"
													class="form-control" value="스탠다드" placeholder="Name">
											</div>
											<div class="mb-3">
												<label class="form-label">기본인원</label> <input type="text"
													class="form-control" value="2인"
													placeholder="Enter your mobile number">
											</div>
											<div class="mb-3">
												<label class="form-label">평일요금</label> <input type="text"
													class="form-control" value="50,000원"
													placeholder="Enter your mobile number">
											</div>
										</div>
										<!-- 왼쪽 카드 END -->

										<!-- 오른쪽 카드 START -->
										<div class="card-body col-6">
											<!-- 검색어 드롭다운 -->
											<div class="mb-3">
												<label class="form-label">객실수</label> <input type="text"
													class="form-control" value="5" placeholder="Name">
											</div>

											<div class="mb-3">
												<label class="form-label">최대인원</label> <input type="text"
													class="form-control" value="3인"
													placeholder="Enter your mobile number">
											</div>
											<div class="mb-3">
												<label class="form-label">주말요금</label> <input type="text"
													class="form-control" value="80,000원"
													placeholder="Enter your mobile number">
											</div>
										</div>
										<!-- 오른쪽 카드 END -->
									</div>
								</div>
								<!-- 객실 기본정보 등록 Card END -->

								<!-- 객실 상세 설명 Card Start -->
								<div class="card border mb-4">
									<div class="card-header border-bottom">
										<h5 class="card-header-title">객실 상세 설명</h5>
									</div>
									<div class="card-body">

										<!-- 답변달기 START -->
										<div class="d-flex mt-1">
											<textarea class="form-control mb-3 bg-light"
												placeholder="답변을 작성해주세요..." rows="7"></textarea>
										</div>

									</div>
								</div>
								<!-- 객실 상세 설명 Card END -->

								<!-- 객실 옵션 설정 Card Start -->
								<div class="card border mb-4">
									<div class="card-header border-bottom">
										<h5 class="card-header-title">객실 옵션 설정</h5>
									</div>
									<div class="card-body">
										<!-- 옵션 체크박스 -->
										<div class="row row-cols-4 g-3">
											<!-- 첫 번째 열 -->
											<div class="col">
												<div class="form-check">
													<input class="form-check-input" type="checkbox"
														id="fitness" checked> <label
														class="form-check-label" for="fitness">피트니스</label>
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
													<input class="form-check-input" type="checkbox"
														id="rooftop"> <label class="form-check-label"
														for="rooftop">루프탑</label>
												</div>
											</div>
											<!-- 세 번째 열 -->
											<div class="col">
												<div class="form-check">
													<input class="form-check-input" type="checkbox"
														id="parking" checked> <label
														class="form-check-label" for="parking">무료주차</label>
												</div>
												<div class="form-check">
													<input class="form-check-input" type="checkbox" id="bbq"
														checked> <label class="form-check-label" for="bbq">바베큐</label>
												</div>
												<div class="form-check">
													<input class="form-check-input" type="checkbox"
														id="elevator"> <label class="form-check-label"
														for="elevator">엘리베이터</label>
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
								<!-- 객실 옵션 설정 Card END -->

								<!-- 객실 사진 등록 Card Start -->
								<div class="card border mb-3">
									<div class="card-header border-bottom">
										<h5 class="card-header-title">객실 사진 등록</h5>
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
												<label class="text-center" style="cursor: pointer;">
													<i class="bi bi-upload"></i><br>숙소 사진 업로드 <input
													type="file" class="d-none">
												</label>
											</div>
										</div>
									</div>
								</div>

							</div>

							<!-- 확인/취소 button -->
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">취소</button>
								<button type="button" class="btn btn-primary">수정하기</button>
							</div>
						</div>
					</div>
				</div>
				<!-- 객실 수정 모달창 END -->

				<!-- tab-content START -->
				<div class="tab-content">
					<!-- #tab1 / 객실 타입 Tap Start -->
					<div class="tab-pane fade show active" id="tab1">
						<div class="col-md-12 col-xxl-12">
							<div class="card border">

								<!-- Card body -->
								<div class="card-body">

									<!-- Rooms START -->
									<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-xxl-5 g-4">

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
														<a role="button"
															class="btn btn-sm btn-dark-soft mb-0 w-50"
															data-bs-toggle="modal" data-bs-target="#roomRegistModal">수정</a>
														<a role="button"
															class="btn btn-sm btn-danger-soft mb-0 w-50">삭제</a>
													</div>
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
														<a role="button"
															class="btn btn-sm btn-dark-soft mb-0 w-50"
															data-bs-toggle="modal" data-bs-target="#roomRegistModal">수정</a>
														<a role="button"
															class="btn btn-sm btn-danger-soft mb-0 w-50">삭제</a>
													</div>
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
														<a role="button"
															class="btn btn-sm btn-dark-soft mb-0 w-50"
															data-bs-toggle="modal" data-bs-target="#roomRegistModal">수정</a>
														<a role="button"
															class="btn btn-sm btn-danger-soft mb-0 w-50">삭제</a>
													</div>
												</div>
											</div>
										</div>

									</div>
									<!-- Rooms END -->

								</div>
								<!-- Card body END-->
							</div>
						</div>
					</div>
					<!-- #tab1 / 객실 타입 Tap END -->

					<!-- #tab2 / 객실추가 Tap START -->
					<div class="tab-pane fade" id="tab2">
						<!-- 상단 네비게이션 바를 클릭하면 탭에 따라 콘텐츠가 변경되는 부분-->
						<!-- 객실 기본정보 등록 Card START -->
						<div class="card border mb-4">
							<div class="card-header border-bottom">
								<h5 class="card-header-title">객실 기본정보</h5>
							</div>
							<!-- Flex container START -->
							<div class="d-flex">
								<!-- 왼쪽 카드 START -->
								<div class="card-body col-6">
									<div class="mb-3">
										<label class="form-label">객실타입명</label> <input type="text"
											class="form-control" value="스탠다드" placeholder="Name">
									</div>
									<div class="mb-3">
										<label class="form-label">기본인원</label> <input type="text"
											class="form-control" value="2인"
											placeholder="Enter your mobile number">
									</div>
									<div class="mb-3">
										<label class="form-label">평일요금</label> <input type="text"
											class="form-control" value="50,000원"
											placeholder="Enter your mobile number">
									</div>
								</div>
								<!-- 왼쪽 카드 END -->

								<!-- 오른쪽 카드 START -->
								<div class="card-body col-6">
									<!-- 검색어 드롭다운 -->
									<div class="mb-3">
										<label class="form-label">객실수</label> <input type="text"
											class="form-control" value="5" placeholder="Name">
									</div>

									<div class="mb-3">
										<label class="form-label">최대인원</label> <input type="text"
											class="form-control" value="3인"
											placeholder="Enter your mobile number">
									</div>
									<div class="mb-3">
										<label class="form-label">주말요금</label> <input type="text"
											class="form-control" value="80,000원"
											placeholder="Enter your mobile number">
									</div>
								</div>
								<!-- 오른쪽 카드 END -->
							</div>
						</div>
						<!-- 객실 기본정보 등록 Card END -->

						<!-- 객실 상세 설명 Card Start -->
						<div class="card border mb-4">
							<div class="card-header border-bottom">
								<h5 class="card-header-title">객실 상세 설명</h5>
							</div>
							<div class="card-body">

								<!-- 답변달기 START -->
								<div class="d-flex mt-1">
									<textarea class="form-control mb-3 bg-light"
										placeholder="답변을 작성해주세요..." rows="7"></textarea>
								</div>

							</div>
						</div>
						<!-- 객실 상세 설명 Card END -->

						<!-- 객실 옵션 설정 Card Start -->
						<div class="card border mb-4">
							<div class="card-header border-bottom">
								<h5 class="card-header-title">객실 옵션 설정</h5>
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
						<!-- 객실 옵션 설정 Card END -->

						<!-- 객실 사진 등록 Card Start -->
						<div class="card border mb-3">
							<div class="card-header border-bottom">
								<h5 class="card-header-title">객실 사진 등록</h5>
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
						<!-- 객실 사진 등록 Card END -->
						<div class="d-flex justify-content-end">
							<button class="btn btn-danger-soft px-4 mb-4">등록</button>
						</div>
					</div>
					<!-- #tab2 / 객실추가 Tap END -->
					<!-- ******************************************** -->





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