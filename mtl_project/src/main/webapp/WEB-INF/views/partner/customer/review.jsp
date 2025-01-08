<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>떠날지도 - 파트너센터</title>
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
		<!-- 페이지 메인 content START -->
		<div class="page-content-wrapper p-xxl-4">

			<!-- Title -->
			<div class="row">
				<div class="col-12 mb-4">
					<h1 class="h3 mb-2">후기 관리</h1>
					<span>예약 고객의 후기를 확인하고, 답변을 달아주세요.</span>
				</div>
			</div>
			
			<!-- 검색 필터 설정 START -->
			<div class="card shadow mb-4">
				<!-- Card header -->
				<div class="card-header border-bottom">
					<h5 class="card-header-title">검색</h5>
				</div>

				<!-- Card body START -->
				<div class="card-body">
					<form id="searchForm" class="row g-4 align-items-center">	
						<div class="col-lg-12">
							<div class="d-flex justify-content-between">
								<div class="col-3 pe-1">
									<label class="h6 fw-normal mb-0 form-label">친절도</label>
									<div class="mt-2">
										<select class="form-select js-choice" id="score1">
											<option value="" selected >전체</option>
											<option value="1">1점</option>
											<option value="2">2점</option>
											<option value="3">3점</option>
											<option value="4">4점</option>
											<option value="5">5점</option>
										</select>
									</div>
								</div>
								<div class="col-3 ps-1">
									<label class="h6 fw-normal mb-0 form-label">청결도</label>
									<div class="mt-2">
										<select class="form-select js-choice" id="score2">
											<option value="" selected >전체</option>
											<option value="1">1점</option>
											<option value="2">2점</option>
											<option value="3">3점</option>
											<option value="4">4점</option>
											<option value="5">5점</option>
										</select>
									</div>
								</div>
								<div class="col-3 ps-1">
									<label class="h6 fw-normal mb-0 form-label">서비스</label>
									<div class="mt-2">
										<select class="form-select js-choice" id="score3">
											<option value="" selected>전체</option>
											<option value="1">1점</option>
											<option value="2">2점</option>
											<option value="3">3점</option>
											<option value="4">4점</option>
											<option value="5">5점</option>
										</select>
									</div>
								</div>
								<div class="col-3 ps-1">
									<label class="h6 fw-normal mb-0 form-label">위치</label>
									<div class="mt-2">
										<select class="form-select js-choice" id="score4">
											<option value="" selected>전체</option>
											<option value="1">1점</option>
											<option value="2">2점</option>
											<option value="3">3점</option>
											<option value="4">4점</option>
											<option value="5">5점</option>
										</select>
									</div>
								</div>
							</div>
						</div>
											
						<!-- Radio items -->
						<div class="col-lg-12">
							<label class="form-label">답변 상태</label>
							<div class="d-sm-flex"> 
								<!-- Radio -->
								<div class="form-check radio-bg-light me-4">  
									<input class="form-check-input" type="radio" name="replyStatus" id="replyAll" value="" checked>
									<label class="form-check-label" for="replyAll"> 전체 </label>
								</div>
								<!-- Radio -->
								<div class="form-check radio-bg-light me-4">
									<input class="form-check-input" type="radio" name="replyStatus" id="reply" value="Y">
									<label class="form-check-label" for="reply"> 답변완료 </label>
								</div>
								<!-- Radio -->
								<div class="form-check radio-bg-light me-4">
									<input class="form-check-input" type="radio" name="replyStatus" id="notReply" value="N"> 
									<label class="form-check-label" for="notReply"> 답변대기 </label>
								</div>
							</div>
						</div>

						<!-- 초기화/검색 button -->
						<div class="d-sm-flex justify-content-end border-top pt-3">
							<button type="button" class="btn btn-primary-soft mb-0 ms-2" onclick="window.location.reload()">초기화</button>
							<button type="button" id="searchButton" class="btn btn-primary mb-0 ms-2" data-src="review" data-act="clickSearch">검색</button>
						</div>
					</form>
				<!-- form END -->
				</div>
			</div>
			<!-- 검색 필터 설정 END -->

			<!-- 리뷰 내역 List 상단 Tab -->
			<div class="row g-4 justify-content-between align-items-center mb-2">
				<div class="col-2">
					<h6 class="mb-1">총 <span id="total"></span>개</h6>
				</div>
			</div>

			<!-- 리뷰 내역 Card START -->
			<div class="card shadow-lg mb-4">
				<div class="card-body">
					<div class="vstack gap-4 mt-2" id="reviewList">
					</div>
					<!-- 페이징 -->
					<div class="card-footer pt-0 mt-4">
						<nav class="d-flex justify-content-center">
							<ul class="pagination pagination-sm pagination-primary-soft mb-0" id="pagination">
							</ul>
						</nav>
					</div>
				</div>
			</div>
		</div>
	</div>
</main>
<!-- footerScript -->
<%@ include file="/WEB-INF/views/include/footerScript.jsp"%>
<script src="js/partner/customer/review.js"></script>
<script type="text/javascript">
	review.init();
</script>
</body>
</html>