<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>[판매자] 기타 페이지들 > 공지사항</title>

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

				<!-- 상단 navbar START -->
				<div class="row g-4 align-items-center border-bottom">
					<!-- Tabs -->
					<div class="col-lg-6">
						<ul class="mb-2 nav nav-pills-shadow nav-responsive">
							<li class="nav-item"><a class="nav-link mb-0 active"
								data-bs-toggle="tab" href="#tab-1">전체</a></li>
							<li class="nav-item"><a class="nav-link mb-0"
								data-bs-toggle="tab" href="#tab-2">운영</a></li>
							<li class="nav-item"><a class="nav-link mb-0"
								data-bs-toggle="tab" href="#tab-3">시스템</a></li>
							<li class="nav-item"><a class="nav-link mb-0"
								data-bs-toggle="tab" href="#tab-4">서비스</a></li>
						</ul>
					</div>
				</div>
				<!-- 상단 navbar END -->

				<!-- 검색 필터 START -->
				<div class="card shadow mt-4 mb-5">
					<form class="card-body">
						<!-- 검색어 입력 input -->
						<div class="col-4 pb-3">
							<label class="h6 fw-normal">검색어</label> <input type="text"
								class="form-control" placeholder="검색어를 입력해주세요.">
						</div>

						<!-- 초기화/검색 button -->
						<div class="d-sm-flex justify-content-end border-top pt-3">
							<button type="button" class="btn btn-primary-soft mb-0 ms-2">초기화</button>
							<button type="button" class="btn btn-primary mb-0 ms-2">검색</button>
						</div>
					</form>
				</div>
				<!-- 검색 필터 설정 END -->



				<!-- 문의 내역 List 상단 Tab -->
				<h6 class="mb-3 ms-2">총 17개</h6>

				<!-- 문의 내역 List START -->
				<div class="card shadow">
					<!-- Card body START -->
					<div class="card-body">
						<!-- Table head -->
						<div class="bg-light rounded p-3 d-none d-lg-block">
							<div class="row row-cols-7 g-4">
								<div class="col">
									<h6 class="mb-0">카테고리</h6>
								</div>
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
							class="row row-cols-xl-7 align-items-lg-center border-bottom g-4 px-2 py-4">
							<!-- Data item -->
							<div class="col">
								<small class="d-block d-lg-none">카테고리</small>
								<h6 class="ms-1 mb-0 fw-normal">서비스</h6>
							</div>

							<!-- Data item -->
							<div class="col">
								<small class="d-block d-lg-none">제목</small>
								<h6 class="ms-1 mb-0 fw-normal text-primary">
									<b>크리스마스 및 연말 요금 점검 안내</b>
								</h6>
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
							class="row row-cols-xl-7 align-items-lg-center border-bottom g-4 px-2 py-4">
							<!-- Data item -->
							<div class="col">
								<small class="d-block d-lg-none">카테고리</small>
								<h6 class="ms-1 mb-0 fw-normal">서비스</h6>
							</div>

							<!-- Data item -->
							<div class="col">
								<small class="d-block d-lg-none">제목</small>
								<h6 class="ms-1 mb-0 fw-normal text-primary">
									<b>설 연휴 점검 안내</b>
								</h6>
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

						<!-- Table data -->
						<div
							class="row row-cols-xl-7 align-items-lg-center border-bottom g-4 px-2 py-4">
							<!-- Data item -->
							<div class="col">
								<small class="d-block d-lg-none">카테고리</small>
								<h6 class="ms-1 mb-0 fw-normal">시스템</h6>
							</div>

							<!-- Data item -->
							<div class="col">
								<small class="d-block d-lg-none">제목</small>
								<h6 class="ms-1 mb-0 fw-normal text-primary">
									<b>파트너센터 시스템 점검 안내</b>
								</h6>
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
							class="row row-cols-xl-7 align-items-lg-center border-bottom g-4 px-2 py-4">
							<!-- Data item -->
							<div class="col">
								<small class="d-block d-lg-none">카테고리</small>
								<h6 class="ms-1 mb-0 fw-normal">운영</h6>
							</div>

							<!-- Data item -->
							<div class="col">
								<small class="d-block d-lg-none">제목</small>
								<h6 class="ms-1 mb-0 fw-normal text-primary">
									<b>정산 일정 안내</b>
								</h6>
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

					</div>
					<!-- Card body END -->

					<!-- Card footer START -->
					<div class="card-footer pt-0">
						<!-- Pagination (페이지 전환 하단 바)-->
						<nav class="d-flex justify-content-center">
							<ul class="pagination pagination-sm pagination-primary-soft mb-0">
								<li class="page-item disabled">
									<!-- disabled: 버튼 비활성화--> <a class="page-link" href="#"
									tabindex="-1">&lt;</a>
								</li>
								<li class="page-item"><a class="page-link" href="#">1</a></li>
								<li class="page-item active"><a class="page-link" href="#">2</a></li>
								<li class="page-item"><a class="page-link" href="#">3</a></li>
								<li class="page-item"><a class="page-link" href="#">4</a></li>
								<li class="page-item disabled"><a class="page-link"
									href="#">..</a></li>
								<li class="page-item"><a class="page-link" href="#">11</a></li>
								<li class="page-item"><a class="page-link" href="#">12</a></li>
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