<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">

<head>
	<title>Booking - Multipurpose Online Booking Theme</title>

	<!-- headerScript -->
	<%@ include file="/WEB-INF/views/include/headerScript.jsp" %>
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
					<div class="col-12 mb-3">
						<h1 class="h3 mb-2">여행지 상세조회</h1>
						<span>설명설명설명설명설명설명설명설명</span>
					</div>
				</div>

				<!-- Button -->
				<div class="d-sm-flex justify-content-end align-items-center">
					<a href="#" class="btn btn-primary-soft text-nowrap mb-0"><i
							class="bi bi-pencil-square fa-fw"></i>수정하기</a>
				</div>

				<!-- 여행지 상세보기 Crad START -->
				<div class="card shadow border mt-2 mb-3 p-3">
					<div class="card-body">
						<!-- 숙소 detail START -->
						<div class="row g-4 g-xl-5">
							<div class="col mb-5">
								<!-- Crad Title START -->
								<div class="card bg-light p-0 pb-0 mb-5">
									<!-- Card body -->
									<div class="card-body d-flex justify-content-between flex-wrap">
										<!-- Title and badge -->
										<div>
											<!-- Badge -->
											<div class="badge text-bg-dark"><i
													class="fa-solid fa-spa fa-fw text-warning"></i> Spa</div>
											<div class="badge text-bg-dark"><i
													class="bi bi-scissors fa-fw text-warning"></i> Salon</div>
											<div class="badge text-bg-dark"><i
													class="fas fa-star fa-fw text-warning"></i> 4.5</div>
											<!-- Title -->
											<h1 class="h3 mt-2 mb-1">관광지 스파 Spa</h1>
											<p class="mb-2 mb-sm-0"><i class="bi bi-geo-alt me-1 text-primary"></i>서울특별시
												홍대 구로</p>
										</div>
									</div>

								</div>
								<!-- Crad Title END -->

								<!-- Crad 내용 START -->
								<section class="pt-0">
									<!-- Tabs contents START -->
									<div class="tab-content mb-0" id="tour-pills-tabContent">

										<!-- Content item START -->
										<div class="tab-pane fade show active" id="tab-1" role="tabpanel"
											aria-labelledby="tab-1">
											<div class="row g-4 g-lg-5">
												<!-- Left side START -->
												<div class="col-lg-7 col-xl-8">
													<!-- Card START -->
													<div class="card bg-transparent mb-4">
														<!-- Card header -->
														<div class="card-header bg-transparent border-bottom px-0 pt-0">
															<h4 class="mb-0">설명</h4>
														</div>
														<!-- Card body -->
														<div class="card-body px-0 pb-0">
															<p class="mb-3">Demesne far-hearted suppose venture excited
																see had has. Dependent on so extremely delivered by. Yet
																no jokes worse her why. <b>Bed one supposing breakfast
																	day fulfilled off depending questions.</b> As it so
																contrasted oh estimating instrument. Size like body some
																one had. Are conduct viewing boy minutes warrant the
																expense?
																Tolerably behavior may admit daughters offending her ask
																own. Praise effect wishes change way and any wanted.
																Lively use looked latter regard had. Do he it part more
																last in. We understand that theory is important to build
																a solid foundation, we understand that theory alone
																isn’t going to
																get the job done so that’s why this is packed with
																practical hands-on examples that you can follow step by
																step.
															</p>

															<p class="mb-0">Delivered dejection necessary objection
																do Mr
																prevailed. Mr feeling does chiefly cordial in do.
																Water
																timed folly right aware if oh truth. Large above be
																to
																means. Dashwood does provide stronger is.</p>
														</div>
													</div>
													<!-- Card END -->

													<!-- Card START -->
													<div class="card bg-transparent">
														<!-- Card header -->
														<div class="card-header bg-transparent border-bottom px-0">
															<h4 class="mb-0">관광지 이미지</h4>
														</div>
														<!-- Card body -->
														<div class="card-body px-0 pb-0">
															<div class="row g-4">
																<div class="col-md-4">
																	<a class="w-100 h-100" data-glightbox
																		data-gallery="gallery"
																		href="assets/images/category/directory/11.jpg">
																		<div
																			class="card card-element-hover card-overlay-hover overflow-hidden">
																			<!-- Image -->
																			<img src="assets/images/category/directory/11.jpg"
																				class="card-img" alt="">
																			<!-- Full screen button -->
																			<div class="hover-element w-100 h-100">
																				<i
																					class="bi bi-fullscreen fs-6 text-white position-absolute top-50 start-50 translate-middle bg-dark rounded-1 p-2 lh-1"></i>
																			</div>
																		</div>
																	</a>
																</div>

																<div class="col-md-4">
																	<a class="w-100 h-100" data-glightbox
																		data-gallery="gallery"
																		href="assets/images/category/directory/09.jpg">
																		<div
																			class="card card-element-hover card-overlay-hover overflow-hidden">
																			<!-- Image -->
																			<img src="assets/images/category/directory/09.jpg"
																				class="card-img" alt="">
																			<!-- Full screen button -->
																			<div class="hover-element w-100 h-100">
																				<i
																					class="bi bi-fullscreen fs-6 text-white position-absolute top-50 start-50 translate-middle bg-dark rounded-1 p-2 lh-1"></i>
																			</div>
																		</div>
																	</a>
																</div>

																<div class="col-md-4">
																	<a class="w-100 h-100" data-glightbox
																		data-gallery="gallery"
																		href="assets/images/category/directory/03.jpg">
																		<div
																			class="card card-element-hover card-overlay-hover overflow-hidden">
																			<!-- Image -->
																			<img src="assets/images/category/directory/03.jpg"
																				class="card-img" alt="">
																			<!-- Full screen button -->
																			<div class="hover-element w-100 h-100">
																				<i
																					class="bi bi-fullscreen fs-6 text-white position-absolute top-50 start-50 translate-middle bg-dark rounded-1 p-2 lh-1"></i>
																			</div>
																		</div>
																	</a>
																</div>

																<div class="col-md-4">
																	<a class="w-100 h-100" data-glightbox
																		data-gallery="gallery"
																		href="assets/images/category/directory/10.jpg">
																		<div
																			class="card card-element-hover card-overlay-hover overflow-hidden">
																			<!-- Image -->
																			<img src="assets/images/category/directory/10.jpg"
																				class="card-img" alt="">
																			<!-- Full screen button -->
																			<div class="hover-element w-100 h-100">
																				<i
																					class="bi bi-fullscreen fs-6 text-white position-absolute top-50 start-50 translate-middle bg-dark rounded-1 p-2 lh-1"></i>
																			</div>
																		</div>
																	</a>
																</div>

																<div class="col-md-4">
																	<a class="w-100 h-100" data-glightbox
																		data-gallery="gallery"
																		href="assets/images/category/directory/08.jpg">
																		<div
																			class="card card-element-hover card-overlay-hover overflow-hidden">
																			<!-- Image -->
																			<img src="assets/images/category/directory/08.jpg"
																				class="card-img" alt="">
																			<!-- Full screen button -->
																			<div class="hover-element w-100 h-100">
																				<i
																					class="bi bi-fullscreen fs-6 text-white position-absolute top-50 start-50 translate-middle bg-dark rounded-1 p-2 lh-1"></i>
																			</div>
																		</div>
																	</a>
																</div>

																<div class="col-md-4">
																	<a class="w-100 h-100" data-glightbox
																		data-gallery="gallery"
																		href="assets/images/category/directory/07.jpg">
																		<div
																			class="card card-element-hover card-overlay-hover overflow-hidden">
																			<!-- Image -->
																			<img src="assets/images/category/directory/07.jpg"
																				class="card-img" alt="">
																			<!-- Full screen button -->
																			<div class="hover-element w-100 h-100">
																				<i
																					class="bi bi-fullscreen fs-6 text-white position-absolute top-50 start-50 translate-middle bg-dark rounded-1 p-2 lh-1"></i>
																			</div>
																		</div>
																	</a>
																</div>
															</div>
														</div>
													</div>
													<!-- Card END -->
												</div>
												<!-- Left side END -->

												<!-- Right side START -->
												<div class="col-lg-5 col-xl-4">
													<!-- 정보 Card START -->
													<div class="card shadow mb-4">
														<!-- Card header -->
														<div class="card-header border-bottom">
															<h5 class="mb-0">정보</h5>
														</div>

														<!-- Card body -->
														<div class="card-body">
															<ul class="list-group list-group-borderless mb-0">
																<li
																	class="list-group-item d-flex justify-content-between">
																	<span>지역</span>
																	<span>서울/강릉/여수/부산/제주 택1</span>
																</li>

																<li class="list-group-item py-0">
																	<hr class="my-1">
																</li>

																<li
																	class="list-group-item d-flex justify-content-between">
																	<span>분류</span>
																	<span>관광지/맛집 택1</span>
																</li>

																<li class="list-group-item py-0">
																	<hr class="my-1">
																</li>

																<li
																	class="list-group-item d-flex justify-content-between">
																	<span>키워드</span>
																	<span>#가족여행 #호캉스 #000 ... </span>
																</li>

																<li class="list-group-item py-0">
																	<hr class="my-1">
																</li>
															</ul>
														</div>
													</div>
													<!-- 정보 Card END -->

													<!-- 위치 Card START -->
													<div class="card shadow mb-4">
														<!-- Card header -->
														<div class="card-header border-bottom">
															<h5 class="mb-0">위치</h5>
														</div>

														<!-- Card body -->
														<div class="card-body">
															<!-- Map START -->
															<iframe class="w-100 grayscale rounded"
																src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3022.9663095343008!2d-74.00425878428698!3d40.74076684379132!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89c259bf5c1654f3%3A0xc80f9cfce5383d5d!2sGoogle!5e0!3m2!1sen!2sin!4v1586000412513!5m2!1sen!2sin"
																height="200" style="border:0;" aria-hidden="false" tabindex="0"></iframe>

															<!-- Info -->
															<ul class="list-group list-group-borderless my-3">
																<!-- Address -->
																<li class="list-group-item">
																	<a href="#" class="h6 fw-normal mb-0"><i class="bi fa-fw bi-geo-alt me-2"></i>5855 서울특별시 홍대연남동</a>
																</li>
																<!-- Call no -->
																<li class="list-group-item">
																	<a href="#" class="h6 fw-normal mb-0"><i class="bi fa-fw bi-telephone-forward me-2"></i>+31 123 456 789</a>
																</li>
																<!-- Email -->
																<li class="list-group-item">
																	<a href="#" class="h6 fw-normal mb-0"><i class="bi fa-fw bi-envelope me-2"></i>example@gmail.com </a>
																</li>
															</ul>
														</div>
													</div>
													<!-- 위치 Card END -->
												</div>
												<!-- Right side END -->
											</div>
										</div>
										<!-- Content item END -->

									</div>
									<!-- Tabs contents END -->

								</section>
								<!-- Crad 내용 END -->
							</div>


						</div>
					</div>





				</div>
			</div>
		</div>
		<!-- Page main content END -->
		</div>
		<!-- Page content END -->

	</main>
	<!-- **************** MAIN CONTENT END **************** -->

	<!-- footerScript -->
	<%@ include file="/WEB-INF/views/include/footerScript.jsp" %>

</body>
</html>