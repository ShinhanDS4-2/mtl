<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>떠날지도 - 파트너 센터</title>
<!-- headerScript -->
<%@ include file="/WEB-INF/views/include/headerScript.jsp"%>
</head>

<body>
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
					<h1 class="h3 mb-2">마이페이지</h1>
					<span>회원 정보를 수정하실 수 있습니다.</span>
				</div>
			</div>

			<!-- 회원 정보 관리 & 업체 정보 관리 감싸는 div-->
			<div class="row g-4">
				<!-- 회원 정보 관리 -->
				<div class="col-lg-6">
					<div class="card shadow">
						<!-- Card header -->
						<div class="card-header border-bottom">
							<h5 class="card-header-title">회원 정보 관리</h5>
						</div>
						<!-- Card body START -->
						<div class="card-body">
							<!-- item -->
							<div class="mb-3">
								<label class="form-label">이름</label> 
								<input type="text" class="form-control" id="name">
								<!-- disabled : 수정불가 -->
							</div>
							<!-- item -->
							<div class="mb-3">
								<label class="form-label">아이디</label>
								<input type="text" class="form-control" value="${login_partner_email }" readonly>
							</div>
							<!-- item -->
							<div class="mb-3">
								<label class="form-label">휴대폰 번호</label>
								<input type="text" class="form-control" id="phone">
							</div>


							<!-- Save button -->
							<div class="d-flex justify-content-end mt-4">
								<a href="javascript:;" class="btn btn-primary" data-src='info' data-act="updateInfo">저장</a>
							</div>
						</div>
						<!-- Card body END -->
					</div>
					
					<!-- 비밀번호 변경 START -->
					<div class="bg-light bor rounded-3 p-4 mb-3 mt-4">
						<div class="d-md-flex justify-content-between align-items-center flex-wrap">
							<!-- Content -->
							<div>
								<h6 class="h5">비밀번호</h6>
								<p class="mb-1 mb-md-0">비밀번호를 변경하여 계정을 보호하세요.</p>
							</div>
							<!-- 비밀번호 변경하기 Button 클릭 시 모달창 표시 -->
							<div>
								<a role="button" class="btn btn-primary mb-2" data-bs-toggle="modal" data-bs-target="#changePassword">비밀번호 변경하기</a>
								<p class="mb-0 small">최근 변경 일자: <span id="passwordUpdateDate"></span></p>
							</div>
						</div>
					</div>
					<!-- 비밀번호 변경 END -->
				</div>

				<!-- 업체 정보 관리 -->
				<div class="col-lg-6">
					<div class="card shadow">
						<!-- Card header -->
						<div class="card-header border-bottom">
							<h5 class="card-header-title">업체 정보 관리</h5>
						</div>

						<!-- Card body START -->
						<div class="card-body">
							<form class="row g-4 align-items-center">

								<!-- item -->
								<div class="col-12">
									<label class="form-label">업체명</label>
									<input type="text" class="form-control" value="${login_partner_name }" readonly>
								</div>
								<!-- item -->
								<div class="col-12">
									<label class="form-label">사업자등록번호</label>
									<input type="text" class="form-control" id="business_number" readonly>
								</div>

								<!-- item -->
								<div class="col-12">
									<label class="form-label">사업장 주소지</label>
									<input type="text" class="form-control" id="address" readonly>
								</div>

								<!-- item -->
								<div class="mb-3">
									<label class="form-label">업체 대표 번호</label>
									<input type="text" class="form-control" id="business_phone" readonly placeholder="업체 대표 번호를 입력하세요.">
								</div>

								<!-- item 정산계좌 -->
								<div class="col-lg-4">
									<label class="form-label">정산계좌</label>
									<div
										class="form-border-bottom form-control-transparent form-fs-lg">
										<select class="form-select" id="account_bank">
											<option value="" disabled="disabled" selected="selected">은행 선택</option>
											<option value="우리은행">우리은행</option>
											<option value="카카오뱅크">카카오뱅크</option>
											<option value="기업은행">기업은행</option>
											<option value="국민은행">국민은행</option>
											<option value="하나은행">하나은행</option>
											<option value="신한은행">신한은행</option>
										</select>
									</div>
								</div>

								<!-- item 정산계좌-->
								<div class="col-lg-8">
									<label class="form-label">계좌번호</label> <input type="email" class="form-control" id="account_number" placeholder="계좌번호를 입력하세요.">
								</div>

								<!-- Save button -->
								<div class="d-flex justify-content-end mt-4">
									<a href="javascript:;" class="btn btn-primary" data-src="info" data-act="updateBusinessInfo">저장</a>
								</div>
							</form>
						</div>
						<!-- Card body END -->
					</div>
				</div>

				<!-- 비밀번호 변경 Modal START -->
				<div class="modal fade" id="changePassword" tabindex="-1" aria-labelledby="pwdModalLabel" aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="pwdModalLabel">비밀번호 변경</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<!-- 기존 비밀번호 -->
								<div class="mb-3">
									<label for="placeName" class="form-label fw-bold">기존 비밀번호 <span class="text-danger">*</span></label> 
									<input id="password" type="password" class="form-control" id="placeName" placeholder="기존 비밀번호를 입력해 주세요.">
								</div>
								<!-- 새 비밀번호 -->
								<div class="mb-3">
									<label for="placeName" class="form-label fw-bold">새 비밀번호 <span class="text-danger">*</span></label>
									<input id="newPassword" type="password" class="form-control" id="pwd" placeholder="영문, 숫자, 특수문자를 조합하여 최소 8자리 이상.">
								</div>
								<!-- 새 비밀번호 확인 -->
								<div class="mb-3">
									<label for="placeName" class="form-label fw-bold">새 비밀번호 확인 <span class="text-danger">*</span></label>
									<input id="confirmPassword" type="password" class="form-control" id="pwd" placeholder="새 비밀번호를 다시 입력해 주세요.">
								</div>
							</div>
							<!-- 확인/취소 button -->
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
								<button type="button" class="btn btn-primary" data-src='info' data-act="changePassword">확인</button>
							</div>
						</div>
					</div>
				</div>
				<!-- 비밀번호 변경 Modal END -->
			</div>
		</div>
	</div>
</main>
<!-- footerScript -->
<%@ include file="/WEB-INF/views/include/footerScript.jsp"%>
<!-- page script -->
<script src="js/partner/mypage.js"></script>
<script type="text/javascript">
	info.init();
</script>
</body>
</html>