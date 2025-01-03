<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>[판매자] 숙소 관리 > 객실관리</title>

<!-- headerScript -->
<%@ include file="/WEB-INF/views/include/headerScript.jsp"%>
</head>

<body>

	<!-- **************** MAIN CONTENT START **************** -->
	<main>
		<!-- Sidebar -->
		<%@ include file="/WEB-INF/views/include/partnerSidebar.jsp"%>


		<!-- Page content START -->
		<div class="page-content">

			<!-- Topbar -->
			<%@ include file="/WEB-INF/views/include/partnerTopbar.jsp"%>


			<!-- Page main content START -->
			<div class="page-content-wrapper p-xxl-4">
				<!-- Title -->
				<div class="row">
					<div class="col-12 mb-4 mb-sm-5">
						<h1 class="h3 mb-2">객실 관리</h1>
						<span>객실 기본정보를 등록/수정할 수 있습니다.</span>
					</div>
				</div>

				<!-- 상단 navbar START -->
				<div class="row g-4 mb-4">
					<div class="col-12">
						<div class="bg-light pb-0 px-2 px-lg-0">
							<ul
								class="nav nav-tabs nav-bottom-line nav-responsive border-0 nav-justified" role="tablist">
								<li class="nav-item"><a class="nav-link mb-0 active"
									data-bs-toggle="tab" href="#tab1">객실목록</a></li>
								<li class="nav-item"><a class="nav-link mb-0"
									data-bs-toggle="tab" href="#tab2">객실추가</a></li>
							</ul>
						</div>
					</div>
				</div>
				<!-- 상단 navbar END -->

				<!-- 객실 수정 모달창 START -->
				<form id="frm_update">
					<div id="roomRegistModal" class="modal" tabindex="-1" role="dialog">
						<div class="modal-dialog modal-xl modal-dialog-centered"
							role="document">
							<!-- 제일 큰 모달 -->
							<div class="modal-content">
								<!-- 모달 head -->
								<div class="modal-header">
									<h5 class="modal-title">객실 수정</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>
	
	
								<!-- 모달 body -->
								<div class="modal-body m-3">
									<!-- 객실 기본정보 등록 Card START -->
									<div class="card border mb-4">
										<div class="card-header border-bottom">
											<h5 class="card-header-title">객실 기본정보</h5>
										</div>
										<!-- Flex container START -->
										<div class="d-flex">
											<!-- 왼쪽 카드 START -->
											<div class="card-body col-6">
												<div class="mb-3">
													<label class="form-label">객실타입명</label> 
													<input type="text" id="roomType" class="form-control" name="RoomType">
												</div>
												<div class="mb-3">
													<label class="form-label">기본인원</label> 
													<input type="text" id="standard_person" name="standard_person" class="form-control">
												</div>
												<div class="mb-3">
													<label class="form-label">평일요금</label> 
													<input type="text" id="basic_price" name="basic_price" class="form-control">
												</div>
											</div>
											<!-- 왼쪽 카드 END -->
	
											<!-- 오른쪽 카드 START -->
											<div class="card-body col-6">
												<!-- 검색어 드롭다운 -->
												<div class="mb-3">
													<label class="form-label">객실수</label> 
													<input type="text" id="room_count" name="room_count" class="form-control">
												</div>
	
												<div class="mb-3">
													<label class="form-label">최대인원</label> 
													<input type="text" id="maximum_person" name="maximum_person" class="form-control">
												</div>
												<div class="mb-3">
													<label class="form-label">주말요금</label> 
													<input type="text" id="weekend_price" name="weekend_price" class="form-control">
												</div>
											</div>
											<!-- 오른쪽 카드 END -->
										</div>
									</div>
									<!-- 객실 기본정보 등록 Card END -->
	
									<!-- 객실 상세 설명 Card Start -->
									<div class="card border mb-4">
										<div class="card-header border-bottom">
											<h5 class="card-header-title">객실 상세 설명</h5>
										</div>
										<div class="card-body">
	
											<!-- 답변달기 START -->
											<div class="d-flex mt-1">
												<textarea id="update_description" name="update_description" class="form-control mb-3 bg-light" rows="7"></textarea>
											</div>
	
										</div>
									</div>
									<!-- 객실 상세 설명 Card END -->
	
									<!-- 객실 옵션 설정 Card Start -->
									<div class="card border mb-4">
										<div class="card-header border-bottom">
											<h5 class="card-header-title">객실 옵션 설정</h5>
										</div>
										<div class="card-body">
											<!-- 옵션 체크박스 -->
											<div class="row row-cols-4 g-3">
												<!-- 첫 번째 열 -->
												<div class="col">
													<div class="form-check">
														<input class="form-check-input" type="checkbox" id="shower2" name="option" value="14"> 
														<label class="form-check-label" for="shower2">샤워실</label>
													</div>
													<div class="form-check">
														<input class="form-check-input" type="checkbox" id="bath2" name="option" value="15">
														<label class="form-check-label" for="bath2">욕조</label>
													</div>
													<div class="form-check">
														<input class="form-check-input" type="checkbox" id="bath-supplies2" name="option" value="16"> 
														<label class="form-check-label" for="bath-supplies2">욕실용품</label>
													</div>
													<div class="form-check">
														<input class="form-check-input" type="checkbox" id="mini-bar2" name="option" value="17">
														<label class="form-check-label" for="mini-bar2">미니바</label>
													</div>
												</div>
												<!-- 두 번째 열 -->
												<div class="col">
													<div class="form-check">
														<input class="form-check-input" type="checkbox" id="dryer2" name="option" value="18"> 
														<label class="form-check-label" for="dryer2">드라이기</label>
													</div>
													<div class="form-check"> 
														<input class="form-check-input" type="checkbox" id="wifi2" name="option" value="19">
														<label class="form-check-label" for="wifi2">와이파이</label>
													</div>
													<div class="form-check">
														<input class="form-check-input" type="checkbox" id="tv2" name="option" value="20"> 
														<label class="form-check-label" for="tv2">TV</label>
													</div>
													<div class="form-check">
														<input class="form-check-input" type="checkbox" id="safe2" name="option" value="21"> 
														<label class="form-check-label" for="safe2">금고</label>
													</div>
												</div>
												<!-- 세 번째 열 -->
												<div class="col">
													<div class="form-check">
														<input class="form-check-input" type="checkbox" id="electric-port2" name="option" value="22"> 
														<label class="form-check-label" for="electric-port2">전기포트</label>
													</div>
													<div class="form-check">
														<input class="form-check-input" type="checkbox" id="rice-cooker2" name="option" value="23"> 
														<label class="form-check-label" for="rice-cooker2">전기밥솥</label>
													</div>
													<div class="form-check">
														<input class="form-check-input" type="checkbox" id="coffee-machine2" name="option" value="24"> 
														<label class="form-check-label" for="coffee-machine2">커피머신</label>
													</div>
													<div class="form-check">
														<input class="form-check-input" type="checkbox" id="spa2" name="option" value="25">
														<label class="form-check-label" for="spa2">스파</label>
													</div>
												</div>
												<!-- 네 번째 열 -->
												<div class="col">
													<div class="form-check">
														<input class="form-check-input" type="checkbox" id="lounge" name="option" value="26"> 
														<label class="form-check-label" for="lounge">어메니티</label>
													</div>
													<div class="form-check">
														<input class="form-check-input" type="checkbox" id="label1" name="option" value="27"> 
														<label class="form-check-label" for="label1">PC</label>
													</div>
												</div>
											</div>
										</div>
									</div>
									<!-- 객실 옵션 설정 Card END -->
	
									<!-- 객실 사진 등록 Card Start -->
									<div class="card border mb-3">
										<div class="card-header border-bottom">
											<h5 class="card-header-title">객실 사진 등록</h5>
										</div>
										<div class="card-body">
											<!-- 사진 리스트 -->
											<div class="d-flex gap-3">
												<!-- 업로드 버튼 -->
												<div class="border rounded d-flex justify-content-center align-items-center" style="width: 150px; height: 100px; background-color: #f8f9fa;">
													<label class="text-center" style="cursor: pointer;"> 
														<i class="bi bi-upload"></i><br>숙소 사진 업로드 
														<input type="file" class="d-none" multiple="multiple" id="changeFile">
													</label>
												</div>
												<div id="preview" class="d-flex">
												</div>
											</div>
										</div>
									</div>
	
								</div>
	
								<!-- 확인/취소 button -->
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-bs-dismiss="modal">취소</button>
									<button type="button" id="updateRoom" class="btn btn-primary">수정하기</button>
								</div>
							</div>
						</div>
					</div> 
				</form>
				<!-- 객실 수정 모달창 END -->

				<!-- tab-content START -->
				<div class="tab-content">
					<!-- #tab1 / 객실 타입 Tap Start -->
					<div class="tab-pane fade show active" id="tab1">
						<div class="col-md-12 col-xxl-12">
							<div class="card border">

								<!-- Card body -->
								<div class="card-body">

									<!-- Rooms START -->
									<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-xxl-5 g-4" id="roomList">
									</div>
									<!-- Rooms END -->

								</div>
								<!-- Card body END-->
							</div>
						</div>
					</div>
					<!-- #tab1 / 객실 타입 Tap END -->

<form id="frm">
					<!-- #tab2 / 객실추가 Tap START -->
					<div class="tab-pane fade" id="tab2">
						<!-- 상단 네비게이션 바를 클릭하면 탭에 따라 콘텐츠가 변경되는 부분-->
						
						<!-- 객실 기본정보 등록 Card START -->
						<div class="card border mb-4">
							<div class="card-header border-bottom">
								<h5 class="card-header-title">객실 기본정보</h5>
							</div>
							<!-- Flex container START -->
							<div class="d-flex">
								<!-- 왼쪽 카드 START -->
								<div class="card-body col-6">
									<div class="mb-3">
										<label class="form-label">객실타입명</label> 
										<input type="text" id="room_type" name="room_type" class="form-control">
									</div>
									<div class="mb-3">
										<label class="form-label">기본인원</label> 
										<input type="text" id="standard" name="standard" class="form-control">
									</div>
									<div class="mb-3">
										<label class="form-label">평일요금</label> 
										<input type="text" id="basic_price" name="basic_price" class="form-control">
									</div>
								</div>
								<!-- 왼쪽 카드 END -->

								<!-- 오른쪽 카드 START -->
								<div class="card-body col-6">
									<!-- 검색어 드롭다운 -->
									<div class="mb-3">
										<label class="form-label">객실수</label> 
										<input type="text" id="count" name="count" class="form-control">
									</div>
									<div class="mb-3">
										<label class="form-label">최대인원</label> 
										<input type="text" id="maximum" name="maximum" class="form-control">
									</div>
									<div class="mb-3">
										<label class="form-label">주말요금</label> 
										<input type="text" id="weekend_price" name="weekend_price" class="form-control">
									</div>
								</div>
								<!-- 오른쪽 카드 END -->
							</div>
						</div>
						<!-- 객실 기본정보 등록 Card END -->

						<!-- 객실 상세 설명 Card Start -->
						<div class="card border mb-4">
							<div class="card-header border-bottom">
								<h5 class="card-header-title">객실 상세 설명</h5>
							</div>
							<div class="card-body">

								<!-- 답변달기 START -->
								<div class="d-flex mt-1">
									<textarea id="description" name="description" class="form-control mb-3 bg-light" placeholder="답변을 작성해주세요." rows="7"></textarea>
								</div>

							</div>
						</div>
						<!-- 객실 상세 설명 Card END -->

						<!-- 객실 옵션 설정 Card Start -->
						<div class="card border mb-4">
							<div class="card-header border-bottom">
								<h5 class="card-header-title">객실 옵션 설정</h5>
							</div>
							<div class="card-body">
								<!-- 옵션 체크박스 -->
								<div class="row row-cols-4 g-3">
									<!-- 첫 번째 열 -->
									<div class="col">
										<div class="form-check">
											<input class="form-check-input" type="checkbox" id="shower" name="option" value="14"> 
											<label class="form-check-label" for="shower">샤워실</label>
										</div>
										<div class="form-check">
											<input class="form-check-input" type="checkbox" id="pool" name="option" value="15">
											<label class="form-check-label" for="pool">욕조</label>
										</div>
										<div class="form-check">
											<input class="form-check-input" type="checkbox" id="bathroom-supplies" name="option" value="16"> 
											<label class="form-check-label" for="bathroom-supplies">욕실용품</label>
										</div>
										<div class="form-check">
											<input class="form-check-input" type="checkbox" id="mini-bar" name="option" value="17">
											<label class="form-check-label" for="mini-bar">미니바</label>
										</div>
									</div>
									<!-- 두 번째 열 -->
									<div class="col">
										<div class="form-check">
											<input class="form-check-input" type="checkbox" id="dryer" name="option" value="18"> 
											<label class="form-check-label" for="dryer">드라이기</label>
										</div>
										<div class="form-check">
											<input class="form-check-input" type="checkbox" id="wifi" name="option" value="19">
											<label class="form-check-label" for="wifi">와이파이</label>
										</div>
										<div class="form-check">
											<input class="form-check-input" type="checkbox" id="tv" name="option" value="20"> 
											<label class="form-check-label" for="tv">TV</label>
										</div>
										<div class="form-check">
											<input class="form-check-input" type="checkbox" id="safe" name="option" value="21">
											<label class="form-check-label" for="safe">금고</label>
										</div>
									</div>
									<!-- 세 번째 열 -->
									<div class="col">
										<div class="form-check">
											<input class="form-check-input" type="checkbox" id="electric-port" name="option" value="22"> 
											<label class="form-check-label" for="electric-port">전기포트</label>
										</div>
										<div class="form-check">
											<input class="form-check-input" type="checkbox" id="rice-cooker" name="option" value="23"> 
											<label class="form-check-label" for="rice-cooker">전기밥솥</label>
										</div>
										<div class="form-check">
											<input class="form-check-input" type="checkbox" id="coffie-machine" name="option" value="24">
											<label class="form-check-label" for="coffie-machine">커피머신</label>
										</div>
										<div class="form-check">
											<input class="form-check-input" type="checkbox" id="spa" name="option" value="25">
											<label class="form-check-label" for="spa">스파</label>
										</div>
									</div>
									<!-- 네 번째 열 -->
									<div class="col">
										<div class="form-check">
											<input class="form-check-input" type="checkbox" id="amenities" name="option" value="26"> 
											<label class="form-check-label" for="amenities">어메니티</label>
										</div>
										<div class="form-check">
											<input class="form-check-input" type="checkbox" id="pc" name="option" value="27"> 
											<label class="form-check-label" for="pc">PC</label>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- 객실 옵션 설정 Card END -->

						<!-- 객실 사진 등록 Card Start -->
						<div class="card border mb-3">
							<div class="card-header border-bottom">
								<h5 class="card-header-title">객실 사진 등록</h5>
							</div>
							<div class="card-body">
								<!-- 사진 리스트 -->
								<div class="d-flex gap-3">
									<!-- 이미지 1 -->
									<div class="position-relative">
										<img src="https://via.placeholder.com/150" alt="사진 1"
											class="rounded border"
											style="width: 150px; height: 100px; object-fit: cover;">
									</div>
									<!-- 이미지 2 -->
									<div class="position-relative">
										<img src="https://via.placeholder.com/150" alt="사진 2"
											class="rounded border"
											style="width: 150px; height: 100px; object-fit: cover;">
									</div>
									<!-- 이미지 3 -->
									<div class="position-relative">
										<img src="https://via.placeholder.com/150" alt="사진 3"
											class="rounded border"
											style="width: 150px; height: 100px; object-fit: cover;">
									</div>
									<!-- 업로드 버튼 -->
									<div class="border rounded d-flex justify-content-center align-items-center" style="width: 150px; height: 100px; background-color: #f8f9fa;">
										<label class="text-center" style="cursor: pointer;"> 
											<i class="bi bi-upload"></i><br>숙소 사진 업로드 
											<input type="file" id="roomImageUpload" class="d-none" multiple>
										</label>
									</div>
								</div>
							</div>
						</div>
						<!-- 객실 사진 등록 Card END -->
						<div class="d-flex justify-content-end">
							<button id="registerRoom" class="btn btn-danger-soft px-4 mb-4">등록</button>
						</div>
					</div>
					<!-- #tab2 / 객실추가 Tap END -->
					<!-- ******************************************** -->
</form>




				</div>
				<!-- tab-content END -->

			</div>
			<!-- Page main content END -->
		</div>
		<!-- Page content END -->



	</main>
	<!-- **************** MAIN CONTENT END **************** -->

	<!-- footerScript -->
	<%@ include file="/WEB-INF/views/include/footerScript.jsp"%>
	
<!-- page script -->
<script src="js/partner/roomRegist.js"></script>
<script type="text/javascript">
	roomRegist.init();
</script>
</body>
</html>