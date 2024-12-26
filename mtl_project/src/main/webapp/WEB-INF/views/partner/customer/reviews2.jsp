<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>[판매자] 고객관리 > 후기관리2 (다른 리뷰 스타일)</title>

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


			<!-- 페이지 메인 content START -->
			<div class="page-content-wrapper p-xxl-4">

				<!-- Title -->
				<div class="row">
					<div class="col-12 mb-4 mb-sm-5">
						<h1 class="h3 mb-2">후기 관리2 (임시)</h1>
						<span>다른 스타일의 리뷰 목록</span>
					</div>
				</div>

				<!-- 리뷰 통계 card START -->
				<div class="col-md-12 col-xxl-12">
					<div class="card shadow mb-4">
						<!-- Card body -->
						<div class="card-body">
							<div class="row">
								<!-- 왼쪽 item -->
								<div class="col-md-4">
									<!-- 12그리드 중 4칸 사용. 박스 반반 나눔 -->
									<div class="bg-light p-4 rounded text-center">
										<h6 class="fw-normal">평균 평점</h6>
										<div class="d-flex align-items-center justify-content-center">
											<h2 class="mb-0 me-2">11.01K</h2>
											<div class="badge bg-success bg-opacity-10 text-success">
												21% <i class="bi bi-graph-up"></i>
											</div>
										</div>
										<p class="mb-0">Growth in reviews this year</p>
									</div>

								</div>

								<!-- 중간 item -->
								<div class="col-md-4">
									<div class="bg-light p-4 rounded text-center">
										<h6 class="fw-normal">Average Rating</h6>
										<div class="d-flex align-items-center justify-content-center">
											<h2 class="mb-0 me-2">4.0</h2>
											<ul class="list-inline mb-0">
												<li class="list-inline-item me-0"><i
													class="fa-solid fa-star text-warning"></i></li>
												<li class="list-inline-item me-0"><i
													class="fa-solid fa-star text-warning"></i></li>
												<li class="list-inline-item me-0"><i
													class="fa-solid fa-star text-warning"></i></li>
												<li class="list-inline-item me-0"><i
													class="fa-solid fa-star text-warning"></i></li>
												<li class="list-inline-item"><i
													class="fa-solid fa-star text-secondary"></i></li>
											</ul>
										</div>
										<p class="mb-0">Average rating on this year</p>
									</div>
								</div>
								<!-- 오른쪽 item -->
								<div class="col-md-4">
									<div class="bg-light p-4 rounded">
										<div class="row gx-3 g-0 align-items-center">
											<!-- Progress bar and Rating -->
											<div class="col-9 col-sm-10">
												<!-- Progress item -->
												<div class="progress progress-xs bg-warning bg-opacity-15">
													<div class="progress-bar bg-warning" role="progressbar"
														style="width: 95%" aria-valuenow="95" aria-valuemin="0"
														aria-valuemax="100"></div>
												</div>
											</div>
											<!-- Percentage -->
											<div class="col-3 col-sm-2 text-end">
												<small class="h6 fw-light mb-0">85%</small>
											</div>

											<!-- Progress bar and Rating -->
											<div class="col-9 col-sm-10">
												<!-- Progress item -->
												<div class="progress progress-xs bg-warning bg-opacity-15">
													<div class="progress-bar bg-warning" role="progressbar"
														style="width: 75%" aria-valuenow="75" aria-valuemin="0"
														aria-valuemax="100"></div>
												</div>
											</div>
											<!-- Percentage -->
											<div class="col-3 col-sm-2 text-end">
												<small class="h6 fw-light mb-0">75%</small>
											</div>

											<!-- Progress bar and Rating -->
											<div class="col-9 col-sm-10">
												<!-- Progress item -->
												<div class="progress progress-xs bg-warning bg-opacity-15">
													<div class="progress-bar bg-warning" role="progressbar"
														style="width: 60%" aria-valuenow="60" aria-valuemin="0"
														aria-valuemax="100"></div>
												</div>
											</div>
											<!-- Percentage -->
											<div class="col-3 col-sm-2 text-end">
												<small class="h6 fw-light mb-0">60%</small>
											</div>

											<!-- Progress bar and Rating -->
											<div class="col-9 col-sm-10">
												<!-- Progress item -->
												<div class="progress progress-xs bg-warning bg-opacity-15">
													<div class="progress-bar bg-warning" role="progressbar"
														style="width: 35%" aria-valuenow="35" aria-valuemin="0"
														aria-valuemax="100"></div>
												</div>
											</div>
											<!-- Percentage -->
											<div class="col-3 col-sm-2 text-end">
												<small class="h6 fw-light mb-0">35%</small>
											</div>

											<!-- Progress bar and Rating -->
											<div class="col-9 col-sm-10">
												<!-- Progress item -->
												<div class="progress progress-xs bg-warning bg-opacity-15">
													<div class="progress-bar bg-warning" role="progressbar"
														style="width: 20%" aria-valuenow="20" aria-valuemin="0"
														aria-valuemax="100"></div>
												</div>
											</div>
											<!-- Percentage -->
											<div class="col-3 col-sm-2 text-end">
												<small class="h6 fw-light mb-0">15%</small>
											</div>
										</div>
									</div>

								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- 리뷰 통계 card END -->


				<!-- 리뷰 상단 Tab -->
				<div class="row g-4 justify-content-between align-items-center mb-2">
					<div class="col-5">
						<h6 class="col-5 card-title mb-1">총 101개</h6>
					</div>

					<div class="col-1">
						<form>
							<select class="form-select js-choice"
								aria-label=".form-select-sm">
								<option value="">10개</option>
								<option>20개</option>
								<option>50개</option>
								<option>100개</option>
							</select>
						</form>
					</div>
				</div>
				<!-- 아래 리뷰 붙여넣었더니, 드롭다운 스타일 적용이 안댄다??? -->

				<!-- Review START -->
				<div class="row">
					<div class="col-12">
						<div class="card border rounded-3">
							<!-- Card header START -->
							<div class="card-header border-bottom">
								<h5 class="card-header-title">User Reviews</h5>
							</div>
							<!-- Card header END -->

							<!-- Card body START -->
							<div class="card-body">
								<div class="bg-light rounded p-3">
									<!-- Review item START -->
									<div class="d-sm-flex justify-content-between">
										<!-- Avatar image -->
										<div class="d-sm-flex align-items-center mb-3">
											<img class="avatar avatar-md rounded-circle float-start me-3"
												src="assets/images/avatar/01.jpg" alt="avatar">
											<!-- Title -->
											<div>
												<h6 class="m-0">Frances Guerrero</h6>
												<span class="me-3 small">2 days ago</span>
											</div>
										</div>
										<!-- Review star -->
										<ul class="list-inline mb-2 mb-sm-0">
											<li class="list-inline-item me-0"><i
												class="fas fa-star text-warning"></i></li>
											<li class="list-inline-item me-0"><i
												class="fas fa-star text-warning"></i></li>
											<li class="list-inline-item me-0"><i
												class="fas fa-star text-warning"></i></li>
											<li class="list-inline-item me-0"><i
												class="fas fa-star text-warning"></i></li>
											<li class="list-inline-item me-0"><i
												class="far fa-star text-warning"></i></li>
										</ul>
									</div>

									<!-- Content -->
									<h6 class="fw-normal">
										<span class="text-body">Review on:</span> Pride moon Village
										Resort & Spa
									</h6>
									<p>Satisfied conveying a dependent contented he gentleman
										agreeable do be. Warrant private blushes removed an in equally
										totally if. Delivered dejection necessary objection do Mr
										prevailed. Mr feeling does chiefly cordial in do.</p>

									<!-- Image -->
									<div class="row g-4">
										<div class="col-4 col-sm-3 col-lg-2">
											<a href="assets/images/category/hotel/4by3/07.jpg"
												data-glightbox data-gallery="gallery"> <img
												src="assets/images/category/hotel/4by3/07.jpg"
												class="rounded" alt="">
											</a>
										</div>
										<div class="col-4 col-sm-3 col-lg-2">
											<a href="assets/images/category/hotel/4by3/08.jpg"
												data-glightbox data-gallery="gallery"> <img
												src="assets/images/category/hotel/4by3/08.jpg"
												class="rounded" alt="">
											</a>
										</div>
									</div>

									<!-- Buttons and collapse -->
									<div class="mt-3">
										<!-- Buttons -->
										<div class="d-flex justify-content-between align-items-center">
											<a class="btn btn-sm btn-primary-soft mb-0"
												data-bs-toggle="collapse" href="#collapseComment"
												role="button" aria-expanded="true"
												aria-controls="collapseComment"> <i
												class="bi bi-reply me-1"></i>Reply
											</a> <a href="#" class="text-primary-hover text-reset small mb-0"><i
												class="bi bi-info-circle me-1"></i>Report</a>
										</div>
										<!-- collapse textarea -->
										<div class="collapse show" id="collapseComment">
											<div class="d-flex mt-3">
												<textarea class="form-control mb-0"
													placeholder="Add a comment..." rows="2" spellcheck="false"></textarea>
												<button
													class="btn btn-sm btn-primary-soft ms-2 px-4 mb-0 flex-shrink-0">
													<i class="fas fa-paper-plane fs-5"></i>
												</button>
											</div>
										</div>
									</div>
									<!-- Review item END -->
								</div>
								<hr>
								<!-- Divider -->

								<!-- Review item START -->
								<div class="bg-light rounded p-3">
									<!-- Review item START -->
									<div class="d-sm-flex justify-content-between">
										<!-- Avatar image -->
										<div class="d-sm-flex align-items-center mb-3">
											<img class="avatar avatar-md rounded-circle float-start me-3"
												src="assets/images/avatar/06.jpg" alt="avatar">
											<!-- Title -->
											<div>
												<h6 class="m-0">Carolyn Ortiz</h6>
												<span class="me-3 small">Nov 22, 2022 at 2:00 pm</span>
											</div>
										</div>
										<!-- Review star -->
										<ul class="list-inline mb-2 mb-sm-0">
											<li class="list-inline-item me-0"><i
												class="fas fa-star text-warning"></i></li>
											<li class="list-inline-item me-0"><i
												class="fas fa-star text-warning"></i></li>
											<li class="list-inline-item me-0"><i
												class="fas fa-star text-warning"></i></li>
											<li class="list-inline-item me-0"><i
												class="fas fa-star text-warning"></i></li>
											<li class="list-inline-item me-0"><i
												class="far fa-star text-warning"></i></li>
										</ul>
									</div>

									<!-- Content -->
									<h6 class="fw-normal">
										<span class="text-body">Review on:</span> Pride moon Village
										Resort & Spa
									</h6>
									<p>Offered chiefly farther Satisfied conveying a dependent
										contented he gentleman agreeable do be. Warrant private
										blushes removed an in equally totally if. Delivered dejection
										necessary objection do Mr prevailed. Mr feeling does chiefly
										cordial in do.</p>
									<!-- Buttons -->
									<div class="d-flex justify-content-between align-items-center">
										<a class="btn btn-sm btn-primary-soft mb-0"> <i
											class="bi bi-reply me-1"></i>Reply
										</a> <a href="#" class="text-primary-hover text-reset small mb-0"><i
											class="bi bi-info-circle me-1"></i>Report</a>
									</div>
									<!-- Review item END -->
								</div>
								<!-- Review item END -->

								<hr>
								<!-- Divider -->

								<!-- Review item START -->
								<div class="bg-light rounded p-3">
									<!-- Review item START -->
									<div class="d-sm-flex justify-content-between">
										<!-- Avatar image -->
										<div class="d-sm-flex align-items-center mb-3">
											<img class="avatar avatar-md rounded-circle float-start me-3"
												src="assets/images/avatar/10.jpg" alt="avatar">
											<!-- Title -->
											<div>
												<h6 class="m-0">Dennis Barrett</h6>
												<span class="me-3 small">Nov 18, 2022 at 2:00 pm</span>
											</div>
										</div>
										<!-- Review star -->
										<ul class="list-inline mb-2 mb-sm-0">
											<li class="list-inline-item me-0"><i
												class="fas fa-star text-warning"></i></li>
											<li class="list-inline-item me-0"><i
												class="fas fa-star text-warning"></i></li>
											<li class="list-inline-item me-0"><i
												class="fas fa-star text-warning"></i></li>
											<li class="list-inline-item me-0"><i
												class="fas fa-star text-warning"></i></li>
											<li class="list-inline-item me-0"><i
												class="far fa-star text-warning"></i></li>
										</ul>
									</div>

									<!-- Content -->
									<h6 class="fw-normal">
										<span class="text-body">Review on:</span> Pride moon Village
										Resort & Spa
									</h6>
									<p>Chiefly farther Satisfied conveying a dependent
										contented he gentleman agreeable do be. Warrant private
										blushes removed an in equally totally if. Delivered dejection
										necessary objection do Mr prevailed. Mr feeling does chiefly
										cordial in do.</p>
									<!-- Buttons -->
									<div class="d-flex justify-content-between">
										<a class="btn btn-sm btn-primary-soft mb-0"> <i
											class="bi bi-reply me-1"></i>Reply
										</a> <a href="#" class="text-primary-hover text-reset small mb-0"><i
											class="bi bi-info-circle me-1"></i>Report</a>
									</div>
									<!-- Review item END -->
								</div>
								<!-- Review item END -->
							</div>
							<!-- Card body END -->

							<!-- Card footer START -->
							<div class="card-footer pt-0">
								<!-- Pagination (페이지 전환 하단 바)-->
								<nav class="d-flex justify-content-center">
									<ul
										class="pagination pagination-sm pagination-primary-soft mb-0">
										<li class="page-item disabled"><a class="page-link"
											href="#" tabindex="-1">&lt;</a></li>
										<li class="page-item"><a class="page-link" href="#">1</a></li>
										<li class="page-item"><a class="page-link" href="#">2</a></li>
										<li class="page-item active"><a class="page-link"
											href="#">3</a></li>
										<li class="page-item disabled"><a class="page-link"
											href="#">..</a></li>
										<li class="page-item"><a class="page-link" href="#">9</a></li>
										<li class="page-item"><a class="page-link" href="#">10</a></li>
										<li class="page-item"><a class="page-link" href="#">&gt;</a>
										</li>
									</ul>
								</nav>
							</div>
							<!-- Card footer END -->
						</div>
					</div>
				</div>
				<!-- Review END -->

			</div>
			<!-- 페이지 메인 content END -->
		</div>
		<!-- Page content END -->

	</main>
	<!-- **************** MAIN CONTENT END **************** -->

	<!-- footerScript -->
	<%@ include file="/WEB-INF/views/include/footerScript.jsp"%>

</body>
</html>