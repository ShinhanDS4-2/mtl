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
<section>
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
										<img class="h-80px mb-3" src="assets/images/logo-130.png" alt="logo">
									</a>
									<p class="h4">회원가입</p>
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
									<div class="mb-3">
										<label class="form-label" for="authNum">이메일 인증번호 <span class="text-danger">*</span></label>
										<div class="row">
											<div class="col-8 pe-1">
												<input type="email" class="form-control" id="authNum" placeholder="인증번호를 입력해 주세요.">
											</div>
											<div class="col-4 ps-1">
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
									<!-- 이름 -->
									<div class="mb-2">
										<label class="form-label" for="joinName">이름 <span class="text-danger">*</span></label>
										<input type="text" class="form-control" id="joinName" placeholder="이름을 입력해 주세요.">
									</div>
									<!-- 생년월일 -->
									<div class="mb-2">
										<label class="form-label" for="joinBirthYear">생년월일 <span class="text-danger">*</span></label>
										<div class="row">
											<div class="col-4 pe-0">
												<select class="form-select d-inline w-75" id="joinBirthYear">
													<option value="" selected disabled="disabled">연도</option>
													<option>1970</option>
													<option>1971</option>
													<option>1972</option>
												</select> 년
											</div>
											<div class="col-4 pe-0 ps-0">
												<select class="form-select d-inline w-75" id="joinBirthMonth">
													<option value="" selected disabled="disabled">월</option>
													<option>01</option>
													<option>02</option>
													<option>03</option>
													<option>04</option>
													<option>05</option>
													<option>06</option>
													<option>07</option>
													<option>08</option>
													<option>09</option>
													<option>10</option>
													<option>11</option>
													<option>12</option>
												</select> 월
											</div>
											<div class="col-4 pe-0 ps-0">
												<select class="form-select d-inline w-75" id="joinBirthDay">
													<option value="" selected disabled="disabled">일</option>
													<option>01</option>
													<option>02</option>
													<option>03</option>
												</select> 일
											</div>
										</div>
									</div>
									<!-- 연락처 -->
									<div class="mb-4">
										<label class="form-label" for="joinPhone">연락처 <span class="text-danger">*</span></label>
										<input type="text" class="form-control" id="joinPhone" placeholder="010-1234-1234">
									</div>
									
									<!-- Button -->
									<div><button type="button" class="btn btn-primary w-100 mb-0">회원가입</button></div>
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