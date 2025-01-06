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
						<h1 class="h3 mb-2">판매자 상세 조회</h1>
						<span>ㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎ.</span>
					</div>
				</div>


				<!-- 판매자 정보 Card START -->
				<div class="card shadow-lg border mb-4">
					<div class="card-header border-bottom">
						<h5 class="card-header-title">판매자 정보</h5>
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
								<label class="form-label">사업자 등록번호</label> <input type="text"
									class="form-control" value="532.86.2256" disabled>
							</div>
						</div>
						<!-- 왼쪽 카드 END -->

						<!-- 오른쪽 카드 START -->
						<div class="card-body col-6">
							<div class="mb-3">
								<label class="form-label">숙소명명</label> <input type="text"
									class="form-control" value="히든베이" placeholder="Name">
							</div>
							<div class="mb-3">
								<label class="form-label">연락처</label> <input type="text"
									class="form-control" value="010-1234-5678"
									placeholder="Enter your mobile number">
							</div>
							<div class="mb-3"></div>
						</div>
						<!-- 오른쪽 카드 END -->
					</div>
				</div>
				<!-- 판매자 정보 Card END -->

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
						</div>
						<!-- 왼쪽 카드 END -->

						<!-- 오른쪽 카드 START -->
						<div class="card-body col-6">
							<div class="mb-3">
								<label class="form-label">상태</label> <input type="text"
									class="form-control" value="승인" disabled>
							</div>
							<div class="mb-3">
								<label class="form-label">최종 로그인 IP</label> <input type="text"
									class="form-control" value="22.168.0.7" disabled>
							</div>
						</div>
						<!-- 오른쪽 카드 END -->
					</div>
				</div>
				<!-- 활동 정보 Card END -->

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