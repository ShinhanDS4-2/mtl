<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<!-- headerScript -->
<%@ include file="/WEB-INF/views/include/headerScript.jsp" %>
<!-- page css -->
</head>
<body>
<!-- header -->
<%@ include file="/WEB-INF/views/include/header.jsp" %>

<!-- main -->
<main>
<section class="pt-3">
	<div class="container">
		<div class="row">
			<!-- 사이드바 -->
			<%@ include file="/WEB-INF/views/include/mypageSidebar.jsp" %>

			<!-- content -->
			<div class="col-lg-8 col-xl-9">
				<!-- Offcanvas menu button -->
				<div class="d-grid mb-0 d-lg-none w-100">
					<button class="btn btn-primary mb-4" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasSidebar" aria-controls="offcanvasSidebar">
						<i class="fas fa-sliders-h"></i> 메뉴
					</button>
				</div>

				<!-- 자주 묻는 질문 -->
				<div class="vstack gap-4">
					<div class="card border">
						<!-- Card header -->
						<div class="card-header border-bottom">
							<h4 class="card-header-title">자주 묻는 질문</h4>
						</div>
						
						<div class="card-body">
							<!-- 분류 -->
							<div class="mt-2">
								<div class="col-12 mx-auto">
									<button type="button" class="btn btn-sm btn-round-m btn-primary-soft" data-src="qna" data-act="clickType" data-type="ALL">전체</button>
									<button type="button" class="btn btn-sm btn-round-m btn-primary-soft" data-src="qna" data-act="clickType" data-type="SERVICE">서비스</button>
									<button type="button" class="btn btn-sm btn-round-m btn-primary-soft" data-src="qna" data-act="clickType" data-type="RESERVATION">예약/결제</button>
									<button type="button" class="btn btn-sm btn-round-m btn-primary-soft" data-src="qna" data-act="clickType" data-type="USE">이용문의</button>
								</div>
							</div>
						
							<!-- Accordion START -->
							<div class="row mt-3 mb-5">
								<div class="col-12 mx-auto">
									<div class="accordion accordion-icon accordion-bg-secondary" id="accordionParent">
									</div>
								</div>
							</div>
							<!-- Accordion END -->
						</div>
					</div>
				</div>
			</div>
			<!-- Main content END -->
		</div>
	</div>
</section>
</main>

<!-- footer -->
<%@ include file="/WEB-INF/views/include/footer.jsp" %>

<!-- footerScript -->
<%@ include file="/WEB-INF/views/include/footerScript.jsp" %>

<!-- page script -->
<script src="js/user/service/qna.js"></script>
<script type="text/javascript">
	qna.init();
</script>
</body>
</html>