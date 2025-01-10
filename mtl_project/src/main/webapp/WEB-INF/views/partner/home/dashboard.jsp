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
								<a href="/mtl/partner/bookinglist">예약 내역 &gt;</a>
							</div>
							<span>2024.12.24(월)</span>
						</div>
						<div class="card-body">
							<div class="item d-flex justify-content-between border-bottom mt-2 mb-4">
								<h6>디럭스</h6>
								<p>2 / 3</p>
							</div>
							<div class="item d-flex justify-content-between border-bottom mt-2 mb-4">
								<h6>트윗</h6>
								<p>1 / 2</p>
							</div>
							<div class="item d-flex justify-content-between border-bottom mt-2 mb-4">
								<h6>스탠다드</h6>
								<p>0 / 3</p>
							</div>
						</div>
					</div>
				</div>

				<!-- 오늘 매출 Card START -->
				<div class="col-md-4">
					<div class="card shadow border-2">
						<div class="card-header bg-light">
							<div class="d-flex justify-content-between align-items-center">
								<h5 class="mb-0">오늘 매출</h5>
								<a href="/mtl/partner/payoutlist">정산 내역 &gt;</a>
							</div>
						</div>
						<div class="card-body">
							<div class="d-flex justify-content-between align-items-center">
								<h6>판매가</h6>
								<p>1,230,000원</p>
							</div>
							<div class="d-flex justify-content-between align-items-center">
								<h6>입금가</h6>
								<p>1,130,000원</p>
							</div>
						</div>
					</div>
					<!-- 최근 7일 후기 Card START -->
					<div class="card shadow border-2 mt-4">
						<div class="card-header bg-light">
							<div class="d-flex justify-content-between align-items-center">
								<h5 class="mb-0">최근 7일 후기</h5>
								<a href="/mtl/partner/reviews">고객 후기 &gt;</a>
							</div>
						</div>
						<div class="card-body">
							<div class="d-flex justify-content-between align-items-center">
								<h6>평점</h6>
								<p class="text-warning">★★★★☆</p>
								<p>
									<strong>(4.0 / 5)</strong>
								</p>
							</div>
							<div class="d-flex justify-content-between align-items-center">
								<h6>후기</h6>
								<p>전체 19 / 미답변 2</p>
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
								<a href="/mtl/partner/notion">전체 보기 &gt;</a>
							</div>
						</div>
						<div class="card-body">
							<div class="item d-flex justify-content-between border-bottom mt-2 mb-4">
								<h6>시스템 점검 안내</h6>
								<p>2024.12.24(월)</p>
							</div>
							<div class="item d-flex justify-content-between border-bottom mt-2 mb-4">
								<h6>시스템 점검 안내</h6>
								<p>2024.12.24(월)</p>
							</div>
							<div class="item d-flex justify-content-between border-bottom mt-2 mb-4">
								<h6>시스템 점검 안내</h6>
								<p>2024.12.24(월)</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</main>
<!-- footerScript -->
<%@ include file="/WEB-INF/views/include/footerScript.jsp"%>

</body>

</html>