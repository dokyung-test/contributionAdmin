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

		/* Q&A 답변창 */
		$("p")
				.click(
						function() {
							var param = "num=" + $(this).attr("title");
							var url = "adminQandAContent.do";
							$
									.ajax({
										type : "post",
										url : url,
										data : param,
										dataType : "json"
									})
									.done(
											function(args) {

												var board_idx = args.board_idx;
												var subject = args.subject;
												var register_date = args.register_date;
												var content = args.content;
												var answer = args.answer;
												var nickname = args.nickname;
												var date1 = new Date(
														register_date);
												var text_date = date1
														.getFullYear()
														+ "년  "
														+ (date1.getMonth() + 1)
														+ "월 "
														+ date1.getDate() + "일";

												$("#hidden")
														.append(
																"<input type='hidden' name='board_idx' value='"+board_idx+"' />");

												$("#subject").append(
														"<div class='a'>"
																+ subject
																+ "</div>");
												$("#nickname").append(
														"<div class='a'>"
																+ nickname
																+ "</div>");
												$("#register_date").append(
														"<div class='a'>"
																+ text_date
																+ "</div>");
												$("#QandAcontent").append(
														"<div class='a'>"
																+ content
																+ "</div>");
												if (answer == null) {
													$("#answer")
															.append(
																	"<br class='a'><textarea cols='50' rows='3' name='answer' class='a' style='resize: none;'>"
																			+ "</textarea>");
												} else {
													$("#answer")
															.append(
																	"<br class='a'><textarea cols='50' rows='3' name='answer' class='a' style='resize: none;'>"
																			+ answer
																			+ "</textarea>");
												}
											});
							$("#contentmodal").show();
							return false;
						});
	});

	function closeModal() {
		$('.searchModal').hide();
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
}
/* 입력칸 스타일 */
.a {
	color: black;
	border-top-left-radius: 7px;
	border-bottom-left-radius: 7px;
	border-top-right-radius: 7px;
	border-bottom-right-radius: 7px;
	border: 10px solid transparent;
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
			<li class="nav-item"><a class="nav-link" href="adminQandA.do">
					<span style="font-size: 18px;">프로그램 승인</span>
			</a></li>
			<br>
			<!-- Nav Item - Tables -->
			<li class="nav-item"><a class="nav-link" href="adminQandA.do">
					<span style="font-size: 18px;">회원 관리</span>
			</a></li>
			<br>
			<!-- Divider -->
			<hr class="sidebar-divider d-none d-md-block">

		</ul>
		<!-- End of Sidebar -->

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
				<div class="container-fluid">

					<!-- Page Heading -->
					<h1 class="h3 mb-2 text-gray-800">Q&A</h1>
					<p class="mb-4">Q&A 리스트</p>

					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered" id="dataTable" width="100%"
									cellspacing="0">
									<thead>
										<tr>
											<th>답변상태</th>
											<th>제목</th>
											<th>문의자</th>
											<th>문의내용</th>
											<th>답변내용</th>
											<th>답변일</th>

										</tr>
									</thead>

									<tbody>
										<c:forEach var="dto" items="${list}">
											<tr>
												<c:if test="${dto.status_id eq 1}">
													<td style="font-size: 15px">접수중</td>
												</c:if>
												<c:if test="${dto.status_id eq 2} ">
													<td style="font-size: 15px">처리중</td>
												</c:if>
												<c:if test="${dto.status_id eq 3}">
													<td style="font-size: 15px">답변완료</td>
												</c:if>

												<td style="font-size: 15px"><p title="${dto.board_idx}">${dto.subject}</td>

												<td style="font-size: 15px"><p title="${dto.board_idx}">${dto.nickname}</td>

												<td style="font-size: 15px"><p title="${dto.board_idx}">${dto.content}</td>

												<c:if test="${dto.status_id eq 1}">
													<td style="font-size: 15px"><p
															title="${dto.board_idx}">접수중 입니다.</td>
												</c:if>
												<c:if test="${dto.status_id eq 2} ">
													<p title="${dto.board_idx}">
													<td style="font-size: 15px">처리중 입니다.</td>
												</c:if>
												<c:if test="${dto.status_id eq 3}">
													<p title="${dto.board_idx}">
													<td style="font-size: 15px">${dto.answer}</td>
												</c:if>
												<td style="font-size: 15px"><p title="${dto.board_idx}">
														<fmt:formatDate value="${dto.register_date}"
															pattern="yyyy년 MM월 dd일" /></td>
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

			<!-- Q&A 상세 내역-->
			<div id="contentmodal" class="searchModal">
				<div class="container">
					<div class="row justify-content-center">
						<div class="col-md-12">
							<div class="wrapper">
								<!--  <div class="col-md-7"> -->
								<div class="contact-wrap w-100 p-md-5 p-4">
									<h3 class="mb-4" style="font-size: 40px">Q&A</h3>
									<div id="form-message-warning" class="mb-4"></div>
									<div id="form-message-success" class="mb-4"
										style="font-size: 20px">Q&A상세내용</div>
									<hr width="1000px" color="black" noshade />
									<form method="POST" action="qANDaUpdate.do" name="form">
										<div class="row">
											<div class="col-md-12">
												<div class="form-group">
													<label class="label" style="font-size: 20px" id="status_id">상태
														<select name="status_id">
															<option value="1">접수중</option>
															<option value="2">처리중</option>
															<option value="3">답변완료</option>
													</select>
													</label>

												</div>
											</div>
											<div class="col-md-12">
												<div class="form-group">
													<label class="label" style="font-size: 20px"
														id="register_date">작성일</label>
												</div>
											</div>
											<div class="col-md-12">
												<div class="form-group">
													<label class="label" style="font-size: 20px" id="subject">제목</label>

												</div>
											</div>
											<div class="col-md-12">
												<div class="form-group">
													<label class="label" style="font-size: 20px" id="nickname">문의자</label>

												</div>
											</div>
											<div class="col-md-12">
												<div class="form-group">
													<label class="label" style="font-size: 20px"
														id="QandAcontent">문의내용</label>

												</div>
											</div>
											<div class="col-md-12">
												<div class="form-group">
													<label class="label" style="font-size: 20px" id="answer">답변내용</label>


												</div>
											</div>
											<input type="hidden" id="hidden" />

											<div class="col-md-12">
												<div class="form-group">
													<input type="button" onclick="closeModal()"
														style="float: right; height: 50px; width: 240px; font-size: 20px;"
														value="취소" class="btn btn-primary" /> <input
														type="submit"
														style="float: right; margin-right: 1%; height: 50px; width: 240px; font-size: 20px;"
														value="보내기" class="btn btn-primary" />
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
			<!-- Q&A답변창 끝 -->

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

</body>

</html>
