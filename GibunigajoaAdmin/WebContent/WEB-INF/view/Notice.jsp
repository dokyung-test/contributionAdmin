<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="true"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="true"%>
<%@ page isELIgnored="false"%>

<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="">
<meta name="author" content="">

<title>관리자 페이지</title>

<link
	href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/vendor/datatables/dataTables.bootstrap4.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/flaticon.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/icomoon.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css" />
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>

<script>
	$(function() {

		/* 공지사항 작성 누를 시 입력 창 */
		$("#testBtn").on('click', function() {
			$("#modal").show();
		});

		
        /* 수정 클릭시 */
		$(".update")
		.click(
				function() {
					var param = "num2=" + $(this).attr("title");
					var url = "updateNoticeForm.do";
					$
							.ajax({
								type : "post",
								url : url,
								data : param,
								dataType : "json"
							})
							.done(
									function(args) {
                                        var notice_idx=args.notice_idx;
										var subject = args.subject;
										var content = args.content;

										$("#subject2")
												.append(
														"<p class='a'><input type='text' name='subject' style='width:650px;' class='form-control' value='"+subject+"'></p>");
										$("#content2")
												.append(
														"<p class='a'><textarea rows='10' name='content' class='form-control' style='width:650px; resize: none;'  align='center'>"
																		+ content
																		+ "</textarea></p>");
										$("#hidden")
										.append(
												"<input type='hidden' name='notice_idx' value='"+notice_idx+"' />");
									});
					$("#updatemodal").show();
					return false;
				});

		/* 상세글 보기 */
		$(".content")
		.click(
				function() {
					var param = "num2=" + $(this).attr("title");
					var url = "updateNoticeForm.do";
					$
							.ajax({
								type : "post",
								url : url,
								data : param,
								dataType : "json"
							})
							.done(
									function(args) {
                                        var notice_idx=args.notice_idx;
										var subject = args.subject;
										var content = args.content;

										$("#subject3")
												.append(
														"<p class='a'><input type='text' class='form-control'style='width:650px;' value='"+subject+"'></p>");
										$("#content3")
												.append(
														"<p class='a'><textarea readonly='readonly' rows='10's class='form-control' style='width:650px; resize: none;'align='reft'>"
																		+ content
																		+ "</textarea></p>");
									});
					$("#cotentmodal").show();
					return false;
				});

	});
	function deletelist(a){
	      if(confirm("삭제하시겠습니까?")){
	            location.href="deleteNotice.do?notice_idx="+a;

	          }else{
	            close();
	              }
			}

	function closeModal() {
		$('.searchModal').hide();
		$('#updatemodal').hide();
		$('.a').remove();
	};
</script>

<style>
/* modal창의 배경 */
.searchModal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 10; /* Sit on top */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
	padding: 3em;
}
/* 공지사항 작성 버튼 꾸미기 */
#testBtn {
	border-top-left-radius: 7px;
	border-bottom-left-radius: 7px;
	border-top-right-radius: 7px;
	border-bottom-right-radius: 7px;
	margin-right: -4px;
	border: 1px solid skyblue;
	background-color: #4e73df;
	color: white;
	padding: 5px;
}

#testBtn:hover {
	color: white;
}
</style>
</head>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
		<ul
			class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
			id="accordionSidebar">

			<br>
			<!-- Sidebar - Brand -->
			<div class="sidebar-brand-icon rotate-n-15"></div>
			<div class="sidebar-brand-text mx-3"
				style="font-size: 20px; color: white;">관리자 페이지</div>
			</a>
			<br>
			<!-- Divider -->
			<hr class="sidebar-divider my-0">

			<!-- Nav Item - Charts -->
			<li class="nav-item"><a class="nav-link" href="adminQandA.do">
					<span style="font-size: 18px;">Q&A 답변</span>
			</a></li>
			<br>

			<!-- Nav Item - Dashboard -->
			<li class="nav-item"><a class="nav-link"
				href="adminNoticeList.do"> <span style="font-size: 18px;">공지사항
						올리기</span>
			</a></li>
			<br>
			<!-- Nav Item - Tables -->
			<li class="nav-item"><a class="nav-link" href="programList.do">
					<span style="font-size: 18px;">프로그램 승인</span>
			</a></li>
			<br>
			<!-- Nav Item - Tables -->
			<li class="nav-item">
			<a class="nav-link" href="#" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
				<span style="font-size: 18px;">회원 관리</span>
			</a>
<<<<<<< HEAD
<<<<<<< HEAD
				<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
          		<div class="bg-white py-2 collapse-inner rounded">
            		<a class="collapse-item" href="memberListType.do?type=1">회원 List</a>
=======
				<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
          		<div class="bg-white py-2 collapse-inner rounded">
            		<a class="collapse-item" href="#">회원 List</a>
>>>>>>> temp
            		<a class="collapse-item" href="#">회원 Chart</a>
            	</div>
            	</div>
			</li>
<<<<<<< HEAD
=======
				<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo"
					data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<a class="collapse-item" href="#">회원 List</a> <a
							class="collapse-item" href="#">회원 Chart</a>
					</div>
				</div></li>
>>>>>>> temp
=======
>>>>>>> temp
			<br>
								
			<!-- Divider -->
			<hr class="sidebar-divider d-none d-md-block">

		</ul>

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- Topbar -->
				<nav
					class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

					<!-- Sidebar Toggle (Topbar) -->
					<button id="sidebarToggleTop"
						class="btn btn-link d-md-none rounded-circle mr-3">
						<i class="fa fa-bars"></i>
					</button>

					<!-- Topbar Navbar -->
					<ul class="navbar-nav ml-auto">

						<!-- Nav Item - Search Dropdown (Visible Only XS) -->
						<li class="nav-item dropdown no-arrow d-sm-none"><a
							class="nav-link dropdown-toggle" href="#" id="searchDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> <i class="fas fa-search fa-fw"></i>
						</a> <!-- Dropdown - Messages -->
							<div
								class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
								aria-labelledby="searchDropdown">
								<form class="form-inline mr-auto w-100 navbar-search">
									<div class="input-group">
										<input type="text"
											class="form-control bg-light border-0 small"
											placeholder="Search for..." aria-label="Search"
											aria-describedby="basic-addon2">
										<div class="input-group-append">
											<button class="btn btn-primary" type="button">
												<i class="fas fa-search fa-sm"></i>
											</button>
										</div>
									</div>
								</form>
							</div></li>

						<div class="topbar-divider d-none d-sm-block"></div>

						<!-- Nav Item - User Information -->
						<li class="nav-item dropdown no-arrow"><a
							class="nav-link dropdown-toggle" href="#" id="userDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> <span
								class="mr-2 d-none d-lg-inline text-gray-600 small">Valerie
									Luna</span> <img class="img-profile rounded-circle"
								src="https://source.unsplash.com/QAB-WJcbgJk/60x60">
						</a> <!-- Dropdown - User Information -->
							<div
								class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
								aria-labelledby="userDropdown">
								<a class="dropdown-item" href="#"> <i
									class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i> Profile
								</a> <a class="dropdown-item" href="#"> <i
									class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
									Settings
								</a> <a class="dropdown-item" href="#"> <i
									class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
									Activity Log
								</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="#" data-toggle="modal"
									data-target="#logoutModal"> <i
									class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
									Logout
								</a>
							</div></li>

					</ul>

				</nav>
				<!-- End of Topbar -->

				<!-- Begin Page Content -->
				<div class="container-fluid" style="width: 1300px;">

					<!-- Page Heading -->
					<h1 class="h3 mb-2 text-gray-800">공지사항 페이지</h1>

					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h4 class="m-0 font-weight-bold text-primary">공지사항</h4>
							<a style="position: absolute; right: 50px; top: 10px;">
								<button id="testBtn" style="font-size: 20px;">공지사항 작성</button>
							</a>
						</div>
						<div class="table-responsive">
							<div class="card-body">

								<table class="table table-bordered" id="dataTable"
									style="width: 100%;">
									<thead>
										<tr>
											<th style="width: 150px;">작성날짜</th>
											<th>제목</th>
											<th style="width: 100px;">조회수</th>
											<th style="width: 100px;"></th>
										</tr>
									</thead>

									<tbody>
										<c:forEach var="dto" items="${list}">
											<tr>
												<td style="font-size: 15px"><p id="register_date">
														<fmt:formatDate value="${dto.register_date}"
															pattern="yyyy년 MM월 dd일" /></td>
												<td style="font-size: 15px"><a href="#" class="content"
													title="${dto.notice_idx}">${dto.subject}</a></td>
												<td style="font-size: 15px"><p id="readcount">${dto.readcount}</td>
												<td align="center" style="font-size: 15px"><a href="#"
													title="${dto.notice_idx}" class="update"
													style="color: blue">수정 / </a> <a href="#"
													onclick="deletelist(${dto.notice_idx})" style="color: blue">삭제</a></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>

				</div>
				<!-- /.container-fluid -->
			</div>
			<!-- End of Main Content -->

			<!-- 공지사항 작성 폼 -->
			<div id="modal" class="searchModal">
				<div class="container" style="width: 900px;">
					<div class="row justify-content-center">
						<div class="col-md-12">
							<div class="wrapper">
								<div class="contact-wrap w-100 p-md-5 p-4">
									<h3 class="mb-4" style="font-size: 40px">공지사항 작성</h3>
									<form method="POST" action="insertNotice.do" name="form"
										onsubmit="return checkAll()">
										<div class="row">
											<div class="col-md-12">
												<div class="form-group">
													<label class="label" style="font-size: 25px">제목</label> <input
														type="text" class="form-control" name="subject"
														placeholder="제목">
												</div>
											</div>
											<div class="col-md-12">
												<div class="form-group">
													<label class="label" style="font-size: 25px">공지 내용</label>
													<textarea name="content" class="form-control" cols="50"
														rows="10" placeholder="공지할 내용을 작성해 주세요."></textarea>
												</div>
											</div>
											<div class="col-md-12">
												<div class="form-group">
													<input type="button" onclick="closeModal()"
														style="float: right; height: 50px; width: 150px; font-size: 20px;"
														value="취소" class="btn btn-primary" /> <input
														type="submit"
														style="float: right; margin-right: 1%; height: 50px; width: 150px; font-size: 20px;"
														value="작성" class="btn btn-primary" />
												</div>
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 공지 사항 추가 종료 -->

			<!-- 공지사항 수정 시작 -->
			<div id="updatemodal" class="searchModal">
				<div class="container" style="width: 900px;">
					<div class="row justify-content-center">
						<div class="col-md-12">
							<div class="wrapper">
								<div class="contact-wrap w-100 p-md-5 p-4">
									<h3 class="mb-4" style="font-size: 40px" align="center">공지사항
										수정</h3>
									<form method="POST" action="update.do" name="form"
										onsubmit="return checkAll2()">
										<div class="row">
											<div class="col-md-12">
												<div class="form-group">
													<label class="label" style="font-size: 25px" id="subject2">제목</label>
												</div>
											</div>
											<div class="col-md-12">
												<div class="form-group">
													<label class="label"
														style="font-size: 25px; margin-left: 5px;" id="content2">공지사항
														내용</label>
												</div>
											</div>
											<div class="col-md-12">
												<div class="form-group">
													<input type="button" onclick="closeModal()" id="cancel"
														style="float: right; height: 50px; width: 150px; font-size: 20px;"
														value="취소" class="btn btn-primary" /> <input
														type="submit" id="hidden"
														style="float: right; margin-right: 1%; height: 50px; width: 150px; font-size: 20px;"
														value="수정" class="btn btn-primary" />
												</div>
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 공지사항 수정 끝 -->

			<!-- 공지사항 상세글 시작 -->
			<div id="cotentmodal" class="searchModal">
				<div class="container" style="width: 900px;">
					<div class="row justify-content-center">
						<div class="col-md-12">
							<div class="wrapper">
								<div class="contact-wrap w-100 p-md-5 p-4">
									<h3 class="mb-4" style="font-size: 40px" align="center">공지사항</h3>

									<div class="row">
										<div class="col-md-12">
											<div class="form-group">
												<label class="label" style="font-size: 25px" id="subject3">제목
												</label>

											</div>
										</div>
										<div class="col-md-12">
											<div class="form-group">
												<label class="label" style="font-size: 25px" id="content3">공지사항
													내용</label>

											</div>
										</div>
										<div class="col-md-12">
											<div class="form-group">
												<input type="button" onclick="closeModal()" id="cancel"
													style="float: right; height: 50px; width: 150px; font-size: 20px;"
													value="취소" class="btn btn-primary" />
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 공지사항 수정 끝 -->


		</div>
		<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<!-- Logout Modal-->
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">A?</span>
					</button>
				</div>
				<div class="modal-body">Select "Logout" below if you are ready
					to end your current session.</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">Cancel</button>
					<a class="btn btn-primary" href="login.html">Logout</a>
				</div>
			</div>
		</div>
	</div>

	<!-- Bootstrap core JavaScript-->
	<script
		src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script
		src="${pageContext.request.contextPath}/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script
		src="${pageContext.request.contextPath}/resources/js/sb-admin-2.min.js"></script>

	<!-- Page level plugins -->
	<script
		src="${pageContext.request.contextPath}/resources/vendor/datatables/jquery.dataTables.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/vendor/datatables/dataTables.bootstrap4.min.js"></script>
	<!-- Page level custom scripts -->
	<script
		src="${pageContext.request.contextPath}/resources/js/demo/datatables-demo.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/vendor/datatables/check.js?v=1"></script>

</body>

</html>
