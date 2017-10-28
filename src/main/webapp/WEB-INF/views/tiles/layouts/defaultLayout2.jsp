<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="Everest Admin Panel" />
<meta name="keywords"
	content="Admin, Dashboard, Bootstrap3, Sass, transform, CSS3, HTML5, Web design, UI Design, Responsive Dashboard, Responsive Admin, Admin Theme, Best Admin UI, Bootstrap Theme, Wrapbootstrap, Bootstrap" />
<meta name="author" content="Bootstrap Gallery" />
<link rel="shortcut icon" href="img/favicon.ico">
<title><tiles:getAsString name="title" /></title>


<link href="<c:url value='/resources/template/css/bootstrap.min.css' />"
	rel="stylesheet" type="text/css">
<link href="<c:url value='/resources/template/css/animate.css' />"
	rel="stylesheet" type="text/css">
<link href="<c:url value='/resources/template/css/main.css' />"
	rel="stylesheet" type="text/css">
<link
	href="<c:url value='/resources/template/fonts/font-awesome.min.css' />"
	rel="stylesheet" type="text/css">


<!-- Data Tables -->
<link href="<c:url value='/resources/template/css/datatables/dataTables.bs.min.css' />" rel="stylesheet" />
<link href="<c:url value='/resources/template/css/datatables/autoFill.bs.min.css' />" rel="stylesheet" />
<link href="<c:url value='/resources/template/css/datatables/fixedHeader.bs.css' />" rel="stylesheet" />
<link href="<c:url value='/resources/template/css/datatables/buttons.bs.css' />" rel="stylesheet" />





<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="<c:url value='/resources/template/js/jquery.js' />"></script>

<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="<c:url value='/resources/template/js/bootstrap.min.js' />"></script>

<!-- Sparkline graphs -->
<script src="<c:url value='/resources/template/js/sparkline.js' />"></script>

<!-- jquery ScrollUp JS -->
<script
	src="<c:url value='/resources/template/js/scrollup/jquery.scrollUp.js' />"></script>


<!-- Data Tables -->
<script src="<c:url value='/resources/template/js/datatables/dataTables.min.js' />"></script>
<script src="<c:url value='/resources/template/js/datatables/dataTables.bootstrap.min.js' />"></script>
<script src="<c:url value='/resources/template/js/datatables/dataTables.tableTools.js' />"></script>
<script src="<c:url value='/resources/template/js/datatables/autoFill.min.js' />"></script>
<script src="<c:url value='/resources/template/js/datatables/autoFill.bootstrap.min.js' />"></script>
<script src="<c:url value='/resources/template/js/datatables/fixedHeader.min.js' />"></script>

<!-- Download / CSV / Copy / Print -->
<script src="<c:url value='/resources/template/js/datatables/buttons.min.js' />"></script>
<script src="<c:url value='/resources/template/js/datatables/flash.min.js' />"></script>
<script src="<c:url value='/resources/template/js/datatables/jszip.min.js' />"></script>
<script src="<c:url value='/resources/template/js/datatables/pdfmake.min.js' />"></script>
<script src="<c:url value='/resources/template/js/datatables/vfs_fonts.js' />"></script>
<script src="<c:url value='/resources/template/js/datatables/html5.min.js' />"></script>
<script src="<c:url value='/resources/template/js/datatables/buttons.print.min.js' />"></script>


<!-- Custom Index -->
<script src="<c:url value='/resources/template/js/custom.js' />"></script>
</head>

<body>

	<!-- Header Start -->
	<header>

		<!-- Logo starts -->
		<div class="logo">
			<a href="#"> <img
				src="<c:url value='/resources/template/img/logo.png' />" alt="logo">
				<span class="menu-toggle hidden-xs"> <i class="fa fa-bars"></i>
			</span>
			</a>
		</div>
		<!-- Logo ends -->

		<!-- Custom Search Starts -->
		<div class="custom-search pull-left hidden-xs hidden-sm">
			<input type="text" class="search-query" placeholder="Search here">
			<i class="fa fa-search"></i>
		</div>
		<!-- Custom Search Ends -->

		<!-- Mini right nav starts -->
		<div class="pull-right">
			<ul id="mini-nav" class="clearfix">
				<li class="list-box hidden-lg hidden-md hidden-sm" id="mob-nav">
					<a href="#"> <i class="fa fa-reorder"></i>
				</a>
				</li>
				<li class="list-box dropdown hidden-xs"><a id="drop1" href="#"
					role="button" class="dropdown-toggle" data-toggle="dropdown"> <i
						class="fa fa-image"></i>
				</a> <span class="info-label info-bg animated rubberBand">7+</span>
					<ul class="blog-gallery dropdown-menu clearfix recent-tweets">
						<li><img
							src="<c:url value='/resources/template/img/user1.jpg' />"
							alt="User"></li>
						<li><img
							src="<c:url value='/resources/template/img/user2.jpg' />"
							alt="User"></li>
						<li><img
							src="<c:url value='/resources/template/img/user3.jpg' />"
							alt="User"></li>
						<li><img
							src="<c:url value='/resources/template/img/user4.jpg' />"
							alt="User"></li>
						<li><img
							src="<c:url value='/resources/template/img/user5.jpg' />"
							alt="User"></li>
						<li><img
							src="<c:url value='/resources/template/img/user6.jpg' />"
							alt="User"></li>
						<li><img
							src="<c:url value='/resources/template/img/user7.jpg' />"
							alt="User"></li>
						<li><img
							src="<c:url value='/resources/template/img/user8.jpg' />"
							alt="User"></li>
						<li><img
							src="<c:url value='/resources/template/img/user9.jpg' />"
							alt="User"></li>
						<li><img
							src="<c:url value='/resources/template/img/user3.jpg' />"
							alt="User"></li>
					</ul></li>
				<li class="list-box dropdown hidden-xs"><a id="drop2" href="#"
					role="button" class="dropdown-toggle" data-toggle="dropdown"> <i
						class="fa fa-th"></i>
				</a> <span class="info-label success-bg animated rubberBand">6</span>
					<ul class="dropdown-menu quick-actions">
						<li class="plain">Recently Viewed</li>
						<li><a href="profile.html"> <i
								class="fa fa-file-word-o text-success"></i>
								<p>Profile</p>
						</a></li>
						<li><a href="gallery.html"> <i
								class="fa fa-image text-danger"></i>
								<p>Gallery</p>
						</a></li>
						<li><a href="timeline.html"> <i
								class="fa fa-list-ol text-info"></i>
								<p>Timeline</p>
						</a></li>
						<li><a href="graphs.html"> <i
								class="fa fa-map-marker text-warning"></i>
								<p>Charts</p>
						</a></li>
						<li><a href="editor.html"> <i
								class="fa fa-pencil text-danger"></i>
								<p>Editor</p>
						</a></li>
						<li><a href="blog.html"> <i
								class="fa fa-file-text text-success"></i>
								<p>Blog</p>
						</a></li>
					</ul></li>
				<li class="list-box dropdown hidden-xs"><a id="drop3" href="#"
					role="button" class="dropdown-toggle" data-toggle="dropdown"> <i
						class="fa fa-bell"></i>
				</a> <span class="info-label danger-bg animated rubberBand">4</span>
					<ul class="dropdown-menu messages">
						<li class="plain">Messages</li>
						<li>
							<div class="user-pic">
								<img src="<c:url value='/resources/template/img/user4.jpg' />"
									alt="User">
							</div>
							<div class="details">
								<strong class="text-danger">Wilson</strong> <span>Uploaded
									28 new files yesterday.</span>
								<div class="progress progress-xs no-margin">
									<div class="progress-bar progress-bar-info" role="progressbar"
										aria-valuenow="90" aria-valuemin="0" aria-valuemax="100"
										style="width: 90%;"></div>
								</div>
							</div>
						</li>
						<li>
							<div class="user-pic">
								<img src="<c:url value='/resources/template/img/user1.jpg' />"
									alt="User">
							</div>
							<div class="details">
								<strong class="text-danger">Adams</strong> <span>Got 12
									new messages.</span>
								<div class="progress progress-xs no-margin">
									<div class="progress-bar progress-bar-danger"
										role="progressbar" aria-valuenow="50" aria-valuemin="0"
										aria-valuemax="100" style="width: 50%;"></div>
								</div>
							</div>
						</li>
						<li>
							<div class="user-pic">
								<img src="<c:url value='/resources/template/img/user3.jpg' />"
									alt="User">
							</div>
							<div class="details">
								<strong class="text-info">Sam</strong> <span>Uploaded new
									project files today.</span>
								<div class="progress progress-xs no-margin">
									<div class="progress-bar progress-bar-success"
										role="progressbar" aria-valuenow="70" aria-valuemin="0"
										aria-valuemax="100" style="width: 70%;"></div>
								</div>
							</div>
						</li>
						<li>
							<div class="user-pic">
								<img src="<c:url value='/resources/template/img/user5.jpg' />"
									alt="User">
							</div>
							<div class="details">
								<strong class="text-info">Jennifer</strong> <span>128 new
									purchases last 3 hours.</span>
								<div class="progress progress-xs no-margin">
									<div class="progress-bar progress-bar-danger"
										role="progressbar" aria-valuenow="30" aria-valuemin="0"
										aria-valuemax="100" style="width: 30%;"></div>
								</div>
							</div>
						</li>
					</ul></li>
				<li class="list-box user-profile hidden-xs"><a id="drop4"
					href="#" class="user-avtar animated rubberBanddropdown-toggle"
					data-toggle="dropdown"> <img
						src="<c:url value='/resources/template/img/user4.jpg' />"
						alt="user avatar" /> <span class="user-name">Mr. Willams <i
							class="fa fa-angle-down"></i></span>
				</a>
					<ul class="dropdown-menu sm user-settings">
						<li><a href="profile.html"><i class="fa fa-meh-o"></i> My
								Profile</a></li>
						<li><a href="#"> <i class="fa fa-bell-o"></i> Messages
						</a></li>
						<li><a href="profile.html"> <i class="fa fa-calendar"></i>
								Appointments
						</a></li>
						<hr class="less-margin">
						<li><a href="#"> <i class="fa fa-sun-o"></i> Account
								Settings
						</a></li>
						<li><a href="login.html"> <i class="fa fa-sign-out"></i>
								Logout
						</a></li>
					</ul></li>
			</ul>
		</div>
		<!-- Mini right nav ends -->

	</header>


	<!-- Left sidebar starts -->
	<aside id="sidebar">
		<tiles:insertAttribute name="menu" />

	</aside>

	<!-- Dashboard Wrapper starts -->
	<div class="dashboard-wrapper">

		<!-- Top Bar starts -->
		<div class="top-bar">
			<div class="page-title">
				<tiles:getAsString name="title" />
			</div>

		</div>
		<!-- Main Container starts -->
		<div class="main-container">

			<!-- Container fluid Starts -->
			<div class="container-fluid">

				<!-- Spacer starts -->
				<div class="spacer">
					<tiles:insertAttribute name="body" />
				</div>

			</div>

		</div>

	</div>
	<!-- Main Container ends -->

	<!-- Footer starts -->
	<footer> Copyright Everest Admin Panel 2014. </footer>
	<!-- Footer ends -->

	</div>
	<!-- Dashboard Wrapper ends -->



</body>
</html>