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
				<div class="col-12 mb-4 mb-sm-5">
					<h1 class="h3 mb-2">판매자 상세 조회</h1>
					<span>판매자의 상세 정보를 확인하고 승인할 수 있습니다.</span>
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
							<label class="form-label">이메일</label>
							<input type="text" class="form-control" id="email" readonly>
						</div>
						<div class="mb-3">
							<label class="form-label">사업자 등록번호</label>
							<input type="text" class="form-control" id="business_number" readonly>
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
							<label class="form-label">숙소명</label>
							<input type="text" class="form-control" id="name" readonly>
						</div>
						<div class="mb-3">
							<label class="form-label">연락처</label>
							<input type="text" class="form-control" id="business_phone" readonly>
						</div>
						<div class="mb-3">
							<label class="form-label">상태</label>
							<input type="text" class="form-control" id="approval_status" readonly>
						</div>
					</div>
					<!-- 오른쪽 카드 END -->
				</div>
				<!-- 승인 버튼 -->
				<div class="d-flex mb-4 justify-content-center">
					<button type="button" class="btn btn-primary w-25 d-none" id="approveButton" data-src="partnerDetail" data-act="clickApproval">승인</button>
				</div>
			</div>
			<!-- 판매자 정보 Card END -->
		</div>
	</div>
</main>

<!-- footerScript -->
<%@ include file="/WEB-INF/views/include/footerScript.jsp"%>

<!-- page script -->
<script src="/mtl/js/admin/partnerDetail.js"></script>
<script type="text/javascript">
	partnerDetail.init();
</script>


</body>
</html>