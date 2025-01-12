<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>떠날지도 - 파트너 센터</title>
<!-- headerScript -->
<%@ include file="/WEB-INF/views/include/headerScript.jsp"%>
</head>
<body>
<main>
	<!-- Sidebar -->
	<%@ include file="/WEB-INF/views/include/partnerSidebar.jsp"%>
	<!-- Page content START -->
	<div class="page-content">
		<!-- Topbar -->
		<%@ include file="/WEB-INF/views/include/partnerTopbar.jsp"%>

		<div class="page-content-wrapper p-xxl-4">
			<!-- Title -->
			<div class="row">
				<div class="col-12 mb-4 mb-sm-5">
					<div class="d-sm-flex justify-content-between align-items-center">
						<h1 class="h3 mb-2 mb-sm-0">대시보드</h1>

					</div>
				</div>
			</div>
			
			<!-- Page main content START -->
			<div class="row g-4">
				<!-- 오늘 예약 Card START -->
				<div class="col-md-4">
					<div class="card shadow border-2 h-400px">
						<div class="card-header bg-light">
							<div class="d-flex justify-content-between align-items-center">
								<h5 class="mb-0">오늘 예약</h5>
								<a href="/mtl/partner/reservation/list">전체보기 &gt;</a>
							</div>
							<span id="today"></span>
						</div>
						<div class="card-body" id="roomList">
						</div>
					</div>
				</div>

				<!-- 오늘 매출 Card START -->
				<div class="col-md-4">
					<div class="card shadow border-2">
						<div class="card-header bg-light">
							<div class="d-flex justify-content-between align-items-center">
								<h5 class="mb-0">매출</h5>
								<a href="/mtl/partner/payout/list">전체보기 &gt;</a>
							</div>
						</div>
						<div class="card-body">
							<div class="d-flex justify-content-between align-items-center">
								<h6>오늘 매출</h6>
								<p id="today_pay"></p>
							</div>
							<div class="d-flex justify-content-between align-items-center">
								<h6>한달 매출</h6>
								<p id="month_pay"></p>
							</div>
						</div>
					</div>
					<!-- 최근 7일 후기 Card START -->
					<div class="card shadow border-2 mt-4">
						<div class="card-header bg-light">
							<div class="d-flex justify-content-between align-items-center">
								<h5 class="mb-0">최근 7일 후기</h5>
								<a href="/mtl/partner/review">전체보기 &gt;</a>
							</div>
						</div>
						<div class="card-body">
							<div class="d-flex justify-content-between align-items-center">
								<h6>평점</h6>
								<p>
									<span class="text-warning me-1" id="star"></span>
									<strong>(<span id="score"></span> / 5)</strong>
								</p>
							</div>
							<div class="d-flex justify-content-between align-items-center">
								<h6>후기</h6>
								<p>전체 <span id="review"></span> / 미답변 <span id="noReply"></span></p>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<!-- 공지사항 Card START -->
					<div class="card shadow border-2 h-400px">
						<div class="card-header bg-light">
							<div class="d-flex justify-content-between align-items-center">
								<h5 class="mb-0">공지사항</h5>
								<a href="/mtl/partner/notice">전체 보기 &gt;</a>
							</div>
						</div>
						<div class="card-body" id="noticeList">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</main>
<!-- footerScript -->
<%@ include file="/WEB-INF/views/include/footerScript.jsp"%>
<script src="js/partner/home/dashboard.js"></script>
<script type="text/javascript">
	dashboard.init();
</script>
</body>

</html>