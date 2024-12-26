<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>[판매자] 예약관리 > 예약내역 상세보기</title>

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
						<h1 class="h3 mb-2">예약내역 상세보기</h1>
						<span>예약내역에서 예약 상세보기 클릭하면 해당 모달창 띄워줌</span>
					</div>
				</div>

				<!-- 모달 열기 버튼 -->
				<button type="button" class="btn btn-primary-soft"
					data-bs-toggle="modal" data-bs-target="#smallModal">
					<!-- data-bs-target: 여기에 열고자 하는 모달 id 지정해주면 해당 모달이 열림-->
					작은크기 모달 열기
				</button>
				<button type="button" class="btn btn-primary-soft"
					data-bs-toggle="modal" data-bs-target="#basicsModal">기본크기
					모달 열기</button>
				<button type="button" class="btn btn-primary" data-bs-toggle="modal"
					data-bs-target="#largeModal">큰 크기 모달 열기 ((제일 적합))</button>
				<button type="button" class="btn btn-primary-soft"
					data-bs-toggle="modal" data-bs-target="#xlargeModal">매우 큰
					크기 모달 열기</button>

				<!-- 모달창 크기 지정하는 방법
			 <div class="modal-dialog"> : 기본 크기의 모달
			 <div class="modal-dialog modal-sm"> : 작은 모달
			 <div class="modal-dialog modal-lg"> : 큰 모달
			 <div class="modal-dialog modal-xl"> : 매우 큰 모달
			-->

				<!-- 모달창 START -->
				<div id="smallModal" class="modal" tabindex="-1" role="dialog">
					<div class="modal-dialog modal-sm" role="document">
						<!-- 작은 모달 -->
						<div class="modal-content">
							<!-- 모달 head -->
							<div class="modal-header">
								<h5 class="modal-title">예약 상세 정보</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<!-- 모달 body -->
							<div class="modal-body">
								<!-- 예약번호 -->
								<h6 class="fw-bold">예약번호</h6>
								<div class="mb-3 border p-3">
									<p class="mb-0">240123</p>
								</div>

								<!-- 예약자 정보 -->
								<h6 class="fw-bold">예약자 정보</h6>
								<div class="mb-3 border p-3">
									<p class="mb-0">예약자명: 으헤헤</p>
									<p class="mb-0">연락처: 010-7737-6314</p>
								</div>

								<!-- 예약 정보 -->
								<h6 class="fw-bold">예약 정보</h6>
								<div class="mb-3 border p-3">
									<p class="mb-0">객실타입: 프리미엄 트윈</p>
									<p class="mb-0">입실일시: 2024.12.09(월) 17:00</p>
									<p class="mb-0">퇴실일시: 2024.12.11(수) 12:00</p>
									<p class="mb-0">예약일시: 2024.12.09(월) 20:08:25</p>
									<p class="mb-0">예약상태: 프리미엄 트윈</p>
								</div>

								<!-- 금액 정보 -->
								<h6 class="fw-bold">금액 정보</h6>
								<div class="mb-3 border p-3">
									<p class="mb-0">판매가: 120,000원</p>
									<p class="mb-0">정상가: 110,000원</p>
								</div>
							</div>

							<!-- 모달 footer -->
							<div class="modal-footer">
								<button type="button" class="btn btn-primary">출력</button>
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">닫기</button>
							</div>
						</div>
					</div>
				</div>
				<!-- 모달창 END -->

				<!-- 모달창 START -->
				<div id="basicsModal" class="modal" tabindex="-1" role="dialog">
					<div class="modal-dialog" role="document">
						<!-- 기본크기의 모달 -->
						<div class="modal-content">
							<!-- 모달 head -->
							<div class="modal-header">
								<h5 class="modal-title">예약 상세 정보</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<!-- 모달 body -->
							<div class="modal-body">
								<!-- 예약번호 -->
								<h6 class="fw-bold">예약번호</h6>
								<div class="mb-3 border p-3">
									<p class="mb-0">240123</p>
								</div>

								<!-- 예약자 정보 -->
								<h6 class="fw-bold">예약자 정보</h6>
								<div class="mb-3 border p-3">
									<p class="mb-0">예약자명: 으헤헤</p>
									<p class="mb-0">연락처: 010-7737-6314</p>
								</div>

								<!-- 예약 정보 -->
								<h6 class="fw-bold">예약 정보</h6>
								<div class="mb-3 border p-3">
									<p class="mb-0">객실타입: 프리미엄 트윈</p>
									<p class="mb-0">입실일시: 2024.12.09(월) 17:00</p>
									<p class="mb-0">퇴실일시: 2024.12.11(수) 12:00</p>
									<p class="mb-0">예약일시: 2024.12.09(월) 20:08:25</p>
									<p class="mb-0">예약상태: 프리미엄 트윈</p>
								</div>

								<!-- 금액 정보 -->
								<h6 class="fw-bold">금액 정보</h6>
								<div class="mb-3 border p-3">
									<p class="mb-0">판매가: 120,000원</p>
									<p class="mb-0">정상가: 110,000원</p>
								</div>
							</div>

							<!-- 모달 footer -->
							<div class="modal-footer">
								<button type="button" class="btn btn-primary">출력</button>
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">닫기</button>
							</div>
						</div>
					</div>
				</div>
				<!-- 모달창 END -->

				<!-- 모달창 START -->
				<div id="largeModal" class="modal" tabindex="-1" role="dialog">
					<div class="modal-dialog modal-lg" role="document">
						<!-- 큰 모달-->
						<div class="modal-content">
							<!-- 모달 head -->
							<div class="modal-header">
								<h5 class="modal-title">예약 상세 정보</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<!-- 모달 body -->
							<div class="modal-body">
								<!-- 예약번호 -->
								<h6 class="fw-bold">예약번호</h6>
								<div class="mb-3 border p-3">
									<p class="mb-0">240123</p>
								</div>

								<!-- 예약자 정보 -->
								<h6 class="fw-bold">예약자 정보</h6>
								<div class="mb-3 border p-3">
									<p class="mb-0">예약자명: 김시온</p>
									<p class="mb-0">연락처: 010-7737-6314</p>
								</div>

								<!-- 예약 정보 -->
								<h6 class="fw-bold">예약 정보</h6>
								<div class="mb-3 border p-3">
									<p class="mb-0">객실타입: 프리미엄 트윈</p>
									<p class="mb-0">입실일시: 2024.12.09(월) 17:00</p>
									<p class="mb-0">퇴실일시: 2024.12.11(수) 12:00</p>
									<p class="mb-0">예약일시: 2024.12.09(월) 20:08:25</p>
									<p class="mb-0">예약상태: 프리미엄 트윈</p>
								</div>

								<!-- 금액 정보 -->
								<h6 class="fw-bold">금액 정보</h6>
								<div class="mb-3 border p-3">
									<p class="mb-0">판매가: 120,000원</p>
									<p class="mb-0">정상가: 110,000원</p>
								</div>
							</div>

							<!-- 모달 footer -->
							<div class="modal-footer">
								<button type="button" class="btn btn-primary">출력</button>
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">닫기</button>
							</div>
						</div>
					</div>
				</div>
				<!-- 모달창 END -->

				<!-- 모달창 START -->
				<div id="xlargeModal" class="modal" tabindex="-1" role="dialog">
					<div class="modal-dialog modal-xl" role="document">
						<!-- 매우 큰 모달 -->
						<div class="modal-content">
							<!-- 모달 head -->
							<div class="modal-header">
								<h5 class="modal-title">예약 상세 정보</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<!-- 모달 body -->
							<div class="modal-body">
								<!-- 예약번호 -->
								<h6 class="fw-bold">예약번호</h6>
								<div class="mb-3 border p-3">
									<p class="mb-0">240123</p>
								</div>

								<!-- 예약자 정보 -->
								<h6 class="fw-bold">예약자 정보</h6>
								<div class="mb-3 border p-3">
									<p class="mb-0">예약자명: 김시온</p>
									<p class="mb-0">연락처: 010-7737-6314</p>
								</div>

								<!-- 예약 정보 -->
								<h6 class="fw-bold">예약 정보</h6>
								<div class="mb-3 border p-3">
									<p class="mb-0">객실타입: 프리미엄 트윈</p>
									<p class="mb-0">입실일시: 2024.12.09(월) 17:00</p>
									<p class="mb-0">퇴실일시: 2024.12.11(수) 12:00</p>
									<p class="mb-0">예약일시: 2024.12.09(월) 20:08:25</p>
									<p class="mb-0">예약상태: 프리미엄 트윈</p>
								</div>

								<!-- 금액 정보 -->
								<h6 class="fw-bold">금액 정보</h6>
								<div class="mb-3 border p-3">
									<p class="mb-0">판매가: 120,000원</p>
									<p class="mb-0">정상가: 110,000원</p>
								</div>
							</div>

							<!-- 모달 footer -->
							<div class="modal-footer">
								<button type="button" class="btn btn-primary">출력</button>
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">닫기</button>
							</div>
						</div>
					</div>
				</div>
				<!-- 모달창 END -->



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