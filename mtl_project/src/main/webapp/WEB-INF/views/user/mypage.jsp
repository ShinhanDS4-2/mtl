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
			<!-- Sidebar START -->
			<div class="col-lg-4 col-xl-3">
				<!-- Responsive offcanvas body START -->
				<div class="offcanvas-lg offcanvas-end" tabindex="-1" id="offcanvasSidebar" >
					<!-- Offcanvas header -->
					<div class="offcanvas-header justify-content-end pb-2">
						<button type="button" class="btn-close" data-bs-dismiss="offcanvas" data-bs-target="#offcanvasSidebar" aria-label="Close"></button>
					</div>

					<!-- Offcanvas body -->
					<div class="offcanvas-body p-3 p-lg-0">
						<div class="card bg-white w-100 border">
							<!-- Card body START -->
							<div class="card-body p-3">
								<ul class="nav nav-pills-primary-soft flex-column">
									<li class="nav-item">
										<a class="nav-link active" href="account-profile.html"><i class="bi bi-person fa-fw me-2"></i>내 정보 관리</a>
									</li>
									<li class="nav-item">
										<a class="nav-link" href="account-bookings.html"><i class="fa-solid fa-calendar-check fa-fw me-2"></i>예약 내역</a>
									</li>
									<li class="nav-item">
										<a class="nav-link" href="account-bookings.html"><i class="fa-regular fa-circle-question fa-fw me-2"></i>1:1 문의</a>
									</li>
									<li class="nav-item">
										<a class="nav-link" href="account-bookings.html"><i class="fa-solid fa-user-pen fa-fw me-2"></i>내가 쓴 후기</a>
									</li>
									<li class="nav-item">
										<a class="nav-link" href="account-wishlist.html"><i class="fa-solid fa-headset fa-fw me-2"></i>고객센터</a>
									</li>
								</ul>
							</div>
							<!-- Card body END -->
						</div>
					</div>
				</div>	
				<!-- Responsive offcanvas body END -->	
			</div>
			<!-- Sidebar END -->

			<!-- Main content START -->
			<div class="col-lg-8 col-xl-9">
				<!-- Offcanvas menu button -->
				<div class="d-grid mb-0 d-lg-none w-100">
					<button class="btn btn-primary mb-4" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasSidebar" aria-controls="offcanvasSidebar">
						<i class="fas fa-sliders-h"></i> 메뉴
					</button>
				</div>

				<div class="vstack gap-4">
					<!-- Personal info START -->
					<div class="card border">
						<!-- Card header -->
						<div class="card-header border-bottom">
							<h4 class="card-header-title">내 정보 관리</h4>
						</div>

						<!-- Card body START -->
						<div class="card-body">
							<!-- Form START -->
							<form class="row g-3">
								<!-- Name -->
								<div class="col-md-6">
									<label class="form-label">이름</label>
									<input type="text" class="form-control" value="Jacqueline Miller">
								</div>

								<!-- Email -->
								<div class="col-md-6">
									<label class="form-label">이메일</label>
									<input type="email" class="form-control text-secondary" value="hello@gmail.com" disabled="disabled">
								</div>

								<!-- Mobile -->
								<div class="col-md-6">
									<label class="form-label">연락처</label>
									<input type="text" class="form-control" value="010-0000-0000">
								</div>

								<!-- Date of birth -->
								<div class="col-md-6">
									<label class="form-label">생년월일</label>
									<input type="text" class="form-control text-secondary" value="1995-01-01" disabled="disabled">
								</div>

								<!-- Button -->
								<div class="col-12 text-end">
									<a href="#" class="btn btn-primary mb-0">내 정보 수정</a>
								</div>
							</form>
							<!-- Form END -->
						</div>
						<!-- Card body END -->
					</div>
					<!-- Personal info END -->

					<!-- Update Password START -->
					<div class="card border">
						<!-- Card header -->
						<div class="card-header border-bottom">
							<h4 class="card-header-title">비밀번호 변경</h4>
							<small class="mb-1 text-secondary">개인정보 보호를 위해 정기적으로 변경해 주세요.</small>
						</div>

						<!-- Card body START -->
						<form class="card-body">
							<!-- Current password -->
							<div class="mb-3">
								<label class="form-label">현재 비밀번호</label>
								<input class="form-control" type="password" placeholder="Enter current password">
							</div>
							<!-- New password -->
							<div class="mb-3">
								<label class="form-label">새 비밀번호</label>
								<div class="input-group">
									<input class="form-control fakepassword" placeholder="Enter new password" type="password" id="psw-input">
									<span class="input-group-text p-0 bg-transparent">
										<i class="fakepasswordicon fas fa-eye-slash cursor-pointer p-2"></i>
									</span>
								</div>
							</div>
							<!-- Confirm -->
							<div class="mb-3">
								<label class="form-label">새 비밀번호 확인</label>
								<input class="form-control" type="password" placeholder="Confirm new password">
							</div>

							<div class="text-end">
								<a href="#" class="btn btn-primary mb-0">비밀번호 변경</a>
							</div>
						</form>
						<!-- Card body END -->
					</div>
					<!-- Update Password END -->
					
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
<script src="js/user/locationDetail.js"></script>
<script type="text/javascript">
	locationDetail.init();
</script>
</body>
</html>