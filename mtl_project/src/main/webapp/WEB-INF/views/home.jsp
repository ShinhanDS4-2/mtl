<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>떠날지도</title>

	<!-- Meta Tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="author" content="Webestica.com">
	<meta name="description" content="Booking - Multipurpose Online Booking Theme">

	<!-- Favicon -->
	<link rel="shortcut icon" href="assets/images/favicon.ico">

	<!-- Google Font -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;500;700&family=Poppins:wght@400;500;700&display=swap">

	<!-- Plugins CSS -->
	<link rel="stylesheet" type="text/css" href="assets/vendor/font-awesome/css/all.min.css">
	<link rel="stylesheet" type="text/css" href="assets/vendor/bootstrap-icons/bootstrap-icons.css">
	<link rel="stylesheet" type="text/css" href="assets/vendor/tiny-slider/tiny-slider.css">
	<link rel="stylesheet" type="text/css" href="assets/vendor/glightbox/css/glightbox.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/choices.js/public/assets/styles/base.min.css"/>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/choices.js/public/assets/styles/choices.min.css"/>
	<link rel="stylesheet" type="text/css" href="assets/vendor/flatpickr/css/flatpickr.min.css">

	<!-- Theme CSS -->
	<link rel="stylesheet" type="text/css" href="assets/css/style.css">
</head>

<body>

<!-- Header START -->
<header class="navbar-light header-sticky">
	<!-- Logo Nav START -->
	<nav class="navbar navbar-expand-xl">
		<div class="container">
			<!-- Logo START -->
			<a class="navbar-brand" href="index.html">
				<img class="light-mode-item navbar-brand-item" src="assets/images/logo.svg" alt="logo">
				<img class="dark-mode-item navbar-brand-item" src="assets/images/logo-light.svg" alt="logo">
			</a>
			<!-- Logo END -->

			<!-- Responsive navbar toggler -->
			<button class="navbar-toggler ms-auto ms-sm-0 p-0 p-sm-2" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-animation">
					<span></span>
					<span></span>
					<span></span>
				</span>
        <span class="d-none d-sm-inline-block small">Menu</span>
			</button>

			<!-- Responsive category toggler -->
			<button class="navbar-toggler ms-sm-auto mx-3 me-md-0 p-0 p-sm-2" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCategoryCollapse" aria-controls="navbarCategoryCollapse" aria-expanded="false" aria-label="Toggle navigation">
				<i class="bi bi-grid-3x3-gap-fill fa-fw"></i><span class="d-none d-sm-inline-block small">Category</span>
			</button>

			<!-- Main navbar START -->
			<div class="navbar-collapse collapse" id="navbarCollapse">
				<ul class="navbar-nav navbar-nav-scroll me-auto">

					<!-- Nav item Listing -->
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#" id="listingMenu" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Listings</a>
						<ul class="dropdown-menu" aria-labelledby="listingMenu">
							<li> <a class="dropdown-item" href="#">메뉴 1-1</a></li>
							<li> <a class="dropdown-item" href="#">메뉴 1-2</a></li>
							<li> <a class="dropdown-item" href="#">메뉴 1-3</a></li>
						</ul>
					</li>

					<!-- Nav item Pages -->
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#" id="pagesMenu" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Pages</a>
						<ul class="dropdown-menu" aria-labelledby="pagesMenu">
							<li> <a class="dropdown-item" href="#">메뉴 2-1</a></li>
							<li> <a class="dropdown-item" href="#">메뉴 2-2</a></li>
							<li> <a class="dropdown-item" href="#">메뉴 2-3</a></li>
						</ul>
					</li>

					<!-- Nav item Account -->
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#" id="accounntMenu" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Accounts</a>
						<ul class="dropdown-menu" aria-labelledby="accounntMenu">
							<li> <a class="dropdown-item" href="#">메뉴 3-1</a></li>
							<li> <a class="dropdown-item" href="#">메뉴 3-2</a></li>
							<li> <a class="dropdown-item" href="#">메뉴 3-3</a></li>
						</ul>
					</li>
				</ul>
			</div>
			<!-- Main navbar END -->

			<!-- Nav category menu START -->
			<div class="navbar-collapse collapse" id="navbarCategoryCollapse">
				<ul class="navbar-nav navbar-nav-scroll nav-pills-primary-soft text-center ms-auto p-2 p-xl-0">
					<!-- Nav item Hotel -->
					<li class="nav-item"> <a class="nav-link" href="index.html"><i class="fa-solid fa-hotel me-2"></i>Hotel</a>	</li>

					<!-- Nav item Flight -->
					<li class="nav-item"> <a class="nav-link" href="index-flight.html"><i class="fa-solid fa-plane me-2"></i>Flight</a>	</li>

					<!-- Nav item Tour -->
					<li class="nav-item"> <a class="nav-link active" href="index-tour.html"><i class="fa-solid fa-globe-americas me-2"></i>Tour</a> </li>

					<!-- Nav item Cabs -->
					<li class="nav-item"> <a class="nav-link" href="index-cab.html"><i class="fa-solid fa-car me-2"></i>Cab</a></li>
				</ul>
			</div>
			<!-- Nav category menu END -->

			<!-- Profile and Notification START -->
			<ul class="nav flex-row align-items-center list-unstyled ms-xl-auto">

				<!-- Notification dropdown START -->
				<li class="nav-item dropdown ms-0 ms-md-3">
					<!-- Notification button -->
					<a class="nav-notification btn btn-light p-0 mb-0" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false" data-bs-auto-close="outside">
						<i class="bi bi-bell fa-fw"></i>
					</a>
					<!-- Notification dote -->
					<span class="notif-badge animation-blink"></span>

					<!-- Notification dropdown menu START -->
					<div class="dropdown-menu dropdown-animation dropdown-menu-end dropdown-menu-size-md shadow-lg p-0">
						<div class="card bg-transparent">
							<!-- Card header -->
							<div class="card-header bg-transparent d-flex justify-content-between align-items-center border-bottom">
								<h6 class="m-0">Notifications <span class="badge bg-danger bg-opacity-10 text-danger ms-2">4 new</span></h6>
								<a class="small" href="#">Clear all</a>
							</div>

							<!-- Card body START -->
							<div class="card-body p-0">
								<ul class="list-group list-group-flush list-unstyled p-2">
									<!-- Notification item -->
									<li>
										<a href="#" class="list-group-item list-group-item-action rounded notif-unread border-0 mb-1 p-3">
											<h6 class="mb-2">New! Booking flights from New York ✈️</h6>
											<p class="mb-0 small">Find the flexible ticket on flights around the world. Start searching today</p>
											<span>Wednesday</span>
										</a>
									</li>
									<!-- Notification item -->
									<li>
										<a href="#" class="list-group-item list-group-item-action rounded border-0 mb-1 p-3">
											<h6 class="mb-2">Sunshine saving are here 🌞 save 30% or more on a stay</h6>
											<span>15 Nov 2022</span>
										</a>
									</li>
								</ul>
							</div>
							<!-- Card body END -->

							<!-- Card footer -->
							<div class="card-footer bg-transparent text-center border-top">
								<a href="#" class="btn btn-sm btn-link mb-0 p-0">See all incoming activity</a>
							</div>
						</div>
					</div>
					<!-- Notification dropdown menu END -->
				</li>
				<!-- Notification dropdown END -->

				<!-- Profile dropdown START -->
				<li class="nav-item ms-3 dropdown">
					<!-- Avatar -->
					<a class="avatar avatar-sm p-0" href="#" id="profileDropdown" role="button" data-bs-auto-close="outside" data-bs-display="static" data-bs-toggle="dropdown" aria-expanded="false">
						<img class="avatar-img rounded-2" src="assets/images/avatar/01.jpg" alt="avatar">
					</a>

					<ul class="dropdown-menu dropdown-animation dropdown-menu-end shadow pt-3" aria-labelledby="profileDropdown">
						<!-- Profile info -->
						<li class="px-3 mb-3">
							<div class="d-flex align-items-center">
								<!-- Avatar -->
								<div class="avatar me-3">
									<img class="avatar-img rounded-circle shadow" src="assets/images/avatar/01.jpg" alt="avatar">
								</div>
								<div>
									<a class="h6 mt-2 mt-sm-0" href="#">Lori Ferguson</a>
									<p class="small m-0">example@gmail.com</p>
								</div>
							</div>
						</li>

						<!-- Links -->
						<li> <hr class="dropdown-divider"></li>
						<li><a class="dropdown-item" href="#"><i class="bi bi-bookmark-check fa-fw me-2"></i>My Bookings</a></li>
						<li><a class="dropdown-item" href="#"><i class="bi bi-heart fa-fw me-2"></i>My Wishlist</a></li>
						<li><a class="dropdown-item" href="#"><i class="bi bi-gear fa-fw me-2"></i>Settings</a></li>
						<li><a class="dropdown-item" href="#"><i class="bi bi-info-circle fa-fw me-2"></i>Help Center</a></li>
						<li><a class="dropdown-item bg-danger-soft-hover" href="#"><i class="bi bi-power fa-fw me-2"></i>Sign Out</a></li>
						<li> <hr class="dropdown-divider"></li>

						<!-- Dark mode options START -->
						<li>
							<div class="nav-pills-primary-soft theme-icon-active d-flex justify-content-between align-items-center p-2 pb-0">
								<span>Mode:</span>
								<button type="button" class="btn btn-link nav-link text-primary-hover mb-0 p-0" data-bs-theme-value="light" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-title="Light">
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-sun fa-fw mode-switch" viewBox="0 0 16 16">
										<path d="M8 11a3 3 0 1 1 0-6 3 3 0 0 1 0 6zm0 1a4 4 0 1 0 0-8 4 4 0 0 0 0 8zM8 0a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-1 0v-2A.5.5 0 0 1 8 0zm0 13a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-1 0v-2A.5.5 0 0 1 8 13zm8-5a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1 0-1h2a.5.5 0 0 1 .5.5zM3 8a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1 0-1h2A.5.5 0 0 1 3 8zm10.657-5.657a.5.5 0 0 1 0 .707l-1.414 1.415a.5.5 0 1 1-.707-.708l1.414-1.414a.5.5 0 0 1 .707 0zm-9.193 9.193a.5.5 0 0 1 0 .707L3.05 13.657a.5.5 0 0 1-.707-.707l1.414-1.414a.5.5 0 0 1 .707 0zm9.193 2.121a.5.5 0 0 1-.707 0l-1.414-1.414a.5.5 0 0 1 .707-.707l1.414 1.414a.5.5 0 0 1 0 .707zM4.464 4.465a.5.5 0 0 1-.707 0L2.343 3.05a.5.5 0 1 1 .707-.707l1.414 1.414a.5.5 0 0 1 0 .708z"/>
										<use href="#"></use>
									</svg>
								</button>
								<button type="button" class="btn btn-link nav-link text-primary-hover mb-0 p-0" data-bs-theme-value="dark" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-title="Dark">
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-moon-stars fa-fw mode-switch" viewBox="0 0 16 16">
										<path d="M6 .278a.768.768 0 0 1 .08.858 7.208 7.208 0 0 0-.878 3.46c0 4.021 3.278 7.277 7.318 7.277.527 0 1.04-.055 1.533-.16a.787.787 0 0 1 .81.316.733.733 0 0 1-.031.893A8.349 8.349 0 0 1 8.344 16C3.734 16 0 12.286 0 7.71 0 4.266 2.114 1.312 5.124.06A.752.752 0 0 1 6 .278zM4.858 1.311A7.269 7.269 0 0 0 1.025 7.71c0 4.02 3.279 7.276 7.319 7.276a7.316 7.316 0 0 0 5.205-2.162c-.337.042-.68.063-1.029.063-4.61 0-8.343-3.714-8.343-8.29 0-1.167.242-2.278.681-3.286z"/>
										<path d="M10.794 3.148a.217.217 0 0 1 .412 0l.387 1.162c.173.518.579.924 1.097 1.097l1.162.387a.217.217 0 0 1 0 .412l-1.162.387a1.734 1.734 0 0 0-1.097 1.097l-.387 1.162a.217.217 0 0 1-.412 0l-.387-1.162A1.734 1.734 0 0 0 9.31 6.593l-1.162-.387a.217.217 0 0 1 0-.412l1.162-.387a1.734 1.734 0 0 0 1.097-1.097l.387-1.162zM13.863.099a.145.145 0 0 1 .274 0l.258.774c.115.346.386.617.732.732l.774.258a.145.145 0 0 1 0 .274l-.774.258a1.156 1.156 0 0 0-.732.732l-.258.774a.145.145 0 0 1-.274 0l-.258-.774a1.156 1.156 0 0 0-.732-.732l-.774-.258a.145.145 0 0 1 0-.274l.774-.258c.346-.115.617-.386.732-.732L13.863.1z"/>
										<use href="#"></use>
									</svg>
								</button>
								<button type="button" class="btn btn-link nav-link text-primary-hover mb-0 p-0 active" data-bs-theme-value="auto" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-title="Auto">
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-circle-half fa-fw mode-switch" viewBox="0 0 16 16">
										<path d="M8 15A7 7 0 1 0 8 1v14zm0 1A8 8 0 1 1 8 0a8 8 0 0 1 0 16z"/>
										<use href="#"></use>
									</svg>
								</button>
							</div>
						</li> 
						<!-- Dark mode options END-->
					</ul>
				</li>
				<!-- Profile dropdown END -->
			</ul>
			<!-- Profile and Notification START -->

		</div>
	</nav>
	<!-- Logo Nav END -->
</header>
<!-- Header END -->

<!-- **************** MAIN CONTENT START **************** -->
<main>
	
<!-- =======================
Main Banner START -->
<section class="pt-0">
	<div class="container position-relative">
		<!-- Bg image -->
		<div class="rounded-3 p-4 p-sm-5" style="background-image: url(assets/images/bg/02.jpg); background-position: center center; background-repeat: no-repeat; background-size: cover;">
			<!-- Banner title -->
			<div class="row justify-content-between pt-0 pb-5"> 
				<div class="col-md-7 col-lg-8 col-xxl-7 pb-5 mb-0 mb-lg-5"> 
					<h1 class="text-white">Life Is Adventure Make The Best Of It</h1>
					<p class="text-white mb-0">Planning for a trip? we will organize your best trip with the best destination and within the best budgets!</p>
				</div>

				<!-- Produce item START -->
				<div class="col-md-5 col-lg-4 col-xl-3 mb-3 mb-sm-0">
					<div class="card shadow p-2 pb-0">
						<!-- Offer badge -->
						<div class="position-absolute top-0 start-0 mt-n3 ms-n3 z-index-9">
							<img src="assets/images/element/05.svg" class="position-relative h-70px" alt="">
							<span class="h5 text-white position-absolute top-50 start-50 translate-middle">40%</span>
						</div>

						<div class="rounded-3 overflow-hidden position-relative">
							<!-- Image -->
							<img src="assets/images/category/tour/05.jpg" class="card-img" alt="">
							<!-- Overlay -->
							<div class="bg-overlay bg-dark opacity-4"></div>
							
							<!-- Hover element -->
							<div class="card-img-overlay d-flex">
								<h6 class="text-white fw-normal mt-auto mb-0">5 Days / 4 Nights</h6>
							</div>
						</div>
						<!-- Card body -->
						<div class="card-body px-2">
							<!-- Badge and Rating -->
							<div class="d-flex justify-content-between align-items-center mb-2">
								<a href="#" class="badge bg-primary bg-opacity-10 text-primary">Adventure</a>
								<!-- Rating -->
								<h6 class="fw-light m-0"><i class="fa-solid fa-star text-warning me-2"></i>4.5</h6>
							</div>

							<!-- Title -->
							<h6 class="card-title"><a href="#">Maldives Sightseeing & Adventure Tour</a></h6>
							
							<!-- Badge and Price -->
							<div class="d-flex justify-content-between align-items-center mb-0">
								<!-- Price -->
								<h6 class="text-success mb-0">$385 <span class="fw-light">/person</span></h6>
								<span class="text-decoration-line-through mb-0 text-reset">$682</span>
							</div>
						</div>
					</div>
				</div>
				<!-- Produce item END -->
			</div>
		</div>

		<!-- Search START -->
		<div class="row mt-n7">
			<div class="col-11 mx-auto">				
				<!-- Booking from START -->
				<form class="bg-mode shadow rounded-3 p-4">
					<div class="row g-4 align-items-center">

						<div class="col-xl-10">
							<div class="row g-4">
								<!-- Location -->
								<div class="col-md-6 col-lg-4">
									<label class="h6 fw-normal mb-0"><i class="bi bi-geo-alt text-primary me-1"></i>Location</label>
									<!-- Input field -->
									<div class="form-border-bottom form-control-transparent form-fs-lg mt-2">
										<select class="form-select js-choice" data-search-enabled="true">
											<option value="">Select location</option>
											<option>San Jacinto, USA</option>
											<option>North Dakota, Canada</option>
											<option>West Virginia, Paris</option>
										</select>
									</div>
								</div>

								<!-- Check in -->
								<div class="col-md-6 col-lg-4">
									<label class="h6 fw-normal mb-0"><i class="bi bi-calendar text-primary me-1"></i>Date</label>
									<!-- Input field -->
									<div class="form-border-bottom form-control-transparent form-fs-lg mt-2">
										<input type="text" class="form-control flatpickr py-2" data-date-format="d M Y" placeholder="Choose a date">
									</div>
								</div>

								<!-- Guest -->
								<div class="col-md-6 col-lg-4">
									<label class="h6 fw-normal mb-0"><i class="fa-solid fa-person-skating text-primary me-1"></i>Tour type</label>
									<!-- Input field -->
									<div class="form-border-bottom form-control-transparent form-fs-lg mt-2">
										<select class="form-select js-choice" data-search-enabled="true">
											<option value="">Select type</option>
											<option>Adventure</option>
											<option>Beach</option>
											<option>Desert</option>
											<option>History</option>
										</select>
									</div>
								</div>
							</div>
						</div>

						<!-- Button -->
						<div class="col-xl-2">
							<div class="d-grid">
								<a href="#" class="btn btn-lg btn-dark mb-0">Take a Tour</a>
							</div>
						</div>
					</div>
				</form>
				<!-- Booking from END -->
			</div>
		</div>
		<!-- Search END -->
	</div>
</section>
<!-- =======================
Main Banner END -->

<!-- =======================
Packages START -->
<section class="pt-0 pt-md-5">
	<div class="container">
		<!-- Title -->
		<div class="row mb-4">
			<div class="col-12 text-center">
				<h2 class="mb-0">Our Best Packages</h2>
			</div>
		</div>

		<div class="row g-4">
			<!-- Package item -->
			<div class="col-sm-6 col-xl-3">
				<!-- Card START -->
				<div class="card card-img-scale overflow-hidden bg-transparent">
					<div class="card-img-scale-wrapper rounded-3">
						<!-- Card Image -->
						<img src="assets/images/category/tour/04.jpg" class="card-img" alt="">
						<!-- Overlay -->
						<div class="card-img-overlay d-flex flex-column z-index-1 p-4">
							<!-- Card overlay top -->
							<div class="d-flex justify-content-between">
								<span class="badge text-bg-dark">Adventure</span>
								<span class="badge text-bg-white"><i class="fa-solid fa-star text-warning me-2"></i>4.3</span>
							</div>
							<!-- Card overlay bottom -->
							<div class="w-100 mt-auto">
								<!-- Card category -->
								<span class="badge text-bg-white fs-6">6 days / 5 nights</span>
							</div>
						</div>
					</div> 
					
					<!-- Card body -->
					<div class="card-body px-2">
						<!-- Title -->
						<h5 class="card-title"><a href="tour-grid.html" class="stretched-link">Lombok, Indonesia</a></h5>
						<!-- Content -->
						<div class="hstack gap-2">
							<span class="h5 mb-0 text-success">$1385</span>
							<small>Starting price</small>
						</div>
					</div>
				</div>
				<!-- Card END -->
			</div>

			<!-- Package item -->
			<div class="col-sm-6 col-xl-3">
				<!-- Card START -->
				<div class="card card-img-scale overflow-hidden bg-transparent">
					<div class="card-img-scale-wrapper rounded-3">
						<!-- Card Image -->
						<img src="assets/images/category/tour/02.jpg" class="card-img" alt="">
						<!-- Overlay -->
						<div class="card-img-overlay d-flex flex-column z-index-1 p-4">
							<!-- Card overlay top -->
							<div class="d-flex justify-content-between">
								<span class="badge text-bg-dark">History</span>
								<span class="badge text-bg-white"><i class="fa-solid fa-star text-warning me-2"></i>4.5</span>
							</div>
							<!-- Card overlay bottom -->
							<div class="w-100 mt-auto">
								<!-- Card category -->
								<span class="badge text-bg-white fs-6">8 days / 7 nights</span>
							</div>
						</div>
					</div> 
					
					<!-- Card body -->
					<div class="card-body px-2">
						<!-- Title -->
						<h5 class="card-title"><a href="tour-grid.html" class="stretched-link">Northern Lights Escape</a></h5>
						<!-- Content -->
						<div class="hstack gap-2">
							<span class="h5 mb-0 text-success">$2569</span>
							<small>Starting price</small>
						</div>
					</div>
				</div>
				<!-- Card END -->
			</div>

			<!-- Package item -->
			<div class="col-sm-6 col-xl-3">
				<div class="card card-img-scale overflow-hidden bg-transparent">
					<div class="card-img-scale-wrapper rounded-3">
						<!-- Card Image -->
						<img src="assets/images/category/tour/03.jpg" class="card-img" alt="">
						<!-- Overlay -->
						<div class="card-img-overlay d-flex flex-column z-index-1 p-4">
							<!-- Card overlay top -->
							<div class="d-flex justify-content-between">
								<span class="badge text-bg-dark">Desert</span>
								<span class="badge text-bg-white"><i class="fa-solid fa-star text-warning me-2"></i>4.2</span>
							</div>
							<!-- Card overlay bottom -->
							<div class="w-100 mt-auto">
								<!-- Card category -->
								<span class="badge text-bg-white fs-6">9 days / 8 nights</span>
							</div>
						</div>
					</div> 
					
					<!-- Card body -->
					<div class="card-body px-2">
						<!-- Title -->
						<h5 class="card-title"><a href="tour-grid.html" class="stretched-link">Essential Egypt</a></h5>
						<!-- Content -->
						<div class="hstack gap-2">
							<span class="h5 mb-0 text-success">$1885</span>
							<small>Starting price</small>
						</div>
					</div>
				</div>
			</div>

			<!-- Package item -->
			<div class="col-sm-6 col-xl-3">
				<div class="card card-img-scale overflow-hidden bg-transparent">
					<div class="card-img-scale-wrapper rounded-3">
						<!-- Card Image -->
						<img src="assets/images/category/tour/01.jpg" class="card-img" alt="">
						<!-- Overlay -->
						<div class="card-img-overlay d-flex flex-column z-index-1 p-4">
							<!-- Card overlay top -->
							<div class="d-flex justify-content-between">
								<span class="badge text-bg-dark">Beach</span>
								<span class="badge text-bg-white"><i class="fa-solid fa-star text-warning me-2"></i>4.6</span>
							</div>
							<!-- Card overlay bottom -->
							<div class="w-100 mt-auto">
								<!-- Card category -->
								<span class="badge text-bg-white fs-6">9 days / 8 nights</span>
							</div>
						</div>
					</div> 
					
					<!-- Card body -->
					<div class="card-body px-2">
						<!-- Title -->
						<h5 class="card-title"><a href="tour-grid.html" class="stretched-link">Phi Phi Islands</a></h5>
						<!-- Content -->
						<div class="hstack gap-2">
							<span class="h5 text-success mb-0">$3585</span>
							<small>Starting price</small>
						</div>
					</div>
				</div>
			</div>
		</div> <!-- Row END -->
	</div>
</section>
<!-- =======================
Packages END -->

<!-- =======================
Top category START -->
<section class="pt-0 pt-md-5">
	<div class="container">
		<!-- Title -->
		<div class="row mb-3 mb-sm-4">
			<div class="col-12 text-center">
				<h2 class="mb-0">Top Categories</h2>
			</div>
		</div>

		<div class="row g-4 g-xl-5">
			<!-- Category item -->
			<div class="col-sm-6 col-lg-4 col-xl-3">
				<div class="row g-2 g-md-3 align-items-center position-relative">
					<!-- Image -->
					<div class="col-md-6">
						<img src="assets/images/category/hotel/nearby/20.jpg" class="rounded-3" alt="">
					</div>
					<!-- Content -->
					<div class="col-md-6">
						<div class="p-2 p-md-0">
							<h5 class="mb-1"><a href="#" class="stretched-link">Beach</a></h5>
							<span>4,568 Places</span>
						</div>
					</div>
				</div>
			</div>

			<!-- Category item -->
			<div class="col-sm-6 col-lg-4 col-xl-3">
				<div class="row g-2 g-md-3 align-items-center position-relative">
					<!-- Image -->
					<div class="col-md-6">
						<img src="assets/images/category/hotel/nearby/19.jpg" class="rounded-3" alt="">
					</div>
					<!-- Content -->
					<div class="col-md-6">
						<div class="p-2 p-md-0">
							<h5 class="mb-1"><a href="#" class="stretched-link">Heritage</a></h5>
							<span>2,845 Places</span>
						</div>	
					</div>
				</div>
			</div>

			<!-- Category item -->
			<div class="col-sm-6 col-lg-4 col-xl-3">
				<div class="row g-2 g-md-3 align-items-center position-relative">
					<!-- Image -->
					<div class="col-md-6">
						<img src="assets/images/category/hotel/nearby/18.jpg" class="rounded-3" alt="">
					</div>
					<!-- Content -->
					<div class="col-md-6">
						<div class="p-2 p-md-0">
							<h5 class="mb-1"><a href="#" class="stretched-link">Desert</a></h5>
							<span>1,587 Places</span>
						</div>	
					</div>
				</div>
			</div>

			<!-- Category item -->
			<div class="col-sm-6 col-lg-4 col-xl-3">
				<div class="row g-2 g-md-3 align-items-center position-relative">
					<!-- Image -->
					<div class="col-md-6">
						<img src="assets/images/category/hotel/nearby/17.jpg" class="rounded-3" alt="">
					</div>
					<!-- Content -->
					<div class="col-md-6">
						<div class="p-2 p-md-0">
							<h5 class="mb-1"><a href="#" class="stretched-link">Tower</a></h5>
							<span>986 Places</span>
						</div>
					</div>
				</div>
			</div>

			<!-- Category item -->
			<div class="col-sm-6 col-lg-4 col-xl-3">
				<div class="row g-2 g-md-3 align-items-center position-relative">
					<!-- Image -->
					<div class="col-md-6">
						<img src="assets/images/category/hotel/nearby/16.jpg" class="rounded-3" alt="">
					</div>
					<!-- Content -->
					<div class="col-md-6">
						<div class="p-2 p-md-0">
							<h5 class="mb-1"><a href="#" class="stretched-link">Mountain</a></h5>
							<span>786 Places</span>
						</div>
					</div>
				</div>
			</div>

			<!-- Category item -->
			<div class="col-sm-6 col-lg-4 col-xl-3">
				<div class="row g-2 g-md-3 align-items-center position-relative">
					<!-- Image -->
					<div class="col-md-6">
						<img src="assets/images/category/hotel/nearby/15.jpg" class="rounded-3" alt="">
					</div>
					<!-- Content -->
					<div class="col-md-6">
						<div class="p-2 p-md-0">
							<h5 class=""><a href="#" class="stretched-link">Safari</a></h5>
							<span>568 Places</span>
						</div>
					</div>
				</div>
			</div>

			<!-- Category item -->
			<div class="col-sm-6 col-lg-4 col-xl-3">
					<div class="row g-2 g-md-3 align-items-center position-relative">
						<!-- Image -->
						<div class="col-md-6">
							<img src="assets/images/category/hotel/nearby/14.jpg" class="rounded-3" alt="">
						</div>
						<!-- Content -->
						<div class="col-md-6">
							<div class="p-2 p-md-0">
								<h5 class="mb-1"><a href="#" class="stretched-link">Temple</a></h5>
								<span>256 Places</span>
							</div>
						</div>
					</div>
			</div>

			<!-- Category item -->
			<div class="col-sm-6 col-lg-4 col-xl-3">
				<div class="row g-2 g-md-3 align-items-center position-relative">
					<!-- Image -->
					<div class="col-md-6">
						<img src="assets/images/category/hotel/nearby/13.jpg" class="rounded-3" alt="">
					</div>
					<!-- Content -->
					<div class="col-md-6">
						<div class="p-2 p-md-0">
							<h5 class="mb-1"><a href="#" class="stretched-link">Festival</a></h5>
							<span>654 Places</span>
						</div>
					</div>
				</div>
			</div>
		</div> <!-- Row END -->
	</div>
</section>
<!-- =======================
Top category END -->

<!-- =======================
Stories START-->
<section class="pt-0 pt-md-5">
	<div class="container">

		<div class="row g-4 g-lg-5 align-items-center">

			<div class="col-lg-4">
				<!-- Title -->
				<h2 class="mb-0">Discover the best places to visit🔥</h2>

				<div class="d-sm-flex justify-content-sm-between align-items-center mt-4">
					<!-- Avatar group -->
					<ul class="avatar-group mb-sm-0">
						<li class="avatar">
							<img class="avatar-img rounded-circle" src="assets/images/avatar/01.jpg" alt="avatar">
						</li>
						<li class="avatar">
							<img class="avatar-img rounded-circle" src="assets/images/avatar/02.jpg" alt="avatar">
						</li>
						<li class="avatar">
							<img class="avatar-img rounded-circle" src="assets/images/avatar/03.jpg" alt="avatar">
						</li>
						<li class="avatar">
							<img class="avatar-img rounded-circle" src="assets/images/avatar/04.jpg" alt="avatar">
						</li>
						<li class="avatar">
							<div class="avatar-img rounded-circle bg-dark">
								<span class="text-white position-absolute top-50 start-50 translate-middle small">16+</span>
							</div>
						</li>
					</ul>

					<!-- Rating -->
					<h5 class="m-0"><i class="fa-solid fa-star text-warning me-2"></i>4.5</h5>
				</div>

				<!-- Button -->
				<a href="#" class="btn btn-lg btn-primary-soft mb-0 mt-4">Explore places <i class="bi fa-fw bi-arrow-right ms-2"></i></a>
			</div>

			<div class="col-lg-8">
				<div class="row">
					<div class="col-md-6">
						<!-- Card item -->
						<div class="card card-element-hover card-overlay-hover overflow-hidden">
							<!-- Image -->
							<img src="assets/images/category/tour/06.jpg" class="rounded-3" alt="">
							<!-- Full screen button -->
							<a class="hover-element position-absolute w-100 h-100" data-glightbox data-gallery="gallery" href="assets/images/gallery/01.jpg">
								<i class="bi bi-fullscreen fs-6 text-white position-absolute top-50 start-50 translate-middle bg-dark rounded-1 p-2 lh-1"></i>
							</a>
						</div>

						<!-- Testimonials START -->
						<div class="tiny-slider arrow-round arrow-blur arrow-hover arrow-xs my-4 mb-md-0">
							<div class="tiny-slider-inner pb-1" data-autoplay="true" data-arrow="true" data-dots="false" data-items="1">
								<!-- Testimonial item -->
								<div class="card bg-transparent">
									<div class="row align-items-center">
										<!-- Image -->
										<div class="col-4">
											<img src="assets/images/team/01.jpg" class="card-img" alt="">
										</div>
										<!-- Card body -->
										<div class="col-8">
											<div class="card-body p-0">
												<p class="mb-0">Farther-related bed and passage comfort civilly.</p>
												<h6 class="card-title mb-0 mt-2">Louis Ferguson</h6>
											</div>
										</div>
									</div>
								</div>

								<!-- Testimonial item -->
								<div class="card bg-transparent">
									<div class="row align-items-center">
										<!-- Image -->
										<div class="col-4">
											<img src="assets/images/team/02.jpg" class="card-img" alt="">
										</div>
										<!-- Card body -->
										<div class="col-8">
											<div class="card-body p-0">
												<p class="mb-0">Farther-related bed and passage comfort civilly.</p>
												<h6 class="card-title mb-0 mt-2">Lori Stevens</h6>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>		
						<!-- Testimonials END -->
					</div>

					<div class="col-md-6">
						<!-- Card item -->
						<div class="card card-element-hover card-overlay-hover overflow-hidden mb-4">
							<!-- Image -->
							<img src="assets/images/gallery/02.jpg" class="rounded-3" alt="">
							<!-- Full screen button -->
							<a class="hover-element position-absolute w-100 h-100" data-glightbox data-gallery="gallery" href="https://www.youtube.com/embed/tXHviS-4ygo">
								<span class="btn text-danger btn-round btn-white position-absolute top-50 start-50 translate-middle mb-0">
									<i class="fas fa-play"></i>
								</span>
							</a>
						</div>
						<!-- Card item -->
						<div class="card card-element-hover card-overlay-hover overflow-hidden">
							<!-- Image -->
							<img src="assets/images/gallery/03.jpg" class="rounded-3" alt="">
							<!-- Full screen button -->
							<a class="hover-element position-absolute w-100 h-100" data-glightbox data-gallery="gallery" href="assets/images/gallery/03.jpg">
								<i class="bi bi-fullscreen fs-6 text-white position-absolute top-50 start-50 translate-middle bg-dark rounded-1 p-2 lh-1"></i>
							</a>
						</div>
					</div>
				</div><!-- Row END -->
			</div>
		</div> <!-- Row END -->
	</div>
</section>
<!-- =======================
Stories END-->

</main>
<!-- **************** MAIN CONTENT END **************** -->

<!-- =======================
Footer START -->
<footer>
	<div class="container">
		<div class="bg-light rounded-top p-4 pb-0">
			<div class="row g-4 justify-content-between">

				<!-- Widget 1 START -->
				<div class="col-md-5 col-lg-4">
					<!-- logo -->
					<a class="me-0" href="index.html">
						<img class="light-mode-item h-40px" src="assets/images/logo.svg" alt="logo">
            <img class="dark-mode-item h-40px" src="assets/images/logo-light.svg" alt="logo">
					</a>

					<p class="text-reset mt-4 mb-2">Subscribe to Our Newsletter</p>
					<!-- Newsletter -->
					<form class="bg-body rounded-2 p-2">
						<div class="input-group">
							<input class="form-control border-0 me-1" type="email" placeholder="Enter your email">
							<button type="button" class="btn btn-dark rounded-2 mb-0"><i class="bi bi-send"></i></button>
						</div>
					</form>
				</div>
				<!-- Widget 1 END -->

				<!-- Widget 2 START -->
				<div class="col-md-7 col-lg-4">
					<div class="row g-4 g-lg-5">
						<!-- Link block -->
						<div class="col-6">
							<h5 class="mb-2 mb-md-4">Page</h5>
							<ul class="nav flex-column">
								<li class="nav-item"><a class="nav-link pt-0" href="#">Blog</a></li>
								<li class="nav-item"><a class="nav-link" href="#">About</a></li>
								<li class="nav-item"><a class="nav-link" href="#">Contact us</a></li>
								<li class="nav-item"><a class="nav-link" href="#">Services</a></li>
							</ul>
						</div>

						<!-- Link block -->
						<div class="col-6">
							<h5 class="mb-2 mb-md-4">Links</h5>
							<ul class="nav flex-column">
								<li class="nav-item"><a class="nav-link pt-0" href="#">Sign up</a></li>
								<li class="nav-item"><a class="nav-link" href="#">Sign in</a></li>
								<li class="nav-item"><a class="nav-link" href="#">Privacy Policy</a></li>
								<li class="nav-item"><a class="nav-link" href="#">Terms</a></li>
								<li class="nav-item"><a class="nav-link" href="#">Cookie</a></li>
								<li class="nav-item"><a class="nav-link" href="#">Supports</a></li>
							</ul>
						</div>
					</div>
				</div>
				<!-- Widget 2 END -->
			</div>

			<!-- Divider -->
			<hr class="mt-4 mb-0">

			<!-- Bottom footer -->
			<div class="container py-3 px-0">
				<div class="d-md-flex justify-content-between align-items-center text-center text-md-left">
					<!-- copyright text -->
					<div class="text-primary-hover text-body"> Copyrights ©2024 Booking. build by <a href="https://www.webestica.com/" class="text-body">Webestica</a>. </div>
					<!-- copyright links-->
					<div class="mt-3 mt-md-0">
						<ul class="nav text-primary-hover justify-content-center justify-content-md-end">
							<li class="nav-item">
								<a class="nav-link text-body" href="#"><i class="fab fa-facebook-f"></i></a>
							</li>
							<li class="nav-item">
								<a class="nav-link text-body" href="#"><i class="fab fa-twitter"></i></a>
							</li>
							<li class="nav-item">
								<a class="nav-link text-body" href="#"><i class="fab fa-instagram"></i></a>
							</li>
							<li class="nav-item">
								<a class="nav-link text-body" href="#"><i class="fab fa-linkedin-in"></i></a>
							</li>
							<li class="nav-item">
								<a class="nav-link text-body" href="#"><i class="fab fa-github"></i></a>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</footer>
<!-- =======================
Footer END -->

<!-- Back to top -->
<div class="back-top"></div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

<!-- Vendors -->
<script src="assets/vendor/tiny-slider/tiny-slider.js"></script>
<script src="assets/vendor/glightbox/js/glightbox.js"></script>
<script src="https://cdn.jsdelivr.net/npm/choices.js/public/assets/scripts/choices.min.js"></script>
<script src="assets/vendor/flatpickr/js/flatpickr.min.js"></script>

<!-- ThemeFunctions -->
<script src="assets/js/functions.js"></script>

</body>
</html>