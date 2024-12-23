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
<!-- main -->
<main>
<section class="vh-xxl-100">
	<div class="container h-100 d-flex px-0 px-sm-4">
		<div class="row justify-content-center align-items-center m-auto">
			<div class="col-12">
				<div class="bg-mode shadow rounded-3 overflow-hidden">
					<div class="row g-0 w-550px">
						<!-- Information -->
						<div class="col-lg-12 order-1">
							<div class="p-2 p-sm-7">
								<div class="text-center">
									<!-- Logo -->
									<a href="/mtl/">
										<img class="h-80px mb-4" src="assets/images/logo-130.png" alt="logo">
									</a>
								</div>
								<!-- Form START -->
								<form class="mt-0 text-start">
									<!-- 이메일 -->
									<div class="mb-2">
										<label class="form-label" for="joinEmail">이메일 <span class="text-danger">*</span></label>
										<input type="email" class="form-control" id="joinEmail" placeholder="abc@address.com">
										<div class="d-grid gap-2 mt-2">
											<button class="btn btn-primary-soft" type="button">이메일 인증</button>
										</div>
									</div>
									<!-- 인증번호 확인 -->
									<div class="mb-2">
										<label class="form-label" for="authNum">이메일 <span class="text-danger">*</span></label>
										<div class="row">
											<div class="col-8">
												<input type="email" class="form-control" id="authNum" placeholder="인증번호를 입력해 주세요.">
											</div>
											<div class="col-4">
												<div class="d-grid">
													<button class="btn btn-primary-soft" type="button">인증 확인</button>
												</div>
											</div>
										</div>
									</div>
									<!-- 비밀번호 -->
									<div class="mb-2">
										<label class="form-label" for="joinPw">비밀번호 <span class="text-danger">*</span></label>
										<input type="password" class="form-control" id="joinPw" placeholder="영문, 숫자, 특수문자를 조합하여 최소 8자리 이상">
										<span class="text-danger smaller">올바른 비밀번호를 입력해 주세요.</span>
									</div>
									<!-- 비밀번호 확인 -->
									<div class="mb-2">
										<label class="form-label" for="joinPwCheck">비밀번호 확인 <span class="text-danger">*</span></label>
										<input type="password" class="form-control" id="joinPwCheck" placeholder="비밀번호를 다시 입력해 주세요.">
										<span class="text-danger smaller" hidden>비밀번호가 일치하지 않습니다.</span>
									</div>
									
									
									
									
									
									<!-- Remember me -->
									<div class="mb-4 d-sm-flex justify-content-between small">
										<a href="forgot-password.html" class="text-secondary">아이디 찾기</a>
										|
										<a href="forgot-password.html" class="text-secondary">비밀번호 찾기</a>
										|
										<a href="common/join" class="text-secondary">회원가입</a>
									</div>
									<!-- Button -->
									<div><button type="submit" class="btn btn-primary w-100 mb-0">로그인</button></div>
		
									<!-- Divider -->
									<div class="position-relative my-4">
										<hr>
										<p class="small bg-mode position-absolute top-50 start-50 translate-middle px-2">Or sign in with</p>
									</div>
		
									<!-- Google and facebook button -->
									<div class="vstack gap-3">
										<a href="#" class="btn btn-light mb-0"><i class="fab fa-fw fa-google text-google-icon me-2"></i>Sign in with Google</a>
										<a href="#" class="btn btn-light mb-0"><i class="fab fa-fw fa-facebook-f text-facebook me-2"></i>Sign in with Facebook</a>
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
</main>

<!-- footerScript -->
<%@ include file="/WEB-INF/views/include/footerScript.jsp" %>

<!-- page script -->
<script src="js/common/login.js"></script>
<script type="text/javascript">
	login.init();
</script>
</body>
</html>