<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                        <h1 class="h3 mb-2">자주 묻는 질문 QnA</h1>
                        <span>QnA를 등록해주세요. </span>
                    </div>
                </div>

                <!-- qna List 상단 Tab -->
                <div class="row g-4 justify-content-between align-items-center mb-2">
                    <div class="col-2">
                        <!-- qnaList 크기 출력 -->
                        <h6 class="mb-1">총 <c:out value="${qnaList.size()}"/>개</h6>
                    </div>
                    <div class="col-2">
                        <form>
                            <select class="form-select js-choice" aria-label=".form-select-sm">
                                <option>게시중</option>
                                <option>게시중단</option>
                            </select>
                        </form>
                    </div>
                </div>

                <!-- qna List START -->
                <div class="card shadow border">
                    <!-- Card body START -->
                    <div class="card-body">
                        <!-- Table head -->
                        <div class="bg-light rounded p-3 d-none d-lg-block">
                            <div class="row row-cols-7 g-4">
                                <div class="col">
                                    <h6 class="mb-0">분류</h6>
                                </div>
                                <div class="col">
                                    <h6 class="mb-0">제목</h6>
                                </div>
                                <div class="col">
                                    <h6 class="mb-0">작성일</h6>
                                </div>
                                <div class="col">
                                    <h6 class="mb-0">상태</h6>
                                </div>
                            </div>
                        </div>

                        <!-- Table data -->
                        <c:forEach var="qna" items="${qnaList}">
                            <div class="row row-cols-xl-7 align-items-lg-center border-bottom g-4 px-2 py-4">
                                <div class="col">
                                    <small class="d-block d-lg-none">분류</small>
                                    <h6 class="ms-1 mb-0 fw-normal">${qna.category}</h6>
                                </div>

                                <div class="col">
                                    <small class="d-block d-lg-none">제목</small>
                                    <a role="button" class="text-primary fw-bold ms-1 mb-0" data-bs-toggle="modal" data-bs-target="#qnaEditModal">${qna.title}</a>
                                </div>

                                <div class="col">
                                    <small class="d-block d-lg-none">작성일</small>
                                    <h6 class="ms-1 mb-0 fw-normal">${qna.createdDate}</h6>
                                </div>

                                <div class="col">
                                    <small class="d-block d-lg-none">상태</small>
                                    <div class="ms-1 badge ${qna.status == 'Y' ? 'bg-success bg-opacity-10 text-success' : 'bg-danger bg-opacity-10 text-danger'}">${qna.status == 'Y' ? '게시중' : '게시중단'}</div>
                                </div>
                            </div>
                        </c:forEach>

                    </div>
                    <!-- Card body END -->

                    <!-- Card footer START -->
                    <div class="card-footer pt-0">
                        <!-- Pagination (페이지 전환 하단 바)-->
                        <nav class="d-flex justify-content-center">
                            <ul class="pagination pagination-sm pagination-primary-soft mb-0">
                                <li class="page-item disabled">
                                    <a class="page-link" href="#" tabindex="-1">&lt;</a>
                                </li>
                                <li class="page-item"><a class="page-link" href="#">1</a></li>
                                <li class="page-item active"><a class="page-link" href="#">2</a></li>
                                <li class="page-item"><a class="page-link" href="#">3</a></li>
                                <li class="page-item"><a class="page-link" href="#">4</a></li>
                                <li class="page-item disabled"><a class="page-link" href="#">..</a></li>
                                <li class="page-item"><a class="page-link" href="#">11</a></li>
                                <li class="page-item"><a class="page-link" href="#">12</a></li>
                                <li class="page-item"><a class="page-link" href="#">></a></li>
                            </ul>
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

</body>

</html>
