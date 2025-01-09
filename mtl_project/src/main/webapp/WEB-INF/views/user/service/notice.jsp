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

				<!-- 공지사항 -->
				<div class="vstack gap-4">
					<div class="row">
						<div class="col-12">
							<div class="card border">
								<!-- Card header -->
								<div class="card-header border-bottom">
									<h4 class="card-header-title">공지사항</h4>
								</div>
								<!-- Card body START -->
								<div class="card-body">
									<!-- Hotel room list START -->
									<div class="table-responsive border-0">
										<table class="table align-middle p-4 mb-0 table-hover table-shrink">
											<tbody class="border-top-0" id="noticeList"> 
												<tr>
													<td> <h6 class="mb-0"><a href="#" data-bs-toggle="modal" data-bs-target="#noticeModal">이용약관 변경 안내</a></h6> </td>
													<td class="text-end"> <small class="mb-0 fw-light text-secondary">2024-12-01</small> </td>
												</tr>
											</tbody>
										</table>
									</div>
									<!-- Hotel room list END -->
								</div>
								<!-- Card body END -->
			
								<!-- Card footer START -->
								<div class="card-footer pt-0">
									<!-- Pagination and content -->
									<div class="d-sm-flex justify-content-sm-center align-items-sm-center">
										<!-- Pagination -->
										<nav class="mb-sm-0 d-flex justify-content-center" aria-label="navigation">
											<ul class="pagination pagination-sm pagination-primary-soft d-inline-block d-md-flex rounded mb-0" id="pagination">
											</ul>
										</nav>
									</div>
								</div>
								<!-- Card footer END -->
							</div>
						</div>
					 </div> 
					<!-- Booking table END -->
				</div>
			</div>
			<!-- Main content END -->
		</div>
	</div>
</section>
</main>

<!-- 공지 상세 모달 -->
<div class="modal fade" id="noticeModal" tabindex="-1" aria-labelledby="noticeDetailLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered modal-lg">
		<div class="modal-content p-0">

			<!-- Title -->
			<div class="modal-header p-3">
				<h5 class="modal-title mb-0" id="noticeDetailLabel">공지사항</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>

			<!-- Modal body -->
			<div class="modal-body p-0">
				<div class="card bg-transparent p-3">
					<div class="card-header bg-transparent pb-0">
						<h3 class="card-title mb-0">서비스 이용 안내</h3>
					</div>
					<div class="card-body">
						<p class="space">
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- footer -->
<%@ include file="/WEB-INF/views/include/footer.jsp" %>

<!-- footerScript -->
<%@ include file="/WEB-INF/views/include/footerScript.jsp" %>

<!-- page script -->
<script src="js/user/service/notice.js"></script>
<script type="text/javascript">
	userNotice.init();
</script>
</body>
</html>