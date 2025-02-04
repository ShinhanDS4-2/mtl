<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <title>떠날지도 - 관리자</title>
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
                        <span>공지사항을 등록해주세요.</span>
                    </div>
                </div>

                <!-- 상단 navbar START -->
                <div class="row g-4 align-items-end border-bottom">
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
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title">새 공지 등록</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body m-3">
                                <h6 class="fw-bold">제목</h6>
                                <input type="text" class="form-control" id="questionTitle" placeholder="제목을 입력하세요">
                                <h6 class="fw-bold mt-4">내용</h6>
                                <textarea class="form-control" id="questionContent" rows="15" placeholder="내용을 입력하세요"></textarea>
                                <div class="col-2 mt-4">
                                    <select class="form-select js-choice" aria-label=".form-select-sm">
                                        <option>사용자</option>
                                        <option>판매자</option>
                                    </select>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                                <button type="button" class="btn btn-primary">확인</button>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- 공지사항 등록 모달창 END -->
				<!-- 공지사항 상세 조회 모달 -->
				<div id="noticeDetailModal" class="modal fade" tabindex="-1" role="dialog" data-bs-backdrop="static">
				    <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
				        <div class="modal-content">
				            <div class="modal-header">
				                <h5 class="modal-title">공지사항 상세</h5>
				                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				            </div>
				            <div class="modal-body">
				                <h6 class="fw-bold">제목</h6>    
				                <input type="text" id="editTitle" class="form-control" placeholder="제목을 입력하세요">
				
				                <h6 class="fw-bold mt-2">내용</h6>
				                <textarea id="editContent" class="form-control" rows="5" placeholder="내용을 입력하세요"></textarea>
				
				                <h6 class="fw-bold mt-2">상태</h6>
				               		<select id="editStatus" class="form-select js-choice" aria-label=".form-select-sm">
                                        <option value="Y">게시중</option>
        								<option value="N">게시중단</option>
                                    </select>
				                <p id="detailStatus" class="mb-3"></p>
				            </div>
				            <div class="modal-footer">
				                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
				                <button type="button" class="btn btn-primary" id="saveButton">수정하기</button>
				            </div>
				        </div>
				    </div>
				</div>

				<!-- 공지사항 상세 모달창 END -->
				
				                 
				<div class="card shadow mt-4 mb-5">
					<!-- Card header -->
					<div class="card-header border-bottom">
						<h5 class="card-header-title">검색</h5>
					</div>	
	                <!-- 검색 필터 START -->
	                <div class="card-body" style="padding-top: 8px; padding-bottom: 8px;">
	                    <form id="searchForm" class="row g-4 align-items-center">
	                        <div class="d-flex">
	                            <div class="col-2 mt-2">
	                                <label for="searchStatus" class="form-label">상태</label>
	                                <select id="searchStatus" class="form-select js-choice" aria-label=".form-select-sm">
	                                    <option value="">전체</option>
	                                    <option value="Y">게시중</option>
	                                    <option value="N">게시중단</option>
	                                </select>
	                            </div>
	                            <div class="col-2 mt-2 ms-3">
	                                <label for="searchTarget" class="form-label">분류</label>
	                                <select id="searchTarget" class="form-select js-choice" aria-label=".form-select-sm">
	                                    <option value="">전체</option>
	                                    <option value="U">사용자</option>
	                                    <option value="P">판매자</option>
	                                </select>
	                            </div>
	                        </div>
	                        <div class="col-12">
	                            <div class="col-6">
	                                <label for="searchKeyword" class="form-label">제목</label>
	                                <input id="searchKeyword" type="text" class="form-control" placeholder="내용을 입력하세요">
	                            </div>
	                        </div>
	                        <div class="d-sm-flex justify-content-end border-top pt-3">
	                            <button type="reset" id="resetButton" class="btn btn-primary-soft mb-0 ms-2" onclick="window.location.reload()">초기화</button>
	                            <button type="button" id="searchButton" class="btn btn-primary mb-0 ms-2">검색</button>
	                        </div>
	                    </form>
	                </div>
	            </div>
                <!-- 검색 필터 END -->
				<div class="row g-4 justify-content-between align-items-center mb-2">
					<div class="col-md-6 col-lg-6">
						<h6 class="mb-1">전체 문의 <span id="totalCnt"></span>건</h6>
					</div>
				</div>
				
                <!-- 공지사항 목록 컨테이너 -->
                <div class="card shadow border">
				
	                <div class="card-body">
						<!-- Table head -->
						<div class="bg-light rounded p-3 d-none d-sm-block">
						    <div class="row g-4">
						        <div class="col text-center">
						            <h6 class="mb-0">분류</h6>
						        </div>
						        <div class="col text-center">
						            <h6 class="mb-0">제목</h6>
						        </div>
						        <div class="col text-center">
						            <h6 class="mb-0">상태</h6>
						        </div>
						        <div class="col text-center">
						            <h6 class="mb-0">게시일</h6>
						        </div>
						        
						     
						    </div>
						</div>
						<div id="noticeList" class="card-body">
				                			<!-- 사용자 List START -->
					
				                    <!-- 공지사항 목록은 JavaScript에서 동적으로 렌더링됩니다 -->
						</div>
					</div>
	                <!-- Card footer START -->
	                <div class="card-footer pt-2">
						<!-- Pagination (페이지 전환 하단 바)-->
						<nav class="d-flex justify-content-center">
							<ul class="pagination pagination-sm pagination-primary-soft mb-0" id="pagination">
							</ul>
						</nav>
					</div>
                </div>
            </div>
            <!-- Page main content END -->
        </div>
        <!-- Page content END -->
    </main>
    <!-- **************** MAIN CONTENT END **************** -->

    <!-- footerScript -->
    <%@ include file="/WEB-INF/views/include/footerScript.jsp" %>

    <script src="js/admin/notice.js"></script>
    <script type="text/javascript">
        notice.init();
    </script>
</body>

</html>
