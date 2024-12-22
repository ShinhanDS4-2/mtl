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

				<!-- 내 정보 관리 -->
				<div class="vstack gap-4">
					<div class="card border">
						<!-- Card header -->
						<div class="card-header border-bottom">
							<h4 class="card-header-title">내 정보 관리</h4>
						</div>

						<div class="card-body">
							<form class="row g-3">
								<div class="col-md-6">
									<label class="form-label">이름</label>
									<input type="text" class="form-control" value="Jacqueline Miller">
								</div>
								<div class="col-md-6">
									<label class="form-label">이메일</label>
									<input type="email" class="form-control text-secondary" value="hello@gmail.com" disabled="disabled">
								</div>
								<div class="col-md-6">
									<label class="form-label">연락처</label>
									<input type="text" class="form-control" value="010-0000-0000">
								</div>
								<div class="col-md-6">
									<label class="form-label">생년월일</label>
									<input type="text" class="form-control text-secondary" value="1995-01-01" disabled="disabled">
								</div>
								<div class="col-md-6">
									<div class="form-check form-switch form-check-md d-flex justify-content-between mb-4">
										<label class="form-check-label" for="smsAssent">SMS 수신 동의</label>
										<input class="form-check-input flex-shrink-0" type="checkbox" id="smsAssent">
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-check form-switch form-check-md d-flex justify-content-between mb-4">
										<label class="form-check-label" for="emailAssent">Email 수신 동의</label>
										<input class="form-check-input flex-shrink-0" type="checkbox" id="emailAssent" checked>
									</div>
								</div>
								<div class="col-12 text-end">
									<a href="#" class="btn btn-primary mb-0">내 정보 수정</a>
								</div>
							</form>
						</div>
					</div>

					<!-- 비밀번호 변경 -->
					<div class="card border">
						<!-- Card header -->
						<div class="card-header border-bottom">
							<h4 class="card-header-title">비밀번호 변경</h4>
							<small class="mb-1 text-secondary">개인정보 보호를 위해 정기적으로 변경해 주세요.</small>
						</div>

						<form class="card-body">
							<div class="mb-3">
								<label class="form-label">현재 비밀번호</label>
								<input class="form-control" type="password" placeholder="Enter current password">
							</div>
							<div class="mb-3">
								<label class="form-label">새 비밀번호</label>
								<div class="input-group">
									<input class="form-control fakepassword" placeholder="Enter new password" type="password" id="psw-input">
									<span class="input-group-text p-0 bg-transparent">
										<i class="fakepasswordicon fas fa-eye-slash cursor-pointer p-2"></i>
									</span>
								</div>
							</div>
							<div class="mb-3">
								<label class="form-label">새 비밀번호 확인</label>
								<input class="form-control" type="password" placeholder="Confirm new password">
							</div>
							<div class="text-end">
								<a href="#" class="btn btn-primary mb-0">비밀번호 변경</a>
							</div>
						</form>
					</div>
					
					<!-- 회원 탈퇴 (modal) -->
					<div class="text-secondary">
						<small>더 이상 떠날지도 이용을 원하지 않으신가요?<a href="#" class="text-secondary"><b> 회원탈퇴</b></a></small>
					</div>
				</div>
			</div>
			<!-- Main content END -->
		</div>
	</div>
</section>
</main>

<!-- footer -->
<%@ include file="/WEB-INF/views/include/footer.jsp" %>

<!-- footerScript -->
<%@ include file="/WEB-INF/views/include/footerScript.jsp" %>

<!-- page script -->
<script src="js/user/service/notice.js"></script>
<script type="text/javascript">
	notice.init();
</script>
</body>
</html>