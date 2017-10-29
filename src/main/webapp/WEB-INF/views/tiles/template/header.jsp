<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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

		<!-- Custom Search Ends -->

		<!-- Mini right nav starts -->
		<div class="pull-right">
			<ul id="mini-nav" class="clearfix">
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




