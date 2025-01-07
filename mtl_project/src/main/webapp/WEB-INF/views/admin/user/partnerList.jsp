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
				<div class="col-12 mb-5">
					<h3>판매자 관리</h3>
					<span>판매자 정보를 확인할 수 있습니다.</span>
				</div>
			</div>

			<!-- 검색 필터 START -->
		<div class="card shadow mb-5">
			<!-- Card header -->
			<div class="card-header border-bottom">
				<h5 class="card-header-title">검색</h5>
			</div>
			<!-- Card body START -->
			<div class="card-body">
				<form class="row g-4 align-items-center">
					<!-- Radio items -->
					<div class="col-12">
						<label class="form-label">상태</label>
						<div class="d-sm-flex">
							<!-- Radio -->
							<div class="form-check radio-bg-light me-4">
								<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1" checked>
								<label class="form-check-label" for="flexRadioDefault1">전체</label>
							</div>
							<!-- Radio -->
							<div class="form-check radio-bg-light me-4">
								<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault2">
								<label class="form-check-label" for="flexRadioDefault2">승인</label>
							</div>
							<!-- Radio -->
							<div class="form-check radio-bg-light me-4">
								<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault3">
								<label class="form-check-label" for="flexRadioDefault3">미승인</label>
							</div>
						</div>
					</div>

					<!-- 검색어 드롭다운 -->
					<div class="col-2">
						<label class="h6 fw-normal mb-0">검색어</label>
						<div class="form-border-bottom form-control-transparent form-fs-lg mt-2">
							<select class="form-select js-choice" id="searchType">
								<option value="name">숙소명</option>
								<option value="email">이메일</option>
							</select>
						</div>
					</div>
					<!-- 검색어 입력 input -->
					<div class="col-6">
						<label class="form-label"></label> 
						<input type="text" class="form-control" placeholder="검색어를 입력하세요">
					</div>

					<!-- 초기화/검색 button -->
					<div class="d-sm-flex justify-content-end border-top pt-3">
						<button type="button" class="btn btn-primary-soft mb-0 ms-2">초기화</button>
						<button type="button" class="btn btn-primary mb-0 ms-2">검색</button>
					</div>
				</form>
			</div>
		</div>
		<!-- 검색 필터 설정 END -->

			<!-- 예약 내역 List 상단 Tab -->
			<div class="row g-4 justify-content-start align-items-center mb-2">
				<div class="col-md-6 col-lg-6">
					<h6 class="mb-1">전체 판매자 <span>50</span>명</h6>
				</div>
			</div>

			<!-- 사용자 List START -->
			<div class="card shadow border">
				<!-- Card body START -->
				<div class="card-body">
					<!-- Table head -->
					<div class="bg-light rounded p-3 d-none d-sm-block">
						<div class="row row-cols-6 g-4">
							<div class="col">
								<h6 class="mb-0">숙소명</h6>
							</div>
							<div class="col">
								<h6 class="mb-0">이메일</h6>
							</div>
							<div class="col">
								<h6 class="mb-0">업체 연락처</h6>
							</div>
							<div class="col">
								<h6 class="mb-0">가입일</h6>
							</div>
							<div class="col">
								<h6 class="mb-0">상태</h6>
							</div>
							<div class="col">
								<h6 class="mb-0"></h6>
							</div>
						</div>
					</div>

					<!-- Table data (1번째 예약내역 상세 데이터)-->
					<div class="row row-cols-xl-7 g-4 align-items-sm-center border-bottom px-2 py-4">
						<!-- Data item -->
						<div class="col">
							<h6 class="ms-1 mb-0 fw-normal">00호텔</h6>
						</div>
						<!-- Data item -->
						<div class="col">
							<h6 class="ms-1 mb-0 fw-normal">cion@naver.com</h6>
						</div>
						<!-- Data item -->
						<div class="col">
							<h6 class="ms-1 mb-1 fw-light">010-7737-6314</h6>
						</div>
						<!-- Data item -->
						<div class="col">
							<h6 class="ms-1 mb-1 fw-light">2024.12.09</h6>
						</div>
						<!-- Data item -->
						<div class="col">
							<div class="badge bg-success bg-opacity-10 text-success">승인</div>
						</div>
						<!-- Data item -->
						<div class="col">
							<div class="ms-1 col">
								<a href="admin/partner/detail" class="btn btn-sm btn-light mb-0">상세보기</a>
							</div>
						</div>
					</div>
					<!-- Table data (2번째 예약내역 상세 데이터)-->
					<div class="row row-cols-xl-7 g-4 align-items-sm-center border-bottom px-2 py-4">
						<!-- Data item -->
						<div class="col">
							<h6 class="ms-1 mb-0 fw-normal">히든베이호텔텔</h6>
						</div>
						<!-- Data item -->
						<div class="col">
							<h6 class="ms-1 mb-0 fw-normal">cc@naver.com</h6>
						</div>
						<!-- Data item -->
						<div class="col">
							<h6 class="ms-1 mb-1 fw-light">010-1234-5678</h6>
						</div>
						<!-- Data item -->
						<div class="col">
							<h6 class="ms-1 mb-1 fw-light">2024.12.09</h6>
						</div>
						<!-- Data item -->
						<div class="col">
							<div class="badge bg-success bg-opacity-10 text-success">승인</div>
						</div>
						<!-- Data item -->
						<div class="col">
							<div class="ms-1 col">
								<a href="admin/partner/detail" class="btn btn-sm btn-light mb-0">상세보기</a>
							</div>
						</div>
					</div>
					<!-- Table data (3번째 예약내역 상세 데이터)-->
					<div
						class="row row-cols-xl-7 g-4 align-items-sm-center border-bottom px-2 py-4">
						<!-- Data item -->
						<div class="col">
							<h6 class="ms-1 mb-0 fw-normal">히든베이호텔텔</h6>
						</div>
						<!-- Data item -->
						<div class="col">
							<h6 class="ms-1 mb-0 fw-normal">cc@naver.com</h6>
						</div>
						<!-- Data item -->
						<div class="col">
							<h6 class="ms-1 mb-1 fw-light">010-1234-5678</h6>
						</div>
						<!-- Data item -->
						<div class="col">
							<h6 class="ms-1 mb-1 fw-light">2024.12.09</h6>
						</div>
						<!-- Data item -->
						<div class="col">
							<div class="badge bg-danger bg-opacity-10 text-danger">미승인</div>
						</div>
						<!-- Data item -->
						<div class="col">
							<div class="ms-1 col">
								<a href="admin/partner/detail" class="btn btn-sm btn-light mb-0">상세보기</a>
							</div>
						</div>
					</div>
					<!-- Table data (4번째 예약내역 상세 데이터)-->
					<div
						class="row row-cols-xl-7 g-4 align-items-sm-center border-bottom px-2 py-4">
						<!-- Data item -->
						<div class="col">
							<h6 class="ms-1 mb-0 fw-normal">시그니엘 서울</h6>
						</div>
						<!-- Data item -->
						<div class="col">
							<h6 class="ms-1 mb-0 fw-normal">cion@naver.com</h6>
						</div>
						<!-- Data item -->
						<div class="col">
							<h6 class="ms-1 mb-1 fw-light">010-7737-6314</h6>
						</div>
						<!-- Data item -->
						<div class="col">
							<h6 class="ms-1 mb-1 fw-light">2024.12.09</h6>
						</div>
						<!-- Data item -->
						<div class="col">
							<div class="badge bg-success bg-opacity-10 text-success">승인</div>
						</div>
						<!-- Data item -->
						<div class="col">
							<div class="ms-1 col">
								<a href="admin/partner/detail" class="btn btn-sm btn-light mb-0">상세보기</a>
							</div>
						</div>
					</div>
					<!-- Table data (5번째 예약내역 상세 데이터)-->
					<div
						class="row row-cols-xl-7 g-4 align-items-sm-center border-bottom px-2 py-4">
						<!-- Data item -->
						<div class="col">
							<h6 class="ms-1 mb-0 fw-normal">파크하얏트</h6>
						</div>
						<!-- Data item -->
						<div class="col">
							<h6 class="ms-1 mb-0 fw-normal">cc@naver.com</h6>
						</div>
						<!-- Data item -->
						<div class="col">
							<h6 class="ms-1 mb-1 fw-light">010-1234-5678</h6>
						</div>
						<!-- Data item -->
						<div class="col">
							<h6 class="ms-1 mb-1 fw-light">2024.12.09</h6>
						</div>
						<!-- Data item -->
						<div class="col">
							<div class="badge bg-success bg-opacity-10 text-success">승인</div>
						</div>
						<!-- Data item -->
						<div class="col">
							<div class="ms-1 col">
								<a href="admin/partner/detail" class="btn btn-sm btn-light mb-0">상세보기</a>
							</div>
						</div>
					</div>
					<!-- Table data (6번째 예약내역 상세 데이터)-->
					<div
						class="row row-cols-xl-7 g-4 align-items-sm-center border-bottom px-2 py-4">
						<!-- Data item -->
						<div class="col">
							<h6 class="ms-1 mb-0 fw-normal">스카이베이</h6>
						</div>
						<!-- Data item -->
						<div class="col">
							<h6 class="ms-1 mb-0 fw-normal">cc@naver.com</h6>
						</div>
						<!-- Data item -->
						<div class="col">
							<h6 class="ms-1 mb-1 fw-light">010-1234-5678</h6>
						</div>
						<!-- Data item -->
						<div class="col">
							<h6 class="ms-1 mb-1 fw-light">2024.12.09</h6>
						</div>
						<!-- Data item -->
						<div class="col">
							<div class="badge bg-danger bg-opacity-10 text-danger">미승인</div>
						</div>
						<!-- Data item -->
						<div class="col">
							<div class="ms-1 col">
								<a href="admin/partner/detail" class="btn btn-sm btn-light mb-0">상세보기</a>
							</div>
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
			</div>
		</div>
	</div>
</main>

<!-- footerScript -->
<%@ include file="/WEB-INF/views/include/footerScript.jsp"%>
</body>

</html>