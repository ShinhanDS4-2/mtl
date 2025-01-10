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
				
					<!-- Title -->
					<div class="row">
						<div class="col-12 mb-4 mb-sm-5">
							<h1 class="h3 mb-2">공지사항</h1>
							<span>파트너센터의 공지사항과 소식을 확인할 수 있습니다. </span>
						</div>
					</div>
					
				<!-- 공지사항 -->
				<div class="vstack gap-4">
					<div class="row">
						<div class="col-12">
							<div class="card border">
								<!-- Card header -->
								<div class="card-header border-bottom">
									<!-- <h4 class="card-header-title">공지사항</h4> -->
								</div>
								<!-- Card body START -->
								<div class="card-body">
									<!-- 사용자 공지사항 리스트 -->
									<div class="table-responsive border-0">
										<table class="table align-middle p-4 mb-0 table-hover table-shrink">
											<tbody class="border-top-0" id="noticeList"> 
												<tr>	
													<small class="d-block d-lg-none">제목</small>
													<td> <h6 class="mb-0"><a href="#" data-bs-toggle="modal" data-bs-target="#noticeModal"></a></h6> </td>
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


<!-- 공지사항 상세 모달창 START -->
				<div id="noticeDetailModal" class="modal fade" tabindex="-1" role="dialog" data-bs-backdrop="static">
				    <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
				        <div class="modal-content">
				            <div class="modal-header">
				                <h5 class="modal-title">공지사항 상세</h5>
				                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				            </div>
				            <div class="modal-body">
				                <h6 class="fw-bold">제목</h6>
				                <p id="detailTitle" class="mb-3"></p>
				
				                <h6 class="fw-bold">내용</h6>
				                <p id="detailContent" class="mb-3"></p>
				
				                <h6 class="fw-bold">상태</h6>
				                <p id="detailStatus" class="mb-3"></p>
				            </div>
				            <div class="modal-footer">
				                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
				            </div>
				        </div>
				    </div>
				</div>
				<!-- 공지사항 상세 모달창 END -->
				<!-- 문의 내용 모달 -->

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