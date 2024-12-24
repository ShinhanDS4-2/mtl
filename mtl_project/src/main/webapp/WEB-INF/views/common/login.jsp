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
					<div class="row g-0 w-450px">
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
									<!-- Email -->
									<div class="form-floating mb-3">
										<input type="email" class="form-control" id="email" placeholder="이메일 (example@gmail.com)">
										<label for="email" class="form-label">이메일</label>
									</div>
									<!-- Password -->
									<div class="form-floating mb-2 position-relative">
										<input class="form-control" type="password" id="pw" placeholder="비밀번호">
										<label class="form-label" for="pw">비밀번호</label>
									</div>
									<!-- 비밀번호 찾기 -->
									<div class="mb-1 d-sm-flex justify-content-center small">
										<a href="#" class="text-secondary" data-bs-toggle="modal" data-bs-target="#findPwModal">비밀번호 찾기</a>
									</div>
									<!-- 회원가입 -->
									<div class="mb-4 d-sm-flex justify-content-center small">
										<a href="join" class="text-secondary">회원가입</a>
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

<!-- 비밀번호 찾기 모달 -->
<div class="modal fade" id="findPwModal" tabindex="-1" aria-labelledby="findPwLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content p-0">

			<!-- Title -->
			<div class="modal-header p-3">
				<h5 class="modal-title mb-0" id="findPwLabel">비밀번호 찾기</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>

			<!-- Modal body -->
			<div class="modal-body p-0">
				<div class="card bg-transparent p-3">
					<div class="card-body">
						<div class="alert alert-secondary" role="alert">
							가입 시 작성했던 이메일과 이름을 기입해 주세요.<br>
							이메일로 임시 비밀번호를 발송해 드립니다.
						</div>
						<div class="d-flex mt-2 form-floating">
							<input type="email" class="form-control" placeholder="이메일을 작성해 주세요." id="findPwEmail">
							<label for="findPwEmail">이메일</label>
						</div>
						<div class="d-flex mt-2 form-floating">
							<input type="text" class="form-control" placeholder="이름을 작성해 주세요." id="findPwName">
							<label for="findPwName">이름</label>
						</div>
						<div class="d-grid gap-2 mt-3">
							<button class="btn btn-primary px-4 mb-0 flex-shrink-0">임시 비밀번호 발송</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 비밀번호 찾기 모달 -->


<!-- footerScript -->
<%@ include file="/WEB-INF/views/include/footerScript.jsp" %>

<!-- page script -->
<script src="js/common/login.js"></script>
<script type="text/javascript">
	login.init();
</script>
</body>
</html>