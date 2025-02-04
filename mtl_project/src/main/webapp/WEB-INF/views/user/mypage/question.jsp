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

				<!-- 문의 내역 -->
				<div class="card border bg-transparent">
					<!-- Card header -->
					<div class="card-header bg-transparent border-bottom">
						<h4 class="card-header-title">1:1 문의</h4>
					</div>

					<div class="card-body p-0">
						<!-- 탭 메뉴 -->
						<ul class="nav nav-tabs nav-bottom-line nav-responsive nav-justified">
							<li class="nav-item"> 
								<a class="nav-link mb-0 active" data-bs-toggle="tab" href="#tab-1"><i class="bi bi-briefcase-fill fa-fw me-1"></i>사이트 문의</a> 
							</li>
							<li class="nav-item">
								<a class="nav-link mb-0" data-bs-toggle="tab" href="#tab-2" id="tab2Area"><i class="fa-solid fa-hotel fa-fw me-1"></i>숙소 문의</a> 
							</li>
						</ul>

						<div class="tab-content p-2 p-sm-4" id="nav-tabContent">
							<!-- 사이트 1:1 문의 -->
							<div class="tab-pane fade show active" id="tab-1">
								<div class="text-align-last">
									<h6 class="d-inline-block">사이트 문의</h6>
									<button type="button" class="btn btn-sm btn-primary d-inline-block me-1" data-bs-toggle="modal" data-bs-target="#qnaModal">문의하기</button>
								</div>
								
								<!-- 테이블 -->
								<div class="table-responsive border-0">
																	
								<table class="table align-middle p-4 mb-0 table-hover table-shrink">
								    <thead class="table-light">
								        <tr>
								            <th scope="col" class="border-0">제목</th>
								            <th scope="col" class="border-0">문의일</th>
								            <th scope="col" class="border-0">답변상태</th>
								            <th scope="col" class="border-0 rounded-end"></th>
								        </tr>
								    </thead>
								    <tbody id="questionList1" class="border-top-0">
								        <!-- JavaScript에서 데이터를 렌더링 -->
								    </tbody>
								</table>

									
								</div>
							</div>

							<!-- 숙소 별 1:1 문의 -->
							<div class="tab-pane fade" id="tab-2">
								<h6>숙소 문의</h6>

								<!-- 테이블 -->
									<!-- 테이블 -->
								<div class="table-responsive border-0">								
									<table class="table align-middle p-4 mb-0 table-hover table-shrink">
								    	<thead class="table-light">
									        <tr>
									            <th scope="col" class="border-0">제목</th>
									            <th scope="col" class="border-0">문의일</th>
									            <th scope="col" class="border-0">답변상태</th>
									            <th scope="col" class="border-0 rounded-end"></th>
									        </tr>
								    	</thead>
								    <tbody id="questionList" class="border-top-0">
								   </tbody></table>
							</div>
						</div>
					</div>
					<!-- Card body END -->
					
					<!-- 페이지네이션 -->
					<div class="card-footer pt-0">
						<!-- Pagination (페이지 전환 하단 바)-->
						<nav class="d-flex justify-content-center">
							<ul class="pagination pagination-sm pagination-primary-soft mb-0" id="pagination">
							</ul>
						</nav>
					</div>
				</div>
			</div>
			<!-- Main content END -->
		</div>
	</div>
</section>
</main>

<!-- 문의하기 Modal -->
<div class="modal fade" id="qnaModal" tabindex="-1" aria-labelledby="qnaLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg">
        <div class="modal-content p-0">
            <div class="modal-header p-3">
                <h5 class="modal-title mb-0" id="qnaLabel">1:1 문의</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>

            <div class="modal-body p-0">
                <div class="card bg-transparent p-3">
                    <div class="card-body pt-2">
                        <div class="d-flex mt-1 form-floating">
                            <input type="text" class="form-control" id="qnaTitle" placeholder="제목을 작성해 주세요.">
                            <label for ="qnaTitle">제목</label>
                        </div>
                        <div class="d-flex mt-1">
                            <textarea class="form-control mb-0" placeholder="질문을 작성해 주세요." rows="5" spellcheck="false" id="qnaContent"></textarea>
                        </div>
                        <div class="d-grid gap-2 mt-3">
                            <button class="btn btn-sm btn-primary-soft px-4 mb-0 flex-shrink-0" id="registQuestionBtn"><i class="fas fa-paper-plane fs-5"></i> 등록</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<!-- 문의 상세 모달 -->
<div class="modal fade" id="qnaDetailModal" tabindex="-1" aria-labelledby="qnaDetailLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered modal-lg">
		<div class="modal-content p-0">

			<!-- Title -->
			<div class="modal-header p-3">
				<h5 class="modal-title mb-0" id="qnaDetailLabel">1:1 문의</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>

			<!-- Modal body -->
			<div class="modal-body p-0">
				<div class="card bg-transparent p-3">
					<div class="card-body pt-2">
						<div class="row g-3 g-lg-4">
							<!-- 질문 -->
							<div class="d-flex justify-content-between">
								<h6 id="questionTitle"></h6> <!-- 제목 -->
								<span class="small" id="create_date"></span> <!-- 작성 날짜 -->
							</div>
							<p class="space" id="questionContent"></p> <!-- 문의 내용 -->
							<hr class="mt-3 mb-3">
							<!-- 답변 -->
							<div class="d-flex justify-content-between">
								<h6>답변</h6>
								<span class="small" id="answer_date"></span> <!-- 답변 날짜 -->
							</div>
							<p class="space" id="answerContent"></p> <!-- 답변 내용 -->
						</div>
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
<script src="js/user/mypage/question.js"></script>
<script type="text/javascript">
	question.init();
</script>
</body>
</html>