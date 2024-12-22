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
<!-- header -->
<%@ include file="/WEB-INF/views/include/header.jsp" %>

<!-- main -->
<main>
<section class="pt-3">
	<div class="container">
		<div class="row">
			<!-- 사이드바 -->
			<%@ include file="/WEB-INF/views/include/mypageSidebar.jsp" %>

			<!-- content -->
			<div class="col-lg-8 col-xl-9">
				<!-- Offcanvas menu button -->
				<div class="d-grid mb-0 d-lg-none w-100">
					<button class="btn btn-primary mb-4" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasSidebar" aria-controls="offcanvasSidebar">
						<i class="fas fa-sliders-h"></i> 메뉴
					</button>
				</div>

				<!-- 자주 묻는 질문 -->
				<div class="vstack gap-4">
					<div class="card border">
						<!-- Card header -->
						<div class="card-header border-bottom">
							<h4 class="card-header-title">자주 묻는 질문</h4>
						</div>
						
						<div class="card-body">
							<!-- 분류 -->
							<div class="mt-2">
								<div class="col-12 mx-auto">
									<button type="button" class="btn btn-sm btn-round-m btn-outline-success active">전체</button>
									<button type="button" class="btn btn-sm btn-round-m btn-outline-success">이용문의</button>
									<button type="button" class="btn btn-sm btn-round-m btn-outline-success">예약</button>
								</div>
							</div>
						
							<!-- Accordion START -->
							<div class="row mt-3 mb-5">
								<div class="col-12 mx-auto">
									<div class="accordion accordion-icon accordion-bg-success">
										<!-- Item -->
										<div class="accordion-item mb-3">
											<h6 class="accordion-header" id="heading-1">
												<button class="accordion-button fw-bold rounded d-inline-block collapsed d-block pe-5" type="button" data-bs-toggle="collapse" data-bs-target="#collapse-1" aria-expanded="false" aria-controls="collapse-1">
													<i class="fa-solid fa-q text-black"></i> How can we help?
												</button>
											</h6>
											<!-- Body -->
											<div id="collapse-1" class="accordion-collapse collapse" aria-labelledby="heading-1" data-bs-parent="#accordionExample2">
												<div class="accordion-body mt-3">
													<p class="space">
														내용
														내용
														
														내용
														
														내용
													</p>
												</div>
											</div>
										</div>
					
										<!-- Item -->
										<div class="accordion-item mb-3">
											<h6 class="accordion-header" id="heading-2">
												<button class="accordion-button fw-bold rounded d-inline-block collapsed d-block pe-5" type="button" data-bs-toggle="collapse" data-bs-target="#collapse-2" aria-expanded="false" aria-controls="collapse-2">
													<i class="fa-solid fa-q text-black"></i>  How to edit my Profile?
												</button>
											</h6>
											<!-- Body -->
											<div id="collapse-2" class="accordion-collapse collapse" aria-labelledby="heading-2" data-bs-parent="#accordionExample2">
												<div class="accordion-body mt-3">
													<p class="space">
													What deal evil rent by real in. But her ready least set lived spite solid. September how men saw tolerably two behavior arranging. She offices for highest and replied one venture pasture. Applauded no discovery in newspaper allowance am northward. Frequently partiality possession resolution at or appearance unaffected me. Engaged its was the evident pleased husband. Ye goodness felicity do disposal dwelling no. First am plate jokes to began to cause a scale. Subjects he prospect elegance followed no overcame possible it on. Improved own provided blessing may peculiar domestic. Sight house has sex never. No visited raising gravity outward subject my cottage Mr be.
													</p>
												</div>
											</div>
										</div>
					
										<!-- Item -->
										<div class="accordion-item mb-3">
											<h6 class="accordion-header" id="heading-3">
												<button class="accordion-button fw-bold collapsed rounded d-block pe-5" type="button" data-bs-toggle="collapse" data-bs-target="#collapse-3" aria-expanded="false" aria-controls="collapse-3">
													<i class="fa-solid fa-q text-black"></i>  How much should I offer the sellers? 
												</button>
											</h6>
											<!-- Body -->
											<div id="collapse-3" class="accordion-collapse collapse" aria-labelledby="heading-3" data-bs-parent="#accordionExample2">
												<div class="accordion-body mt-3">
													Post no so what deal evil rent by real in. But her ready least set lived spite solid. September how men saw tolerably two behavior arranging. She offices for highest and replied one venture pasture. Applauded no discovery in newspaper allowance am northward. Frequently partiality possession resolution at or appearance unaffected me. Engaged its was the evident pleased husband. Ye goodness felicity do disposal dwelling no. First am plate jokes to began to cause a scale. Subjects he prospect elegance followed no overcame possible it on. Improved own provided blessing may peculiar domestic. Sight house has sex never. No visited raising gravity outward subject my cottage Mr be. Hold do at tore in park feet near my case. Invitation at understood occasional sentiments insipidity inhabiting in. Off melancholy alteration principles old. Is do speedily kindness properly oh. Respect article painted cottage he is offices parlors.
												</div>
											</div>
										</div>
					
										<!-- Item -->
										<div class="accordion-item mb-3">
											<h6 class="accordion-header" id="heading-4">
												<button class="accordion-button fw-bold collapsed rounded d-block pe-5" type="button" data-bs-toggle="collapse" data-bs-target="#collapse-4" aria-expanded="false" aria-controls="collapse-4">
													<i class="fa-solid fa-q text-black"></i>  Installation Guide 
												</button>
											</h6>
											<!-- Body -->
											<div id="collapse-4" class="accordion-collapse collapse" aria-labelledby="heading-4" data-bs-parent="#accordionExample2">
												<div class="accordion-body mt-3">
													<p>What deal evil rent by real in. But her ready least set lived spite solid. September how men saw tolerably two behavior arranging. She offices for highest and replied one venture pasture. Applauded no discovery in newspaper allowance am northward. Frequently partiality possession resolution at or appearance unaffected me. Engaged its was the evident pleased husband. Ye goodness felicity do disposal dwelling no. First am plate jokes to began to cause a scale. Subjects he prospect elegance followed no overcame possible it on. Improved own provided blessing may peculiar domestic. Sight house has sex never. No visited raising gravity outward subject my cottage Mr be.</p>
													<p class="mb-0">At the moment, we only accept Credit/Debit cards and Paypal payments. Paypal is the easiest way to make payments online. While checking out your order. Be sure to fill in correct details for fast &amp; hassle-free payment processing.</p>
												</div>
											</div>
										</div>
					
										<!-- Item -->
										<div class="accordion-item mb-3">
											<h6 class="accordion-header" id="heading-5">
												<button class="accordion-button fw-bold collapsed rounded d-block pe-5" type="button" data-bs-toggle="collapse" data-bs-target="#collapse-5" aria-expanded="false" aria-controls="collapse-5">
													<i class="fa-solid fa-q text-black"></i>  Additional Options and Services
												</button>
											</h6>
											<!-- Body -->
											<div id="collapse-5" class="accordion-collapse collapse" aria-labelledby="heading-5" data-bs-parent="#accordionExample2">
												<div class="accordion-body mt-3">
													Post no so what deal evil rent by real in. But her ready least set lived spite solid. September how men saw tolerably two behavior arranging. She offices for highest and replied one venture pasture. Applauded no discovery in newspaper allowance am northward. Frequently partiality possession resolution at or appearance unaffected me. Engaged its was the evident pleased husband. Ye goodness felicity do disposal dwelling no. First am plate jokes to began to cause a scale. Subjects he prospect elegance followed no overcame possible it on. Improved own provided blessing may peculiar domestic. Sight house has sex never. No visited raising gravity outward subject my cottage Mr be. Hold do at tore in park feet near my case. Invitation at understood occasional sentiments insipidity inhabiting in. Off melancholy alteration principles old. Is do speedily kindness properly oh. Respect article painted cottage he is offices parlors.
												</div>
											</div>
										</div>
					
										<!-- Item -->
										<div class="accordion-item">
											<h6 class="accordion-header" id="heading-6">
												<button class="accordion-button fw-bold collapsed rounded d-block pe-5" type="button" data-bs-toggle="collapse" data-bs-target="#collapse-6" aria-expanded="false" aria-controls="collapse-6">
													<i class="fa-solid fa-q text-black"></i>  What is the difference between a college and a university?
												</button>
											</h6>
											<!-- Body -->
											<div id="collapse-6" class="accordion-collapse collapse" aria-labelledby="heading-6" data-bs-parent="#accordionExample2">
												<div class="accordion-body mt-3">
													Post no so what deal evil rent by real in. But her ready least set lived spite solid. September how men saw tolerably two behavior arranging. She offices for highest and replied one venture pasture. Applauded no discovery in newspaper allowance am northward. Frequently partiality possession resolution at or appearance unaffected me. Engaged its was the evident pleased husband. Ye goodness felicity do disposal dwelling no. First am plate jokes to began to cause a scale. Subjects he prospect elegance followed no overcame possible it on. Improved own provided blessing may peculiar domestic. Sight house has sex never. No visited raising gravity outward subject my cottage Mr be. Hold do at tore in park feet near my case. Invitation at understood occasional sentiments insipidity inhabiting in. Off melancholy alteration principles old. Is do speedily kindness properly oh. Respect article painted cottage he is offices parlors.
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- Accordion END -->
						</div>
					</div>
				</div>
			</div>
			<!-- Main content END -->
		</div>
	</div>
</section>
</main>

<!-- footer -->
<%@ include file="/WEB-INF/views/include/footer.jsp" %>

<!-- footerScript -->
<%@ include file="/WEB-INF/views/include/footerScript.jsp" %>

<!-- page script -->
<script src="js/user/service/qna.js"></script>
<script type="text/javascript">
	qna.init();
</script>
</body>
</html>