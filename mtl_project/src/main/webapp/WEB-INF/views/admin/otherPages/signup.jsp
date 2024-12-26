<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>[관리자]회원가입</title>

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
									class="col-lg-6 d-md-flex align-items-center order-2 order-lg-1">
									<div class="p-3 p-lg-5">
										<img src="assets/images/element/signin.svg" alt="">
									</div>
									<!-- Divider -->
									<div class="vr opacity-1 d-none d-lg-block"></div>
								</div>

								<!-- Information -->
								<div class="col-lg-6 order-1">
									<div class="p-4 p-sm-6">
										<!-- Logo -->
										<a href="index.html"> <img class="h-50px mb-4"
											src="assets/images/logo-icon.svg" alt="logo">
										</a>
										<!-- Title -->
										<h1 class="mb-4 h4 text-center">판매자 회원가입</h1>

										<!-- Form START -->
										<form class="mt-4 text-start">
											<!-- Email -->
											<div class="mb-3">
												<label class="form-label">대표 이메일</label>
												<div class="mb-2 d-flex align-items-center">
													<input type="email" class="form-control me-2"
														style="flex: 1;">
													<button type="button" class="btn btn-primary">중복
														확인</button>
												</div>
												<div class="mb-3">
													<button type="button" class="btn btn-primary w-100 mb-0">이메일
														인증</button>
												</div>
												<!-- Email 인증번호  -->
												<label class="form-label">인증번호</label>
												<div class="mb-2 d-flex align-items-center">
													<input type="email" class="form-control me-2"
														style="flex: 1;" placeholder="인증번호를 입력해주세요.">
													<button type="button" class="btn btn-primary">인증
														확인</button>
												</div>
											</div>

											<!-- Password -->
											<div class="mb-3 position-relative">
												<label class="form-label">비밀번호</label> <input
													class="form-control fakepassword" type="password"
													id="psw-input" placeholder="영문, 숫자, 특문 조합 최소 8자리 이상">
												<span
													class="position-absolute top-50 end-0 translate-middle-y p-0 mt-3">
													<i
													class="fakepasswordicon fas fa-eye-slash cursor-pointer p-2"></i>
												</span>
											</div>
											<!-- Confirm Password -> 여기 비밀번호 보기가 안댐-->
											<div class="mb-3 position-relative">
												<label class="form-label">비밀번호 확인</label> <input
													class="form-control fakepassword" type="password"
													id="psw-input"> <span
													class="position-absolute top-50 end-0 translate-middle-y p-0 mt-3">
													<i
													class="fakepasswordicon fas fa-eye-slash cursor-pointer p-2"></i>
												</span>
											</div>

											<!-- 업체명 -->
											<div class="mb-3">
												<label class="form-label">업체명</label> <input type="text"
													class="form-control">
											</div>

											<!-- 사업자명 -->
											<div class="mb-3">
												<label class="form-label">사업자명</label> <input type="text"
													class="form-control">
											</div>

											<!-- 사업자 등록 번호 -->
											<div class="mb-3">
												<label class="form-label">사업자 등록 번호</label> <input
													type="text" class="form-control">
											</div>

											<!-- 업체 연락처 -->
											<div class="mb-3">
												<label class="form-label">업체 연락처</label> <input type="text"
													class="form-control">
											</div>
											<!-- 사업자 연락처 -->
											<div class="mb-3">
												<label class="form-label">사업자 연락처</label> <input type="text"
													class="form-control">
											</div>

											<!-- Button -->
											<div>
												<button type="submit" class="btn btn-primary w-100 mb-0">회원가입</button>
											</div>
											<br>
											<br>
											<br>
											<br>

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
		<!-- =======================
Main Content END -->

	</main>
	<!-- **************** MAIN CONTENT END **************** -->
	<!-- footerScript -->
	<%@ include file="/WEB-INF/views/include/footerScript.jsp"%>

</body>
</html>