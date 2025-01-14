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
		<!-- Page main content START -->
		<div class="page-content-wrapper p-xxl-4">

			<!-- Title -->
			<div class="row">
				<div class="col-12 mb-4 mb-sm-5">
					<h1 class="h3 mb-2">문의 상세 조회</h1>
					<span>고객의 1:1 문의에 답변해주세요. </span>
				</div>
			</div>

			<!-- 문의 내역 상세조회 START -->
			<div class="card shadow border rounded-3">
				<div class="row">
					<div class="col-12">
						<!-- Card header START -->
						<div class="card-header border-bottom">
							<h5 class="card-header-title">문의 상세 조회</h5>
						</div>
						<!-- Card header END -->

						<!-- Card body START -->
						<div class="card-body">
							<div class="bg-light rounded p-4 mb-4">
								<!-- 문의 내용 -->
								<p class="text-body space" id="questionContent">
								</p>
							</div>
							<hr>
							<!-- 줄긋기 -->

							<!-- 답변달기 START -->
							<div class="bg-light rounded p-4 mt-4 d-none" id="answerFeild">
								<div class="d-flex mt-3">
									<textarea class="form-control mb-3" placeholder="답변을 작성해주세요." rows="11" spellcheck="false" id="answerArea"></textarea>
								</div>
								<div class="d-flex justify-content-end">
									<button class="btn btn-primary-soft px-4 mb-0" data-src="questionReply" data-act="clickAnswer">등록</button>
								</div>
							</div>
							<div class="bg-light rounded p-4 mt-4 d-none" id="replyFeild">
								<p class="space" id="answerContent"></p>
							</div>
						</div>
						<!-- Card body END -->
					</div>
				</div>
			</div>
			<!-- 문의 내역 상세조회 END -->
		</div>
		<!-- Page main content END -->
	</div>
	<!-- Page content END -->
</main>
<!-- footerScript -->
<%@ include file="/WEB-INF/views/include/footerScript.jsp"%>
<script src="js/partner/customer/questionReply.js"></script>
<script type="text/javascript">
	questionReply.init();
</script>
</body>
</html>