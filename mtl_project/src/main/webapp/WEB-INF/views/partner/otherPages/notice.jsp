<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>[판매자] 공지사항</title>

<!-- headerScript -->
<%@ include file="/WEB-INF/views/include/headerScript.jsp"%>
</head>

<body>

	<!-- **************** MAIN CONTENT START **************** -->
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
						<h1 class="h3 mb-2">파트너센터 공지사항</h1>
						<span>파트너센터의 공지사항과 소식을 확인할 수 있습니다. </span>
					</div>
				</div>
				<!-- 문의 상세 모달 -->
				<div id="getNoticeDetailByIdx" class="modal fade" tabindex="-1" role="dialog" >
				    <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
				        <div class="modal-content">
				            <div class="modal-header">
				                <h5 class="modal-title">공지사항 상세</h5>
				                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				            </div>
				            <div class="modal-body">
				                <h6 class="fw-bold">제목</h6>    
				                <p id="modalTitle" class="space" >
				
				                <h6 class="fw-bold ">내용</h6>
				                <p id="modalContent" class="space" ></p>
	
				                
				            </div>
				            <div class="modal-footer">
				                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
				             
				            </div>
				        </div>
				    </div>
				</div>


				<!-- 문의 내역 List 상단 Tab -->
				<div class="row g-4 justify-content-between align-items-center mb-2">
					
				</div>
				<!-- 문의 내역 List START -->
				<div class="card shadow border">
					<!-- Card body START -->
					<div class="card-body">
						<!-- Table head -->
						<div class="bg-light rounded p-3 d-none d-lg-block">
							<div class="row g-4">
								<div class="col">
									<h6 class="mb-0 text-center" >제목</h6>
								</div>
								<div class="col">
									<h6 class="mb-0 text-center" >등록일</h6>
								</div>
							</div>
						</div>

						<!-- 사용자 공지사항 리스트 -->
						<div class="table-responsive border-0">
							<table class="table align-middle p-4 mb-0 table-hover table-shrink">
								<tbody class="border-top-0" id="noticeList"> 
									
								</tbody>
							</table>
						</div>
					</div>
					<!-- Card body END -->

					<!-- Card footer START -->
					<div class="card-footer pt-0">
						<!-- Pagination (페이지 전환 하단 바)-->
						<nav class="d-flex justify-content-center">
							<!-- Pagination -->
							<nav class="mb-sm-0 d-flex justify-content-center" aria-label="navigation">
								<ul class="pagination pagination-sm pagination-primary-soft d-inline-block d-md-flex rounded mb-0" id="pagination">
								</ul>
							</nav>						
						</nav>

					</div>
					<!-- Card footer END -->
				</div>
				<!-- 문의 내역 List END -->
			</div>
			<!-- Page main content END -->
		</div>
		<!-- Page content END -->
	</main>
	<!-- **************** MAIN CONTENT END **************** -->
	<!-- footerScript -->
	<%@ include file="/WEB-INF/views/include/footerScript.jsp"%>
	
	<!-- page script -->
	<script src="js/partner/service/notice.js"></script>
	<script type="text/javascript">
		userNotice.init();
	</script>
</body>
</html>