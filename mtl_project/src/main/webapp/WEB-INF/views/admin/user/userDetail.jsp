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
		<%@ include file="/WEB-INF/views/include/adminTopbar.jsp" %>

		<!-- Page main content START -->
		<div class="page-content-wrapper p-xxl-4">

			<!-- Title -->
			<div class="row">
				<div class="col-12 mb-4">
					<h1 class="h3 mb-2">사용자 상세 조회</h1>
					<span>회원의 상세 정보를 확인할 수 있습니다.</span>
				</div>
			</div>

			<div class="justify-content-start mb-3">
				<a href="javascript:window.history.back();" class="h6 text-reset">
					<i class="fa-solid fa-circle-chevron-left"></i> 뒤로가기
				</a>
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
							<label class="form-label">이메일</label> 
							<input type="text" class="form-control" id="email" readonly>
						</div>
						<div class="mb-3">
							<label class="form-label">생년월일</label>
							<input type="text" class="form-control" id="birth" readonly>
						</div>
						<div class="mb-3">
							<label class="form-label">가입일</label>
							<input type="text" class="form-control" id="create_date" readonly>
						</div>
					</div>
					<!-- 왼쪽 카드 END -->

					<!-- 오른쪽 카드 START -->
					<div class="card-body col-6">
						<div class="mb-3">
							<label class="form-label">이름</label>
							<input type="text" class="form-control" id="name" readonly>
						</div>
						<div class="mb-3">
							<label class="form-label">연락처</label>
							<input type="text" class="form-control" id="phone" readonly>
						</div>
						<div class="mb-3">
							<label class="form-label">상태</label>
							<input type="text" class="form-control" id="user_status" readonly>
						</div>
					</div>
					<!-- 오른쪽 카드 END -->
				</div>
			</div>
			<!-- 회원 정보 Card END -->

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
						<div class="row row-cols-8 justify-content-between g-4">
							<div class="col">
								<h6 class="mb-0"></h6>
							</div>
							<div class="col">
								<h6 class="mb-0">숙소명</h6>
							</div>
							<div class="col">
								<h6 class="mb-0">객실</h6>
							</div>
							<div class="col">
								<h6 class="mb-0">체크인</h6>
							</div>
							<div class="col">
								<h6 class="mb-0">체크아웃</h6>
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

					<div id="reservationList">
					</div>
					
					<!-- Pagination (페이지 전환 하단 바)-->
					<nav class="d-flex justify-content-center pt-4">
						<ul class="pagination pagination-sm pagination-primary-soft mb-0" id="pagination">
						</ul>
					</nav>
				</div>
			</div>
		</div>
		<!-- Page main content END -->
	</div>
	<!-- Page content END -->
</main>
<!-- footerScript -->
<%@ include file="/WEB-INF/views/include/footerScript.jsp"%>

<!-- page script -->
<script src="/mtl/js/admin/user/userDetail.js"></script>
<script type="text/javascript">
	userDetail.init();
</script>

</body>
</html>