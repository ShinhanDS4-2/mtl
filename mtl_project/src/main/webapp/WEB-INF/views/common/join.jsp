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
										<div class="row">
											<div class="col-8 pe-1">
												<input type="email" class="form-control" id="joinEmail" placeholder="abc@address.com">
											</div>
											<div class="col-4 ps-1">
												<div class="d-grid">
													<button class="btn btn-primary" type="button" data-src="join" data-act="clickEmailCheck">중복 확인</button>
												</div>
											</div>
										</div>
										<div class="d-grid gap-2 mt-2">
											<!-- <button class="btn btn-primary-soft" type="button">이메일 인증</button> -->
										</div>
									</div>
									<!-- 인증번호 확인 -->
									<!--
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
									-->
									
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
													<%
														for (int year = 1970; year <= 2025; year++) {
															out.print("<option>" + year + "</option>");
														}
													%>
												</select> 년
											</div>
											<div class="col-4 pe-0 ps-0">
												<select class="form-select d-inline w-75" id="joinBirthMonth">
													<option value="" selected disabled="disabled">월</option>
													<%
														for (int month = 1; month <= 12; month++) {
															out.print("<option>" + String.format("%02d", month) + "</option>");
														}
													%>
												</select> 월
											</div>
											<div class="col-4 pe-0 ps-0">
												<select class="form-select d-inline w-75" id="joinBirthDay">
													<option value="" selected disabled="disabled">일</option>
													<%
														for (int day = 1; day <= 31; day++) {
															out.print("<option>" + String.format("%02d", day) + "</option>");
														}
													%>
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
									<div><button type="button" class="btn btn-primary w-100 mb-2" data-src="join" data-act="clickJoin">회원가입</button></div>
									<div><a href="login" type="button" class="btn btn-primary-soft w-100 mb-0">로그인</a></div>
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
<script src="/mtl/js/common/join.js"></script>
<script type="text/javascript">
	join.init();
</script>
</body>
</html>