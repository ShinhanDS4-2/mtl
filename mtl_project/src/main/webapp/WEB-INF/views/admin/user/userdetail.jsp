<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>[관리자] 회원관리 > 사용자 상세</title>

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
	<%@ include file="/WEB-INF/views/include/adminTopbar.jsp" %>
	

			<!-- Page main content START -->
			<div class="page-content-wrapper p-xxl-4">

				<!-- Title -->
				<div class="row">
					<div class="col-12 mb-4 mb-sm-5">
						<h1 class="h3 mb-2">사용자 상세 조회</h1>
						<span>ㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎ.</span>
					</div>
				</div>


				<!-- 회원 정보 Card START -->
				<div class="card shadow-lg border mb-4">
					<div class="card-header border-bottom">
						<h5 class="card-header-title">회원 정보</h5>
					</div>
					<!-- Flex container START -->
					<div class="d-flex mb-4">
						<!-- 왼쪽 카드 START -->
						<div class="card-body col-6">
							<div class="mb-3">
								<label class="form-label">아이디</label> <input type="text"
									class="form-control" value="admin" disabled>
							</div>
							<div class="mb-3">
								<label class="form-label">이메일</label> <input type="text"
									class="form-control" value="222 555 666"
									placeholder="Enter your mobile number">
							</div>
							<div class="mb-3">
								<label class="form-label">생년월일</label> <input type="text"
									class="form-control" value="1990.01.01"
									placeholder="Enter your mobile number">
							</div>
						</div>
						<!-- 왼쪽 카드 END -->

						<!-- 오른쪽 카드 START -->
						<div class="card-body col-6">
							<div class="mb-3">
								<label class="form-label">이름</label> <input type="text"
									class="form-control" value="가나다" placeholder="Name">
							</div>
							<div class="mb-3">
								<label class="form-label">연락처</label> <input type="text"
									class="form-control" value="010-1234-5678"
									placeholder="Enter your mobile number">
							</div>
							<div class="mb-3">
								<label class="form-label">구분</label> <input type="text"
									class="form-control" value="일반 or 관리자"
									placeholder="Enter your mobile number">
							</div>
						</div>
						<!-- 오른쪽 카드 END -->
					</div>
				</div>
				<!-- 회원 정보 Card END -->

				<!-- 활동 정보 Card START -->
				<div class="card shadow-lg border mb-4">
					<div class="card-header border-bottom">
						<h5 class="card-header-title">활동 정보</h5>
					</div>
					<!-- Flex container START -->
					<div class="d-flex mb-4">
						<!-- 왼쪽 카드 START -->
						<div class="card-body col-6">
							<div class="mb-3">
								<label class="form-label">가입일</label> <input type="text"
									class="form-control" value="2024.12.01" disabled>
							</div>
							<div class="mb-3">
								<label class="form-label">최종 로그인 일시</label> <input type="text"
									class="form-control" value="2024.12.15 00:00:00" disabled>
							</div>
							<div class="mb-3">
								<label class="form-label">예약</label> <input type="text"
									class="form-control" value="1990.01.01"
									placeholder="Enter your mobile number">
							</div>
						</div>
						<!-- 왼쪽 카드 END -->

						<!-- 오른쪽 카드 START -->
						<div class="card-body col-6">
							<div class="mb-3">
								<label class="form-label">상태</label> <input type="text"
									class="form-control" value="정상 활동" placeholder="Name">
							</div>
							<div class="mb-3">
								<label class="form-label">최종 로그인 IP</label> <input type="text"
									class="form-control" value="22.168.0.7" disabled>
							</div>
							<div class="mb-3">
								<label class="form-label">후기</label> <input type="text"
									class="form-control" value="흠.."
									placeholder="Enter your mobile number">
							</div>
						</div>
						<!-- 오른쪽 카드 END -->
					</div>
				</div>
				<!-- 활동 정보 Card END -->

				<!-- 과거 예약 정보 Card START -->
				<div class="card shadow border">
					<!-- Card header -->
					<div class="card-header border-bottom">
						<h5 class="card-header-title">과거 예약 내역</h5>
					</div>

					<!-- Card body -->
					<div class="card-body">
						<!-- Table head -->
						<div class="bg-light rounded p-3 d-none d-lg-block">
							<div class="row row-cols-6 justify-content-between g-4">
								<div class="col">
									<h6 class="mb-0">업장명</h6>
								</div>
								<div class="col">
									<h6 class="mb-0">객실 타입</h6>
								</div>
								<div class="col">
									<h6 class="mb-0">체크인/체크아웃</h6>
								</div>
								<div class="col">
									<h6 class="mb-0">예약일</h6>
								</div>
								<div class="col">
									<h6 class="mb-0">금액</h6>
								</div>
								<div class="col">
									<h6 class="mb-0">상태</h6>
								</div>
							</div>
						</div>

						<!-- Table data -->
						<div
							class="row row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-lg-6 g-2 g-sm-4 align-items-md-center justify-content-between border-bottom px-2 py-4">
							<!-- Data item -->
							<div class="col">
								<small class="d-block d-lg-none">업장명</small>
								<div class="d-flex align-items-center">
									<!-- Image -->
									<div class="w-80px flex-shrink-0">
										<img src="assets/images/category/hotel/4by3/01.jpg"
											class="rounded" alt="">
									</div>
									<!-- Title -->
									<h6 class="mb-0 ms-2">오션뷰 디럭스</h6>
								</div>
							</div>
							<!-- Data item -->
							<div class="col">
								<small class="d-block d-lg-none">객실 타입</small>
								<h6 class="mb-0 fw-normal">스탠다드 디럭스</h6>
							</div>
							<!-- Data item -->
							<div class="col">
								<small class="d-block d-lg-none">체크인/체크아웃</small>
								<h6 class="mb-0 fw-normal">2024-12-12</h6>
							</div>
							<!-- Data item -->
							<div class="col">
								<small class="d-block d-lg-none">예약일</small>
								<h6 class="mb-0 fw-normal">2024-12-12</h6>
							</div>
							<!-- Data item -->
							<div class="col">
								<small class="d-block d-lg-none">금액</small>
								<h6 class="mb-0 fw-bold">95,000원</h6>
							</div>
							<!-- Data item -->
							<div class="col">
								<small class="d-block d-sm-none">상태</small>
								<div class="badge bg-success bg-opacity-10 text-success">이용완료</div>
							</div>
						</div>

						<!-- Table data -->
						<div
							class="row row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-lg-6 g-2 g-sm-4 align-items-md-center justify-content-between border-bottom px-2 py-4">
							<!-- Data item -->
							<div class="col">
								<small class="d-block d-lg-none">업장명</small>
								<div class="d-flex align-items-center">
									<!-- Image -->
									<div class="w-80px flex-shrink-0">
										<img src="assets/images/category/hotel/4by3/01.jpg"
											class="rounded" alt="">
									</div>
									<!-- Title -->
									<h6 class="mb-0 ms-2">오션뷰 디럭스</h6>
								</div>
							</div>
							<!-- Data item -->
							<div class="col">
								<small class="d-block d-lg-none">객실 타입</small>
								<h6 class="mb-0 fw-normal">스탠다드 디럭스</h6>
							</div>
							<!-- Data item -->
							<div class="col">
								<small class="d-block d-lg-none">체크인/체크아웃</small>
								<h6 class="mb-0 fw-normal">2024-12-12</h6>
							</div>
							<!-- Data item -->
							<div class="col">
								<small class="d-block d-lg-none">예약일</small>
								<h6 class="mb-0 fw-normal">2024-12-12</h6>
							</div>
							<!-- Data item -->
							<div class="col">
								<small class="d-block d-lg-none">금액</small>
								<h6 class="mb-0 fw-bold">95,000원</h6>
							</div>
							<!-- Data item -->
							<div class="col">
								<small class="d-block d-sm-none">상태</small>
								<div class="badge bg-danger bg-opacity-10 text-danger">환불완료</div>
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
	<%@ include file="/WEB-INF/views/include/footerScript.jsp"%>

</body>
</html>