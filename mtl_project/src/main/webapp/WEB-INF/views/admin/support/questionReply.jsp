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
						<h1 class="h3 mb-2">1:1 문의 답변</h1>
						<span>예약 고객의 1:1 문의에 답변해주세요. </span>
					</div>
				</div>

				<!-- 문의 내역 상세조회 START -->
				<div class="card shadow border rounded-3">
					<div class="row">
						<div class="col-12">
							<!-- Card header START -->
							<div class="card-header border-bottom">
								<h5 class="card-header-title">문의 상세 조회</h5>
							</div>
							<!-- Card header END -->

							<!-- Card body START -->
							<div class="card-body">
								<div class="bg-light rounded p-4 mb-4">
									<!-- 문의 내용 -->
									<h6 class="fw-normal">Pride moon Village Resort & Spa</h6>
									<p class="text-body">처음 전기차 주차가 어려워 객실 먼저 들어간 가족들을 만나기 힘든
										구조여서 불편함을 호소했지만 그만큼 객실과의 분리가 잘되어 있다는 생각이 듭니다. 가장 좋았다면 조용한 점과
										가격대비 시설과 인테리어가 우수했고 추가 조식을 구매하였는데 다른곳에 비해 든든한 식사를 할수 있었습니다.
										부모님들과는 한식이 아니여서 고민은 될 듯 합니다. 주변환경도 좋아 1박으로 조금 아쉽기도 했습니다. 추후
										재방문 의사는 있습니다. 가성비, 위치, 컨디션 전부 무난하고 좋아서 강릉 올때마다 세인트존스 호텔 이용합니다.
										일회용품 어메니티 없는거 까진 괜찮은데 바디로션하고 치약도 없는건 아쉽네요 다회용 큰사이즈로 있어도 좋을거같아요</p>

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
								</div>
								<hr>
								<!-- 줄긋기 -->

								<!-- 답변달기 START -->
								<div class="bg-light rounded p-4 mt-4">
									<div class="d-flex mt-3">
										<textarea class="form-control mb-3"
											placeholder="답변을 작성해주세요..." rows="11" spellcheck="false"></textarea>
									</div>
									<div class="d-flex justify-content-end">
										<button class="btn btn-primary-soft px-4 mb-0">등록</button>
									</div>
								</div>
							</div>
							<!-- Card body END -->
						</div>
					</div>
				</div>
				<!-- 문의 내역 상세조회 END -->

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