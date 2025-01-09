<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>[판매자] 공지사항</title>

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
						<h1 class="h3 mb-2">파트너센터 공지사항</h1>
						<span>파트너센터의 공지사항과 소식을 확인할 수 있습니다. </span>
					</div>
				</div>



				<!-- 문의 내역 List 상단 Tab -->
				<div class="row g-4 justify-content-between align-items-center mb-2">
					<div class="col-2">
						<h6 class="mb-1">총 <span id="totalCnt">101</span>개</h6>
					</div>
				</div>
				<!-- 문의 내역 List START -->
				<div class="card shadow border">
					<!-- Card body START -->
					<div class="card-body">
						<!-- Table head -->
						<div class="bg-light rounded p-3 d-none d-lg-block">
							<div class="row row-cols-4 g-4">
								<div class="col">
									<h6 class="mb-0">제목</h6>
								</div>
								<div class="col">
									<h6 class="mb-0"></h6>
								</div>
								<div class="col">
									<h6 class="mb-0"></h6>
								</div>
								<div class="col">
									<h6 class="mb-0">등록일</h6>
								</div>
							</div>
						</div>

						<!-- Table data -->
						<div
							class="row row-cols-xl-4 align-items-lg-center border-bottom g-4 px-2 py-4">
							<!-- 제목 누르면 <질문 수정> 모달창 표시 -->
							<div class="col">
								<small class="d-block d-lg-none">제목</small>
								<a role="button" class="text-primary fw-bold ms-1 mb-0" data-bs-toggle="modal" data-bs-target="#noticeEditModal">크리스마스 및 연말 요금 점검 안내</a>
							</div>

							<!-- Data item -->
							<div class="col"></div>
							<!-- Data item -->
							<div class="col"></div>

							<!-- Data item -->
							<div class="col">
								<small class="d-block d-lg-none">등록일</small>
								<h6 class="ms-1 mb-0 fw-normal">2024.12.20(금)</h6>
							</div>
						</div>

						<!-- Table data -->
						<div
							class="row row-cols-xl-4 align-items-lg-center border-bottom g-4 px-2 py-4">

							<!-- 제목 누르면 <질문 수정> 모달창 표시 -->
							<div class="col">
								<small class="d-block d-lg-none">제목</small>
								<a role="button" class="text-primary fw-bold ms-1 mb-0" data-bs-toggle="modal" data-bs-target="#noticeEditModal">설 연휴 점검 안내</a>
							</div>

							<!-- Data item -->
							<div class="col"></div>
							<!-- Data item -->
							<div class="col"></div>

							<!-- Data item -->
							<div class="col">
								<small class="d-block d-lg-none">등록일</small>
								<h6 class="ms-1 mb-0 fw-normal">2024.12.19(목)</h6>
							</div>
						</div>


					</div>
					<!-- Card body END -->

					<!-- Card footer START -->
					<div class="card-footer pt-0">
						<!-- Pagination (페이지 전환 하단 바)-->
						<nav class="d-flex justify-content-center">
							<ul class="pagination pagination-sm pagination-primary-soft mb-0" id="pagination">
								<li class="page-item disabled">
									<!-- disabled: 버튼 비활성화--> <a class="page-link" href="#"
									tabindex="-1">&lt;</a>
								</li>
								<li class="page-item"><a class="page-link" href="#">1</a></li>
								<li class="page-item active"><a class="page-link" href="#">2</a></li>
								<li class="page-item"><a class="page-link" href="#">3</a></li>
								<li class="page-item"><a class="page-link" href="#">4</a></li>
								<li class="page-item"><a class="page-link" href="#">5</a></li>
								<li class="page-item"><a class="page-link" href="#">&gt;</a>
								</li>
							</ul>
						</nav>

					</div>
					<!-- Card footer END -->
				</div>
				<!-- 문의 내역 List END -->
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