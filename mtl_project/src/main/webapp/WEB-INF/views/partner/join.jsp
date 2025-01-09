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
	<section class="vh-xxl-100">
		<div class="container h-100 d-flex px-0 px-sm-4">
			<div class="row justify-content-center align-items-center m-auto">
				<div class="col-12">
					<div class="bg-mode shadow rounded-3 overflow-hidden">
						<div class="row g-0 w-550px">
							<!-- Information -->
							<div class="col-lg-12 order-1">
								<div class="p-4 p-sm-6">
									<div class="text-center">
										<!-- Logo -->
										<a href="/mtl/">
											<img class="h-80px mb-3" src="assets/images/logo-130.png" alt="logo">
										</a>
										<p class="h4">판매자 회원가입</p>
									</div>
									<!-- Form START -->
									<form class="mt-4 text-start">
										<!-- Email -->
										<div class="mb-1">
											<label class="form-label" for="joinEmail">대표 이메일 <span class="text-danger">*</span></label>
											<div class="row">
												<div class="col-8 pe-1">
													<input type="email" class="form-control" id="joinEmail" placeholder="이메일을 입력해 주세요.">
												</div>
												<div class="col-4 ps-1">
													<div class="d-grid">
														<button id="dupleBtn" class="btn btn-primary" type="button" data-src="join" data-act="clickEmailCheck" data-check="0">중복 확인</button>
													</div>
												</div>
											</div>
										</div>
										<div class="mb-3">
											<button type="button" class="btn btn-primary-soft w-100 mb-0" data-src="join" data-act="clickSendMail">이메일 인증</button>
										</div>
										<!-- Email 인증번호  -->
										<label class="form-label">인증번호 <span class="text-danger">*</span></label>
										<div class="mb-2 d-flex align-items-center">
											<input type="text" class="form-control me-2" id="authNum"  style="flex: 1;" placeholder="인증번호를 입력해주세요."  data-auth-check="0">
											<button type="button" class="btn btn-primary" data-src="join" data-act="clickAuthCheck">인증 확인</button>
										</div>

										<!-- 비밀번호 -->
										<div class="mb-2">
											<label class="form-label" for="joinPw">비밀번호 <span class="text-danger">*</span></label>
											<input type="password" class="form-control" id="joinPw" placeholder="영문, 숫자, 특수문자를 조합하여 최소 8자리 이상">
											<!-- <span class="text-danger smaller">올바른 비밀번호를 입력해 주세요.</span> -->
										</div>
										<!-- 비밀번호 확인 -->
										<div class="mb-2">
											<label class="form-label" for="joinPwCheck">비밀번호 확인 <span class="text-danger">*</span></label>
											<input type="password" class="form-control" id="joinPwCheck" placeholder="비밀번호를 다시 입력해 주세요.">
											<span class="text-danger smaller" hidden>비밀번호가 일치하지 않습니다.</span>
										</div>

										<!-- 업체명 -->
										<div class="mb-2">
											<label class="form-label">업체명 <span class="text-danger">*</span></label>
											<input type="text" class="form-control" id="joinName">
										</div>

										<!-- 사업자명 -->
										<div class="mb-2">
											<label class="form-label">사업자명 <span class="text-danger">*</span></label> 
											<input type="text" class="form-control" id="joinBusiness_Name">
										</div>

										<!-- 사업자 등록 번호 -->
										<div class="mb-2">
											<label class="form-label">사업자 등록 번호 <span class="text-danger">*</span></label>
											<input type="text" class="form-control" id="joinBusiness_Number">
										</div>

										<!-- 업체 연락처 -->
										<div class="mb-2">
											<label class="form-label">업체 연락처 <span class="text-danger">*</span></label>
											<input type="text" class="form-control" id="joinPhone">
										</div>
										<!-- 사업자 연락처 -->
										<div class="mb-4">
											<label class="form-label">사업자 연락처 <span class="text-danger">*</span></label>
											<input type="text" class="form-control" id="joinBusiness_Phone">
										</div>
										<!-- Button -->
										<div><button type="button" class="btn btn-primary w-100 mb-2" data-src="join" data-act="clickJoin">회원가입</button></div>
										<div><a href="partner/login" type="button" class="btn btn-primary-soft w-100 mb-0">로그인</a></div>
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
<%@ include file="/WEB-INF/views/include/footerScript.jsp"%>

<!-- page script -->
<script src="/mtl/js/partner/join.js"></script>
<script type="text/javascript">
	join.init();
</script>
</body>
</html>