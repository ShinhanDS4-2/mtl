<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>[판매자] 비밀번호 찾기</title>

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
										<img src="assets/images/element/forgot-pass.svg" alt="">
									</div>
									<!-- Divider -->
									<div class="vr opacity-1 d-none d-lg-block"></div>
								</div>

								<!-- Information -->
								<div class="col-lg-6 order-1">
									<div class="p-4 p-sm-7">
										<!-- Logo -->
										<a href="index.html"> <img class="mb-4 h-50px"
											src="assets/images/logo-icon.svg" alt="logo">
										</a>
										<!-- Title -->
										<h1 class="mb-2 h3">비밀번호 찾기</h1>
										<p class="mb-sm-0">계정과 연결된 이메일 주소를 입력하세요.</p>

										<!-- Form START -->
										<form class="mt-sm-4 text-start">
											<!-- Email -->
											<div class="mb-3">
												<label class="form-label">아이디</label> <input type="email"
													class="form-control" placeholder="아이디를 입력하세요">
											</div>



											<!-- Button -->
											<div class="mb-2 d-grid">
												<button type="submit" class="btn btn-primary">비밀번호
													초기화/찾기</button>
											</div>
											<div class="mb-3 text-center">
												<p>
													<a href="sign-in.html">로그인</a>으로 돌아가기
												</p>
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