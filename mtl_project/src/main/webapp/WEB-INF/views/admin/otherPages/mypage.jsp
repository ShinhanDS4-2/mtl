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
						<h1 class="h3 mb-2">마이페이지</h1>
						<span>관리자 정보를 수정.. </span>
					</div>
				</div>


				<!-- 회원 정보 관리 & 업체 정보 관리 감싸는 div-->
				<div class="row g-4">
					<!-- 회원 정보 관리 -->
					<div class="col-lg-6">
						<div class="card shadow">
							<!-- Card header -->
							<div class="card-header border-bottom">
								<h5 class="card-header-title">관리자 정보 관리</h5>
							</div>
							<!-- Card body START -->
							<div class="card-body">
								<!-- item -->
								<div class="mb-3">
									<label class="form-label">이름</label>
									<input type="text" class="form-control" id="admin_name">
								</div>
								<!-- item -->
								<div class="mb-3">
									<label class="form-label">이메일</label>
									<input type="text" class="form-control" id="admin_email" readonly>
								</div>

								<!-- Save button -->
								<div class="d-flex justify-content-end mt-4">
									<a href="javascript:;" class="btn btn-primary" data-src='info' data-act="updateInfo">저장</a>
								</div>
							</div>
							<!-- Card body END -->
						</div>
					</div>

					<!-- 비밀번호 변경 START -->
					<div class="col-lg-6">
						<!-- Change password -->
						<div class="bg-light bor rounded-3 p-4 mb-3">
							<div
								class="d-md-flex justify-content-between align-items-center flex-wrap">
								<!-- Content -->
								<div>
									<h6 class="h5">비밀번호</h6>
									<p class="mb-1 mb-md-0">비밀번호를 변경하여 계정을 보호하세요.</p>
								</div>
								<!-- 비밀번호 변경하기 Button 클릭 시 모달창 표시 -->
								<div>
									<a role="button" class="btn btn-primary mb-2" data-bs-toggle="modal" data-bs-target="#changePassword">비밀번호 변경하기</a>
									<p class="mb-0 small h6">최근 변경 일자: <span id="passwordUpdateDate"><span></span></p>
								</div>
							</div>
						</div>
					</div>
					<!-- 비밀번호 변경 END -->

					<!-- 비밀번호 변경 Modal START -->
					<div class="modal fade" id="changePassword" tabindex="-1"
						aria-labelledby="pwdModalLabel" aria-hidden="true">
						<div class="modal-dialog modal-dialog-centered">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="pwdModalLabel">비밀번호 변경</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>
								<div class="modal-body">
									<form>
										<!-- 기존 비밀번호 -->
										<div class="mb-3">
											<label for="placeName" class="form-label fw-bold">기존
												비밀번호 <span class="text-danger">*</span>
											</label>
											<input id="admin_password" type="text" class="form-control" id="placeName" placeholder="기존 비밀번호를 입력해 주세요.">
										</div>
										<!-- 새 비밀번호 -->
										<div class="mb-3">
											<label for="placeName" class="form-label fw-bold">새
												비밀번호 <span class="text-danger">*</span>
											</label>
											<input id="newPassword" type="text" class="form-control" id="pwd" placeholder="영문, 숫자, 특수문자를 조합하여 최소 8자리 이상.">
										</div>
										<!-- 새 비밀번호 확인 -->
										<div class="mb-3">
											<label for="placeName" class="form-label fw-bold">새
												비밀번호 확인 <span class="text-danger">*</span>
											</label>
											<input id="confirmPassword" type="text" class="form-control" id="pwd" placeholder="새 비밀번호를 다시 입력해 주세요.">
										</div>
									</form>
								</div>
								<!-- 확인/취소 button -->
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-bs-dismiss="modal">취소</button>
									<button type="button" class="btn btn-primary" data-src='info' data-act="changePassword">확인</button>
								</div>
							</div>
						</div>
					</div>
					<!-- 비밀번호 변경 Modal END -->


				</div>
				<!-- Row END -->
			</div>
			<!-- Page main content END -->
		</div>
		<!-- Page content END -->

	</main>
	<!-- **************** MAIN CONTENT END **************** -->
	<!-- footerScript -->
	<%@ include file="/WEB-INF/views/include/footerScript.jsp"%>
	
	<!-- page script -->
	<script src="js/admin/mypage.js"></script>
	<script type="text/javascript">
		info.init();
	</script>
</body>
</html>