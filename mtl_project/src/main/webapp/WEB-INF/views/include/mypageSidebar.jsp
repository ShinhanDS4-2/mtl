<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="col-lg-4 col-xl-3">
	<!-- offcanvass -->
	<div class="offcanvas-lg offcanvas-end" tabindex="-1" id="offcanvasSidebar" >
		<div class="offcanvas-header justify-content-end pb-2">
			<button type="button" class="btn-close" data-bs-dismiss="offcanvas" data-bs-target="#offcanvasSidebar" aria-label="Close"></button>
		</div>

		<!-- 메뉴 -->
		<c:if test="${!empty login_user_idx }">
			<div class="offcanvas-body p-3 p-lg-0 mb-3">
				<div class="card bg-white w-100 border">
					<div class="card-body p-3">
						<ul class="nav nav-pills-primary-soft flex-column">
							<li class="nav-item">
								<a class="nav-link" href="mypage/info" id="menuInfo"><i class="bi bi-person fa-fw me-2"></i>내 정보 관리</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="mypage/reservation" id="menuReservation"><i class="fa-solid fa-calendar-check fa-fw me-2"></i>예약 내역</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="mypage/question" id="menuQuestion"><i class="fa-regular fa-circle-question fa-fw me-2"></i>1:1 문의</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="mypage/review" id="menuReview"><i class="fa-solid fa-user-pen fa-fw me-2"></i>내가 쓴 후기</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</c:if>
		
		<div class="offcanvas-body p-3 p-lg-0">
			<div class="card bg-white w-100 border">
				<div class="card-body p-3">
					<ul class="nav nav-pills-primary-soft flex-column">
						<li class="nav-item">
							<a class="nav-link" href="service/qna" id="serviceQnA"><i class="fa-solid fa-circle-question fa-fw me-2"></i>자주 묻는 질문</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="service/notice" id="serviceNotice"><i class="fa-solid fa-bullhorn fa-fw me-2"></i>공지사항</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>	
</div>
