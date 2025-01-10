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

				<!-- 예약 내역 -->
				<div class="vstack gap-4">
					<div class="card border">
						<!-- Card header -->
						<div class="card-header border-bottom">
							<h4 class="card-header-title">내가 쓴 후기</h4>
						</div>
						
						<!-- Review item -->
						<div class="card-body" id="reviewList">
						</div>
						
						<!-- 페이지네이션 -->
						<div class="card-footer pt-0">
							<div class="d-sm-flex justify-content-sm-center align-items-sm-center">
								<nav class="mb-sm-0 d-flex justify-content-center" aria-label="navigation">
									<ul class="pagination pagination-sm pagination-primary-soft d-inline-block d-md-flex rounded mb-0" id="pagination">
									</ul>
								</nav>
							</div>
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
<script src="js/user/mypage/review.js"></script>
<script type="text/javascript">
	review.init();
</script>
</body>
</html>