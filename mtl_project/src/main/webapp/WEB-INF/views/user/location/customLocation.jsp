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
<section class="pt-4 d-none" id="keywordSelect">
	<div class="container mt-7 mb-7">
		<div class="w-50 bg-light rounded p-5" style="justify-self:center;">
			<!-- Title -->
			<div class="row mb-5">
				<div class="col-12 text-center">
					<h4 class="mb-0">취향 키워드를 선택해 주세요!</h4>
					<small>여러 개를 고를 수록 다양한 결과가 나옵니다.</small>
				</div>
			</div>
			<ul class="list-inline mb-0 g-4" id="keywordList">
			</ul>
			<div class="row mt-3">
				<div class="d-grid gap-2">
					<button class="btn btn-primary rounded-4" type="button" data-src="customLocation" data-act="clickNext">계속하기</button>
				</div>
			</div>
		</div>
	</div>
</section>

<section class="pt-4 d-none" id="locationCustom">
	<div class="container mt-7 mb-7" data-sticky-container>
		<div class="row">
			<div class="col-4" id="locationList">
			</div>
			<div class="col-8">
				<div data-sticky data-margin-top="100">
					<!-- 이미지, 지도 -->
					<div class="d-flex justify-content-sm-between">
						<div class="col-6 bg-light me-1 h-250px">
							<img src="" class="rounded h-100 w-100" id="locationImage">
						</div>
						<div class="col-6 bg-light ms-1 rounded h-250px" id="map">
						</div>
					</div>
					
					<!-- 설명 -->
					<div class="d-flex border mt-4 rounded">
						<div class="card bg-transparent">
							<div class="card-header ">
								<h4 class="mb-0" id="locationName"></h4>
							</div>
							<div class="card-body">
								<p class="space" id="locationDescription"></p>
							</div>
						</div>
					</div>
					<section id="saveBtn">
						<div class="d-flex justify-content-end">
							<button type="button" class="btn btn-primary-soft me-2" data-src="customLocation" data-act="clickPrev">이전으로</button>
							<button type="button" class="btn btn-primary" data-src="customLocation" data-act="clickSave">저장하기</button>
						</div>
					</section>
				</div>
			</div>
		</div>
	</div>
</section>
</main>

<!-- footer -->
<%@ include file="/WEB-INF/views/include/footer.jsp" %>

<!-- footerScript -->
<%@ include file="/WEB-INF/views/include/footerScript.jsp" %>

<!-- page script -->
<script src="js/user/location/customLocation.js"></script>
<script type="text/javascript">
	customLocation.init();
</script>
</body>
</html>