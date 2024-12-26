<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>[관리자]로그인</title>

<!-- headerScript -->
<%@ include file="/WEB-INF/views/include/headerScript.jsp"%>
</head>

<body>

	<!-- **************** MAIN CONTENT START **************** -->
	<main>

		<!-- =======================
Main Content START -->
		<section class="vh-xxl-100">
			<div class="container h-100 d-flex px-0 px-sm-4">
				<div class="row justify-content-center align-items-center m-auto">
					<div class="col-12">
						<div class="bg-mode shadow rounded-3 overflow-hidden">
							<div class="row g-0">
								<!-- Vector Image -->
								<div
									class="col-lg-6 d-flex align-items-center order-2 order-lg-1">
									<div class="p-3 p-lg-5">
										<img src="assets/images/element/signin.svg" alt="">
									</div>
									<!-- Divider -->
									<div class="vr opacity-1 d-none d-lg-block"></div>
								</div>

								<!-- Information -->
								<div class="col-lg-6 order-1">
									<div class="p-4 p-sm-7">
										<!-- Logo -->
										<a href="index.html"> <img class="h-50px mb-4"
											src="assets/images/logo-icon.svg" alt="logo">
										</a>

										<!-- Title -->
										<h1 class="mb-2 h4 text-center">000 파트너센터</h1>

										<!-- Form START -->
										<form class="mt-4 text-start">
											<!-- Id -->
											<div class="mb-3">
												<label class="form-label">아이디</label> <input type="text"
													class="form-control">
											</div>
											<!-- Password -->
											<div class="mb-3 position-relative">
												<label class="form-label">비밀번호</label> <input
													class="form-control fakepassword" type="password"
													id="psw-input"> <span
													class="position-absolute top-50 end-0 translate-middle-y p-0 mt-3">
													<i
													class="fakepasswordicon fas fa-eye-slash cursor-pointer p-2"></i>
												</span>
											</div>
											<!-- Remember me -->
											<div class="mb-3 d-sm-flex justify-content-between">
												<div>
													<input type="checkbox" class="form-check-input"
														id="rememberCheck"> <label
														class="form-check-label" for="rememberCheck">아이디
														저장</label>
												</div>
											</div>
											<!-- Button -->
											<div class="mb-3">
												<button type="submit" class="btn btn-primary w-100 mb-0">로그인</button>
											</div>

											<!-- Id/Pwd 찾기, 회원가입입 -->
											<div class="mb-3 text-center">
												<a href="html 없음">아이디 찾기&nbsp;&nbsp;</a>| <a
													href="forgot-password.html">&nbsp;비밀번호 찾기&nbsp;&nbsp;</a>|
												<a href="sign-up.html">&nbsp;회원가입</a> <br>
												<br>
												<br>
												<br>
											</div>
										</form>
										<!-- Form END -->
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- =======================Main Content END -->

	</main>
	<!-- **************** MAIN CONTENT END **************** -->
	<!-- footerScript -->
	<%@ include file="/WEB-INF/views/include/footerScript.jsp"%>

</body>
</html>