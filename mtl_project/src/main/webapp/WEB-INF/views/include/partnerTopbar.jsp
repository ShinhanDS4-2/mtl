<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>
<!-- Top bar START -->
<nav class="navbar top-bar navbar-light py-0 py-xl-3">
	<div class="container-fluid p-0">
		<div class="d-flex align-items-center w-100">

			<!-- Logo START -->
			<div class="d-flex align-items-center d-xl-none">
				<a class="navbar-brand" href="javascript:;" data-src="partnerTopbar" data-act="clickLogo"> 
				<img class="navbar-brand-item h-40px" src="assets/images/logo-icon.svg" alt="">
				</a>
			</div>
			<!-- Logo END -->

			<!-- Toggler for sidebar START  =>  작은화면에서 사이드바 펼쳐지도록 하는 햄버거 버튼 -->
			<div class="navbar-expand-xl sidebar-offcanvas-menu">
				<button class="navbar-toggler me-auto p-2" type="button"
					data-bs-toggle="offcanvas" data-bs-target="#offcanvasSidebar"
					aria-controls="offcanvasSidebar" aria-expanded="false"
					aria-label="Toggle navigation" data-bs-auto-close="outside">
					<i class="bi bi-list text-primary fa-fw"
						data-bs-target="#offcanvasMenu"></i>
				</button>
			</div>
			<!-- Toggler for sidebar END -->

			<!-- Top bar left START / 지우면 XX-->
			<div class="navbar-expand-lg ms-auto ms-xl-0"></div>
			<!-- Top bar left END -->

			<!-- Top bar right START -->
			<ul class="nav flex-row align-items-center list-unstyled ms-xl-auto">

				<!-- 프로필 드롭다운 START -->
				<li class="nav-item ms-3 dropdown"><a
					class="text-dark fw-bold p-1" href="/mtl/partner/hotelregist" id="profileDropdown"
					role="button" data-bs-auto-close="outside" data-bs-display="static"
					data-bs-toggle="dropdown" aria-expanded="false">${login_partner_name } 님 </a>
					<ul
						class="dropdown-menu dropdown-animation dropdown-menu-end shadow pt-3"
						aria-labelledby="profileDropdown">
						<!-- Profile info -->
						<li class="px-3 mb-3">
							<div class="d-flex align-items-center">

								<div>
									<a class="h6 mt-2 mt-sm-0" href="/mtl/partner/hotelregist">${login_partner_name }</a>
									<p class="small m-0">${login_partner_email }</p>
									<!-- 아이디 들어오는 곳 -->
								</div>
							</div>
						</li>

						<!-- Links -->
						<li>
							<hr class="dropdown-divider">
						</li>
						<li><a class="dropdown-item" href="/mtl/partner/mypage"><i
								class="bi bi-heart fa-fw me-2"></i>마이페이지</a></li>
						<li><a class="dropdown-item" href="javascript:;" data-src="partnerTopbar" data-act="clickLogoutBtn"><i
								class="bi bi-power fa-fw me-2"></i>로그아웃</a></li>
					</ul></li>
				<!-- 프로필 드롭다운 END -->


			</ul>
			<!-- Top bar right END -->
		</div>
	</div>
</nav>
<!-- Top bar END -->