<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>[판매자] 고객관리 > 리뷰관리</title>

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
					<div class="col-12 mb-4">
						<h1 class="h3 mb-2">후기 관리</h1>
						<span>예약 고객의 후기를 확인하고, 답변을 달아주세요.</span>
					</div>
				</div>

				<!-- 리뷰 통계 card START -->
				<div class="col-md-12 col-xxl-12 mt-4 mb-3">
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

				<!-- 리뷰 내역 List 상단 Tab -->
				<div class="row g-4 justify-content-between align-items-center mb-2">
					<div class="col-2">
						<h6 class="mb-1">총 101개</h6>
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

				<!-- 리뷰 내역 Card START -->
				<div class="card shadow-lg mb-4">
					<div class="card-body">
						<div class="vstack gap-4 mt-2">

							<!-- 리뷰 item -->
							<div class="row g-3 g-lg-4">
								<div class="col-md-4 col-xxl-3">
									<!-- Avatar and info -->
									<div class="d-flex align-items-center">
										<!-- Info -->
										<div class="ms-2">
											<h5 class="mb-1">음얌얌ㅇ</h5>
											<p class="mb-0">2024-10-11</p>
										</div>
									</div>
								</div>
								<div class="col-md-8 col-xxl-9">
									<!-- 별점 -->
									<ul class="list-inline mb-2">
										<li class="list-inline-item me-0"><i
											class="fas fa-star text-warning"></i></li>
										<li class="list-inline-item me-0"><i
											class="fas fa-star text-warning"></i></li>
										<li class="list-inline-item me-0"><i
											class="fas fa-star text-warning"></i></li>
										<li class="list-inline-item me-0"><i
											class="far fa-star text-warning"></i></li>
										<li class="list-inline-item me-0"><i
											class="far fa-star text-warning"></i></li>
									</ul>
									<h6>
										<span class="text-body fw-light"></span>오션뷰 패밀리
									</h6>
									<p>잘 쉬다 갑니다!</p>

									<!-- Button -->
									<div class="d-flex justify-content-between align-items-center">
										<div>
											<a class="btn btn-sm btn-light mb-0"
												data-bs-toggle="collapse" href="#collapseComment1"
												role="button" aria-expanded="false"
												aria-controls="collapseComment"> 답변달기 </a>
										</div>
										<a href="#" class="text-primary-hover"><i
											class="bi bi-trash3 me-1"></i>삭제하기</a>
									</div>
									<!-- 답변달기 창 -->
									<div class="collapse show" id="collapseComment1">
										<!-- class="collapse show" 로 하면 처음부터 펼쳐진 상태 -->
										<div class="d-flex mt-3">
											<textarea class="form-control mb-0"
												placeholder="Add a comment..." rows="2" spellcheck="false"></textarea>
											<button
												class="btn btn-sm btn-primary-soft ms-2 px-4 mb-0 flex-shrink-0">등록</button>
										</div>
									</div>
								</div>
							</div>
							<hr class="m-0">
							<!-- 선긋기 -->

							<!-- 리뷰 item -->
							<div class="row g-3 g-lg-4">
								<div class="col-md-4 col-xxl-3">
									<!-- Avatar and info -->
									<div class="d-flex align-items-center">
										<!-- Info -->
										<div class="ms-2">
											<h5 class="mb-1">일이삼</h5>
											<p class="mb-0">2024-10-17</p>
										</div>
									</div>
								</div>
								<div class="col-md-8 col-xxl-9">
									<!-- 별점 -->
									<ul class="list-inline mb-2">
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
									<h6>
										<span class="text-body fw-light"></span> 오션뷰 트윈룸
									</h6>
									<p>지하철이 가깝고 가성비 좋아요</p>

									<!-- Button -->
									<div class="d-flex justify-content-between align-items-center">
										<div>
											<a class="btn btn-sm btn-light mb-0"
												data-bs-toggle="collapse" href="#collapseComment2"
												role="button" aria-expanded="false"
												aria-controls="collapseComment"> 답변달기 </a>
										</div>
										<a href="#" class="text-primary-hover"><i
											class="bi bi-trash3 me-1"></i>삭제하기</a>
									</div>
									<!-- 답변달기 창 -->
									<div class="collapse" id="collapseComment2">
										<!-- class="collapse show" 로 하면 처음부터 펼쳐진 상태 -->
										<div class="d-flex mt-3">
											<textarea class="form-control mb-0"
												placeholder="Add a comment..." rows="2" spellcheck="false"></textarea>
											<button
												class="btn btn-sm btn-primary-soft ms-2 px-4 mb-0 flex-shrink-0">등록</button>
										</div>
									</div>
								</div>
							</div>
							<hr class="m-0">
							<!-- 선긋기 -->

							<!-- 리뷰 item -->
							<div class="row g-3 g-lg-4">
								<div class="col-md-4 col-xxl-3">
									<!-- Avatar and info -->
									<div class="d-flex align-items-center">
										<!-- Info -->
										<div class="ms-2">
											<h5 class="mb-1">사오오</h5>
											<p class="mb-0">2024-10-17</p>
										</div>
									</div>
								</div>
								<div class="col-md-8 col-xxl-9">
									<!-- 별점 -->
									<ul class="list-inline mb-2">
										<li class="list-inline-item me-0"><i
											class="fas fa-star text-warning"></i></li>
										<li class="list-inline-item me-0"><i
											class="fas fa-star text-warning"></i></li>
										<li class="list-inline-item me-0"><i
											class="fas fa-star text-warning"></i></li>
										<li class="list-inline-item me-0"><i
											class="fas fa-star text-warning"></i></li>
										<li class="list-inline-item me-0"><i
											class="fas fa-star text-warning"></i></li>
									</ul>
									<h6>
										<span class="text-body fw-light"></span>티라미슈
									</h6>
									<p>케잌..</p>

									<!-- Button -->
									<div class="d-flex justify-content-between align-items-center">
										<div>
											<a class="btn btn-sm btn-light mb-0"
												data-bs-toggle="collapse" href="#collapseComment3"
												role="button" aria-expanded="false"
												aria-controls="collapseComment"> 답변달기 </a>
										</div>
										<a href="#" class="text-primary-hover"><i
											class="bi bi-trash3 me-1"></i>삭제하기</a>
									</div>
									<!-- 답변달기 창 -->
									<div class="collapse" id="collapseComment3">
										<!-- class="collapse show" 로 하면 처음부터 펼쳐진 상태 -->
										<div class="d-flex mt-3">
											<textarea class="form-control mb-0"
												placeholder="Add a comment..." rows="2" spellcheck="false"></textarea>
											<button
												class="btn btn-sm btn-primary-soft ms-2 px-4 mb-0 flex-shrink-0">등록</button>
										</div>
									</div>
								</div>
							</div>
							<hr class="m-0">
							<!-- 선긋기 -->

							<!-- 리뷰 item -->
							<div class="row g-3 g-lg-4">
								<div class="col-md-4 col-xxl-3">
									<!-- Avatar and info -->
									<div class="d-flex align-items-center">
										<!-- Info -->
										<div class="ms-2">
											<h5 class="mb-1">호호호</h5>
											<p class="mb-0">2024-12-19</p>
										</div>
									</div>
								</div>
								<div class="col-md-8 col-xxl-9">
									<!-- 별점 -->
									<ul class="list-inline mb-2">
										<li class="list-inline-item me-0"><i
											class="fas fa-star text-warning"></i></li>
										<li class="list-inline-item me-0"><i
											class="fas fa-star text-warning"></i></li>
										<li class="list-inline-item me-0"><i
											class="fas fa-star text-warning"></i></li>
										<li class="list-inline-item me-0"><i
											class="fas fa-star text-warning"></i></li>
										<li class="list-inline-item me-0"><i
											class="fas fa-star text-warning"></i></li>
									</ul>
									<h6>
										<span class="text-body fw-light"></span>성심당
									</h6>
									<p>망고시루</p>

									<!-- Button -->
									<div class="d-flex justify-content-between align-items-center">
										<div>
											<a class="btn btn-sm btn-light mb-0"
												data-bs-toggle="collapse" href="#collapseComment4"
												role="button" aria-expanded="false"
												aria-controls="collapseComment"> 답변달기 </a>
										</div>
										<a href="#" class="text-primary-hover"><i
											class="bi bi-trash3 me-1"></i>삭제하기</a>
									</div>
									<!-- 답변달기 창 -->
									<div class="collapse" id="collapseComment4">
										<div class="d-flex mt-3">
											<textarea class="form-control mb-0"
												placeholder="Add a comment..." rows="2" spellcheck="false"></textarea>
											<button
												class="btn btn-sm btn-primary-soft ms-2 px-4 mb-0 flex-shrink-0">등록</button>
										</div>
									</div>
								</div>
							</div>
							<hr class="m-0">
							<!-- 선긋기 -->

							<!-- 리뷰 item -->
							<div class="row g-3 g-lg-4">
								<div class="col-md-4 col-xxl-3">
									<!-- Avatar and info -->
									<div class="d-flex align-items-center">
										<!-- Info -->
										<div class="ms-2">
											<h5 class="mb-1">ㅇㅇㅇㅁㅇㅁ</h5>
											<p class="mb-0">2024-10-22</p>
										</div>
									</div>
								</div>

								<div class="col-md-8 col-xxl-9">
									<!-- 별점 -->
									<ul class="list-inline mb-2">
										<li class="list-inline-item me-0"><i
											class="far fa-star text-warning"></i></li>
										<li class="list-inline-item me-0"><i
											class="far fa-star text-warning"></i></li>
										<li class="list-inline-item me-0"><i
											class="far fa-star text-warning"></i></li>
										<li class="list-inline-item me-0"><i
											class="far fa-star text-warning"></i></li>
										<li class="list-inline-item me-0"><i
											class="far fa-star text-warning"></i></li>
									</ul>
									<h6>
										<span class="text-body fw-light"></span> 디럭스
									</h6>
									<p>최악입니다. 절ㅇㅇㅇ대가지마</p>

									<!-- Button -->
									<div class="d-flex justify-content-between align-items-center">
										<div>
											<a class="btn btn-sm btn-light mb-0"
												data-bs-toggle="collapse" href="#collapseComment5"
												role="button" aria-expanded="false"
												aria-controls="collapseComment"> 답변달기 </a>
										</div>
										<a href="#" class="text-primary-hover"><i
											class="bi bi-trash3 me-1"></i>삭제하기</a>
									</div>
									<!-- 답변달기 창 -->
									<div class="collapse" id="collapseComment5">
										<div class="d-flex mt-3">
											<textarea class="form-control mb-0"
												placeholder="Add a comment..." rows="2" spellcheck="false"></textarea>
											<button
												class="btn btn-sm btn-primary-soft ms-2 px-4 mb-0 flex-shrink-0">등록</button>
										</div>
									</div>
								</div>
							</div>
							<hr class="m-0">
							<!-- 선긋기 -->


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
				<!-- 리뷰 내역 Card END -->

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