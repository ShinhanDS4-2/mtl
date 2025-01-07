<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<title>[관리자] 고객 문의 > 공지사항</title>

<!-- headerScript -->
<%@ include file="/WEB-INF/views/include/headerScript.jsp"%>
</head>

<body>

	<!-- **************** MAIN CONTENT START **************** -->
	<main>

		<!-- Sidebar -->
		<%@ include file="/WEB-INF/views/include/adminSidebar.jsp"%>


		<!-- Page content START -->
		<div class="page-content">

			<!-- Topbar -->
			<%@ include file="/WEB-INF/views/include/adminTopbar.jsp"%>


			<!-- Page main content START -->
			<div class="page-content-wrapper p-xxl-4">

				<!-- Title -->
				<div class="row">
					<div class="col-12 mb-4 mb-sm-5">
						<h1 class="h3 mb-2">공지사항</h1>
						<span>공지사항을 등록해주세요. </span>
					</div>
				</div>

				<!-- 상단 navbar START -->
				<div class="row g-4 align-items-end border-bottom">
					<!-- 새 질문 등록 버튼 클릭 시 모달창 표시 -->
					<div class="col-12 d-flex justify-content-end">
						<button type="button" class="btn btn-primary-soft" data-bs-toggle="modal" data-bs-target="#noticeRegistModal">
							<i class="bi bi-plus-lg fa-fw"></i>공지사항 등록
						</button>
					</div>
				</div>
				<!-- 상단 navbar END -->

				<!-- 공지사항 등록 모달창 START -->
				<div id="noticeRegistModal" class="modal" tabindex="-1" role="dialog">
					<div class="modal-dialog modal-xl modal-dialog-centered" role="document">
						<!-- 제일 큰 모달 -->
						<div class="modal-content">
							<!-- 모달 head -->
							<div class="modal-header">
								<h5 class="modal-title">새 공지 등록</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							</div>
							<!-- 모달 body -->
							<div class="modal-body m-3">
								<h6 class="fw-bold">제목</h6>
								<input type="text" class="form-control" id="questionTitle" placeholder="제목을 입력하세요">

								<h6 class="fw-bold mt-4">내용</h6>
								<textarea class="form-control" id="questionContent" rows="15" placeholder="내용을 입력하세요"></textarea>
							</div>
							<div class="col-2 mt-4">
									<select class="form-select js-choice" aria-label=".form-select-sm">
										<option>사용자</option>
										<option>판매자</option>
									</select>
								</div>

							<!-- 확인/취소 button -->
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">취소</button>
								<button type="button" class="btn btn-primary">확인</button>
							</div>
						</div>
					</div>
				</div>
				<!-- 공지사항 등록 모달창 END -->
				
				<!-- 공지사항 수정 모달창 START -->
				<div id="noticeEditModal" class="modal" tabindex="-1" role="dialog">
					<div class="modal-dialog modal-xl modal-dialog-centered" role="document">
						<!-- 제일 큰 모달 -->
						<div class="modal-content">
							<!-- 모달 head -->
							<div class="modal-header">
								<h5 class="modal-title">공지사항 수정</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<!-- 모달 body -->
							<div class="modal-body m-3">
								<h6 class="fw-bold">제목</h6>
								<input type="text" class="form-control" id="questionTitle"
									placeholder="제목을 입력하세요">

								<h6 class="fw-bold mt-4">내용</h6>
								<textarea class="form-control" id="questionContent" rows="15"
									placeholder="내용을 입력하세요"></textarea>

								<!-- 상태 드롭다운 -->
								<div class="col-2 mt-4">
									<select class="form-select js-choice"
										aria-label=".form-select-sm">
										<option>게시중</option>
										<option>게시중단</option>
									</select>
								</div>
							</div>

							<!-- 확인/취소 button -->
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">취소</button>
								<button type="button" class="btn btn-primary">수정하기</button>
							</div>
						</div>
					</div>
				</div>
				<!-- 공지사항 수정 모달창 END -->
				
				<!-- 검색 필터 START -->
				<div class="card shadow border mt-4 mb-5">
					<!-- Card header -->
					<div class="card-header border-bottom">
						<h5 class="card-header-title">검색</h5>
					</div>
					<!-- Card body START -->
					<div class="card-body">
						<form class="row g-4 align-items-center">
							<div class="d-flex">
								<!-- 상태 드롭다운 -->
								<div class="col-2 mt-2">
									<label class="form-label">상태</label>
									<select class="form-select js-choice" aria-label=".form-select-sm">
										<option>게시중</option>
										<option>게시중단</option>
									</select>
								</div>								
								<div class="col-2 mt-2 ms-3">
									<label class="form-label">분류</label>
									<select class="form-select js-choice" aria-label=".form-select-sm">
										<option>서비스</option>
										<option>시스템</option>
										<option>운영</option>
									</select>
								</div>								
							</div>
							<!-- 검색어 입력 input -->
							<div class="col-12">
								<div class="col-6">
									<label class="form-label">제목</label> <input type="text" class="form-control" placeholder="내용을 입력하세요">
								</div>
							</div>
							<!-- 초기화/검색 button -->
							<div class="d-sm-flex justify-content-end border-top pt-3">
								<button type="button" class="btn btn-primary-soft mb-0 ms-2">초기화</button>
								<button type="button" class="btn btn-primary mb-0 ms-2">검색</button>
							</div>
						</form>
					</div>
				</div>
				<!-- 검색 필터 설정 END -->


				<!-- 문의 내역 List 상단 Tab -->
				<div class="row g-4 justify-content-between align-items-center mb-2">
					<div class="col-2">
						<h6 class="mb-1">총 101개</h6>
					</div>
				</div>
				<!-- 문의 내역 List START -->
				<div class="card shadow border">
					<!-- Card body START -->
					<div class="card-body">
						<!-- Table head -->
						<div class="bg-light rounded p-3 d-none d-lg-block">
							<div class="row row-cols-7 g-4">
								<div class="col-2">
									<h6 class="mb-0">분류</h6>
								</div>
								<div class="col-5">
									<h6 class="mb-0">제목</h6>
								</div>
								<div class="col-2">
									<h6 class="mb-0">상태</h6>
								</div>
								<div class="col-3">
									<h6 class="mb-0">등록일</h6>
								</div>
							</div>
						</div>

						<!-- Table data -->
						<div
							class="row row-cols-xl-7 align-items-lg-center border-bottom g-4 px-2 py-4">
							<!-- Data item -->
							<div class="col-2">
								<small class="d-block d-lg-none">카테고리</small>
								<h6 class="ms-1 mb-0 fw-normal">서비스</h6>
							</div>

							<!-- 제목 누르면 <질문 수정> 모달창 표시 -->
							<div class="col-5">
								<small class="d-block d-lg-none">제목</small>
								<a role="button" class="text-primary fw-bold ms-1 mb-0" data-bs-toggle="modal" data-bs-target="#noticeEditModal">크리스마스 및 연말 요금 점검 안내</a>
							</div>

							<!-- Data item -->
							<div class="col-2">게시중</div>

							<!-- Data item -->
							<div class="col-3">
								<small class="d-block d-lg-none">등록일</small>
								<h6 class="ms-1 mb-0 fw-normal">2024.12.20(금)</h6>
							</div>
						</div>

						<!-- Table data -->
						<div
							class="row row-cols-xl-7 align-items-lg-center border-bottom g-4 px-2 py-4">
							<!-- Data item -->
							<div class="col-2">
								<small class="d-block d-lg-none">카테고리</small>
								<h6 class="ms-1 mb-0 fw-normal">서비스</h6>
							</div>

							<!-- 제목 누르면 <질문 수정> 모달창 표시 -->
							<div class="col-5">
								<small class="d-block d-lg-none">제목</small>
								<a role="button" class="text-primary fw-bold ms-1 mb-0" data-bs-toggle="modal" data-bs-target="#noticeEditModal">설 연휴 점검 안내</a>
							</div>

							<!-- Data item -->
							<div class="col-2">게시중</div>

							<!-- Data item -->
							<div class="col-3">
								<small class="d-block d-lg-none">등록일</small>
								<h6 class="ms-1 mb-0 fw-normal">2024.12.19(목)</h6>
							</div>
						</div>

						<!-- Table data -->
						<div
							class="row row-cols-xl-7 align-items-lg-center border-bottom g-4 px-2 py-4">
							<!-- Data item -->
							<div class="col-2">
								<small class="d-block d-lg-none">카테고리</small>
								<h6 class="ms-1 mb-0 fw-normal">시스템</h6>
							</div>
							
							<!-- 제목 누르면 <질문 수정> 모달창 표시 -->
							<div class="col-5">
								<small class="d-block d-lg-none">제목</small>
								<a role="button" class="text-primary fw-bold ms-1 mb-0" data-bs-toggle="modal" data-bs-target="#noticeEditModal">파트너센터 시스템 점검 안내</a>
							</div>

							<!-- Data item -->
							<div class="col-2">게시중</div>

							<!-- Data item -->
							<div class="col-3">
								<small class="d-block d-lg-none">등록일</small>
								<h6 class="ms-1 mb-0 fw-normal">2024.12.20(금)</h6>
							</div>
						</div>

						<!-- Table data -->
						<div
							class="row row-cols-xl-7 align-items-lg-center border-bottom g-4 px-2 py-4">
							<!-- Data item -->
							<div class="col-2">
								<small class="d-block d-lg-none">카테고리</small>
								<h6 class="ms-1 mb-0 fw-normal">운영</h6>
							</div>

							<!-- 제목 누르면 <질문 수정> 모달창 표시 -->
							<div class="col-5">
								<small class="d-block d-lg-none">제목</small>
								<a role="button" class="text-primary fw-bold ms-1 mb-0" data-bs-toggle="modal" data-bs-target="#noticeEditModal">정산 일정 안내</a>
							</div>

							<!-- Data item -->
							<div class="col-2">게시중</div>

							<!-- Data item -->
							<div class="col-3">
								<small class="d-block d-lg-none">등록일</small>
								<h6 class="ms-1 mb-0 fw-normal">2024.12.20(금)</h6>
							</div>
						</div>

					</div>
					<!-- Card body END -->

					<!-- Card footer START -->
					<div class="card-footer pt-0">
						<!-- Pagination (페이지 전환 하단 바)-->
						<nav class="d-flex justify-content-center">
							<ul class="pagination pagination-sm pagination-primary-soft mb-0">
								<li class="page-item disabled">
									<!-- disabled: 버튼 비활성화--> <a class="page-link" href="#"
									tabindex="-1">&lt;</a>
								</li>
								<li class="page-item"><a class="page-link" href="#">1</a></li>
								<li class="page-item active"><a class="page-link" href="#">2</a></li>
								<li class="page-item"><a class="page-link" href="#">3</a></li>
								<li class="page-item"><a class="page-link" href="#">4</a></li>
								<li class="page-item disabled"><a class="page-link"
									href="#">..</a></li>
								<li class="page-item"><a class="page-link" href="#">11</a></li>
								<li class="page-item"><a class="page-link" href="#">12</a></li>
								<li class="page-item"><a class="page-link" href="#">&gt;</a>
								</li>
							</ul>
						</nav>

					</div>
					<!-- Card footer END -->
				</div>
				<!-- 문의 내역 List END -->
				 <!-- 페이징 -->
                    <div id="paging" class="col-12 mt-4">
                        <script>
                            $(function() {
                                $('#paging').customPaging({
                                    limit: ${limit}, 
                                    showPageNum: 5
                                }, function(pageNum) {
                                    location.href = "/notice?page=" + pageNum;
                                }).drawPage(${totalCount});
                            });
                        </script>
                    </div>
			</div>
			<!-- Page main content END -->
		</div>
		<!-- Page content END -->
	</main>
	<!-- **************** MAIN CONTENT END **************** -->
	<!-- footerScript -->
	<%@ include file="/WEB-INF/views/include/footerScript.jsp"%>

</body>

</html>